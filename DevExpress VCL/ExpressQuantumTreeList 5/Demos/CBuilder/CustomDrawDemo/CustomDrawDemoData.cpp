//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CustomDrawDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TCustomDrawDemoDataDM *CustomDrawDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TCustomDrawDemoDataDM::TCustomDrawDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void TCustomDrawDemoDataDM::SetParentValue(Variant AValue)
{
  if ((tblDepartments->State == dsEdit) || (tblDepartments->State == dsInsert))
    tblDepartments->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------


