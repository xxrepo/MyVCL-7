unit WebDateEditHome;

interface

uses
  Windows, SysUtils, Classes, Controls, HTTPApp,
  cxWebModule, cxWebTypes, cxWebColors, cxWebClasses, cxWebControls,
  cxWebCalendar, cxWebStdCtrls, cxWebDataCtrls, cxWebDateEdit, cxWebImgList;

type
  TWebDateEditHomePage = class(TcxWebPageModule)
    WebCalendar: TcxWebCalendar;
    StyleController: TcxWebStyleController;
    wlblTitle: TcxWebLabel;
    wlbCalendarDateLb: TcxWebLabel;
    ilImages: TcxWebImageList;
    wcbShowDate: TcxWebCheckBox;
    cbClientScripts: TcxWebCheckBox;
    cbShowImages: TcxWebCheckBox;
    cbShowYear: TcxWebCheckBox;
    cxWebLabel2: TcxWebLabel;
    wcbStartOfWeek: TcxWebComboBox;
    wcbStyle: TcxWebComboBox;
    cxWebLabel3: TcxWebLabel;
    stStandardTitle: TcxWebStyleItem;
    stStandardOtherMonth: TcxWebStyleItem;
    stStandardSelected: TcxWebStyleItem;
    stStandard: TcxWebStyleItem;
    stStandardDayHeader: TcxWebStyleItem;
    stWheatTitle: TcxWebStyleItem;
    stWheatOtherMonth: TcxWebStyleItem;
    stWheatSelected: TcxWebStyleItem;
    stWheat: TcxWebStyleItem;
    stWheatDayHeader: TcxWebStyleItem;
    stStrongTitle: TcxWebStyleItem;
    stStrongOtherMonth: TcxWebStyleItem;
    stStrongSelected: TcxWebStyleItem;
    stStrong: TcxWebStyleItem;
    stStrongDayHeader: TcxWebStyleItem;
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
    WebDateEdit: TcxWebDateEdit;
    cxWebLabel4: TcxWebLabel;
    cxWebLabel5: TcxWebLabel;
    wlbCalendarDate: TcxWebLabel;
    stStrongButton: TcxWebStyleItem;
    stStrongEditor: TcxWebStyleItem;
    stWheatButton: TcxWebStyleItem;
    stWheatEditor: TcxWebStyleItem;
    stStandardButton: TcxWebStyleItem;
    stStandardEditor: TcxWebStyleItem;
    cbTodayLink: TcxWebCheckBox;
    wlbDateEditDateLb: TcxWebLabel;
    wlbDateEditDate: TcxWebLabel;
    procedure cbClientScriptsClick(Sender: TObject);
    procedure cbShowImagesClick(Sender: TObject);
    procedure cbShowYearClick(Sender: TObject);
    procedure wcbShowDateClick(Sender: TObject);
    procedure wcbStyleChange(Sender: TObject);
    procedure wcbStartOfWeekChange(Sender: TObject);
    procedure WebCalendarSelectDay(Sender: TObject; ADate: TDateTime);
    procedure WebDateEditSelectDay(Sender: TObject; ADate: TDateTime);
    procedure cbTodayLinkClick(Sender: TObject);
    procedure cxWebPageModuleBeforeRender(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebDateEditHomePage: TWebDateEditHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function WebDateEditHomePage: TWebDateEditHomePage;
begin
  Result := TWebDateEditHomePage(WebContext.FindModuleClass(TWebDateEditHomePage));
end;

procedure TWebDateEditHomePage.cbClientScriptsClick(Sender: TObject);
begin
  WebCalendar.ForcePostBack := not cbClientScripts.Checked;
  WebDateEdit.ForcePostBack := not cbClientScripts.Checked;
end;

procedure TWebDateEditHomePage.cbShowImagesClick(Sender: TObject);
begin
  WebCalendar.ShowMonthPictures := cbShowImages.Checked;
  WebDateEdit.ShowMonthPictures := cbShowImages.Checked;
end;

procedure TWebDateEditHomePage.cbShowYearClick(Sender: TObject);
begin
  WebCalendar.ShowYear := cbShowYear.Checked;
  WebDateEdit.ShowYear := cbShowYear.Checked;
end;

procedure TWebDateEditHomePage.wcbShowDateClick(Sender: TObject);
begin
  if wcbShowDate.Checked then
  begin
    wlbCalendarDate.Visible := True;
    wlbDateEditDate.Visible := True;
    wlbCalendarDateLb.Visible := True;
    wlbDateEditDateLb.Visible := True;
    WebCalendar.OnSelectDay := WebCalendarSelectDay;
    WebDateEdit.OnSelectDay := WebDateEditSelectDay;
    wlbCalendarDate.Caption := DateToStr(WebCalendar.SelectedDate);
    wlbDateEditDate.Caption := DateToStr(WebDateEdit.SelectedDate);
  end
  else
  begin
    wlbCalendarDate.Visible := False;
    wlbDateEditDate.Visible := False;
    wlbCalendarDateLb.Visible := False;
    wlbDateEditDateLb.Visible := False;
    WebCalendar.OnSelectDay := nil;
    WebDateEdit.OnSelectDay := nil;
  end;
end;

procedure TWebDateEditHomePage.wcbStyleChange(Sender: TObject);
var
  AStylePrefix: string;
begin
  case wcbStyle.ItemIndex of
    1: AStylePrefix := 'stStandard';
    2: AStylePrefix := 'stWheat';
    3: AStylePrefix := 'stStrong';
  else
    AStylePrefix := '';
  end;
  WebCalendar.Styles.Default := StyleController.ItemByName(AStylePrefix);
  WebCalendar.DayHeaderStyle.Default := StyleController.ItemByName(AStylePrefix + 'DayHeader');
  WebCalendar.OtherMonthDayStyle.Default := StyleController.ItemByName(AStylePrefix + 'OtherMonth');
  WebCalendar.TitleStyle.Default := StyleController.ItemByName(AStylePrefix + 'Title');
  WebCalendar.TodayPanelStyle.Default := StyleController.ItemByName(AStylePrefix + 'Title');
  WebCalendar.SelectedStyle.Default := StyleController.ItemByName(AStylePrefix + 'Selected');

  WebDateEdit.Styles.Default := StyleController.ItemByName(AStylePrefix);
  WebDateEdit.DayHeaderStyle.Default := StyleController.ItemByName(AStylePrefix + 'DayHeader');
  WebDateEdit.OtherMonthDayStyle.Default := StyleController.ItemByName(AStylePrefix + 'OtherMonth');
  WebDateEdit.TitleStyle.Default := StyleController.ItemByName(AStylePrefix + 'Title');
  WebDateEdit.TodayPanelStyle.Default := StyleController.ItemByName(AStylePrefix + 'Title');
  WebDateEdit.SelectedStyle.Default := StyleController.ItemByName(AStylePrefix + 'Selected');
  WebDateEdit.ButtonStyles.Default := StyleController.ItemByName(AStylePrefix + 'Button');
  WebDateEdit.EditorStyles.Default := StyleController.ItemByName(AStylePrefix + 'Editor');
end;

procedure TWebDateEditHomePage.wcbStartOfWeekChange(Sender: TObject);
begin
  WebCalendar.FirstDayOfWeek := TcxFirstDayOfWeek(wcbStartOfWeek.ItemIndex);
  WebDateEdit.FirstDayOfWeek := TcxFirstDayOfWeek(wcbStartOfWeek.ItemIndex);
end;

procedure TWebDateEditHomePage.WebCalendarSelectDay(Sender: TObject;
  ADate: TDateTime);
begin
  wlbCalendarDate.Caption := DateToStr(WebCalendar.SelectedDate);
end;

procedure TWebDateEditHomePage.WebDateEditSelectDay(Sender: TObject;
  ADate: TDateTime);
begin
  wlbDateEditDate.Caption := DateToStr(WebDateEdit.SelectedDate);
end;

procedure TWebDateEditHomePage.cbTodayLinkClick(Sender: TObject);
begin
  WebCalendar.ShowTodayLink := cbTodayLink.Checked;
  WebDateEdit.ShowTodayLink := cbTodayLink.Checked;
end;

procedure TWebDateEditHomePage.cxWebPageModuleBeforeRender(
  Sender: TObject);
begin
  wlbCalendarDate.Caption := DateToStr(WebCalendar.SelectedDate);
  wlbDateEditDate.Caption := DateToStr(WebDateEdit.SelectedDate);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TWebDateEditHomePage, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
