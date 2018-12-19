//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SummariesDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TSummariesDemoDataDM *SummariesDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TSummariesDemoDataDM::TSummariesDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoDataDM::tblCustomersCalcFields(TDataSet *DataSet)
{
  tblCustomersName->Value = tblCustomersFirstName->AsString + " " +
    tblCustomersLastName->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoDataDM::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCarName->Value = tblCarsTrademark->AsString + " " +
    tblCarsModel->AsString;
}
//---------------------------------------------------------------------------


