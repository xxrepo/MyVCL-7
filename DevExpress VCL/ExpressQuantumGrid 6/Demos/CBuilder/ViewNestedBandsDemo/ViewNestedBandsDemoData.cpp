//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ViewNestedBandsDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma link "cxEditRepositoryItems"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TViewNestedBandsDemoDataDM *ViewNestedBandsDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TViewNestedBandsDemoDataDM::TViewNestedBandsDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TViewNestedBandsDemoDataDM::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCar->AsString = tblCarsTrademark->AsString + " " +
    tblCarsModel->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TViewNestedBandsDemoDataDM::tblCustomersCalcFields(TDataSet *DataSet)
{
  tblCustomersName->AsString = tblCustomersFirstName->AsString + " " +
    tblCustomersLastName->AsString;
}
//---------------------------------------------------------------------------

