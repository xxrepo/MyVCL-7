//---------------------------------------------------------------------------
#include "..\cxDemosBCB.inc"

#include <vcl.h>
#pragma hdrstop

#include "DBDemoMainUnit.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxGraphics"
#pragma link "cxScheduler"
#pragma link "cxSchedulerCustomControls"
#pragma link "cxSchedulerCustomResourceView"
#pragma link "cxSchedulerDateNavigator"
#pragma link "cxSchedulerDayView"
#pragma link "cxStyles"
#pragma link "DemoBasicMain"
#pragma link "cxSchedulerDBStorage"
#pragma link "cxSchedulerStorage"
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxGraphics"
#pragma link "cxScheduler"
#pragma link "cxSchedulerCustomControls"
#pragma link "cxSchedulerCustomResourceView"
#pragma link "cxSchedulerDateNavigator"
#pragma link "cxSchedulerDayView"
#pragma link "cxSchedulerDBStorage"
#pragma link "cxSchedulerStorage"
#pragma link "cxStyles"
#pragma link "DemoBasicMain"
#pragma link "cxButtons"
#pragma link "cxCheckBox"
#pragma link "cxContainer"
#pragma resource "*.dfm"
TDBDemoMainForm *DBDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TDBDemoMainForm::TDBDemoMainForm(TComponent* Owner)
        : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDBDemoMainForm::FormCreate(TObject *Sender)
{
  TDemoBasicMainForm::FormCreate(Sender);
  Scheduler->GoToDate(EncodeDate(2005, 9, 20));
}
//---------------------------------------------------------------------------

void __fastcall TDBDemoMainForm::chDataModeClick(TObject *Sender)
{
  SchedulerDBStorage->SmartRefresh = cxCheckBox1->Checked;
//
}
//---------------------------------------------------------------------------

void __fastcall TDBDemoMainForm::cxButton1Click(TObject *Sender)
{
  MaxRandomPeriod = 720;
  GenerateRandomEvents(5000, false);
  MaxRandomPeriod = 60;
}
//---------------------------------------------------------------------------

