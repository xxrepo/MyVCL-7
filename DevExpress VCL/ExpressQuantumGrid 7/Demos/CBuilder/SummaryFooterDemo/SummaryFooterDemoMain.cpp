//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "SummaryFooterDemoMain.h"
#include "SummaryFooterDemoData.h"
#include "AboutDemoForm.h"
#include "SummaryFooterDemoEditSummary.h"
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
#pragma link "cxGridCustomPopupMenu"
#pragma link "cxGridPopupMenu"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TSummaryFooterDemoMainForm *SummaryFooterDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TSummaryFooterDemoMainForm::TSummaryFooterDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::FormShow(TObject *Sender)
{
  if(SummaryFooterDemoDataDM->tblCars->Active) {
    SummaryFooterDemoDataDM->tblCars->First();
    if (tvCars->Controller->FocusedRecord != NULL)
      tvCars->Controller->FocusedRecord->Expanded = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miSummariesClick(
      TObject *Sender)
{
  SummaryFooterDemoEditSummaryForm->ShowModal();
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miSelectedRedcordsOnlyClick(
      TObject *Sender)
{
  if(Grid->FocusedView == NULL)
    return;
  TcxDataSummary* ASummary = Grid->FocusedView->DataController->Summary;
  if(ASummary->Options.Contains(soSelectedRecords))
    ASummary->Options = ASummary->Options>>soSelectedRecords;
  else
    ASummary->Options = ASummary->Options<<soSelectedRecords;
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miIgnoreNullValuesClick(
      TObject *Sender)
{
  if(Grid->FocusedView == NULL)
    return;
  TcxDataSummary* ASummary = Grid->FocusedView->DataController->Summary;
  if(ASummary->Options.Contains(soNullIgnore))
    ASummary->Options = ASummary->Options>>soNullIgnore;
  else
    ASummary->Options = ASummary->Options<<soNullIgnore;
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miMultiSelectClick(
      TObject *Sender)
{
  if(Grid->FocusedView == NULL)
    return;
  TcxGridDBTableView* AView = ((TcxGridDBTableView*)Grid->FocusedView);
  AView->OptionsSelection->MultiSelect = !AView->OptionsSelection->MultiSelect;
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::GridFocusedViewChanged(
      TcxCustomGrid *Sender, TcxCustomGridView *APrevFocusedView,
      TcxCustomGridView *AFocusedView)
{
  TcxGridDBTableView* AView = ((TcxGridDBTableView*)Grid->FocusedView);
  miSelectedRedcordsOnly->Checked = AView->DataController->Summary->Options.Contains(soSelectedRecords);
  miIgnoreNullValues->Checked = AView->DataController->Summary->Options.Contains(soNullIgnore);
  miMultiSelect->Checked = AView->OptionsSelection->MultiSelect;
  miFooter->Checked = AView->OptionsView->Footer;
}
//---------------------------------------------------------------------------

void __fastcall TSummaryFooterDemoMainForm::miFooterClick(
      TObject *Sender)
{
  if(Grid->FocusedView == NULL)
    return;
  TcxGridDBTableView* AView = ((TcxGridDBTableView*)Grid->FocusedView);
  AView->OptionsView->Footer = !AView->OptionsView->Footer;
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------


