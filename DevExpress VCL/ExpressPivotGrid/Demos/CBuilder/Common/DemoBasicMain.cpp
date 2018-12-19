//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DemoBasicMain.h"
#include "cxExportPivotGridLink.hpp"
#include "AboutDemoForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxCustomPivotGrid"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"

//---------------------------------------------------------------------------
__fastcall TfrmDemoBaisicMain::TfrmDemoBaisicMain(TComponent* Owner)
  : TForm(Owner)
{
  Application->Title = Caption;
  SyncMenuWithTotalVisibility();
  SyncMenuWithElementsVisibility();
}

TcxCustomPivotGrid* __fastcall TfrmDemoBaisicMain::PivotGrid()
{
  return NULL;
}

void __fastcall TfrmDemoBaisicMain::miExportToClick(TObject *Sender)
{
  if (SaveDialog->Execute()) {
    switch (((TMenuItem*)Sender)->Tag){
      case 1:
        cxExportPivotGridToExcel(SaveDialog->FileName, PivotGrid(), true, true, "xls"); break;
      case 2:
        cxExportPivotGridToText(SaveDialog->FileName, PivotGrid(), true, "", "", "", "txt"); break;
      case 3:
        cxExportPivotGridToHTML(SaveDialog->FileName, PivotGrid(), true, "html"); break;
      case 4:
        cxExportPivotGridToXML(SaveDialog->FileName, PivotGrid(), true, "xml"); break;
    }
  }
}

void __fastcall TfrmDemoBaisicMain::miTotalsLocationClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  PivotGrid()->OptionsView->TotalsLocation =
    (TcxPivotGridTotalsLocation)((TMenuItem*)Sender)->Tag;
  miTotalsLocationFar->Checked = (PivotGrid()->OptionsView->TotalsLocation == tlFar);
  miTotalsLocationNear->Checked = (PivotGrid()->OptionsView->TotalsLocation == tlNear);
}

void __fastcall TfrmDemoBaisicMain::miExitClick(TObject *Sender)
{
  Application->Terminate();
}

void __fastcall TfrmDemoBaisicMain::miTotalsVisibilityClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  SyncTotalVisibilityWithMenu();
}

void __fastcall TfrmDemoBaisicMain::miElementsVisibilityClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  SyncElementsVisibilityWithMenu();
}

void __fastcall TfrmDemoBaisicMain::miLookAndFeelClick(TObject *Sender)
{
  if (((TMenuItem*)Sender)->Tag > 3) {
    lfController->NativeStyle = !lfController->NativeStyle;
  }
  else {
    ((TMenuItem*)Sender)->Checked = true;
    lfController->NativeStyle = false;
    lfController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->Tag;
  }
  miNativeStyle->Checked = lfController->NativeStyle;
}

void __fastcall TfrmDemoBaisicMain::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}

void __fastcall TfrmDemoBaisicMain::SyncElementsVisibilityWithMenu()
{
  PivotGrid()->OptionsView->ColumnFields = miShowColumnFields->Checked;
  PivotGrid()->OptionsView->DataFields = miShowDataFields->Checked;
  PivotGrid()->OptionsView->FilterFields = miShowFilterFields->Checked;
  PivotGrid()->OptionsView->FilterSeparator = miShowFilterSeparator->Checked;
  PivotGrid()->OptionsView->RowFields = miShowRowFields->Checked;
}

void __fastcall TfrmDemoBaisicMain::SyncTotalVisibilityWithMenu()
{
  PivotGrid()->OptionsView->ColumnTotals = miShowColumnTotals->Checked;
  PivotGrid()->OptionsView->RowTotals = miShowRowTotals->Checked;
  PivotGrid()->OptionsView->ColumnGrandTotals = miShowColumnGrandTotals->Checked;
  PivotGrid()->OptionsView->RowGrandTotals = miShowRowGrandTotals->Checked;
  PivotGrid()->OptionsView->TotalsForSingleValues = miShowTotalsForSingleValues->Checked;
  PivotGrid()->OptionsView->GrandTotalsForSingleValues = miShowGrandTotalsForSingleValues->Checked;
}

void __fastcall TfrmDemoBaisicMain::SyncMenuWithElementsVisibility()
{
  miShowColumnFields->Checked = PivotGrid()->OptionsView->ColumnFields;
  miShowDataFields->Checked = PivotGrid()->OptionsView->DataFields;
  miShowFilterFields->Checked = PivotGrid()->OptionsView->FilterFields;
  miShowFilterSeparator->Checked = PivotGrid()->OptionsView->FilterSeparator;
  miShowRowFields->Checked = PivotGrid()->OptionsView->RowFields;
}

void __fastcall TfrmDemoBaisicMain::SyncMenuWithTotalVisibility()
{
  miShowColumnTotals->Checked = PivotGrid()->OptionsView->ColumnTotals;
  miShowRowTotals->Checked = PivotGrid()->OptionsView->RowTotals;
  miShowColumnGrandTotals->Checked = PivotGrid()->OptionsView->ColumnGrandTotals;
  miShowRowGrandTotals->Checked = PivotGrid()->OptionsView->RowGrandTotals;
  miShowTotalsForSingleValues->Checked = PivotGrid()->OptionsView->TotalsForSingleValues;
  miShowGrandTotalsForSingleValues->Checked = PivotGrid()->OptionsView->GrandTotalsForSingleValues;
}

//---------------------------------------------------------------------------
