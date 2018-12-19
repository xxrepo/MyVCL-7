//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EditorsInPlaceDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TEditorsInPlaceDemoDataDM *EditorsInPlaceDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TEditorsInPlaceDemoDataDM::TEditorsInPlaceDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEditorsInPlaceDemoDataDM::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCar->AsString = tblCarsTrademark->AsString + " " + tblCarsModel->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsInPlaceDemoDataDM::tblOrdersCalcFields(TDataSet *DataSet)
{
  tblOrdersCustomerEmail->AsString = tblCustomers->Lookup("ID",
    tblOrdersCustomerID->Value, "email");
}
//---------------------------------------------------------------------------

