unit DBDemoMainUnit;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils, {$IFDEF DELPHI6} Variants, {$ENDIF} Classes,
  Graphics, Controls, Forms, Dialogs, DemoBasicMain, cxStyles, cxGraphics, cxEdit,
  cxScheduler, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, DB, cxSchedulerStorage,
  cxSchedulerDBStorage, DBTables, cxLookAndFeels, Menus, StdCtrls,
  ExtCtrls, cxControls, ComCtrls, cxSchedulerWeekView, Math, 
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerYearView,
  cxLookAndFeelPainters, cxContainer, cxCheckBox, cxButtons;

type
  TDBDemoMainForm = class(TDemoBasicMainForm)
    EventsTable: TTable;
    SchedulerDataSource: TDataSource;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxCheckBox1: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure chDataModeClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBDemoMainForm: TDBDemoMainForm;

implementation

{$R *.dfm}

procedure TDBDemoMainForm.FormCreate(Sender: TObject);
var
  ADate: TDateTime;
begin
  inherited;
  ADate := EncodeDate(2005, 9, 30);
  Scheduler.GotoDate(ADate);
  ADate := ADate + Scheduler.OptionsView.WorkStart;
  Scheduler.SelectTime(ADate, ADate, nil);
end;

procedure TDBDemoMainForm.chDataModeClick(Sender: TObject);
begin
  SchedulerDBStorage.SmartRefresh := (Sender as TcxCheckBox).Checked;
end;

procedure TDBDemoMainForm.cxButton1Click(Sender: TObject);
begin
  MaxRandomPeriod := 720;
  GenerateRandomEvents(5000);
  MaxRandomPeriod := 180;
end;

end.
