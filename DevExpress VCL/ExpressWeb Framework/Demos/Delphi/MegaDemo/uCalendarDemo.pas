unit uCalendarDemo;

interface

uses
  Windows, SysUtils, Classes, Controls, HTTPApp,
  cxWebModule, cxWebTypes, cxWebColors, cxWebClasses, cxWebControls,
  cxWebCalendar, cxWebStdCtrls, cxWebDataCtrls, cxWebDateEdit, cxWebImgList;

type
  TCalendarDemo = class(TcxWebPageModule)
    cxWebCalendar1: TcxWebCalendar;
    StyleController: TcxWebStyleController;
    wlblTitle: TcxWebLabel;
    cxWebLabel1: TcxWebLabel;
    wlbDate: TcxWebLabel;
    ilImages: TcxWebImageList;
    cxWebPanel1: TcxWebPanel;
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
    procedure cbClientScriptsClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cbShowImagesClick(Sender: TObject);
    procedure cbShowYearClick(Sender: TObject);
    procedure wcbShowDateClick(Sender: TObject);
    procedure wcbStyleChange(Sender: TObject);
    procedure wcbStartOfWeekChange(Sender: TObject);
    procedure cxWebCalendar1SelectDay(Sender: TObject; ADate: TDateTime);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CalendarDemo: TCalendarDemo;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, uMainPage;

function CalendarDemo: TCalendarDemo;
begin
  Result := TCalendarDemo(WebContext.FindModuleClass(TCalendarDemo));
end;

procedure TCalendarDemo.cbClientScriptsClick(Sender: TObject);
begin
  cxWebCalendar1.ForcePostBack := not cbClientScripts.Checked;
end;

procedure TCalendarDemo.cxWebPageModuleActivate(Sender: TObject);
begin
  wlbDate.Caption := DateToStr(cxWebCalendar1.SelectedDate);
end;

procedure TCalendarDemo.cbShowImagesClick(Sender: TObject);
begin
  cxWebCalendar1.ShowMonthPictures := cbShowImages.Checked;
end;

procedure TCalendarDemo.cbShowYearClick(Sender: TObject);
begin
  cxWebCalendar1.ShowYear := cbShowYear.Checked;
end;

procedure TCalendarDemo.wcbShowDateClick(Sender: TObject);
begin
  if wcbShowDate.Checked then
  begin
    wlbDate.Visible := True;
    cxWebLabel1.Visible := True;
    cxWebCalendar1.OnSelectDay := cxWebCalendar1SelectDay;
    wlbDate.Caption := DateToStr(cxWebCalendar1.SelectedDate);
  end
  else
  begin
    wlbDate.Visible := False;
    cxWebLabel1.Visible := False;
    cxWebCalendar1.OnSelectDay := nil;
  end;
end;

procedure TCalendarDemo.wcbStyleChange(Sender: TObject);
begin
  case wcbStyle.ItemIndex of
    1: begin
      cxWebCalendar1.Styles.Default := stStandard;
      cxWebCalendar1.DayHeaderStyle.Default := stStandardDayHeader;
      cxWebCalendar1.OtherMonthDayStyle.Default := stStandardOtherMonth;
      cxWebCalendar1.TitleStyle.Default := stStandardTitle;
      cxWebCalendar1.SelectedStyle.Default := stStandardSelected;
    end;
    2: begin
      cxWebCalendar1.Styles.Default := stWheat;
      cxWebCalendar1.DayHeaderStyle.Default := stWheatDayHeader;
      cxWebCalendar1.OtherMonthDayStyle.Default := stWheatOtherMonth;
      cxWebCalendar1.TitleStyle.Default := stWheatTitle;
      cxWebCalendar1.SelectedStyle.Default := stWheatSelected;
    end;
    3: begin
      cxWebCalendar1.Styles.Default := stStrong;
      cxWebCalendar1.DayHeaderStyle.Default := stStrongDayHeader;
      cxWebCalendar1.OtherMonthDayStyle.Default := stStrongOtherMonth;
      cxWebCalendar1.TitleStyle.Default := stStrongTitle;
      cxWebCalendar1.SelectedStyle.Default := stStrongSelected;
    end;
  else
    cxWebCalendar1.Styles.Default := nil;
    cxWebCalendar1.DayHeaderStyle.Default := nil;
    cxWebCalendar1.OtherMonthDayStyle.Default := nil;
    cxWebCalendar1.SelectedStyle.Default := nil;
    cxWebCalendar1.TitleStyle.Default := nil;
  end;
end;

procedure TCalendarDemo.wcbStartOfWeekChange(Sender: TObject);
begin
  cxWebCalendar1.FirstDayOfWeek := TcxFirstDayOfWeek(wcbStartOfWeek.ItemIndex);
end;

procedure TCalendarDemo.cxWebCalendar1SelectDay(Sender: TObject;
  ADate: TDateTime);
begin
  wlbDate.Caption := DateToStr(cxWebCalendar1.SelectedDate);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TCalendarDemo, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
