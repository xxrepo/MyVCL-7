//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BandedDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TBandedDemoDataDM *BandedDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TBandedDemoDataDM::TBandedDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void TBandedDemoDataDM::SetParentValue(Variant AValue)
{
  if (tblDepartments->State == dsEdit ||
    tblDepartments->State == dsInsert)
    tblDepartments->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------


