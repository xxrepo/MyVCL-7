unit SimpleTabControl;

interface
uses
  Classes, SysUtils, cxWebIntf,  cxWebClasses, cxWebControls, cxWebTypes,
  cxWebRender;

type
  TcxWebSimpleTabControlTabClick = procedure(Sender: TObject; var ATabIndex: Integer) of object;

  TcxCustomWebSimpleTabControl = class(TcxWebControl)
  private
    FTabs: TStrings;
    FActiveTab: Integer;
    FTabStyles: TcxWebStyles;
    FActiveTabStyles: TcxWebStyles;
    FOnTabClick: TcxWebSimpleTabControlTabClick;

    procedure DoTabChanged(Sender: TObject);
    procedure SetTabs(Value: TStrings);
    procedure SetActiveTab(Value: Integer);
    procedure SetTabStyles(Value: TcxWebStyles);
    procedure SetActiveTabStyles(Value: TcxWebStyles);

    procedure TabClick(const AParameters: TcxActionParameters);
  protected
    procedure DoTabClick(var ATabIndex: Integer); dynamic;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    { actions }
    procedure RegisterActions; override;
    { renderers }
    procedure RegisterRenderers; override;
    { Scripts }
    procedure ScriptsSubscription; override;

    property Tabs: TStrings read FTabs write SetTabs;
    property Activetab: Integer read FActiveTab write SetActiveTab;
    property TabStyles: TcxWebStyles read FTabStyles write SetTabStyles;
    property ActiveTabStyles: TcxWebStyles read FActiveTabStyles write SetActiveTabStyles;
    property OnTabClick: TcxWebSimpleTabControlTabClick read FonTabClick write FonTabClick;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  TcxCustomWebSimpleTabControlRenderer = class(TcxWebControlRenderer)
  private
    procedure WriteComponentEvents(const Style: TcxWebStyleItem);
  protected
    function TabControl: TcxCustomWebSimpleTabControl;

    procedure WriteTab(AIndex, Activetab: Integer; ACaption: string);
    procedure WriteTabs;
  public
    procedure WriteHTML; override;
  end;

  TcxWebSimpleTabControl = class(TcxCustomWebSimpleTabControl)
  published
    property Tabs;
    property Activetab;
    property TabStyles;
    property ActiveTabStyles;
    property OnTabClick;
  end;

implementation
uses
  cxWebScriptFactory;
  
{ TcxCustomWebSimpleTabControl }
constructor TcxCustomWebSimpleTabControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FTabs := TStringList.Create;
  TStringList(FTabs).OnChange := DoTabChanged;
  FActivetab := -1;
  FTabStyles := TcxWebStyles.Create(self);
  FActiveTabStyles := TcxWebStyles.Create(self);
end;

destructor TcxCustomWebSimpleTabControl.Destroy;
begin
  FTabStyles.Free;
  FActiveTabStyles.Free;
  FTabs.Free;
  inherited;
end;

procedure TcxCustomWebSimpleTabControl.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and not (csDestroying in ComponentState) then
  begin
    //notify style controller that we are destroying
    if AComponent is TcxWebStyleItem then
    begin
      TabStyles.Notification(AComponent, opRemove);
      ActiveTabStyles.Notification(AComponent, opRemove);
    end;
  end;
end;

procedure TcxCustomWebSimpleTabControl.DoTabChanged(Sender: TObject);
begin
  if ActiveTab > Tabs.Count - 1 then
    FActiveTab := Tabs.Count - 1;
  //Here we tell Designer control to refresh the context.
  //TcxWebControl has property DesignerControl: IcxWebDesignerControl
  UpdateDesignerContext;
end;


procedure TcxCustomWebSimpleTabControl.RegisterRenderers;
begin
  //It is a very simple control, so we have only one Render class for all browsers
  WebRenderHelper.RegisterRenderer(TcxCustomWebSimpleTabControlRenderer);
end;

procedure TcxCustomWebSimpleTabControl.RegisterActions;
begin
  //Lets register the action
  //This control has just one action so far
  WebActionsHelper.RegisterAction('', TabClick);
  WebActionsHelper.RegisterAction('TABCLICK', TabClick);
end;

//Call DoTabClick protected method
procedure TcxCustomWebSimpleTabControl.TabClick(const AParameters: TcxActionParameters);
var
  ATabIndex: Integer;
begin
  if AParameters.ParamString <> '' then
    ATabIndex := StrToInt(AParameters.ParamString)
  else ATabIndex := 0;
  DoTabClick(ATabIndex);
end;

//The magic is over the event is trapped.
procedure TcxCustomWebSimpleTabControl.DoTabClick(var ATabIndex: Integer);
begin
  if Assigned(OnTabClick) then
    OnTabClick(self, ATabIndex);
  Activetab := ATabIndex;
end;


procedure TcxCustomWebSimpleTabControl.ScriptsSubscription;
begin
  inherited ScriptsSubscription;
  //We need the change style JS procedure
  if (TabStyles.Hover <> nil) or (ActiveTabStyles.Hover <> nil) then
    WebScriptsHelper.ScriptSubscription(TcxWebChangeStyleScript);
  //We need postback JScript method to perform a tab click
  WebScriptsHelper.ScriptSubscription(TcxWebPostBackScript);
end;

procedure TcxCustomWebSimpleTabControl.SetTabs(Value: TStrings);
begin
  FTabs.Assign(Value);
end;

procedure TcxCustomWebSimpleTabControl.SetActiveTab(Value: Integer);
begin
  if Value < -1 then
    Value := -1;
  if (Value > Tabs.Count - 1) or
   ((Value = -1) and (Tabs.Count > 0)) then exit;
  FActiveTab := Value;
  UpdateDesignerContext;
end;

procedure TcxCustomWebSimpleTabControl.SetTabStyles(Value: TcxWebStyles);
begin
  TabStyles.Assign(Value);
end;

procedure TcxCustomWebSimpleTabControl.SetActiveTabStyles(Value: TcxWebStyles);
begin
  ActiveTabStyles.Assign(Value);
end;

{ TcxCustomWebSimpleTabControlRenderer }

function TcxCustomWebSimpleTabControlRenderer.TabControl: TcxCustomWebSimpleTabControl;
begin
  Result := Component as TcxCustomWebSimpleTabControl;
end;

procedure TcxCustomWebSimpleTabControlRenderer.WriteHTML;
begin
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagSpan);
  if (csDesigning in TabControl.ComponentState) then //we need accurate size at design time
  begin
    HTMLTextBuilder.WriteStyleAttribute(saHeight, WebControl.Height);
    HTMLTextBuilder.WriteStyleAttribute(saWidth, WebControl.Width);
  end;
  WriteID;
  WriteAttributes;
  WriteStyleAttributes;
  WritePosition;
  WriteZIndex;
  WriteTabs; //Render our tabs here.
  HTMLTextBuilder.WriteEndTag(TcxHTMLTagSpan);
end;

procedure TcxCustomWebSimpleTabControlRenderer.WriteTabs;
var
  I: Integer;
begin
  if TabControl.Tabs.Count = 0 then exit;

  //A good idea to use HTML table since it works perfect in all popular browsers
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagTable);
  HTMLTextBuilder.WriteAttribute(aRules, 'all');
  HTMLTextBuilder.WriteAttribute(aBorder, 0);
  HTMLTextBuilder.WriteAttribute(aCellspacing, 4); //It is good idea to make it a property in the future version
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagTr);
  
  for I := 0 to TabControl.Tabs.Count - 1 do
    WriteTab(I, TabControl.Activetab, TabControl.Tabs[I]);

  HTMLTextBuilder.WriteEndTag(TcxHTMLTagTr);
  HTMLTextBuilder.WriteEndTag(TcxHTMLTagTable);
end;

procedure TcxCustomWebSimpleTabControlRenderer.WriteTab(AIndex, Activetab: Integer; ACaption: string);
begin
  HTMLTextBuilder.WriteBeginTag(TcxHTMLTagTd);

  if AIndex <> Activetab then //we need it for Inactive tab only
  begin
     HTMLTextBuilder.WriteBeginTag(TcxHTMLTagA, False, False);
    //Lets apply styles for inactive tabs
    if TabControl.TabStyles.Default <> nil then
      HTMLTextBuilder.WriteAttribute(aClass, TabControl.TabStyles.Default.FullName);
    WriteComponentEvents(TabControl.TabStyles.Hover);
    //it will send to the server
    HTMLTextBuilder.WriteAttribute(aHref,
          Format('javascript:__doPostBack(&quot;%s&quot;, &quot;TABCLICK:%d&quot;)',
                  [TabControl.Name, AIndex]));
    HTMLTextBuilder.WriteText(ACaption, False, False);
    HTMLTextBuilder.WriteEndTag(TcxHTMLTagA, False, False);
  end else
  begin
    //Lets apply styles for the active tab
    if TabControl.ActiveTabStyles.Default <> nil then
      HTMLTextBuilder.WriteAttribute(aClass, TabControl.ActiveTabStyles.Default.FullName);
    WriteComponentEvents(TabControl.ActiveTabStyles.Hover);
    HTMLTextBuilder.WriteText(ACaption, False, False);
  end;

  HTMLTextBuilder.WriteEndTag(TcxHTMLTagTd);
end;

procedure TcxCustomWebSimpleTabControlRenderer.WriteComponentEvents(
  const Style: TcxWebStyleItem);
begin
  if not TabControl.IsDesigning and (Style <> nil) then
  begin
    HTMLTextBuilder.WriteEventAttribute(eOnMouseOver, GetHoverStyleProc(Style));
    HTMLTextBuilder.WriteEventAttribute(eOnMouseOut, GetDefaultStyleProc(Style));
  end;
end;

end.
