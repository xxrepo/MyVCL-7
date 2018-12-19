//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ViewBandedDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridBandedTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TViewBandedDemoDataDM *ViewBandedDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TViewBandedDemoDataDM::TViewBandedDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoDataDM::tblUSERSCalcFields(
      TDataSet *DataSet)
{
  tblUSERSName->Value = tblUSERSFNAME->Value + " " + tblUSERSLNAME->Value;
}
//---------------------------------------------------------------------------

