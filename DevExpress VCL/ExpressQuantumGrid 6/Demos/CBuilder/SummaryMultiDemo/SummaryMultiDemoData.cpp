//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SummaryMultiDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TSummaryMultiDemoDataDM *SummaryMultiDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TSummaryMultiDemoDataDM::TSummaryMultiDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSummaryMultiDemoDataDM::tblCarsCalcFields(
      TDataSet *DataSet)
{
  tblCarsCarName->AsString = tblCarsTrademark->AsString + " " +
    tblCarsModel->AsString;
}
//---------------------------------------------------------------------------


