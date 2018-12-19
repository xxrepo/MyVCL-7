//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DragDropDemoMain.h"
#include "DragDropDemoDictionaries.h"
#include "DragDropDemoData.h"
#include "AboutDemoForm.h"
#include "shellapi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridBandedTableView"
#pragma link "cxGridCardView"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBBandedTableView"
#pragma link "cxGridDBCardView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TDragDropDemoMainForm *DragDropDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TDragDropDemoMainForm::TDragDropDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDragDropDemoMainForm::miShowDictionariesClick(TObject *Sender)
{
  DragDropDemoDictionariesForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::miTabPositionClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  Grid->RootLevelOptions->DetailTabsPosition =
    (TcxGridDetailTabsPosition)((TMenuItem*)Sender)->Tag;
}
//---------------------------------------------------------------------------

TcxCustomGridView* GetDragSourceGridView(TObject* Source)
{
  TcxGridSite* cxGridSite;
  if ((cxGridSite = dynamic_cast<TcxGridSite*> (((TDragControlObject*)Source)->Control))!= NULL)
    return(cxGridSite->GridView);
  else
    return(NULL);
}
//---------------------------------------------------------------------------

int GetMasterRecordFilmID(TcxCustomGridView* AView)
{
  return(((TcxDBDataRelation*)(AView->DataController->GetMasterRelation()))->GetMasterRecordID(AView->MasterGridRecordIndex));
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::cvPersonsDragOver(TObject *Sender, TObject *Source,
      int X, int Y, TDragState State, bool &Accept)
{
  Accept = ((TcxGridSite*)((TDragControlObject*)Source)->Control)->GridView ==
    DragDropDemoDictionariesForm->cvPersonsList;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::tvCompaniesDragOver(TObject *Sender,
      TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
  Accept = ((TcxGridSite*)((TDragControlObject*)Source)->Control)->GridView == DragDropDemoDictionariesForm->tvCompaniesList;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::bvFilmsDragOver(TObject *Sender, TObject *Source,
      int X, int Y, TDragState State, bool &Accept)
{
  Accept = ((TcxGridSite*)((TDragControlObject*)Source)->Control)->GridView ==  DragDropDemoDictionariesForm->tvFilmsList;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::cvPersonsDragDrop(TObject *Sender, TObject *Source,
      int X, int Y)
{
  TcxCustomGridView* AGridView = GetDragSourceGridView(Source);
  if (AGridView == NULL) return;
    int FilmID = GetMasterRecordFilmID(((TcxGridSite*)Sender)->GridView);
    int PersonID = AGridView->DataController->Values[AGridView->DataController->FocusedRecordIndex][
      DragDropDemoDictionariesForm->cvPersonsListID->Index];
    DragDropDemoMainDM->tblFilmsPersonsStaff->Insert();
    DragDropDemoMainDM->tblFilmsPersonsStaffFILMID->AsInteger = FilmID;
    DragDropDemoMainDM->tblFilmsPersonsStaffPERSONID->AsInteger = PersonID;
    DragDropDemoMainDM->tblFilmsPersonsStaffPERSONLINEID->AsInteger = 2;
    try {
      DragDropDemoMainDM->tblFilmsPersonsStaff->Post();
      DragDropDemoMainDM->qryFilmsPersons->Close();
      DragDropDemoMainDM->qryFilmsPersons->Open();
      int Bounds[2] = {0,2};
      Variant KeyValues = VarArrayCreate(Bounds, 1, varInteger);
      KeyValues.PutElement(FilmID, 0);
      KeyValues.PutElement(PersonID, 1);
      KeyValues.PutElement(2, 2);
      if (DragDropDemoMainDM->qryFilmsPersons->Locate("FILMID;PERSONID;PERSONLINEID", KeyValues, TLocateOptions()))
        SetFocus();
    }
    catch (...) {
      DragDropDemoMainDM->tblFilmsPersonsStaff->Cancel();
      MessageDlg("This person is already assigned to this film", mtInformation, TMsgDlgButtons() << mbOK, 0);
    }
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::tvCompaniesDragDrop(TObject *Sender,
      TObject *Source, int X, int Y)
{
  TcxCustomGridView* AGridView = GetDragSourceGridView(Source);
  if (AGridView == NULL) return;
    int FilmID = GetMasterRecordFilmID(((TcxGridSite*)Sender)->GridView);
    DragDropDemoMainDM->tblFilmsCompaniesStaff->Insert();
    int CompanyID = AGridView->DataController->Values[AGridView->DataController->FocusedRecordIndex][
      DragDropDemoDictionariesForm->tvCompaniesListID->Index];
    DragDropDemoMainDM->tblFilmsCompaniesStaffFILMID->AsInteger = FilmID;
    DragDropDemoMainDM->tblFilmsCompaniesStaffCOMPANYID->AsInteger = CompanyID;
    try {
      DragDropDemoMainDM->tblFilmsCompaniesStaff->Post();
      DragDropDemoMainDM->qryFilmsCompanies->Close();
      DragDropDemoMainDM->qryFilmsCompanies->Open();
      int Bounds[2] = {0,1};
      Variant KeyValues = VarArrayCreate(Bounds, 1, varInteger);
      KeyValues.PutElement(FilmID, 0);
      KeyValues.PutElement(CompanyID, 1);
      if (DragDropDemoMainDM->qryFilmsCompanies->Locate("FILMID;COMPANYID", KeyValues, TLocateOptions()))
        SetFocus();
    }
    catch(...) {
      DragDropDemoMainDM->tblFilmsCompaniesStaff->Cancel();
      MessageDlg("This company is already assigned to this film", mtInformation, TMsgDlgButtons() << mbOK, 0);
    }
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::bvFilmsDragDrop(TObject *Sender, TObject *Source,
      int X, int Y)
{
  TcxCustomGridView* AGridView = GetDragSourceGridView(Source);
  if (AGridView == NULL) return;
  DragDropDemoMainDM->tblFilmsGenres->Close();
  DragDropDemoMainDM->tblFilmsGenres->Open();
  DragDropDemoMainDM->tblFilmsGenres->Insert();
  int FilmID = AGridView->DataController->Values[AGridView->DataController->FocusedRecordIndex][DragDropDemoDictionariesForm->tvFilmsListID->Index];
  DragDropDemoMainDM->tblFilmsGenresFILMID->AsInteger = FilmID;
  DragDropDemoMainDM->tblFilmsGenresGENREID->AsInteger = Grid->ActiveLevel->Tag;
  try {
    DragDropDemoMainDM->tblFilmsGenres->Post();
    DragDropDemoMainDM->qryFilms->Close();
    DragDropDemoMainDM->qryFilms->Open();
    if (DragDropDemoMainDM->qryFilms->Locate("ID", FilmID, TLocateOptions()))
      SetFocus();
  }
  catch (...) {
    DragDropDemoMainDM->tblFilmsGenres->Cancel();
    MessageDlg("This film already exists in this category", mtInformation, TMsgDlgButtons() << mbOK, 0);
  }
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::GridActiveTabChanged(TcxCustomGrid *Sender,
      TcxGridLevel *ALevel)
{
  if (ALevel->IsMaster)
    try {
      Grid->BeginUpdate();
      ALevel->GridView = bvFilms;
      ALevel->Items[0]->GridView = cvPersons;
      ALevel->Items[1]->GridView = tvCompanies;
      ALevel->Items[2]->GridView = cvPhotos;
      DragDropDemoMainDM->qryFilms->Params->Items[0]->Value = ALevel->Tag;
      DragDropDemoMainDM->qryFilms->Close();
      DragDropDemoMainDM->qryFilms->Open();
      bvFilms->DataController->ClearDetails();
    }
    __finally {
      Grid->EndUpdate();
    }
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::FormCreate(TObject *Sender)
{
  DragDropDemoMainDM->OnNextRecord = MoveToNextRecord;
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::MoveToNextRecord(TObject* Sender)
{
 (( TcxCustomGridTableView*)Grid->FocusedView)->Controller->GoToNext(true, true);
}

void __fastcall TDragDropDemoMainForm::FormShow(TObject *Sender)
{
  CreateLevels();
  if (Grid->Levels->Count > 0)
    GridActiveTabChanged(Grid, Grid->Levels->Items[0]);
  DragDropDemoDictionariesForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TDragDropDemoMainForm::CreateLevels()
{
  if (!DragDropDemoMainDM->tblGenres->Active)
    DragDropDemoMainDM->tblGenres->Open();
  DragDropDemoMainDM->tblGenres->First();
  TcxGridLevel* Level;
  while (!DragDropDemoMainDM->tblGenres->Eof) {
    Level = Grid->Levels->Add();
    Level->MaxDetailHeight = 600;
    Level->Caption = DragDropDemoMainDM->tblGenresNAME->AsString;
    Level->Options->DetailTabsPosition = dtpTop;
    Level->Styles->Tab = DragDropDemoMainDM->cxStyle1;
    Level->Styles->TabsBackground = DragDropDemoMainDM->cxStyle39;
    Level->Add()->Caption = "People";
    Level->Add()->Caption = "Companies";
    Level->Add()->Caption = "Photos";
    Level->Tag = DragDropDemoMainDM->tblGenresID->AsInteger;
    DragDropDemoMainDM->tblGenres->Next();
  }
  if (!DragDropDemoMainDM->tblPersonsLine->Active)
    DragDropDemoMainDM->tblPersonsLine->Open();
}
//---------------------------------------------------------------------------

