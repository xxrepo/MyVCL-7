unit UnboundDemoMain;

interface

{$I ..\cxVer.inc}

uses
  Windows, Messages, SysUtils, Classes, {$IFDEF DELPHI6} Variants, {$ENDIF}
  Graphics, Controls, Forms, Dialogs, DemoBasicMain, cxLookAndFeels, ActnList,
  ImgList, Menus, StdCtrls, ComCtrls, cxStyles, cxGraphics, cxEdit, cxScheduler,
  cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerStorage,
  cxControls, cxContainer, cxTextEdit, cxMemo, cxRichEdit, ExtCtrls, Buttons,
  cxSchedulerWeekView, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerYearView;

type
  TUnboundDemoMainForm = class(TDemoBasicMainForm)
    btnGenerate: TBitBtn;
    btnDelete: TBitBtn;
    SchedulerUnboundStorage: TcxSchedulerStorage;
    ImageList: TImageList;
    EventImages: TImageList;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SchedulerInitEventImages(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent; AImages: TcxSchedulerEventImages);
    procedure SchedulerUnboundStorageRemindersOpenEvent(
      Sender: TcxSchedulerReminders; AEvent: TcxSchedulerControlEvent);
  private
    { Private declarations }
  protected
    procedure OnNewEvent(AEvent: TcxSchedulerEvent; AIndex: Integer); override;
  public
    { Public declarations }
  end;

var
  UnboundDemoMainForm: TUnboundDemoMainForm;

implementation

{$R *.dfm}
uses
  cxClasses;

const
  GenerateCount = 500;

procedure TUnboundDemoMainForm.btnDeleteClick(Sender: TObject);
begin
  SchedulerUnboundStorage.Clear;
end;

procedure TUnboundDemoMainForm.btnGenerateClick(Sender: TObject);
begin
  GenerateRandomEvents(GenerateCount, True);
end;

procedure TUnboundDemoMainForm.FormCreate(Sender: TObject);
begin
  inherited;
  Scheduler.SelectDays(Date, Date, True);
end;

procedure TUnboundDemoMainForm.SchedulerInitEventImages(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent;
  AImages: TcxSchedulerEventImages);
var
  AValue: Variant;
begin
  AValue := AEvent.GetCustomFieldValueByName('IconIndex');
  if VarIsNull(AValue) or VarIsEmpty(AValue) or (AValue = -1) then Exit;
  AImages.Add(AValue, False);
end;

procedure TUnboundDemoMainForm.OnNewEvent(
  AEvent: TcxSchedulerEvent; AIndex: Integer);
begin
  AEvent.SetCustomFieldValueByName('IconIndex', AIndex);
  AEvent.Reminder := (Trunc(AEvent.Start) >= Trunc(Now)) and Boolean(Random(2));
end;


procedure TUnboundDemoMainForm.SchedulerUnboundStorageRemindersOpenEvent(
  Sender: TcxSchedulerReminders; AEvent: TcxSchedulerControlEvent);
begin
  Scheduler.EditEventUsingDialog(AEvent);
end;

end.
