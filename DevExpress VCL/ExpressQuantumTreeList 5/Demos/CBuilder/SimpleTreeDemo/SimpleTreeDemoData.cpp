//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SimpleTreeDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TSimpleTreeDemoDataDM *SimpleTreeDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TSimpleTreeDemoDataDM::TSimpleTreeDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSimpleTreeDemoDataDM::SetParentValue(Variant AValue)
{
  if (tblDepartments->State == dsEdit || tblDepartments->State == dsInsert)
    tblDepartments->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------


