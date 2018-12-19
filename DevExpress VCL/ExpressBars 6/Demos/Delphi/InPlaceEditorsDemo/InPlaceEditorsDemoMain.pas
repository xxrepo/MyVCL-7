unit InPlaceEditorsDemoMain;

{$I ..\cxVer.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  Dialogs, StdCtrls, ExtCtrls, cxClasses, cxControls, cxGraphics, cxStyles, dxBar,
  dxBarExtItems, cxBarEditItem, dxRibbon, dxRibbonForm, cxEdit,
  cxShellComboBox, cxDropDownEdit, cxBlobEdit, cxRadioGroup, cxCheckBox, cxLabel, cxTextEdit,
  cxColorComboBox, cxImageComboBox, cxFontNameComboBox, cxCheckComboBox, cxSpinEdit, cxProgressBar,
  cxTrackBar, cxTimeEdit, cxCalendar, cxCheckGroup, cxCurrencyEdit, cxCalc, cxMemo, cxRichEdit,
  cxButtonEdit, cxHyperLinkEdit, cxMaskEdit, cxImage, cxDBLookupComboBox, cxMRUEdit, Db, DBTables, EBarsUtils,
  ImgList, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter;

const
  DemoTabsCount = 6;
  RibbonTabsCount = 9;

  TabCaptions: array [0..RibbonTabsCount - 1] of string = ('Value Editors ', 'Multi-line Text Editors', 'Text Editors',
    'Image Editors', 'Combo Boxes', 'Check Boxes & Groups', 'Styles', 'Ribbon options', 'Help');

  SToolBarDescription = 'Edit values using bar editors and see the results below';
  SDemoDescription = 'This demo illustrates the use of thirty different in-place editors from the ExpressEditors' +
  ' Library. The ExpressEditors Library is not a part of ExpressBars v6 and must be' +
  ' purchased separately. Select Help | About for more information.';
  SRibbonOptionsDescription = 'Use these options to customize Ribbon control appearance settings and toggle the Ribbon UI on/off.';
  SEditorStyles = 'Choose an in-place editor to be displayed by a TcxBarEdit item and apply different styles to the item''s caption and editor.';
  SImageEditDescription = 'Load images in bar editors and see the results below';
  SCheckBoxesDescription = SToolBarDescription;
  SMultiLineTextEdits = SToolBarDescription;
  SFileFindError = 'File %s not found';

type
  TcxBaseFrameCategory = (bfcValueEditors, bfcMultilineTextEditors, bfcTextEditors,
    bfcImageEditors, bfcComboBoxes, bfcCheckBoxes, bfcStyles, bfcRibbonOptions);

  TfrmMain = class(TdxCustomRibbonForm)
    BarManager: TdxBarManager;
    lblSelectEditorsBarHeader: TdxBarStatic;
    btnEditorStyles: TdxBarButton;
    btnTextEdit: TdxBarButton;
    btnMultilineTextEdits: TdxBarButton;
    btnValueEdits: TdxBarButton;
    tlbValueEdits: TdxBar;
    tlbMultilineTextEdits: TdxBar;
    tlbTextEdits: TdxBar;
    tlbEditorStyles: TdxBar;
    cbStyle: TcxBarEditItem;
    cbStyleEdit: TcxBarEditItem;
    cbSelectEditType: TcxBarEditItem;
    edtPreviewItem: TcxBarEditItem;
    cxStyleRepository1: TcxStyleRepository;
    Standard: TcxStyle;
    Italicized: TcxStyle;
    Colored: TcxStyle;
    Panel2: TPanel;
    tlbRibbonOptions: TdxBar;
    fncRibbonFontName: TcxBarEditItem;
    cbRibbonFont: TcxBarEditItem;
    ccbAssignedRibbonFonts: TcxBarEditItem;
    btnRibbonStyle: TdxBarButton;
    seFontSize: TcxBarEditItem;
    prbFontSize: TcxBarEditItem;
    trbFontSize: TcxBarEditItem;
    edtTime: TcxBarEditItem;
    edtDate: TcxBarEditItem;
    cbFontSize: TcxBarEditItem;
    dxBarDockControl1: TdxBarDockControl;
    Panel1: TPanel;
    clcFontColor: TcxBarEditItem;
    fncPathFontName: TcxBarEditItem;
    scbSelectPath: TcxBarEditItem;
    btnImageEditors: TdxBarButton;
    btnComboBoxes: TdxBarButton;
    btnCheckBoxes: TdxBarButton;
    edtMoney: TcxBarEditItem;
    edtCalculate: TcxBarEditItem;
    edtBlob: TcxBarEditItem;
    memMemo: TcxBarEditItem;
    reRich: TcxBarEditItem;
    beCompanyName: TcxBarEditItem;
    edtSite: TcxBarEditItem;
    lblCompanyName: TcxBarEditItem;
    mePhoneNum: TcxBarEditItem;
    edtCompanyName: TcxBarEditItem;
    tlbImageEditors: TdxBar;
    edtImage: TcxBarEditItem;
    edtBlobImage: TcxBarEditItem;
    tlbComboBoxes: TdxBar;
    imcImages: TcxBarEditItem;
    cbLookUp: TcxBarEditItem;
    edtLastPath: TcxBarEditItem;
    tlbCheckBoxes: TdxBar;
    chbMonochrome: TcxBarEditItem;
    cbSelectColor: TcxBarEditItem;
    chgSelectColor: TcxBarEditItem;
    rgSelectColor: TcxBarEditItem;
    Image1: TImage;
    Bold: TcxStyle;
    DataSource: TDataSource;
    tblContacts: TTable;
    Database: TDatabase;
    siValueEditors: TdxBarSubItem;
    btnExit: TdxBarButton;
    tlbMainMenu: TdxBar;
    siFile: TdxBarSubItem;
    siView: TdxBarSubItem;
    siHelp: TdxBarSubItem;
    siBarStyles: TdxBarSubItem;
    btnShowDescription: TdxBarButton;
    btnToolBarDescriptions: TdxBarButton;
    btnBarsHelp: TdxBarButton;
    btnDockingHelp: TdxBarButton;
    btnDownloads: TdxBarButton;
    btnRateDemo: TdxBarButton;
    btnDXOnTheWeb: TdxBarButton;
    btnSupport: TdxBarButton;
    btnProducts: TdxBarButton;
    btnMyDX: TdxBarButton;
    tlbHelp: TdxBar;
    lblDemoDescription: TLabel;
    siCheckBoxes: TdxBarSubItem;
    siTextEditors: TdxBarSubItem;
    siMultilineTextEditors: TdxBarSubItem;
    siImageEditors: TdxBarSubItem;
    siComboBoxes: TdxBarSubItem;
    tlbEditorType: TdxBar;
    tlbPreview: TdxBar;
    btnStandard: TdxBarButton;
    btnEnhanced: TdxBarButton;
    btnFlat: TdxBarButton;
    btnXP: TdxBarButton;
    btnOffice11: TdxBarButton;
    tlbTextEditorsInSubMenu: TdxBar;
    tlbValueEditorsInSubMenu: TdxBar;
    tlbMultiLineTextEditorsInSubMenu: TdxBar;
    tlbImageEditorsInSubMenu: TdxBar;
    tlbComboBoxesInSubMenu: TdxBar;
    tlbCheckBoxesInSubMenu: TdxBar;
    btnAbout: TdxBarLargeButton;
    tlbDateTimeValues: TdxBar;
    tlbScaleValues: TdxBar;
    tlbShellMRUCombo: TdxBar;
    tlbImageLookUpCombo: TdxBar;
    tlbColorScheme: TdxBar;
    btnBlueRibbonScheme: TdxBarLargeButton;
    BlackRibbonScheme: TdxBarLargeButton;
    SilverRibbonSheme: TdxBarLargeButton;
    edtPopup: TcxBarEditItem;
    memPopup: TMemo;
    tblContactsID: TAutoIncField;
    tblContactsProductID: TIntegerField;
    tblContactsFirstName: TStringField;
    tblContactsLastName: TStringField;
    tblContactsCompany: TStringField;
    tblContactsAddress: TStringField;
    tblContactsCity: TStringField;
    tblContactsState: TStringField;
    tblContactsPurchaseDate: TDateField;
    tblContactsPaymentType: TStringField;
    tblContactsPaymentAmount: TBCDField;
    tblContactsFullName: TStringField;
    ilSmall: TcxImageList;
    ilLarge: TcxImageList;
    siGroup: TdxBarSubItem;
    procedure btnEditorStylesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSelectEditTypeChange(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbRibbonFontChange(Sender: TObject);
    procedure ccbAssignedRibbonFontsChange(Sender: TObject);
    procedure btnRibbonStyleClick(Sender: TObject);
    procedure seFontSizeChange(Sender: TObject);
    procedure edtCompanyNameChange(Sender: TObject);
    procedure edtMoneyChange(Sender: TObject);
    procedure clcFontColorChange(Sender: TObject);
    procedure edtSiteChange(Sender: TObject);
    procedure chgSelectColorChange(Sender: TObject);
    procedure chbMonochromeChange(Sender: TObject);
    procedure scbSelectPathChange(Sender: TObject);
    procedure edtLastPathChange(Sender: TObject);
    procedure edtImageChange(Sender: TObject);
    procedure reRichChange(Sender: TObject);
    procedure memMemoChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnShowDescriptionClick(Sender: TObject);
    procedure btnToolBarDescriptionsClick(Sender: TObject);
    procedure beCompanyNamePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cbStyleEditChange(Sender: TObject);
    procedure imcImagesChange(Sender: TObject);
    procedure fncRibbonFontNameChange(Sender: TObject);
    procedure btnStandardClick(Sender: TObject);
    procedure btnBlueRibbonSchemeClick(Sender: TObject);
    procedure edtDateChange(Sender: TObject);
    procedure cbLookUpChange(Sender: TObject);
    procedure tblContactsCalcFields(DataSet: TDataSet);
    procedure edtPopupPropertiesCloseUp(Sender: TObject);
    procedure cbFontSizePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    FRibbon: TdxRibbon;
    FUpdateLock: Boolean;

    procedure CreateFrames;
    procedure RibbonTabChanged(Sender: TdxCustomRibbon);

    procedure UpdateCheckBoxesView;
    procedure UpdateComboBoxesView;
    procedure UpdateImageEditorsView;
    procedure UpdateMultilineTextEditorsView;
    procedure UpdateValueEditorsView;
    procedure UpdateTextEditView;

    procedure InitializeComboBoxes;
    procedure InitializeCheckBoxes;
    procedure InitializeImageEditors;
    procedure InitializeMultilineTextEditors;
    procedure InitializeTextEditors;
    procedure InitializeValueEditors;
    procedure InitializeEditorStyles;
    procedure InitializeRibbon;

    procedure InitializeFrames;

    procedure SynchronizeCalcValueEditors(AValue: Variant);
    procedure SynchronizeCheckGroupEditors(AValue: Variant);
    procedure SynchronizeImageEditors(AValue: Variant);
    procedure SynchronizeMultilineTextEditors(AValue: Variant);
    procedure SynchronizePathEditors(AValue: Variant);
    procedure SynchronizeRibbonFontEditors;
    procedure SynchronizeValueEditors(AValue: Variant);
    procedure SynchronizeTextEditors(AValue: Variant);

    procedure SetEditorStyle(APropName: string; AStyleSource: TcxBarEditItem);
    procedure UpdateActionsImages;
  public
    procedure HideAllFrames;
    procedure ShowAllDemoToolbars(AVisible: Boolean);
    procedure SelectNonRibbonTab(ATabIndex: Integer);
    procedure SelectTab(ATabIndex: Integer);
  end;

var
  frmMain: TfrmMain;

implementation

uses
  InPlaceEditorsDemoFrameManager, InPlaceEditorsDemoComboBoxes, InPlaceEditorsDemoImage,
  InPlaceEditorsDemoText, InPlaceEditorsDemoMultiLineText, InPlaceEditorsDemoValue,
  InPlaceEditorsDemoCheckBoxes, InPlaceEditorsDemoAbout;

{$R *.dfm}

procedure TfrmMain.btnEditorStylesClick(Sender: TObject);
begin
  SelectNonRibbonTab(TdxBarItem(Sender).Category);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  dmCommonData.AboutFormClass := TfrmAbout;
  CreateFrames;

  TWinControl(dxBarDockControl1).Align := alTop;
  lblDemoDescription.Caption := SDemoDescription;
  Panel1.Align := alClient;
  Panel2.Align := alClient;

  tblContacts.Open;
  BarManager.BeginUpdate;
  try
    InitializeComboBoxes;
    InitializeCheckBoxes;
    InitializeImageEditors;
    InitializeMultilineTextEditors;
    InitializeTextEditors;
    InitializeValueEditors;
    InitializeEditorStyles;
    InitializeRibbon;
 
    InitializeFrames;

    BarManager.Style := bmsOffice11;

    UpdateActionsImages;

    BarManager.Bars[1].Visible := True;
    SelectNonRibbonTab(1);
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TfrmMain.HideAllFrames;
var
  I: Integer;
begin
  for I := 0 to AFrameManager.FramesCount - 1 do
    TForm(AFrameManager[I]).Hide;
end;

procedure TfrmMain.ShowAllDemoToolbars(AVisible: Boolean);
var
  I: Integer;
begin
  BarManager.BeginUpdate;
  try
    for I := 0 to BarManager.Bars.Count - 1 do
      if BarManager.Bars[I].Tag <> 0 then
        BarManager.Bars[I].Visible := AVisible;
  finally
    BarManager.EndUpdate;
  end;
end;

procedure TfrmMain.SelectNonRibbonTab(ATabIndex: Integer);
var
  I, APos: Integer;
begin
  ShowAllDemoToolbars(False);
  APos := 0;
  BarManager.BeginUpdate;
  try
    for I := 0 to BarManager.Bars.Count - 1 do
      if  BarManager.Bars[I].Tag = ATabIndex then
      begin
        BarManager.Bars[I].Move(dxBarDockControl1, APos, 0);
        BarManager.Bars[I].Visible := True;
        Inc(APos);
      end;
  finally
    BarManager.EndUpdate;
  end;
  SelectTab(ATabIndex);
end;

procedure TfrmMain.SelectTab(ATabIndex: Integer);
begin
  HideAllFrames;
  if ATabIndex <= AFrameManager.FramesCount then
    AFrameManager[ATabIndex - 1].Show;
end;

procedure TfrmMain.RibbonTabChanged(Sender: TdxCustomRibbon);
begin
  SelectTab(Sender.ActiveTab.Tag);
end;

procedure TfrmMain.CreateFrames;
begin
  AFrameManager.AddFrame(TfrmValueEditors.Create(Self), Ord(bfcValueEditors));
  AFrameManager.AddFrame(TfrmMultiLineTextEditors.Create(Self), Ord(bfcMultilineTextEditors));
  AFrameManager.AddFrame(TfrmTextEditors.Create(Self), Ord(bfcTextEditors));
  AFrameManager.AddFrame(TfrmImageEditors.Create(Self), Ord(bfcImageEditors));
  AFrameManager.AddFrame(TfrmComboBoxes.Create(Self), Ord(bfcComboBoxes));
  AFrameManager.AddFrame(TfrmCheckBoxes.Create(Self), Ord(bfcCheckBoxes));
  AFrameManager.AddFrame(TEditorDemoBaseFrame.Create(Self), Ord(bfcStyles));
  AFrameManager.AddFrame(TEditorDemoBaseFrame.Create(Self), Ord(bfcRibbonOptions));
end;

procedure TfrmMain.UpdateCheckBoxesView;
begin
  TfrmCheckBoxes(AFrameManager[Ord(bfcCheckBoxes)]).SetParameters(rgSelectColor.EditValue, chgSelectColor.EditValue, chbMonochrome.EditValue);
end;

procedure TfrmMain.UpdateComboBoxesView;
var
  AImage: TBitmap;
begin
  AImage := TBitmap.Create;
  try
    ilSmall.GetImage(imcImages.EditValue, AImage);

    TfrmComboBoxes(AFrameManager[Ord(bfcComboBoxes)]).SetParameters(clcFontColor.EditValue, fncPathFontName.EditValue,
      scbSelectPath.EditValue, tblContacts.FieldByName('FullName').AsString, cbFontSize.EditValue, AImage);
  finally
    AImage.Free;
  end;
end;

procedure TfrmMain.UpdateImageEditorsView;
var
  AStream: TStringStream;
begin
  if edtImage.EditValue = Null then
    AStream := nil
  else
    AStream := TStringStream.Create(edtImage.EditValue);
  try
    TfrmImageEditors(AFrameManager.Frames[Ord(bfcImageEditors)]).SetParameters(AStream);
  finally
    AStream.Free;
  end;
end;

procedure TfrmMain.UpdateMultilineTextEditorsView;
var
  AStream: TStringStream;
begin
  AStream := TStringStream.Create(edtBlob.EditValue);
  try
    TfrmMultiLineTextEditors(AFrameManager.Frames[Ord(bfcMultilineTextEditors)]).SetParameters(nil, AStream);
  finally
    AStream.Free;
  end;
end;

procedure TfrmMain.UpdateValueEditorsView;

  function GetFontSize: Integer;
  begin
    Result := prbFontSize.EditValue;
  end;

  function GetDate: string;
  begin
    if edtDate.EditValue <> Null then
      Result := edtDate.EditValue
    else
      Result := '';
  end;

  function GetTime: string;
  begin
    Result := edtTime.EditValue;
  end;

  function GetMoney: Currency;
  begin
    if edtMoney.EditValue <> Null then
      Result := edtMoney.EditValue
    else
      Result := 0;
  end;

begin
  TfrmValueEditors(AFrameManager.Frames[Ord(bfcValueEditors)]).SetParameters(GetFontSize, GetDate, GetTime, GetMoney);
end;

procedure TfrmMain.UpdateTextEditView;
begin
  TfrmTextEditors(AFrameManager[Ord(bfcTextEditors)]).SetParameters(edtCompanyName.EditValue, edtSite.EditValue, mePhoneNum.EditValue);
end;

procedure TfrmMain.cbSelectEditTypeChange(Sender: TObject);
var
  AIndex: Integer;
  APropertiesClass: TcxCustomEditPropertiesClass;
  AItem: TcxBarEditItem;
begin
  AIndex := TcxComboBoxProperties(cbSelectEditType.Properties).Items.IndexOf(cbSelectEditType.EditValue);
  APropertiesClass := TcxCustomEditPropertiesClass(GetRegisteredEditProperties.Items[AIndex]);

  for AIndex := 0 to BarManager.ItemCount - 1 do
    if BarManager.Items[AIndex] is TcxBarEditItem then
    begin
      AItem := TcxBarEditItem(BarManager.Items[AIndex]);
      if (AItem.Category in [1..DemoTabsCount]) and
        (AItem.Properties.ClassType = APropertiesClass) then
      begin
        edtPreviewItem.EditValue := Null;
        edtPreviewItem.PropertiesClass := APropertiesClass;
        edtPreviewItem.Properties.Assign(AItem.Properties);
        edtPreviewItem.EditValue := AItem.EditValue;
        edtPreviewItem.Caption := cbSelectEditType.EditValue;
      end;
    end;
end;

procedure TfrmMain.cbStyleChange(Sender: TObject);
begin
  SetEditorStyle('Style', cbStyle);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  tblContacts.Close;
end;

procedure TfrmMain.UpdateActionsImages;
begin
  btnDockingHelp.ImageIndex := 18;
  btnBarsHelp.ImageIndex := 18;
  btnDXOnTheWeb.ImageIndex := 20;
  btnMyDX.ImageIndex := 20;
  btnDownloads.ImageIndex := 20;
  btnProducts.ImageIndex := 20;
  btnSupport.ImageIndex := 21;
  btnRateDemo.ImageIndex := 22;
  btnAbout.LargeImageIndex := 19;
  btnAbout.ImageIndex := 19;
end;

procedure TfrmMain.cbRibbonFontChange(Sender: TObject);
begin
  SynchronizeRibbonFontEditors;
end;

procedure TfrmMain.ccbAssignedRibbonFontsChange(Sender: TObject);
var
  I: Integer;
  AValue: string;
  AFonts: TdxRibbonAssignedFonts;
begin
  if not FUpdateLock then
  begin
    AValue := ccbAssignedRibbonFonts.EditValue;
    AFonts := FRibbon.Fonts.AssignedFonts;
    for I := 1 to TcxCheckComboBoxProperties(ccbAssignedRibbonFonts.Properties).Items.Count do
      if AValue[I] = '1' then
        Include(AFonts, TdxRibbonAssignedFont(I - 1))
      else
        Exclude(AFonts, TdxRibbonAssignedFont(I - 1));
    FRibbon.Fonts.AssignedFonts := AFonts;
    SynchronizeRibbonFontEditors;
  end;
end;

procedure TfrmMain.btnRibbonStyleClick(Sender: TObject);
begin
  if btnRibbonStyle.Down then
  begin
    BarManager.BeginUpdate;
    try
      tlbMainMenu.Visible := False;
      FRibbon.BarManager := BarManager;
      FRibbon.Visible := True;
      FRibbon.SupportNonClientDrawing := True;
      ShowAllDemoToolbars(True);
      tlbRibbonOptions.Visible := True;
      tlbHelp.Visible := True;
      FRibbon.Tabs[0].Active := True;
      lblDemoDescription.Align := alBottom;
      TcxCheckGroupProperties(chgSelectColor.Properties).Columns := 3;
      TcxRadioGroupProperties(rgSelectColor.Properties).Columns := 3;
      SelectTab(1);
    finally
      BarManager.EndUpdate;
    end;
  end
  else
  begin
    BarManager.BeginUpdate;
    try
      tlbRibbonOptions.Visible := False;
      tlbHelp.Visible := False;
      FRibbon.SupportNonClientDrawing := False;
      FRibbon.Visible := False;
      FRibbon.BarManager := nil;
      btnValueEdits.Down := True;
      ShowAllDemoToolbars(False);
      tlbMainMenu.Visible := True;
      TcxCheckGroupProperties(chgSelectColor.Properties).Columns := 1;
      TcxRadioGroupProperties(rgSelectColor.Properties).Columns := 1;
      SelectNonRibbonTab(1);
    finally
      BarManager.EndUpdate;
    end;
    lblDemoDescription.Align := alTop;
  end;
end;

procedure TfrmMain.seFontSizeChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeValueEditors(TcxBarEditItem(Sender).EditValue);
    UpdateValueEditorsView;
  end;
end;

procedure TfrmMain.edtCompanyNameChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeTextEditors(TcxBarEditItem(Sender).EditValue);
    UpdateTextEditView;
  end;
end;

procedure TfrmMain.edtMoneyChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeCalcValueEditors(TcxBarEditItem(Sender).EditValue);
    UpdateValueEditorsView;
  end;
end;

procedure TfrmMain.InitializeComboBoxes;
begin
  scbSelectPath.EditValue := GetCurrentDir;
  clcFontColor.EditValue := clWindow;
  AFrameManager[Ord(bfcComboBoxes)].SetDescription(SToolBarDescription);
end;

procedure TfrmMain.InitializeCheckBoxes;
begin
  chbMonochrome.EditValue := False;
  AFrameManager[Ord(bfcCheckBoxes)].SetDescription(SCheckBoxesDescription);
end;

procedure TfrmMain.InitializeImageEditors;
begin
  SynchronizeImageEditors(edtImage.EditValue);
  UpdateImageEditorsView;
  AFrameManager[Ord(bfcImageEditors)].SetDescription(SImageEditDescription);
end;

procedure TfrmMain.InitializeMultilineTextEditors;

  procedure ReadTextFile(AEditor: TcxBarEditItem; AFileName: string);
  var
    AList: TStringList;
  begin
    AList := TStringList.Create;
    try
      if FileExists(AFileName) then
      begin
        AList.LoadFromFile(AFileName);
        AEditor.EditValue := AList.Text;
      end
      else
        ShowMessage(Format(SFileFindError, [AFileName]));
    finally
      AList.Free;
    end;
  end;

begin
  ReadTextFile(reRich, 'EditorCategories.rtf');
  SynchronizeMultilineTextEditors(memPopup.Lines.Text);
  UpdateMultilineTextEditorsView;
  AFrameManager[Ord(bfcMultilineTextEditors)].SetDescription(SMultiLineTextEdits);
end;

procedure TfrmMain.InitializeTextEditors;
begin
  edtCompanyName.EditValue := 'Developer Express Inc.';
  AFrameManager[Ord(bfcTextEditors)].SetDescription(SToolBarDescription);
end;

procedure TfrmMain.InitializeValueEditors;
begin
  edtTime.EditValue := Time;
  edtDate.EditValue := Date;
  AFrameManager[Ord(bfcValueEditors)].SetDescription(SToolBarDescription);
end;

procedure TfrmMain.InitializeEditorStyles;

  procedure InitializeStylesCombo(ABarEditItem: TcxBarEditItem; AStyles: TStrings);
  begin
    TcxComboBoxProperties(ABarEditItem.Properties).Items.AddStrings(AStyles);
    ABarEditItem.EditValue := TcxComboBoxProperties(ABarEditItem.Properties).Items[0];
  end;

var
  I: Integer;
  AStyles: TStringList;
  AItems: TStrings;
begin
  AItems := TcxComboBoxProperties(cbSelectEditType.Properties).Items;
  AItems.BeginUpdate;
  try
    for I := 0 to GetRegisteredEditProperties.Count - 1 do
      AItems.Add(GetRegisteredEditProperties.Descriptions[I]);
  finally
    AItems.EndUpdate;
  end;

  AStyles := TStringList.Create;
  try
    for I := 0 to cxStyleRepository1.Count - 1 do
      AStyles.Add(cxStyleRepository1.Items[I].Name);
    InitializeStylesCombo(cbStyle, AStyles);
    InitializeStylesCombo(cbStyleEdit, AStyles);
  finally
    AStyles.Free;
  end;
  cbSelectEditType.EditValue := 'TextEdit';

  AFrameManager[Ord(bfcStyles)].SetDescription(SEditorStyles);
end;

procedure TfrmMain.InitializeRibbon;

  function AddTab(AToolBar: TdxBar): TdxRibbonTab;
  begin
    Result := FRibbon.Tabs.Add;
    Result.Caption := TabCaptions[FRibbon.Tabs.Count - 1];
    Result.Tag := AToolBar.Tag;
  end;

  procedure AddToolBar(AToolBar: TdxBar);
  begin
    AddTab(AToolBar).AddToolBar(AToolBar);
  end;

  procedure AddDemoToolBars;
  var
    I: Integer;
  begin
    for I := 0 to DemoTabsCount - 1 do
      AddTab(BarManager.Bars[I]);
    for I := 0 to BarManager.Bars.Count - 1 do
      if BarManager.Bars[I].Tag in [1..DemoTabsCount] then
        FRibbon.Tabs[BarManager.Bars[I].Tag - 1].AddToolBar(BarManager.Bars[I]);
  end;

begin
  FRibbon := TdxRibbon.Create(frmMain);
  FRibbon.Parent := frmMain;
  FRibbon.PopupMenuItems := [rpmiMinimizeRibbon];
  FRibbon.SupportNonClientDrawing := False;
  FRibbon.Visible := False;
  FRibbon.BarManager := BarManager;
  cbRibbonFont.EditValue := 'Tab Caption';
  FRibbon.ColorSchemeName := 'Blue';

  AddDemoToolBars;
  
  AddToolBar(tlbEditorType);
  FRibbon.Tabs[FRibbon.Tabs.Count - 1].AddToolBar(tlbEditorStyles);
  FRibbon.Tabs[FRibbon.Tabs.Count - 1].AddToolBar(tlbPreview);

  AddToolBar(tlbRibbonOptions);
  FRibbon.Tabs[FRibbon.Tabs.Count - 1].AddToolBar(tlbColorScheme);
  
  AddToolBar(tlbHelp);
  FRibbon.OnTabChanged := RibbonTabChanged;
  FRibbon.ApplicationButton.Glyph.Assign(Image1.Picture.Bitmap);
  FRibbon.BarManager := nil;
  AFrameManager[Ord(bfcRibbonOptions)].SetDescription(SRibbonOptionsDescription);
end;

procedure TfrmMain.InitializeFrames;
var
  I: Integer;
begin
  for I := 0 to AFrameManager.FramesCount - 1 do
  begin
    AFrameManager[I].Parent := Panel1;
    AFrameManager[I].Align := alClient;
  end;
end;

procedure TfrmMain.SynchronizeCalcValueEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    edtCalculate.EditValue := AValue;
    edtMoney.EditValue := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeCheckGroupEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    cbSelectColor.EditValue := AValue;
    chgSelectColor.EditValue := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeImageEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    edtBlobImage.EditValue := AValue;
    edtImage.EditValue := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeMultilineTextEditors(AValue: Variant);
var
  AStream: TStringStream;
begin
  FUpdateLock := True;
  try
    AStream := TStringStream.Create(AValue);
    try
      edtBlob.EditValue := AValue;
      memMemo.EditValue := AValue;
      memPopup.Lines.Clear;
      memPopup.Lines.LoadFromStream(AStream);
    finally
      AStream.Free;
    end;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizePathEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    scbSelectPath.EditValue := AValue;
    edtLastPath.EditValue := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeRibbonFontEditors;
var
  AFontIndex: Integer;
  S: string;
  ARibbonFont: TdxRibbonAssignedFont;
begin
  FUpdateLock := True;
  try
    AFontIndex := TcxComboBoxProperties(cbRibbonFont.Properties).Items.IndexOf(cbRibbonFont.EditValue);
    case AFontIndex of
      0: fncRibbonFontName.EditValue := FRibbon.Fonts.TabHeader.Name;
      1: fncRibbonFontName.EditValue := FRibbon.Fonts.Group.Name;
      2: fncRibbonFontName.EditValue := FRibbon.Fonts.GroupHeader.Name;
    end;

    S := '';
    for ARibbonFont := Low(TdxRibbonAssignedFont) to High(TdxRibbonAssignedFont) do
      if ARibbonFont in FRibbon.Fonts.AssignedFonts then
        S := S + '1'
      else
        S := S + '0';
    ccbAssignedRibbonFonts.EditValue := S;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeValueEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    seFontSize.EditValue := AValue;
    trbFontSize.EditValue := AValue;
    prbFontSize.EditValue := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.SynchronizeTextEditors(AValue: Variant);
begin
  FUpdateLock := True;
  try
    if ActiveBarControl <> nil then
      ActiveBarControl.HideAll;

    beCompanyName.EditValue := AValue;
    edtCompanyName.EditValue := AValue;
    lblCompanyName.Caption := AValue;
  finally
    FUpdateLock := False;
  end;
end;

procedure TfrmMain.clcFontColorChange(Sender: TObject);
begin
  UpdateComboBoxesView;
end;

procedure TfrmMain.edtSiteChange(Sender: TObject);
begin
  UpdateTextEditView;
end;

procedure TfrmMain.chgSelectColorChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeCheckGroupEditors(TcxBarEditItem(Sender).EditValue);
    UpdateCheckBoxesView;
  end;
end;

procedure TfrmMain.chbMonochromeChange(Sender: TObject);
begin
  UpdateCheckBoxesView;                        
end;

procedure TfrmMain.scbSelectPathChange(Sender: TObject);
var
  AMRUEditLookupItems: TStrings;
  AValue: string;
  AIndex: Integer;
begin
  if not FUpdateLock then
  begin
    AValue := scbSelectPath.EditValue;

    edtLastPath.Properties.BeginUpdate;
    try
      AMRUEditLookupItems := TcxMRUEditProperties(edtLastPath.Properties).LookupItems;
      AIndex := AMRUEditLookupItems.IndexOf(AValue);
      if AIndex <> -1 then
        AMRUEditLookupItems.Move(AIndex, 0)
      else
        AMRUEditLookupItems.Insert(0, AValue);
      if AMRUEditLookupItems.Count > 100 then
        AMRUEditLookupItems.Delete(AMRUEditLookupItems.Count - 1);
    finally
      edtLastPath.Properties.EndUpdate(False);
    end;

    SynchronizePathEditors(AValue);
    UpdateComboBoxesView;
  end;
end;

procedure TfrmMain.edtLastPathChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizePathEditors(TcxBarEditItem(Sender).EditValue);
    UpdateComboBoxesView;
  end;
end;

procedure TfrmMain.edtImageChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeImageEditors(TcxBarEditItem(Sender).EditValue);
    UpdateImageEditorsView;
  end;
end;

procedure TfrmMain.reRichChange(Sender: TObject);
var
  AStream: TStringStream;
begin
  AStream := TStringStream.Create(reRich.EditValue);
  try
    TfrmMultiLineTextEditors(AFrameManager.Frames[Ord(bfcMultilineTextEditors)]).SetParameters(AStream, nil);
  finally
    AStream.Free;
  end;
end;

procedure TfrmMain.memMemoChange(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeMultilineTextEditors(TcxBarEditItem(Sender).EditValue);
    UpdateMultilineTextEditorsView;
  end;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.btnShowDescriptionClick(Sender: TObject);
begin
  lblDemoDescription.Visible := btnShowDescription.Down;
end;

procedure TfrmMain.btnToolBarDescriptionsClick(Sender: TObject);
begin
  AFrameManager.SetDescriptionsVisible(btnToolBarDescriptions.Down);
end;

procedure TfrmMain.beCompanyNamePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  ShowMessage('Company name: ' + beCompanyName.EditValue);
end;

procedure TfrmMain.cbStyleEditChange(Sender: TObject);
begin
  SetEditorStyle('StyleEdit', cbStyleEdit);
end;

procedure TfrmMain.SetEditorStyle(APropName: string; AStyleSource: TcxBarEditItem);
var
  AStyleIndex: Integer;
  AStyle: TcxStyle;
begin
  AStyleIndex := TcxComboBoxProperties(AStyleSource.Properties).Items.IndexOf(AStyleSource.EditValue);
  AStyle := TcxStyle(cxStyleRepository1.Items[AStyleIndex]);
  if APropName = 'Style' then
   edtPreviewItem.Style := AStyle
  else {'StyleEdit'}
   edtPreviewItem.StyleEdit := AStyle;
end;

procedure TfrmMain.imcImagesChange(Sender: TObject);
begin
  UpdateComboBoxesView;
end;

procedure TfrmMain.fncRibbonFontNameChange(Sender: TObject);
var
  AFontIndex: Integer;
begin
  if not FUpdateLock then
  begin
    AFontIndex := TcxComboBoxProperties(cbRibbonFont.Properties).Items.IndexOf(cbRibbonFont.EditValue);
    case AFontIndex of
      0: FRibbon.Fonts.TabHeader.Name := fncRibbonFontName.EditValue;
      1: FRibbon.Fonts.Group.Name := fncRibbonFontName.EditValue;
      2: FRibbon.Fonts.GroupHeader.Name := fncRibbonFontName.EditValue;
    end;
    SynchronizeRibbonFontEditors;
  end;
end;

procedure TfrmMain.btnStandardClick(Sender: TObject);
begin
  BarManager.Style := TdxBarManagerStyle(TComponent(Sender).Tag);
end;

procedure TfrmMain.btnBlueRibbonSchemeClick(Sender: TObject);
begin
  FRibbon.ColorSchemeName := TdxBarLargeButton(Sender).Caption;
end;

procedure TfrmMain.edtDateChange(Sender: TObject);
begin
  UpdateValueEditorsView;
end;

procedure TfrmMain.cbLookUpChange(Sender: TObject);
begin
  tblContacts.Locate('ID', cbLookUp.EditValue, []);
  UpdateComboBoxesView;
end;

procedure TfrmMain.tblContactsCalcFields(DataSet: TDataSet);
begin
  tblContacts.FieldByName('FullName').Value := tblContacts.FieldByName('FirstName').AsString + ' ' + tblContacts.FieldByName('LastName').AsString;
end;

procedure TfrmMain.edtPopupPropertiesCloseUp(Sender: TObject);
begin
  if not FUpdateLock then
  begin
    SynchronizeMultilineTextEditors(memPopup.Lines.Text);
    UpdateMultilineTextEditorsView;
  end;
end;

procedure TfrmMain.cbFontSizePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  if DisplayValue = '' then
    DisplayValue := (Sender as TcxBarEditItem).EditValue;
end;

end.


