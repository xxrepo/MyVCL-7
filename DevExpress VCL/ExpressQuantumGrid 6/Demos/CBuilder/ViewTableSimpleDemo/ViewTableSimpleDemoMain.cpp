//---------------------------------------------------------------------------

#include <vcl.h>
#include <shellapi.hpp>
#pragma hdrstop

#include "ViewTableSimpleDemoMain.h"
#include "ViewTableSimpleDemoData.h"
#include "dialogs.hpp"
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
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TViewTableSimpleDemoMainForm *ViewTableSimpleDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TViewTableSimpleDemoMainForm::TViewTableSimpleDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::FocusRomanceCategory()
{
  for(int i=0; i < cxgGenrasDBTableView->ViewInfo->RecordsViewInfo->Count; i++) {
    if(VarToStr(cxgGenrasDBTableView->ViewData->Records[i]->Values[0]) == "Romance") {
      cxgGenrasDBTableView->ViewData->Records[i]->Focused = true;
      break;
    }
  }
}

void __fastcall TViewTableSimpleDemoMainForm::FormShow(TObject *Sender)
{
  ((TcxGridTableView*)cxgFilms->FocusedView)->DataController->Groups->FullExpand();
  FocusRomanceCategory();
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miExitClick(
      TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miShowIndicatorClick(
      TObject *Sender)
{
  cxgFilmsDBTableView->OptionsView->Indicator = !cxgFilmsDBTableView->OptionsView->Indicator;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableView->OptionsView->Indicator;
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miShowPreviewRowClick(
      TObject *Sender)
{
  cxgFilmsDBTableViewTAGLINE->IsPreview = !cxgFilmsDBTableViewTAGLINE->IsPreview;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableViewTAGLINE->IsPreview;
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miFocusCellOnTabClick(
      TObject *Sender)
{
  cxgFilmsDBTableView->OptionsBehavior->FocusCellOnTab = !cxgFilmsDBTableView->OptionsBehavior->FocusCellOnTab;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableView->OptionsBehavior->FocusCellOnTab;
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miIncSearchClick(
      TObject *Sender)
{
  cxgFilmsDBTableView->OptionsBehavior->IncSearch = !cxgFilmsDBTableView->OptionsBehavior->IncSearch;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableView->OptionsBehavior->IncSearch;
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miImmediateEditorClick(
      TObject *Sender)
{
  cxgFilmsDBTableView->OptionsBehavior->ImmediateEditor = !cxgFilmsDBTableView->OptionsBehavior->ImmediateEditor;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableView->OptionsBehavior->ImmediateEditor;
}
//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miMultiSelectClick(
      TObject *Sender)
{
  cxgFilmsDBTableView->OptionsSelection->MultiSelect = !cxgFilmsDBTableView->OptionsSelection->MultiSelect;
  ((TMenuItem*)Sender)->Checked = cxgFilmsDBTableView->OptionsSelection->MultiSelect;
}

//---------------------------------------------------------------------------

void __fastcall TViewTableSimpleDemoMainForm::miShowNavigatorClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  cxgFilmsDBTableView->OptionsView->Navigator = ((TMenuItem*)Sender)->Checked;
}

