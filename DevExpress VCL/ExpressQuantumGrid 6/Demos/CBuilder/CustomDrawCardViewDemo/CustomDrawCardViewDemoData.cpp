//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CustomDrawCardViewDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TCustomDrawCardViewDemoMainDM *CustomDrawCardViewDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TCustomDrawCardViewDemoMainDM::TCustomDrawCardViewDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
