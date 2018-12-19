//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "StylesMultiDemoMain.h"
#include "StylesMultiDemoData.h"
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
#pragma link "cxButtons"
#pragma link "cxGridCustomPopupMenu"
#pragma link "cxGridPopupMenu"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxStyleSheetEditor"
#pragma link "cxRadioGroup"
#pragma link "cxListBox"
#pragma link "cxContainer"
#pragma link "cxGroupBox"
#pragma link "cxGridStyleSheetsPreview"
#pragma resource "*.dfm"
TStylesMultiDemoMainForm *StylesMultiDemoMainForm;

const cNone = 0;
const cPredefined = 1;
const cUserDefined = 2;

//---------------------------------------------------------------------------
__fastcall TStylesMultiDemoMainForm::TStylesMultiDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::FormCreate(TObject *Sender)
{
  CreateUserStyleSheetsList();
  CreatePredefinedStyleSheetsList();
  SetPredefinedStyleSheets();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::btnSaveClick(TObject *Sender)
{
    if (SaveDialog->Execute())
      SaveUserDefinedStyleSheets(SaveDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::btnLoadClick(TObject *Sender)
{
  if (OpenDialog->Execute())
    LoadUserDefinedStyleSheets(OpenDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::RadioGroupClick(TObject *Sender)
{
  switch (((TcxRadioGroup*)Sender)->ItemIndex) {
    case cNone:
      UpdateGridStyleSheets(NULL);
    case cPredefined:
      SetPredefinedStyleSheets();
    case cUserDefined:
      SetUserDefinedStyleSheets();
  }
  ChangeVisibility(((TcxRadioGroup*)Sender)->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::cbUserStyleSheetsChange(TObject *Sender)
{
  SetUserDefinedStyleSheets();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::lbPredefinedStyleSheetsClick(TObject *Sender)
{
  SetPredefinedStyleSheets();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::btnEditClick(TObject *Sender)
{
  ShowcxStyleSheetEditor((TcxGridTableViewStyleSheet*)(cbUserStyleSheets->Items->Objects[cbUserStyleSheets->ItemIndex]), NULL);
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::FormActivate(TObject *Sender)
{
  OpenDialog->InitialDir = ExtractFileDir(Application->ExeName);
  SaveDialog->InitialDir = OpenDialog->InitialDir;
}
//---------------------------------------------------------------------------

TcxGridTableViewStyleSheet* TStylesMultiDemoMainForm::GetCurrentStyleSheet()
{
  return (TcxGridTableViewStyleSheet*)tvProjects->Styles->StyleSheet;
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::CreateUserStyleSheetsList()
{
  cbUserStyleSheets->Clear();
  for (int I = 0 ; I < StylesMultiDemoDataDM->strepUserDefined->StyleSheetCount; I++)
    cbUserStyleSheets->Items->AddObject(
      StylesMultiDemoDataDM->strepUserDefined->StyleSheets[I]->Caption,
      StylesMultiDemoDataDM->strepUserDefined->StyleSheets[I]);
  cbUserStyleSheets->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::CreatePredefinedStyleSheetsList()
{
  lbPredefinedStyleSheets->Clear();
  for (int I = 0; I < StylesMultiDemoDataDM->strepPredefined->StyleSheetCount; I++)
    lbPredefinedStyleSheets->Items->AddObject(
      StylesMultiDemoDataDM->strepPredefined->StyleSheets[I]->Caption,
      StylesMultiDemoDataDM->strepPredefined->StyleSheets[I]);
  lbPredefinedStyleSheets->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::UpdateView(TcxGridDBTableView *AView,
  TcxGridTableViewStyleSheet *AStyleSheet)
{
  AView->BeginUpdate();
  AView->Styles->StyleSheet = AStyleSheet;
  AView->EndUpdate();
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::UpdateGridStyleSheets(TcxGridTableViewStyleSheet *AStyleSheet)
{
  if (GetCurrentStyleSheet() == AStyleSheet) return;
  UpdateView(tvProjects, AStyleSheet);
  UpdateView(tvTeam, AStyleSheet);
  tvProjects->DataController->ClearDetails();  // refresh detail level

  if (AStyleSheet != NULL)
    pnlCurrentStyleSheet->Caption = AStyleSheet->Caption;
  else
    pnlCurrentStyleSheet->Caption = "";
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::ChangeVisibility(int AType)
{
  cbUserStyleSheets->Enabled = (AType == cUserDefined);
  gbUserDefined->Enabled = (AType == cUserDefined);
  btnEdit->Enabled = (AType == cUserDefined);
  btnLoad->Enabled = (AType == cUserDefined);
  btnSave->Enabled = (AType == cUserDefined);

  lbPredefinedStyleSheets->Enabled = (AType == cPredefined);
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::SetPredefinedStyleSheets()
{
  if (lbPredefinedStyleSheets->Items->Count > 0)
    UpdateGridStyleSheets(
    (TcxGridTableViewStyleSheet*)lbPredefinedStyleSheets->Items->
      Objects[lbPredefinedStyleSheets->ItemIndex]);
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::SetUserDefinedStyleSheets()
{
  if (cbUserStyleSheets->Items->Count > 0)
    UpdateGridStyleSheets((TcxGridTableViewStyleSheet*)cbUserStyleSheets->Items->
      Objects[cbUserStyleSheets->ItemIndex]);
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::ClearUserDefinedStyleSheets()
{
  StylesMultiDemoDataDM->strepUserDefined->Clear();
  StylesMultiDemoDataDM->strepUserDefined->ClearStyleSheets();
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::LoadUserDefinedStyleSheets(TFileName AFileName)
{
  UpdateGridStyleSheets(NULL);
  ClearUserDefinedStyleSheets();

  LoadStyleSheetsFromIniFile(AFileName, StylesMultiDemoDataDM->strepUserDefined,
    __classid(TcxGridTableViewStyleSheet), NULL, NULL, NULL, NULL);

  CreateUserStyleSheetsList();
  SetUserDefinedStyleSheets();
}
//---------------------------------------------------------------------------

void TStylesMultiDemoMainForm::SaveUserDefinedStyleSheets(TFileName AFileName)
{
  TList *AList = new TList();
  try {
    StylesMultiDemoDataDM->PopulateStyleSheetsList(AList);
    SaveStyleSheetsToIniFile(AFileName, AList);
  }
  __finally {
    delete AList;
  }
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::miNativeStyleClick(
      TObject *Sender)
{
  LookAndFeelController->NativeStyle = !LookAndFeelController->NativeStyle;
  ((TMenuItem*)Sender)->Checked = LookAndFeelController->NativeStyle;
}
//---------------------------------------------------------------------------


void __fastcall TStylesMultiDemoMainForm::miLookAndFeelKindClick(TObject *Sender)
{
  LookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->MenuIndex;
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------

