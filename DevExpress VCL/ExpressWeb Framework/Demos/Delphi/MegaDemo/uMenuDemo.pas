unit uMenuDemo;

interface

uses
  SysUtils, Classes, HTTPApp,
  cxWebModule, cxWebTypes, cxWebColors, cxWebClasses, cxWebMenus,
  cxWebMainMenu, cxWebControls, cxWebStdCtrls, cxWebImgList;

type
  TMenuDemo1 = class(TcxWebPageModule)
    StyleController: TcxWebStyleController;
    stAreas: TcxWebStyleItem;
    wlblTitle: TcxWebLabel;
    cxWebMainMenu1: TcxWebMainMenu;
    cxWebMainMenu1Item1: TcxWebMenuItem;
    cxWebMainMenu1Item2: TcxWebMenuItem;
    cxWebMainMenu1Item3: TcxWebMenuItem;
    cxWebMainMenu1Item4: TcxWebMenuItem;
    cxWebMainMenu1Item5: TcxWebMenuItem;
    miB2CDemo: TcxWebMenuItem;
    miDataContolsDemo: TcxWebMenuItem;
    miWebGridDemo: TcxWebMenuItem;
    miWebTreeViewDemo: TcxWebMenuItem;
    miWebMenuDemo: TcxWebMenuItem;
    miWebCalendarDemo: TcxWebMenuItem;
    miOrderFormDemo: TcxWebMenuItem;
    cxWebMainMenu1Item13: TcxWebMenuItem;
    cxWebMainMenu1Item14: TcxWebMenuItem;
    cxWebMainMenu1Item15: TcxWebMenuItem;
    cxWebMainMenu1Item16: TcxWebMenuItem;
    cxWebMainMenu1Item17: TcxWebMenuItem;
    cxWebMainMenu1Item18: TcxWebMenuItem;
    cxWebLabel1: TcxWebLabel;
    cxWebLabel2: TcxWebLabel;
    cxWebPopupMenu1: TcxWebPopupMenu;
    pmiB2CDemo: TcxWebMenuItem;
    pmiDataContolsDemo: TcxWebMenuItem;
    pmiWebGridDemo: TcxWebMenuItem;
    pmiWebTreeViewDemo: TcxWebMenuItem;
    pmiWebCalendarDemo: TcxWebMenuItem;
    pmiWebMenuDemo: TcxWebMenuItem;
    pmiOrderFormDemo: TcxWebMenuItem;
    cxWebLabel3: TcxWebLabel;
    cbMainMenuStyles: TcxWebComboBox;
    MenuDefaultStyleDevExpress: TcxWebStyleItem;
    MenuHoverStyleDevExpress: TcxWebStyleItem;
    MenuDefaultStyleWheat: TcxWebStyleItem;
    MenuHoverStyleWheat: TcxWebStyleItem;
    MenuDefaultStyleBright: TcxWebStyleItem;
    MenuHoverStyleBright: TcxWebStyleItem;
    cbHorizontal: TcxWebCheckBox;
    scCommon: TcxWebStyleController;
    stHeader1: TcxWebStyleItem;
    stHeader2: TcxWebStyleItem;
    stPanel: TcxWebStyleItem;
    stButtonDef: TcxWebStyleItem;
    stButtonHover: TcxWebStyleItem;
    stEditorDef: TcxWebStyleItem;
    stEditorHover: TcxWebStyleItem;
    stLabelDef: TcxWebStyleItem;
    stLabelHover: TcxWebStyleItem;
    stTips: TcxWebStyleItem;
    stLine1: TcxWebStyleItem;
    stLine2: TcxWebStyleItem;
    Item1: TcxWebMenuItem;
    cxWebPanel1: TcxWebPanel;
    cxWebPanel2: TcxWebPanel;
    wcbB2CVisible: TcxWebCheckBox;
    wcbOrderFormVisible: TcxWebCheckBox;
    wcbDataControlsVisible: TcxWebCheckBox;
    wcbWebGridVisible: TcxWebCheckBox;
    wcbTreeViewVisible: TcxWebCheckBox;
    wcbCalendarVisible: TcxWebCheckBox;
    wcbMenuVisible: TcxWebCheckBox;
    wcbWebMenuEnabled: TcxWebCheckBox;
    wcbCalendarEnabled: TcxWebCheckBox;
    wcbTreeViewEnabled: TcxWebCheckBox;
    wcbWebGridEnabled: TcxWebCheckBox;
    wcbDataControlsEnabled: TcxWebCheckBox;
    wcbOrderFormEnabled: TcxWebCheckBox;
    wcbB2CEnabled: TcxWebCheckBox;
    ilImages: TcxWebImageList;
    Item2: TcxWebMenuItem;
    procedure cbMainMenuStylesChange(Sender: TObject);
    procedure cbHorizontalClick(Sender: TObject);
    procedure wcbB2CVisibleClick(Sender: TObject);
    procedure wcbOrderFormVisibleClick(Sender: TObject);
    procedure wcbDataControlsVisibleClick(Sender: TObject);
    procedure wcbWebGridVisibleClick(Sender: TObject);
    procedure wcbTreeViewVisibleClick(Sender: TObject);
    procedure wcbCalendarVisibleClick(Sender: TObject);
    procedure wcbMenuVisibleClick(Sender: TObject);
    procedure wcbB2CEnabledClick(Sender: TObject);
    procedure wcbOrderFormEnabledClick(Sender: TObject);
    procedure wcbDataControlsEnabledClick(Sender: TObject);
    procedure wcbWebGridEnabledClick(Sender: TObject);
    procedure wcbTreeViewEnabledClick(Sender: TObject);
    procedure wcbCalendarEnabledClick(Sender: TObject);
    procedure wcbWebMenuEnabledClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MenuDemo1: TMenuDemo1;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, uMainPage;

function MenuDemo1: TMenuDemo1;
begin
  Result := TMenuDemo1(WebContext.FindModuleClass(TMenuDemo1));
end;

procedure TMenuDemo1.cbMainMenuStylesChange(Sender: TObject);
begin
  case cbMainMenuStyles.ItemIndex of
    1: begin
      cxWebMainMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleDevExpress');
      cxWebMainMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleDevExpress');
      cxWebMainMenu1.SeparatorColor :=  clWebDeepSkyBlue;
      cxWebMainMenu1.ImagesBackgroundColor := clWebLightSkyBlue;

      cxWebPopupMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleDevExpress');
      cxWebPopupMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleDevExpress');
      cxWebPopupMenu1.SeparatorColor :=  clWebDeepSkyBlue;
      cxWebPopupMenu1.ImagesBackgroundColor := clWebLightSkyBlue;
    end;
    2: begin
      cxWebMainMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleWheat');
      cxWebMainMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleWheat');
      cxWebMainMenu1.SeparatorColor :=  clWebBlack;
      cxWebMainMenu1.ImagesBackgroundColor := clWebDarkSalmon;

      cxWebPopupMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleWheat');
      cxWebPopupMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleWheat');
      cxWebPopupMenu1.SeparatorColor :=  clWebBlack;
      cxWebPopupMenu1.ImagesBackgroundColor := clWebDarkSalmon;
    end;
    3: begin
      cxWebMainMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleBright');
      cxWebMainMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleBright');
      cxWebMainMenu1.SeparatorColor :=  clWebDarkBlue;
      cxWebMainMenu1.ImagesBackgroundColor := clWebLightSkyBlue;

      cxWebPopupMenu1.Styles.Default := StyleController.ItemByName('MenuDefaultStyleBright');
      cxWebPopupMenu1.Styles.Hover := StyleController.ItemByName('MenuHoverStyleBright');
      cxWebMainMenu1.SeparatorColor :=  clWebDarkBlue;
      cxWebPopupMenu1.ImagesBackgroundColor := clWebLightSkyBlue;
    end;
  else
    cxWebMainMenu1.Styles.Default := nil;
    cxWebMainMenu1.Styles.Hover := nil;
    cxWebMainMenu1.SeparatorColor :=  clWebBlack;
    cxWebMainMenu1.ImagesBackgroundColor := clWebSilver;

    cxWebPopupMenu1.Styles.Default := nil;
    cxWebPopupMenu1.Styles.Hover := nil;
    cxWebPopupMenu1.SeparatorColor :=  clWebBlack;
    cxWebPopupMenu1.ImagesBackgroundColor := clWebSilver;
  end;
end;

procedure TMenuDemo1.cbHorizontalClick(Sender: TObject);
begin
  cxWebMainMenu1.Horizontal := cbHorizontal.Checked;
end;

procedure TMenuDemo1.wcbB2CVisibleClick(Sender: TObject);
begin
  miB2CDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiB2CDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbOrderFormVisibleClick(Sender: TObject);
begin
  miOrderFormDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiOrderFormDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbDataControlsVisibleClick(Sender: TObject);
begin
  miDataContolsDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiDataContolsDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbWebGridVisibleClick(Sender: TObject);
begin
  miWebGridDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiWebGridDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbTreeViewVisibleClick(Sender: TObject);
begin
  miWebTreeViewDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiWebTreeViewDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbCalendarVisibleClick(Sender: TObject);
begin
  miWebCalendarDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiWebCalendarDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbMenuVisibleClick(Sender: TObject);
begin
  miWebMenuDemo.Visible := TcxWebCheckBox(Sender).Checked;
  pmiWebMenuDemo.Visible := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbB2CEnabledClick(Sender: TObject);
begin
  miB2CDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiB2CDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbOrderFormEnabledClick(Sender: TObject);
begin
  miOrderFormDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiOrderFormDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbDataControlsEnabledClick(Sender: TObject);
begin
  miDataContolsDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiDataContolsDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbWebGridEnabledClick(Sender: TObject);
begin
  miWebGridDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiWebGridDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbTreeViewEnabledClick(Sender: TObject);
begin
  miWebTreeViewDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiWebTreeViewDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbCalendarEnabledClick(Sender: TObject);
begin
  miWebCalendarDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiWebCalendarDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

procedure TMenuDemo1.wcbWebMenuEnabledClick(Sender: TObject);
begin
  miWebMenuDemo.Enabled := TcxWebCheckBox(Sender).Checked;
  pmiWebMenuDemo.Enabled := TcxWebCheckBox(Sender).Checked;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TMenuDemo1, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
