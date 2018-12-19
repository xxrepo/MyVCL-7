//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ViewTableSimpleDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TViewTableSimpleDemoMainDM *ViewTableSimpleDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TViewTableSimpleDemoMainDM::TViewTableSimpleDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainDM::qreFilmsAfterDelete(
      TDataSet *DataSet)
{
  if (ViewTableSimpleDemoMainDM->qreFilms->UpdatesPending)
    qreFilms->ApplyUpdates();
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainDM::qreFilmsBeforeDelete(
      TDataSet *DataSet)
{
  if (tblFilmsGenres->Locate("FILMID", tblFilmsID->Value, TLocateOptions()))
    tblFilmsGenres->Delete();
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainDM::qreFilmsAfterPost(
      TDataSet *DataSet)
{
  qreFilms->ApplyUpdates();
  if (FUpdating) {
    FUpdating = false;
    qreMaxFilmsID->Active = false;
    qreMaxFilmsID->Active = true;
    tblFilmsGenres->Insert();
    tblFilmsGenresFILMID->Value = qreMaxFilmsIDMAXOFID->Value;
    tblFilmsGenresGENREID->Value = tlbGENRESID->Value;
    tblFilmsGenres->Post();
  }
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainDM::qreFilmsAfterInsert(
      TDataSet *DataSet)
{
  FUpdating = true;
}
//---------------------------------------------------------------------------

 