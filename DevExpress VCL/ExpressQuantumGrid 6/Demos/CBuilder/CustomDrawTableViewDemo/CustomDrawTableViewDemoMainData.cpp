//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CustomDrawTableViewDemoMainData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TCustomDrawTableViewDemoDataDM *CustomDrawTableViewDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TCustomDrawTableViewDemoDataDM::TCustomDrawTableViewDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
