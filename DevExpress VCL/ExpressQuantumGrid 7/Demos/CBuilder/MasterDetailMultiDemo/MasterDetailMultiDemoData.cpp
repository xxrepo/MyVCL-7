//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MasterDetailMultiDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridBandedTableView"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TMasterDetailMultiDemoMainDM *MasterDetailMultiDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TMasterDetailMultiDemoMainDM::TMasterDetailMultiDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailMultiDemoMainDM::qryFilmsPersonsCalcFields(
      TDataSet *DataSet)
{
  qryFilmsPersonsName->AsString = qryFilmsPersonsFIRSTNAME->AsString + " " +
    qryFilmsPersonsSECONDNAME->AsString;
} 
//---------------------------------------------------------------------------
void TMasterDetailMultiDemoMainDM::InsertNewPerson()
{
    tblPersonsHelper->Insert();

    tblPersonsHelperFIRSTNAME->AsString = qryFilmsPersonsFIRSTNAME->AsString;
    tblPersonsHelperSECONDNAME->Value = qryFilmsPersonsSECONDNAME->Value;
    tblPersonsHelperGENDER->AsBoolean = qryFilmsPersonsGender->AsBoolean;
    tblPersonsHelperBIRTHNAME->AsString = qryFilmsPersonsBIRTHNAME->AsString;
    tblPersonsHelperDATEOFBIRTH->AsDateTime = qryFilmsPersonsDATEOFBIRTH->AsDateTime;
    tblPersonsHelperBIRTHCOUNTRY->AsString = qryFilmsPersonsBIRTHCOUNTRY->AsString;
    tblPersonsHelperLOCATIONOFBIRTH->AsString =
      qryFilmsPersonsLOCATIONOFBIRTH->AsString;
    tblPersonsHelperBIOGRAPHY->AsString = qryFilmsPersonsBIOGRAPHY->AsString;
    tblPersonsHelperNICKNAME->AsString = qryFilmsPersonsNICKNAME->AsString;
    tblPersonsHelperHOMEPAGE->AsString = qryFilmsPersonsHOMEPAGE->AsString;

    tblPersonsHelper->Post();
}
//---------------------------------------------------------------------------

void TMasterDetailMultiDemoMainDM::InsertNewPersonStaff()
{
    tblPersonsStaffHelper->Insert();
    tblPersonsStaffHelperPERSONID->AsInteger = tblPersonsHelperID->AsInteger;
    tblPersonsStaffHelperPERSONLINEID->AsInteger =
      qryFilmsPersonsPersonLineID->AsInteger;
    tblPersonsStaffHelper->Post();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainDM::qryFilmsPersonsBeforePost(
      TDataSet *DataSet)
{
  if (FIsInserting) {
    InsertNewPerson();
    InsertNewPersonStaff();
    DataSet->Cancel();
    DataSet->Close();
    DataSet->Open();
    TLocateOptions ALocateOptions;
    ALocateOptions.Clear();
    DataSet->Locate("ID",tblPersonsStaffHelperID->AsInteger,ALocateOptions);
    Abort;
    FIsInserting = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainDM::qryFilmsPersonsAfterInsert(
      TDataSet *DataSet)
{
  FIsInserting = true;
}
//---------------------------------------------------------------------------


