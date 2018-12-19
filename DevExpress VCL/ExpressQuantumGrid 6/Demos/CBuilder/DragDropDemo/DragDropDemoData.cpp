//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DragDropDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridBandedTableView"
#pragma link "cxGridCardView"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TDragDropDemoMainDM *DragDropDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TDragDropDemoMainDM::TDragDropDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void ReopenDataset(TDataSet* AQuery)
{
  AQuery->DisableControls();
  try {
    AQuery->Close();
    AQuery->Open();
  }
  __finally {
    AQuery->EnableControls();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::qryFilmsBeforeDelete(
      TDataSet *DataSet)
{
  int Bounds[2] = {0,1};
  Variant KeyValues = VarArrayCreate(Bounds, 1, varInteger);
  KeyValues.PutElement(qryFilmsID->AsInteger, 0);
  KeyValues.PutElement(qryFilms->Params->Items[0]->Value, 1);
  if(tblFilmsGenres->Locate("FILMID;GENREID", KeyValues, TLocateOptions())) {
    int FilmID = -1;
    qryFilms->Next();
    if(!qryFilms->Eof)
      FilmID = qryFilmsID->AsInteger;
    tblFilmsGenres->Delete();
    ReopenDataset(qryFilms);
    if(!qryFilms->Locate("ID", FilmID, TLocateOptions()))
      qryFilms->Last();
  }
  Abort();
}
//---------------------------------------------------------------------------
void __fastcall TDragDropDemoMainDM::qryFilmsCompaniesBeforeDelete(
      TDataSet *DataSet)
{
  int Bounds[2] = {0,1};
  Variant KeyValues = VarArrayCreate(Bounds, 1, varInteger);
  KeyValues.PutElement(qryFilmsID->AsInteger, 0);
  KeyValues.PutElement(qryFilmsCompaniesCompanyID->AsInteger, 1);
  if(tblFilmsCompaniesStaff->Locate("FILMID;COMPANYID", KeyValues, TLocateOptions())) {
    DoNextRecord(this);
    KeyValues.PutElement(-1, 1);
    if(!qryFilmsCompanies->Eof)
      KeyValues.PutElement(qryFilmsCompaniesCompanyID->AsInteger, 1);

    tblFilmsCompaniesStaff->Delete();
    ReopenDataset(qryFilmsCompanies);

    qryFilmsCompanies->Locate("FILMID;COMPANYID", KeyValues, TLocateOptions());
  };
  Abort();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::qryFilmsPersonsAfterPost(
      TDataSet *DataSet)
{
  ReopenDataset(tblFilmsPersonsStaff);
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::qryFilmsPersonsBeforeDelete(
      TDataSet *DataSet)
{
  int Bounds[2] = {0,2};
  Variant KeyValues = VarArrayCreate(Bounds, 1, varInteger);
  KeyValues.PutElement(qryFilmsID->AsInteger, 0);
  KeyValues.PutElement(qryFilmsPersonsPersonID->AsInteger, 1);
  KeyValues.PutElement(qryFilmsPersonsPersonLineID->AsInteger, 2);
  if(tblFilmsPersonsStaff->Locate("FILMID;PERSONID;PERSONLINEID", KeyValues, TLocateOptions())) {
    tblFilmsPersonsStaff->Delete();
    KeyValues.PutElement(-1, 1);
    KeyValues.PutElement(-1, 2);
    DoNextRecord(this);
    if(!qryFilmsPersons->Eof) {
      KeyValues.PutElement(qryFilmsPersonsPersonID->AsInteger, 1);
      KeyValues.PutElement(qryFilmsPersonsPersonLineID->AsInteger, 2);
    };
    ReopenDataset(qryFilmsPersons);
    qryFilmsPersons->Locate("FILMID;PERSONID;PERSONLINEID", KeyValues, TLocateOptions());
  };
  Abort();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblPersonsAfterUpdate(
      TDataSet *DataSet)
{
  ReopenDataset(qryFilmsPersons);
  if(!qryFilmsPersons->Locate("PersonID", FPersonID, TLocateOptions()))
    qryFilmsPersons->Last();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblPersonsBeforeUpdate(
      TDataSet *DataSet)
{
  FPersonID = DataSet->FieldByName("ID")->AsInteger;
  if(FPersonID == qryFilmsPersonsPersonID->AsInteger) {
    qryFilmsPersons->Next();
    FPersonID = -1;
    if(!qryFilmsPersons->Eof)
      FPersonID = qryFilmsPersonsPersonID->AsInteger;
  } else
    FPersonID = qryFilmsPersonsPersonID->AsInteger;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblCompaniesAfterUpdate(
      TDataSet *DataSet)
{
  ReopenDataset(qryFilmsCompanies);
  if(!qryFilmsCompanies->Locate("CompanyID", FCompanyID, TLocateOptions()))
    qryFilmsCompanies->Last();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblCompaniesBeforeUpdate(
      TDataSet *DataSet)
{
  FCompanyID = DataSet->FieldByName("ID")->AsInteger;
  if(FCompanyID == qryFilmsCompaniesCompanyID->AsInteger) {
    qryFilmsPersons->Next();
    FCompanyID = -1;
    if(!qryFilmsPersons->Eof)
      FCompanyID = qryFilmsCompaniesCompanyID->AsInteger;
  } else
    FCompanyID = qryFilmsCompaniesCompanyID->AsInteger;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblFilmsDictAfterUpdate(
      TDataSet *DataSet)
{
  ReopenDataset(qryFilms);
  if(!qryFilms->Locate("ID", FFilmID, TLocateOptions()))
    qryFilms->Last();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::tblFilmsDictBeforeUpdate(
      TDataSet *DataSet)
{
  FFilmID = DataSet->FieldByName("ID")->AsInteger;
  if(FFilmID == qryFilmsID->AsInteger) {
    qryFilms->Next();
    FFilmID = -1;
    if(!qryFilms->Eof)
      FFilmID = qryFilmsID->AsInteger;
  } else
    FFilmID = qryFilmsID->AsInteger;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::DoNextRecord(TObject* Sender)
{
  if(FOnNextRecord)
    FOnNextRecord(Sender);
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainDM::qryFilmsPersonsCalcFields(
      TDataSet *DataSet)
{
  qryFilmsPersonsName->AsString = qryFilmsPersonsFIRSTNAME->AsString +
    " " + qryFilmsPersonsSECONDNAME->AsString;
}
//---------------------------------------------------------------------------


