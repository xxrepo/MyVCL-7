//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MasterDetailDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TMasterDetailDemoDataDM *MasterDetailDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TMasterDetailDemoDataDM::TMasterDetailDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailDemoDataDM::qryFilmsPersonsCalcFields(
      TDataSet *DataSet)
{
  qryFilmsPersonsName->AsString = qryFilmsPersonsFIRSTNAME->AsString + " " +
    qryFilmsPersonsSECONDNAME->AsString;
}
//---------------------------------------------------------------------------
void TMasterDetailDemoDataDM::InsertNewPersonStaff()
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

void __fastcall TMasterDetailDemoDataDM::qryFilmsPersonsAfterPost(
      TDataSet *DataSet)
{
  qryFilmsPersons->ApplyUpdates();
  if (FIsInserting) {
    InsertNewPersonStaff();
    FIsInserting = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailDemoDataDM::qryFilmsPersonsAfterInsert(
      TDataSet *DataSet)
{
  FIsInserting = true;
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailDemoDataDM::qryFilmsPersonsAfterDelete(
  TDataSet *DataSet)
{
  qryFilmsPersons->ApplyUpdates();
}
//---------------------------------------------------------------------------


