unit utreedemo1;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule, cxWebControls,
  cxWebIntf, cxWebRender, cxWebTV, cxWebStdCtrls, cxWebImgList;

type
  TTreeDemo1 = class(TcxWebPageModule)
    WebTreeView: TcxWebTreeView;
    StyleController: TcxWebStyleController;
    stTreeDef: TcxWebStyleItem;
    stTreeHover: TcxWebStyleItem;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stEditorDef: TcxWebStyleItem;
    stEditorHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLabelHover: TcxWebStyleItem;
    stLabelDef: TcxWebStyleItem;
    ilImages: TcxWebImageList;
    wlblTitle: TcxWebLabel;
    wlblItemProp: TcxWebLabel;
    wlblImages: TcxWebLabel;
    wlblName: TcxWebLabel;
    wlblText: TcxWebLabel;
    wlblHint: TcxWebLabel;
    wlblURL: TcxWebLabel;
    wlblImIdx: TcxWebLabel;
    wbtnAdd: TcxWebButton;
    wbtnAddCh: TcxWebButton;
    wbtnRemove: TcxWebButton;
    wlblSelItem: TcxWebLabel;
    wedName: TcxWebEdit;
    wedText: TcxWebEdit;
    wedURL: TcxWebEdit;
    wedHint: TcxWebEdit;
    wedImIdx: TcxWebEdit;
    wlblVisProp: TcxWebLabel;
    wchbButtons: TcxWebCheckBox;
    wchbImages: TcxWebCheckBox;
    wlblColor: TcxWebLabel;
    wlblBColor: TcxWebLabel;
    wlblBWidth: TcxWebLabel;
    wlblIndent: TcxWebLabel;
    wedIndent: TcxWebEdit;
    wedBorderWidth: TcxWebEdit;
    wcbBorderColors: TcxWebComboBox;
    wcbColors: TcxWebComboBox;
    wbtnVisApply: TcxWebButton;
    wbtnItemApply: TcxWebButton;
    wlblHelp: TcxWebLabel;
    wbtnExpand: TcxWebButton;
    wbtnCollapse: TcxWebButton;
    wlblBottomBevel: TcxWebLabel;
    wlblTopBevel: TcxWebLabel;
    wcbSelItem: TcxWebComboBox;
    cxWebLabel1: TcxWebLabel;
    cxWebLabel2: TcxWebLabel;
    procedure wbtnVisApplyClick(Sender: TObject);
    procedure wbtnItemApplyClick(Sender: TObject);
    procedure wbtnAddClick(Sender: TObject);
    procedure wbtnAddChClick(Sender: TObject);
    procedure wbtnRemoveClick(Sender: TObject);
    procedure wbtnExpandClick(Sender: TObject);
    procedure wbtnCollapseClick(Sender: TObject);
    procedure WebTreeViewClick(Sender: TObject; Item: TcxWebTreeItem);
    procedure wcbSelItemChange(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    procedure AddColorToCombos(const S: string);
    procedure FillItemsCombo(AItem: TcxWebTreeItem);
  end;

function TreeDemo1: TTreeDemo1;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants,
  cxWebGraphics;

function TreeDemo1: TTreeDemo1;
begin
  Result := TTreeDemo1(WebContext.FindModuleClass(TTreeDemo1));
end;

procedure TTreeDemo1.AddColorToCombos(const S: string);
begin
  wcbColors.Items.Add.Text := S;
  wcbBorderColors.Items.Add.Text := S;
end;

procedure TTreeDemo1.FillItemsCombo(AItem: TcxWebTreeItem);
var
  I: Integer;
begin
  if AItem.Parent <> nil then
    wcbSelItem.Items.Add.Text := AItem.Name;
  for I := 0 to AItem.Count - 1 do
    FillItemsCombo(AItem.Items[I]);
end;

procedure TTreeDemo1.wbtnVisApplyClick(Sender: TObject);
begin
  WebTreeView.Styles.Default.Style.Shading.Color := cxStringToWebColor(wcbColors.Text);
  WebTreeView.Styles.Hover.Style.Shading.Color := cxStringToWebColor(wcbColors.Text);
  WebTreeView.Styles.Default.Style.Borders.Color := cxStringToWebColor(wcbBorderColors.Text);
  WebTreeView.Styles.Hover.Style.Borders.Color := cxStringToWebColor(wcbBorderColors.Text);
  WebTreeView.Styles.Default.Style.Borders.Width := StrToInt(wedBorderWidth.Text);
  WebTreeView.Styles.Hover.Style.Borders.Width := StrToInt(wedBorderWidth.Text);
  WebTreeView.Indent := StrToInt(wedIndent.Text);
  WebTreeView.ShowButtons := wchbButtons.Checked;
  WebTreeView.ShowImages := wchbImages.Checked;
end;

procedure TTreeDemo1.wbtnItemApplyClick(Sender: TObject);
var
  CurItem: TcxWebTreeItem;
begin
  CurItem := WebTreeView.ItemByName(wcbSelItem.Text);
  if CurItem <> nil then
  begin
    CurItem.Text := wedText.Text;
    CurItem.URL.Href := wedURL.Text;
    CurItem.Hint := wedHint.Text;
    CurItem.ImageIndex := StrToInt(wedImIdx.Text);
  end;
end;

procedure TTreeDemo1.wbtnAddClick(Sender: TObject);
var
  CurItem: TcxWebTreeItem;
begin
  CurItem := WebTreeView.ItemByName(wcbSelItem.Text);
  if (CurItem <> nil) and (CurItem.Parent <> nil) then
    CurItem := CurItem.Parent.AddChild
  else
    CurItem := WebTreeView.Items.AddChild;
  wcbSelItem.Items.Add.Text := CurItem.Name;
  wcbSelItem.ItemIndex := wcbSelItem.Items.IndexOfText(CurItem.Name);

end;

procedure TTreeDemo1.wbtnAddChClick(Sender: TObject);
var
  CurItem, NewItem: TcxWebTreeItem;
begin
  CurItem := WebTreeView.ItemByName(wcbSelItem.Text);
  if CurItem <> nil then
  begin
    NewItem := CurItem.AddChild;
    CurItem.Expand(False);
    wcbSelItem.Items.Add.Text := NewItem.Name;
    wcbSelItem.ItemIndex := wcbSelItem.Items.IndexOfText(NewItem.Name);
  end;
end;

procedure TTreeDemo1.wbtnRemoveClick(Sender: TObject);
var
  CurItem: TcxWebTreeItem;
begin
  CurItem := WebTreeView.ItemByName(wcbSelItem.Text);
  if CurItem <> nil then
  begin
    CurItem.Free;
    wcbSelItem.Items.Clear;
    FillItemsCombo(WebTreeView.Items);
    wcbSelItemChange(nil);
  end;
end;

procedure TTreeDemo1.wbtnExpandClick(Sender: TObject);
begin
  WebTreeView.FullExpand;
end;

procedure TTreeDemo1.wbtnCollapseClick(Sender: TObject);
begin
  WebTreeView.FullCollapse;
end;

procedure TTreeDemo1.WebTreeViewClick(Sender: TObject;
  Item: TcxWebTreeItem);
begin
  wcbSelItem.Text := Item.Name;
end;

procedure TTreeDemo1.wcbSelItemChange(Sender: TObject);
var
  CurItem: TcxWebTreeItem;
begin
  CurItem := WebTreeView.ItemByName(wcbSelItem.Text);
  wedName.Text := CurItem.Name;
  wedText.Text := CurItem.Text;
  wedURL.Text := CurItem.URL.Href;
  wedHint.Text := CurItem.Hint;
  wedImIdx.Text := IntToStr(CurItem.ImageIndex);
end;

const
  ImageJsClickCode = 'editor = document.getElementById("wedImIdx");' + #13#10 +
                     'if(editor)' + #13#10 +
                     '{' + #13#10 +
                     '    editor.value = "%d"' + #13#10 +
                     '}';

procedure TTreeDemo1.cxWebPageModuleActivate(Sender: TObject);
var
  I: Integer;
  Img: TcxWebImage;
  Lbl: TcxWebLabel;
begin
  cxGetWebColorValues(AddColorToCombos);
  wcbColors.Text := cxWebColorToString(WebTreeView.Color);
  wcbBorderColors.Text := cxWebColorToString(WebTreeView.Styles.Default.Style.Borders.Color);
  wedBorderWidth.Text := IntToStr(WebTreeView.Styles.Default.Style.Borders.Width);
  wedIndent.Text := IntToStr(WebTreeView.Indent);
  wchbButtons.Checked := WebTreeView.ShowButtons;
  wchbImages.Checked := WebTreeView.ShowImages;
  wcbSelItem.Items.Clear;
  FillItemsCombo(WebTreeView.Items);
  wcbSelItem.ItemIndex := 0;
  wcbSelItemChange(nil);
  // Show Images
  for I := 0 to ilImages.Images.Count - 1 do
  begin
    Img := FindComponent('Img' + IntToStr(I)) as TcxWebImage;
    if Img = nil then
    begin
      Img := TcxWebImage.Create(Self);
      with Img do
      begin
        Parent := Self;
        Name := 'Img' + IntToStr(I);
        SetBounds(wlblImages.Left + wlblImages.Width + 4 + I * 27, wlblImages.Top, 16, 16);
        PictureURL := ilImages.ImagesPath + ilImages.Images.Items[I].FileName;
        with CustomEvents.Add do
        begin
          EventProcType := etSingleLine;
          EventType := Integer(eOnClick);
          HandlerText.Text := Format('javascript:setIndex(%d);', [I]);
        end;
      end;
    end;
    Lbl := FindComponent('Lbl' + IntToStr(I)) as TcxWebLabel;
    if Lbl = nil then
    begin
      Lbl := TcxWebLabel.Create(Self);
      with Lbl do
      begin
        Parent := Self;
        Name := 'Lbl' + IntToStr(I);
        Alignment := whalCenter;
        SetBounds(Img.Left, Img.Top + Img.Height + 4, 16, 16);
        Caption := IntToStr(I);
        Styles.Default := stLabelDef;
      end;
    end;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TTreeDemo1, TcxWebPageInfo.Create('*.html'), caDestroy));
end.
