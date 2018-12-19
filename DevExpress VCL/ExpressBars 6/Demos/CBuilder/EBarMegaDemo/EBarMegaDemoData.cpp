//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EBarMegaDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEBarMegaDemoMainDM *EBarMegaDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TEBarMegaDemoMainDM::TEBarMegaDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoMainDM::tblContactsCalcFields(
      TDataSet *DataSet)
{
  DataSet->FieldByName("CustName")->AsString = DataSet->FieldByName("FirstName")->AsString + " " + DataSet->FieldByName("LastName")->AsString;
}
//---------------------------------------------------------------------------

