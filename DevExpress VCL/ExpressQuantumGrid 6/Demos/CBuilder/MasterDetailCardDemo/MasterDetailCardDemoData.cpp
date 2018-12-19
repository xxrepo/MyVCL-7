//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MasterDetailCardDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TMasterDetailCardDemoDataDM *MasterDetailCardDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TMasterDetailCardDemoDataDM::TMasterDetailCardDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailCardDemoDataDM::qryFilmsPersonsCalcFields(
      TDataSet *DataSet)
{
  qryFilmsPersonsName->AsString = qryFilmsPersonsFIRSTNAME->AsString + " " +
    qryFilmsPersonsSECONDNAME->AsString;
}
//---------------------------------------------------------------------------
void TMasterDetailCardDemoDataDM::InsertNewPersonStaff()
{
    tblPersonsStaffHelper->Open();
    tblPersonsStaffHelper->Insert();
    tblPersonsStaffHelperFILMID->Value = tblFilmsID->Value;
    tblPersonsHelper->Open();
    tblPersonsHelper->Last();
    tblPersonsStaffHelperPERSONID->AsInteger = tblPersonsHelperID->AsInteger;
    tblPersonsHelper->Close();
    tblPersonsStaffHelperPERSONLINEID->AsInteger =
      qryFilmsPersonsPersonLineID->AsInteger;
    tblPersonsStaffHelper->Post();
    tblPersonsStaffHelper->Close();
}

//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoDataDM::qryFilmsPersonsAfterPost(
      TDataSet *DataSet)
{
  qryFilmsPersons->ApplyUpdates();
  if (FIsInserting) {
    InsertNewPersonStaff();
    FIsInserting = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoDataDM::qryFilmsPersonsAfterInsert(
      TDataSet *DataSet)
{
  FIsInserting = true;
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoDataDM::qryFilmsPersonsAfterDelete(
  TDataSet *DataSet)
{
  qryFilmsPersons->ApplyUpdates();
}
//---------------------------------------------------------------------------


