unit DockingMegaDemoMain;

{$I cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, dxDockPanel, Menus, StdCtrls, ExtCtrls, ImgList,
  Clipbrd, dxBar, ActnList, dxDockControl, StdActns, dxBarExtItems, dxsbar,
  cxClasses, EBarsUtils;

type
  TDockingMegaDemoMainForm = class(TForm)
    dsHost: TdxDockSite;
    dpStartPage: TdxDockPanel;
    dpOutput: TdxDockPanel;
    dpToolbox: TdxDockPanel;
    dxDockingManager1: TdxDockingManager;
    dpProperties: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dpClassView: TdxDockPanel;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dpCallStack: TdxDockPanel;
    dxTabContainerDockSite1: TdxTabContainerDockSite;
    dpSolutionExplorer: TdxDockPanel;
    dxTabContainerDockSite2: TdxTabContainerDockSite;
    dpWatch: TdxDockPanel;
    BarManager: TdxBarManager;
    dxBarButtonLoad: TdxBarLargeButton;
    dxBarButtonSave: TdxBarLargeButton;
    dxBarSubItemFile: TdxBarSubItem;
    dxBarSubItemInsert: TdxBarSubItem;
    dxBarSubItemFormat: TdxBarSubItem;
    dxBarSubItemWindow: TdxBarSubItem;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarSubItemHelp: TdxBarSubItem;
    imBarIcons: TImageList;
    dxBarButtonToolBox: TdxBarLargeButton;
    dxBarButtonWatch: TdxBarLargeButton;
    dxBarButtonOutput: TdxBarLargeButton;
    dxBarButtonCallStack: TdxBarLargeButton;
    dxBarButtonProperties: TdxBarLargeButton;
    dxBarButtonClassView: TdxBarLargeButton;
    dxBarButtonSolutionExplorer: TdxBarLargeButton;
    dxBarButtonFont: TdxBarLargeButton;
    dxBarButtonColor: TdxBarLargeButton;
    dxBarButtonStandardView: TdxBarLargeButton;
    dxBarButtonNETView: TdxBarLargeButton;
    dxBarButtonXPView: TdxBarLargeButton;
    dxBarSubItemOtherWindows: TdxBarSubItem;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    ilDockIcons: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButtonDockable: TdxBarButton;
    dxBarButtonHide: TdxBarButton;
    dxBarButtonFloating: TdxBarButton;
    dxBarButtonAutoHide: TdxBarButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxBarButtonStartPage: TdxBarLargeButton;
    dxBarButtonOffice11View: TdxBarLargeButton;
    dxBarButton1: TdxBarLargeButton;
    dxBarButton2: TdxBarLargeButton;
    dxBarButton3: TdxBarLargeButton;
    dxBarButton4: TdxBarLargeButton;
    dxBarButton5: TdxBarLargeButton;
    dxBarButton6: TdxBarLargeButton;
    dxBarButton7: TdxBarLargeButton;
    ilDisabledImages: TImageList;
    ilHotImages: TImageList;
    ListView1: TListView;
    Memo1: TMemo;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    ListView2: TListView;
    tvSolutionExplorer: TTreeView;
    tvClassView: TTreeView;
    iComponentsIcons: TImageList;
    dxSideBar1: TdxSideBar;
    ScrollBox1: TScrollBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbManagerColor: TCheckBox;
    cbManagerFont: TCheckBox;
    eCaption: TEdit;
    cbShowCaption: TCheckBox;
    cbShowCloseButton: TCheckBox;
    cbShowMaxButton: TCheckBox;
    cbShowHideButton: TCheckBox;
    cbAllowDockLeft: TCheckBox;
    cbAllowDockTop: TCheckBox;
    cbAllowDockClient: TCheckBox;
    cbAllowFloating: TCheckBox;
    cbAllowDockBottom: TCheckBox;
    cbAllowDockRight: TCheckBox;
    cbAllowDockClientsLeft: TCheckBox;
    cbAllowDockClientsTop: TCheckBox;
    cbAllowDockClientsClient: TCheckBox;
    cbAllowDockClientsBottom: TCheckBox;
    cbAllowDockClientsRight: TCheckBox;
    cbTabsOnTop: TCheckBox;
    cbTabsScrollable: TCheckBox;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Label4: TLabel;
    Image3: TImage;
    Image4: TImage;
    Label5: TLabel;
    Panel4: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    Panel5: TPanel;
    Image1: TImage;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    procedure dxBarButtonExitClick(Sender: TObject);
    procedure dxBarButtonSolutionExplorerClick(Sender: TObject);
    procedure dxBarButtonClassViewClick(Sender: TObject);
    procedure dxBarButtonPropertiesClick(Sender: TObject);
    procedure dxBarButtonToolBoxClick(Sender: TObject);
    procedure dxBarButtonCallStackClick(Sender: TObject);
    procedure dxBarButtonOutputClick(Sender: TObject);
    procedure dxBarButtonFontClick(Sender: TObject);
    procedure dxBarButtonColorClick(Sender: TObject);
    procedure dxBarButtonStandardViewClick(Sender: TObject);
    procedure dxBarButtonNETViewClick(Sender: TObject);
    procedure dxBarButtonXPViewClick(Sender: TObject);
    procedure frSolutionExplorer1TreeView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dxBarButtonOnWebClick(Sender: TObject);
    procedure dxBarButtonWatchClick(Sender: TObject);
    procedure dpContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure dxBarButtonDockableClick(Sender: TObject);
    procedure dxBarButtonHideClick(Sender: TObject);
    procedure dxBarButtonFloatingClick(Sender: TObject);
    procedure dxBarButtonAutoHideClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxBarButtonLoadClick(Sender: TObject);
    procedure dxBarButtonSaveClick(Sender: TObject);
    procedure dxBarButtonStartPageClick(Sender: TObject);
    procedure dxBarButtonOffice11ViewClick(Sender: TObject);
    procedure dxDockingManager1LayoutChanged(Sender: TdxCustomDockControl);
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure tvSolutionExplorerChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
  private
    FDockControl: TdxCustomDockControl;
    procedure SetDockControl(const Value: TdxCustomDockControl);
    procedure ApplyProperties;
    procedure UpdateProperties;
    procedure DisableProperties;
  private
    FPopupMenuDockControl: TdxCustomDockControl;
    procedure UpdateSolutionTV;
    procedure UpdateClassViewTV;
    property DockControl: TdxCustomDockControl read FDockControl write SetDockControl;
  end;

var
  DockingMegaDemoMainForm: TDockingMegaDemoMainForm;

implementation

uses
  EBarsDemoRating;

{$R *.dfm}

procedure TDockingMegaDemoMainForm.UpdateSolutionTV;
  procedure CheckSite(AControl: TdxCustomDockControl; ANode: TTreeNode);
  var
    I: Integer;
    AChild: TTreeNode;
    ANodeName: string;
  begin
    if AControl.Name <> '' then
      ANodeName := AControl.Name
    else ANodeName := AControl.ClassName;
    AChild := tvSolutionExplorer.Items.AddChildObject(ANode, ANodeName, AControl);
    AChild.StateIndex := AControl.ImageIndex;
    for I := 0 to AControl.ChildCount - 1 do
       CheckSite(AControl.Children[I], AChild);
  end;
var
  I: Integer;
begin
  if not tvSolutionExplorer.HandleAllocated then exit;
  tvSolutionExplorer.Items.BeginUpdate;
  try
    tvSolutionExplorer.Items.Clear;
    CheckSite(dsHost, nil);
    tvSolutionExplorer.FullExpand;
  finally
    tvSolutionExplorer.Items.EndUpdate;
  end;
  tvSolutionExplorer.Selected := nil;
  for I := 0 to tvSolutionExplorer.Items.Count - 1 do
    if TdxCustomDockControl(tvSolutionExplorer.Items[I].Data) = DockControl then
      tvSolutionExplorer.Selected := tvSolutionExplorer.Items[I];
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.UpdateClassViewTV;
var
  ANode: TTreeNode;
begin
  if not tvClassView.HandleAllocated then Exit;
  tvClassView.Items.BeginUpdate;
  try
    tvClassView.Items.Clear;
    ANode := tvClassView.Items.AddChild(nil, 'TdxCustomDockControl');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxCustomDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxLayoutDockSite');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxTabContainerDockSite');
    ANode := tvClassView.Items.AddChild(ANode, 'TdxSideContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxHorizContainerDockSite');
    tvClassView.Items.AddChild(ANode, 'TdxVertContainerDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[1], 'TdxFloatDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[1], 'TdxDockSite');
    tvClassView.Items.AddChild(tvClassView.Items[0], 'TdxDockPanel');
    tvClassView.FullExpand;
  finally
    tvClassView.Items.EndUpdate;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonStartPageClick(Sender: TObject);
begin
  if (dpStartPage = nil) then exit;
  if not dpStartPage.Visible then
    dpStartPage.Visible := True;
  dxDockingController.ActiveDockControl := dpStartPage;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonSolutionExplorerClick(Sender: TObject);
begin
  if (dpSolutionExplorer = nil) then exit;
  if not dpSolutionExplorer.Visible then
    dpSolutionExplorer.Visible := True;
  dxDockingController.ActiveDockControl := dpSolutionExplorer;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonClassViewClick(Sender: TObject);
begin
  if (dpClassView = nil) then exit;
  if not dpClassView.Visible then
    dpClassView.Visible := True;
  dxDockingController.ActiveDockControl := dpClassView;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonPropertiesClick(Sender: TObject);
begin
  if (dpProperties = nil) then exit;
  if not dpProperties.Visible then
    dpProperties.Visible := True;
  dxDockingController.ActiveDockControl := dpProperties;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonToolBoxClick(Sender: TObject);
begin
  if (dpToolbox = nil) then exit;
  if not dpToolbox.Visible then
    dpToolbox.Visible := True;
  dxDockingController.ActiveDockControl := dpToolbox;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonCallStackClick(Sender: TObject);
begin
  if (dpCallStack = nil) then exit;
  if not dpCallStack.Visible then
    dpCallStack.Visible := True;
  dxDockingController.ActiveDockControl := dpCallStack;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonOutputClick(Sender: TObject);
begin
  if (dpOutput = nil) then exit;
  if not dpOutput.Visible then
    dpOutput.Visible := True;
  dxDockingController.ActiveDockControl := dpOutput;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonWatchClick(Sender: TObject);
begin
  if (dpWatch = nil) then exit;
  if not dpWatch.Visible then
    dpWatch.Visible := True;
  dxDockingController.ActiveDockControl := dpWatch;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonFontClick(Sender: TObject);
begin
  FontDialog1.Font := dxDockingManager1.Font;
  if FontDialog1.Execute then
    dxDockingManager1.Font := FontDialog1.Font;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonColorClick(Sender: TObject);
begin
  ColorDialog1.Color := dxDockingManager1.Color;
  if ColorDialog1.Execute then
    dxDockingManager1.Color := ColorDialog1.Color;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonStandardViewClick(Sender: TObject);
begin
  dxDockingManager1.ViewStyle := vsStandard;
  BarManager.Style := bmsStandard;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonNETViewClick(Sender: TObject);
begin
  dxDockingManager1.ViewStyle := vsNET;
  BarManager.Style := bmsFlat;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonOffice11ViewClick(Sender: TObject);
begin
  dxDockingManager1.ViewStyle := vsOffice11;
  BarManager.Style := bmsOffice11;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonXPViewClick(Sender: TObject);
begin
  dxDockingManager1.ViewStyle := vsXP;
  BarManager.Style := bmsXP;
end;

procedure TDockingMegaDemoMainForm.frSolutionExplorer1TreeView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ANode: TTreeNode;
begin
  ANode := tvSolutionExplorer.GetNodeAt(X, Y);
  if ANode <> nil then
    DockControl := TdxCustomDockControl(ANode.Data)
  else DockControl := dsHost;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonOnWebClick(Sender: TObject);
begin
  Browse(spStart);
end;

procedure TDockingMegaDemoMainForm.dpContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  pt: TPoint;
  AControl: TdxCustomDockControl;
begin
  GetCursorPos(pt);
  AControl := dxDockingController.GetDockControlAtPos(pt);
  if AControl <> nil then
  begin
    FPopupMenuDockControl := AControl;
    dxBarButtonDockable.Down := FPopupMenuDockControl.Dockable;
    dxBarButtonFloating.Down := FPopupMenuDockControl.FloatDockSite <> nil;
    dxBarButtonAutoHide.Enabled := FPopupMenuDockControl.CanAutoHide;
    dxBarButtonAutoHide.Down := FPopupMenuDockControl.AutoHide;
    dxBarPopupMenu1.PopupFromCursorPos;
    Handled := True;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonDockableClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.Dockable := (Sender as TdxBarButton).Down;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonHideClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.Visible := False;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonFloatingClick(Sender: TObject);
var
  pt: TPoint;
begin
  if (FPopupMenuDockControl <> nil) and (FPopupMenuDockControl.DockState <> dsFloating) then
  begin
    GetCursorPos(pt);
    FPopupMenuDockControl.MakeFloating(pt.X, pt.Y);
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonAutoHideClick(Sender: TObject);
begin
  if FPopupMenuDockControl <> nil then
  begin
    FPopupMenuDockControl.AutoHide := (Sender as TdxBarButton).Down;
    FPopupMenuDockControl := nil;
  end;
end;

procedure TDockingMegaDemoMainForm.FormShow(Sender: TObject);
begin
  DockControl := dsHost;
  UpdateSolutionTV;
  UpdateClassViewTV;
  ComboBox1.Align := alClient;
end;

procedure TDockingMegaDemoMainForm.dxBarButtonLoadClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
    dxDockingManager1.LoadLayoutFromIniFile(OpenDialog1.FileName);
end;

procedure TDockingMegaDemoMainForm.dxBarButtonSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    dxDockingManager1.SaveLayoutToIniFile(SaveDialog1.FileName);
end;

procedure TDockingMegaDemoMainForm.dxDockingManager1LayoutChanged(Sender: TdxCustomDockControl);
begin
  UpdateSolutionTV;
end;

procedure TDockingMegaDemoMainForm.SetDockControl(const Value: TdxCustomDockControl);
begin
  if FDockControl <> Value then
  begin
    FDockControl := Value;
    UpdateProperties;
  end;
end;

procedure TDockingMegaDemoMainForm.ApplyProperties;
var
  ADockTypes: TdxDockingTypes;
  ACaptionButtons: TdxCaptionButtons;
begin
  if (FDockControl = nil) or (csDestroying in FDockControl.ComponentState) then exit;

  FDockControl.ManagerColor := cbManagerColor.Checked;
  FDockControl.ManagerFont := cbManagerFont.Checked;
  FDockControl.Caption := eCaption.Text;
  FDockControl.ShowCaption := cbShowCaption.Checked;

  ACaptionButtons := [];
  if cbShowCloseButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbClose];
  if cbShowMaxButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbMaximize];
  if cbShowHideButton.Checked then
    ACaptionButtons := ACaptionButtons + [cbHide];

  FDockControl.CaptionButtons := ACaptionButtons;

  ADockTypes := [];
  if cbAllowDockLeft.Checked then ADockTypes := ADockTypes + [dtLeft];
  if cbAllowDockTop.Checked then ADockTypes := ADockTypes + [dtTop];
  if cbAllowDockRight.Checked then ADockTypes := ADockTypes + [dtRight];
  if cbAllowDockBottom.Checked then ADockTypes := ADockTypes + [dtBottom];
  if cbAllowDockClient.Checked then ADockTypes := ADockTypes + [dtClient];
  FDockControl.AllowDock := ADockTypes;

  FDockControl.AllowFloating := cbAllowFloating.Checked;

  ADockTypes := [];
  if cbAllowDockClientsLeft.Checked then ADockTypes := ADockTypes + [dtLeft];
  if cbAllowDockClientsTop.Checked then ADockTypes := ADockTypes + [dtTop];
  if cbAllowDockClientsRight.Checked then ADockTypes := ADockTypes + [dtRight];
  if cbAllowDockClientsBottom.Checked then ADockTypes := ADockTypes + [dtBottom];
  if cbAllowDockClientsClient.Checked then ADockTypes := ADockTypes + [dtClient];
  FDockControl.AllowDockClients := ADockTypes;

  if FDockControl is TdxTabContainerDockSite then
  begin
    if cbTabsOnTop.Checked then
      (FDockControl as TdxTabContainerDockSite).TabsPosition := tctpTop
    else (FDockControl as TdxTabContainerDockSite).TabsPosition := tctpBottom;
    (FDockControl as TdxTabContainerDockSite).TabsScroll := cbTabsScrollable.Checked;
  end;
end;

procedure TDockingMegaDemoMainForm.UpdateProperties;
begin
  if (FDockControl <> nil) and not (csDestroying in FDockControl.ComponentState) then
  begin
    cbManagerColor.Enabled := True;
    cbManagerColor.Checked := FDockControl.ManagerColor;
    cbManagerFont.Enabled := True;
    cbManagerFont.Checked := FDockControl.ManagerFont;
    eCaption.Enabled := True;
    eCaption.Text := FDockControl.Caption;
    cbShowCaption.Enabled := True;
    cbShowCaption.Checked := FDockControl.ShowCaption;
    cbShowCloseButton.Enabled := True;
    cbShowCloseButton.Checked := cbClose in FDockControl.CaptionButtons;
    cbShowMaxButton.Enabled := True;
    cbShowMaxButton.Checked := cbMaximize in FDockControl.CaptionButtons;
    cbShowHideButton.Enabled := True;
    cbShowHideButton.Checked := cbHide in FDockControl.CaptionButtons;

    cbAllowDockLeft.Enabled := True;
    cbAllowDockLeft.Checked := dtLeft in FDockControl.AllowDock;
    cbAllowDockTop.Enabled := True;
    cbAllowDockTop.Checked := dtTop in FDockControl.AllowDock;
    cbAllowDockRight.Enabled := True;
    cbAllowDockRight.Checked := dtRight in FDockControl.AllowDock;
    cbAllowDockBottom.Enabled := True;
    cbAllowDockBottom.Checked := dtBottom in FDockControl.AllowDock;
    cbAllowDockClient.Enabled := True;
    cbAllowDockClient.Checked := dtClient in FDockControl.AllowDock;
    cbAllowFloating.Enabled := True;
    cbAllowFloating.Checked := FDockControl.AllowFloating;
    cbAllowDockClientsLeft.Enabled := True;
    cbAllowDockClientsLeft.Checked := dtLeft in FDockControl.AllowDockClients;
    cbAllowDockClientsTop.Enabled := True;
    cbAllowDockClientsTop.Checked := dtTop in FDockControl.AllowDockClients;
    cbAllowDockClientsRight.Enabled := True;
    cbAllowDockClientsRight.Checked := dtRight in FDockControl.AllowDockClients;
    cbAllowDockClientsBottom.Enabled := True;
    cbAllowDockClientsBottom.Checked := dtBottom in FDockControl.AllowDockClients;
    cbAllowDockClientsClient.Enabled := True;
    cbAllowDockClientsClient.Checked := dtClient in FDockControl.AllowDockClients;

    if FDockControl is TdxTabContainerDockSite then
    begin
      cbTabsOnTop.Enabled := True;
      cbTabsOnTop.Checked := (FDockControl as TdxTabContainerDockSite).TabsPosition = tctpTop;
      cbTabsScrollable.Enabled := True;
      cbTabsScrollable.Checked := (FDockControl as TdxTabContainerDockSite).TabsScroll;
    end
    else
    begin
      cbTabsOnTop.Enabled := False;
      cbTabsScrollable.Enabled := False;
    end;
    btnApply.Enabled := True;
    btnCancel.Enabled := True;
  end
  else DisableProperties;
end;

procedure TDockingMegaDemoMainForm.DisableProperties;
begin
  cbManagerColor.Checked := False;
  cbManagerColor.Enabled := False;
  cbManagerFont.Checked := False;
  cbManagerFont.Enabled := False;
  eCaption.Text := '';
  eCaption.Enabled := False;
  cbShowCaption.Checked := False;
  cbShowCaption.Enabled := False;
  cbShowCloseButton.Checked := False;
  cbShowCloseButton.Enabled := False;
  cbShowMaxButton.Checked := False;
  cbShowMaxButton.Enabled := False;
  cbShowHideButton.Checked := False;
  cbShowHideButton.Enabled := False;
  cbAllowDockLeft.Checked := False;
  cbAllowDockLeft.Enabled := False;
  cbAllowDockTop.Checked := False;
  cbAllowDockTop.Enabled := False;
  cbAllowDockRight.Checked := False;
  cbAllowDockRight.Enabled := False;
  cbAllowDockBottom.Checked := False;
  cbAllowDockBottom.Enabled := False;
  cbAllowDockClient.Checked := False;
  cbAllowDockClient.Enabled := False;
  cbAllowFloating.Checked := False;
  cbAllowFloating.Enabled := False;
  cbAllowDockClientsLeft.Checked := False;
  cbAllowDockClientsLeft.Enabled := False;
  cbAllowDockClientsTop.Checked := False;
  cbAllowDockClientsTop.Enabled := False;
  cbAllowDockClientsRight.Checked := False;
  cbAllowDockClientsRight.Enabled := False;
  cbAllowDockClientsBottom.Checked := False;
  cbAllowDockClientsBottom.Enabled := False;
  cbAllowDockClientsClient.Checked := False;
  cbAllowDockClientsClient.Enabled := False;
  cbTabsOnTop.Checked := False;
  cbTabsOnTop.Enabled := False;
  cbTabsScrollable.Checked := False;
  cbTabsScrollable.Enabled := False;
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TDockingMegaDemoMainForm.btnApplyClick(Sender: TObject);
begin
  ApplyProperties;
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.btnCancelClick(Sender: TObject);
begin
  UpdateProperties;
end;

procedure TDockingMegaDemoMainForm.tvSolutionExplorerChange(Sender: TObject;
  Node: TTreeNode);
begin
  Node := tvSolutionExplorer.Selected;
  if Node <> nil then
    DockControl := TdxCustomDockControl(Node.Data)
  else DockControl := dsHost;
end;

procedure TDockingMegaDemoMainForm.FormCreate(Sender: TObject);
begin
{$IFDEF DELPHI5}
  dpStartPage.OnContextPopup := dpContextPopup;
  dpProperties.OnContextPopup := dpContextPopup;
  dpSolutionExplorer.OnContextPopup := dpContextPopup;
  dpClassView.OnContextPopup := dpContextPopup;
  dpOutput.OnContextPopup := dpContextPopup;
  dpCallStack.OnContextPopup := dpContextPopup;
  dpWatch.OnContextPopup := dpContextPopup;
  dpToolbox.OnContextPopup := dpContextPopup;
{$ENDIF}
end;

end.
