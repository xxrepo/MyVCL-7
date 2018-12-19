unit AggregateDemoMainUnit;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, DemoBasicMain, cxStyles, cxGraphics, cxEdit,
  cxScheduler, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, DB, cxSchedulerStorage,
  cxSchedulerDBStorage, DBTables, cxLookAndFeels, Menus, StdCtrls,
  ExtCtrls, cxControls, ComCtrls, cxSchedulerWeekView, Math, 
  cxSchedulerTimeGridView, cxSchedulerUtils, cxSchedulerYearView,
  cxLookAndFeelPainters, cxContainer, cxCheckBox, cxButtons,
  cxSchedulerHolidays, cxSchedulerAggregateStorage, cxSchedulerGanttView,
  Grids, DBGrids, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxScheduler3Painter;

type
  TAggregateDemoMainForm = class(TDemoBasicMainForm)
    EventsTable: TTable;
    SchedulerDataSource: TDataSource;
    Panel1: TPanel;
    cxButton1: TcxButton;
    SchedulerAggregateStorage: TcxSchedulerAggregateStorage;
    SchedulerStorage: TcxSchedulerStorage;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    DBGrid1: TDBGrid;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure SchedulerAggregateStorageEventInserting(
      Sender: TcxSchedulerAggregateStorage; AEvent: TcxSchedulerEvent;
      var AStorage: TcxCustomSchedulerStorage);
    procedure cxButton2Click(Sender: TObject);
  end;

var
  AggregateDemoMainForm: TAggregateDemoMainForm;

implementation

uses
  TypInfo, SelectStorageUnit;

{$R *.dfm}

procedure TAggregateDemoMainForm.FormCreate(Sender: TObject);
var
  ADate: TDateTime;
begin
  inherited;
  ADate := Date;
  Scheduler.GotoDate(ADate);
  ADate := ADate + Scheduler.OptionsView.WorkStart;
  Scheduler.SelectTime(ADate, ADate, nil);
  SchedulerDBStorage.Clear;
  cxButton1.LookAndFeel := Scheduler.LookAndFeel;
  cxButton2.LookAndFeel := Scheduler.LookAndFeel;
end;

procedure TAggregateDemoMainForm.cxButton1Click(Sender: TObject);
begin
  GenerateRandomEvents(500, False, SchedulerDBStorage, EventLabelColors[3]);
end;

procedure TAggregateDemoMainForm.SchedulerAggregateStorageEventInserting(
  Sender: TcxSchedulerAggregateStorage; AEvent: TcxSchedulerEvent;
  var AStorage: TcxCustomSchedulerStorage);
var
  AEditor: TSelectStorage;
begin
  AEditor := TSelectStorage.Create(nil);
  try
    if AEditor.ShowModal = mrOk then
    begin
      if AEditor.rbDBStorage.Checked then
        AStorage := SchedulerDBStorage
      else
        AStorage := SchedulerStorage;
    end;
  finally
    FreeAndNil(AEditor);
  end;
end;

procedure TAggregateDemoMainForm.cxButton2Click(Sender: TObject);
begin
  GenerateRandomEvents(500, False, SchedulerStorage, EventLabelColors[1]);
end;

end.
