//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DemoBasicMain.h"
#include "cxExportPivotGridLink.hpp"
#include "AboutDemoForm.h"
#include "DemoUtils.h"
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
  SyncMenuWithOptionsSelection();
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
	switch(((TMenuItem*)Sender)->Tag)
	{
		case 0, 1:
			PivotGrid()->OptionsView->ColumnTotalsLocation = TcxPivotGridTotalsLocation(((TMenuItem*)Sender)->Tag);
		case 2, 3:
			PivotGrid()->OptionsView->RowTotalsLocation = TcxPivotGridTotalsLocation(((TMenuItem*)Sender)->Tag - 2);
	}
	miColumnTotalsPositionFar->Checked = PivotGrid()->OptionsView->ColumnTotalsLocation == tlFar;
	miColumnTotalsPositionNear->Checked = PivotGrid()->OptionsView->ColumnTotalsLocation == tlNear;
	miRowTotalsPositionFar->Checked = PivotGrid()->OptionsView->RowTotalsLocation == tlFar;
	miRowTotalsPositionNear->Checked = PivotGrid()->OptionsView->RowTotalsLocation == tlNear;
}

void __fastcall TfrmDemoBaisicMain::miExitClick(TObject *Sender)
{
  Application->Terminate();
}

void __fastcall TfrmDemoBaisicMain::FormCreate(TObject *Sender)
{
  SetDefaultLookAndFeel();
  AddLookAndFeelMenu();
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

void __fastcall TfrmDemoBaisicMain::SyncMenuWithOptionsSelection()
{
  miMultiSelect->Checked = PivotGrid()->OptionsSelection->MultiSelect;
  miCrossCells->Checked = PivotGrid()->OptionsSelection->IncludeCells.Contains(osiCrossCells);
  miGrandTotalsCells->Checked = PivotGrid()->OptionsSelection->IncludeCells.Contains(osiGrandTotalCells);
  miTotalsCells->Checked = PivotGrid()->OptionsSelection->IncludeCells.Contains(osiTotalCells);
  miHideFocusRect->Checked = PivotGrid()->OptionsSelection->HideFocusRect;
  miHideSelection->Checked = PivotGrid()->OptionsSelection->HideSelection;
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

void __fastcall TfrmDemoBaisicMain::miMultiSelectClick(TObject *Sender)
{
  PivotGrid()->OptionsSelection->MultiSelect = !PivotGrid()->OptionsSelection->MultiSelect;
  ((TMenuItem*)Sender)->Checked = PivotGrid()->OptionsSelection->MultiSelect;
}

void __fastcall TfrmDemoBaisicMain::miHideFocusRectClick(TObject *Sender)
{
  PivotGrid()->OptionsSelection->HideFocusRect = !PivotGrid()->OptionsSelection->HideFocusRect;
  ((TMenuItem*)Sender)->Checked = PivotGrid()->OptionsSelection->HideFocusRect;
}

void __fastcall TfrmDemoBaisicMain::miHideSelectionClick(TObject *Sender)
{
  PivotGrid()->OptionsSelection->HideSelection = !PivotGrid()->OptionsSelection->HideSelection;
  ((TMenuItem*)Sender)->Checked = PivotGrid()->OptionsSelection->HideSelection;
}

void __fastcall TfrmDemoBaisicMain::IncludeCellsClick(TObject *Sender)
{
  TcxPivotGridOptionsSelectionIncludes AIncludeCells;

  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  AIncludeCells.Clear();
  if (miCrossCells->Checked)
	AIncludeCells << osiCrossCells;
  if (miGrandTotalsCells->Checked)
	AIncludeCells << osiGrandTotalCells;
  if (miTotalsCells->Checked)
	AIncludeCells << osiTotalCells;
  PivotGrid()->OptionsSelection->IncludeCells = AIncludeCells;
}

void __fastcall TfrmDemoBaisicMain::AddLookAndFeelMenu()
{
  mmMain->Items->Insert(mmMain->Items->IndexOf(miAbout),
	CreateLookAndFeelMenuItems(mmMain->Items, lfController));
}

TcxLookAndFeelKind __fastcall TfrmDemoBaisicMain::GetDefaultLookAndFeelKind()
{
  return(lfOffice11);
}

bool __fastcall TfrmDemoBaisicMain::IsNativeDefaultStyle()
{
  return(false);
}

void __fastcall TfrmDemoBaisicMain::SetDefaultLookAndFeel()
{
  lfController->NativeStyle = IsNativeDefaultStyle();
  lfController->Kind = GetDefaultLookAndFeelKind();
}
//---------------------------------------------------------------------------
