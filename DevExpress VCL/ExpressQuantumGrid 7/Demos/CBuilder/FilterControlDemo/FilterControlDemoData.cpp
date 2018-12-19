//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FilterControlDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TFilterControlDemoDataDM *FilterControlDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TFilterControlDemoDataDM::TFilterControlDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFilterControlDemoDataDM::tblCarsCalcFields(
      TDataSet *DataSet)
{
  tblCarsName->AsString = tblCarsTrademark->AsString + " " +
    tblCarsModel->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoDataDM::tblCustomersCalcFields(
      TDataSet *DataSet)
{
  tblCustomersName->AsString = tblCustomersFirstName->AsString + " " +
    tblCustomersLastName->AsString;
}
//---------------------------------------------------------------------------

