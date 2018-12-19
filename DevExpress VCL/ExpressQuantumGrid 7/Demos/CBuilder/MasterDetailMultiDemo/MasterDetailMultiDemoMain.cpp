//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "MasterDetailMultiDemoMain.h"
#include "MasterDetailMultiDemoData.h"
#include "AboutDemoForm.h"
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
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridBandedTableView"
#pragma link "cxGridCardView"
#pragma link "cxGridDBBandedTableView"
#pragma link "cxGridDBCardView"
#pragma link "cxLookAndFeels"
#pragma link "cxBlobEdit"
#pragma link "cxDataStorage"
#pragma link "cxDBLookupComboBox"
#pragma link "cxHyperLinkEdit"
#pragma link "cxImage"
#pragma link "cxMemo"
#pragma link "cxLookAndFeelPainters"
#pragma resource "*.dfm"
TMasterDetailMultiDemoMainForm *MasterDetailMultiDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TMasterDetailMultiDemoMainForm::TMasterDetailMultiDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailMultiDemoMainForm::FormCreate(TObject *Sender)
{
  CreateLevels();
  GridActiveTabChanged(Grid, Grid->Levels->Items[0]);
  CreateTabStyleMenu();
  UpdateMenu();
}
//---------------------------------------------------------------------------

void TMasterDetailMultiDemoMainForm::CreateLevels()
{
  MasterDetailMultiDemoMainDM->tblGenres->First();
  while (!MasterDetailMultiDemoMainDM->tblGenres->Eof)
  {
    TcxGridLevel *ALevel = Grid->Levels->Add();
    ALevel->Caption = MasterDetailMultiDemoMainDM->tblGenresNAME->AsString;
    ALevel->MaxDetailHeight = 250;
    ALevel->Options->DetailTabsPosition = dtpTop;
    ALevel->Options->TabsForEmptyDetails = false;
    ALevel->Add()->Caption = "Companies";
    ALevel->Add()->Caption = "People";
    ALevel->Add()->Caption = "Photos";
    ALevel->Tag = MasterDetailMultiDemoMainDM->tblGenresID->AsInteger;

    MasterDetailMultiDemoMainDM->tblGenres->Next();
  }
}
//---------------------------------------------------------------------------

void TMasterDetailMultiDemoMainForm::AddTabStyleMenuItem(TcxPCStyleID AStyleID,
  const AnsiString AStyleName)
{
  TMenuItem* AMenuItem = new TMenuItem(this);
  AMenuItem->Tag = AStyleID;
  AMenuItem->Caption = AStyleName;
  AMenuItem->GroupIndex = 1;
  AMenuItem->RadioItem = true;
  AMenuItem->OnClick = miTabStyleClick;
  miTabStyle->Add(AMenuItem);
}
//---------------------------------------------------------------------------

void TMasterDetailMultiDemoMainForm::CreateTabStyleMenu()
{
  AddTabStyleMenuItem(0, "Default");
  for (int i = 0; i < PaintersFactory()->PainterClassCount; i++)
  {
	int AStyleID = PaintersFactory()->PainterStyleIDs[i];
	AddTabStyleMenuItem(AStyleID, GetPCStyleName(AStyleID));
  };
}
//---------------------------------------------------------------------------

void TMasterDetailMultiDemoMainForm::UpdateMenu()
{
  miGenreTabPosition->Items[(int)Grid->RootLevelOptions->DetailTabsPosition]->Checked = true;
  miTabsForEmptyDetails->Checked = Grid->Levels->Items[0]->Options->TabsForEmptyDetails;
  AnsiString S = GetPCStyleName(Grid->LevelTabs->Style);
  miTabStyle->Find(S)->Checked = true;
  miTabCaptionAlignment->Items[(int)Grid->LevelTabs->CaptionAlignment]->Checked = true;
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miTabPositionClick(
      TObject *Sender)
{
  Grid->RootLevelOptions->DetailTabsPosition =
    (TcxGridDetailTabsPosition)((TMenuItem*)Sender)->MenuIndex;
  UpdateMenu();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::GridActiveTabChanged(
      TcxCustomGrid *Sender, TcxGridLevel *ALevel)
{
  if (!ALevel->IsMaster) return;
  Grid->BeginUpdate();
  try {
    ALevel->GridView = bvFilms;
    ALevel->Items[0]->GridView = tvCompanies;
    ALevel->Items[1]->GridView = cvPeople;
    ALevel->Items[2]->GridView = cvPhotos;
    MasterDetailMultiDemoMainDM->qryFilms->Params->Items[0]->Value = ALevel->Tag;
    MasterDetailMultiDemoMainDM->qryFilms->Close();
    MasterDetailMultiDemoMainDM->qryFilms->Open();
  }
  __finally {
    Grid->EndUpdate();
  }
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miTabStyleClick(TObject *Sender)
{
  Grid->LevelTabs->Style = (TcxPCStyleID)((TMenuItem*)Sender)->Tag;
  UpdateMenu();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::GridRootLevelStylesGetTabStyle(
      TcxGridLevel *Sender, TcxGridLevel *ATabLevel, TcxStyle *&AStyle)
{
  if (ATabLevel->Active)
    AStyle = MasterDetailMultiDemoMainDM->styleBold;
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miTabCaptionAlignmentClick(
      TObject *Sender)
{
  Grid->LevelTabs->CaptionAlignment = (TAlignment)((TMenuItem*)Sender)->MenuIndex;
  UpdateMenu();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailMultiDemoMainForm::miTabsForEmptyDetailsClick(
      TObject *Sender)
{
  Grid->BeginUpdate();
  try {
    for (int i = 0; i < Grid->Levels->Count; i++)
      Grid->Levels->Items[i]->Options->TabsForEmptyDetails = !Grid->Levels->Items[i]->Options->TabsForEmptyDetails;
  }
  __finally {
    Grid->EndUpdate();
    UpdateMenu();
  }
}
//---------------------------------------------------------------------------

