//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FilterByCodeDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma link "cxEditRepositoryItems"
#pragma resource "*.dfm"
TFilterByCodeDemoMainDM *FilterByCodeDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TFilterByCodeDemoMainDM::TFilterByCodeDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
