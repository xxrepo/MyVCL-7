unit GanttViewDemoMain;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils, Classes, Variants, 
  Graphics, Controls, Forms, Dialogs, DemoBasicMain, cxLookAndFeels, ActnList,
  ImgList, Menus, StdCtrls, ComCtrls, cxStyles, cxGraphics, cxEdit, cxScheduler,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerStorage,
  cxControls, cxContainer, cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, Buttons,
  cxSchedulerWeekView, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerYearView, cxSchedulerHolidays, cxSchedulerGanttView,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxScheduler3Painter;

type
  TGanttViewDemoMainForm = class(TDemoBasicMainForm)
    SchedulerStorage: TcxSchedulerStorage;
    askOptions1: TMenuItem;
    miHotTrack: TMenuItem;
    miShowAsProgress: TMenuItem;
    miShowTotalProgress: TMenuItem;
    miShowExpandButtons: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure miHotTrackClick(Sender: TObject);
    procedure miShowAsProgressClick(Sender: TObject);
    procedure miShowTotalProgressClick(Sender: TObject);
    procedure miShowExpandButtonsClick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  GanttViewDemoMainForm: TGanttViewDemoMainForm;

implementation

{$R *.dfm}

uses
  cxClasses;

constructor TGanttViewDemoMainForm.Create(AOwner: TComponent);
var
  ADate: TDateTime;
begin
  inherited Create(AOwner);
  miView.Visible := False;
  Options1.Visible := False;
  miEventsOpt.Visible := False;
  Resources1.Visible := False;
  ADate := EncodeDate(2008, 01, 31);
  SchedulerStorage.LoadFromFile('..\..\Data\cxSchedulerGanttViewData.bin');
  Scheduler.SelectDays(ADate, ADate, True);
end;

procedure TGanttViewDemoMainForm.miHotTrackClick(Sender: TObject);
begin
  Scheduler.OptionsBehavior.HotTrack := miHotTrack.Checked;
end;

procedure TGanttViewDemoMainForm.miShowAsProgressClick(Sender: TObject);
const
  EventStyles: array[Boolean] of TcxSchedulerGanttViewEventStyle =
    (esDefault, esProgress);
begin
  Scheduler.ViewGantt.EventsStyle := EventStyles[miShowAsProgress.Checked];
  miShowTotalProgress.Enabled := Scheduler.ViewGantt.EventsStyle = esProgress;
end;

procedure TGanttViewDemoMainForm.miShowTotalProgressClick(Sender: TObject);
begin
  Scheduler.ViewGantt.ShowTotalProgressLine := miShowTotalProgress.Checked;
end;

procedure TGanttViewDemoMainForm.miShowExpandButtonsClick(Sender: TObject);
begin
  Scheduler.ViewGantt.ShowExpandButtons := miShowExpandButtons.Checked; 
end;

end.
