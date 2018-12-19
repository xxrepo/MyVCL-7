//---------------------------------------------------------------------------

#include <vcl.h>
#include <shellapi.hpp>
#pragma hdrstop

#include "ViewCardSimpleDemoMain.h"
#include "ViewCardSimpleDemoData.h"
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
#pragma link "cxGridCardView"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBCardView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TViewCardSimpleDemoMainForm *ViewCardSimpleDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TViewCardSimpleDemoMainForm::TViewCardSimpleDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TViewCardSimpleDemoMainForm::miAboutClick(
      TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miInvertSelectClick(
      TObject *Sender)
{
  cxGridUsersDBCardView->OptionsSelection->InvertSelect = !cxGridUsersDBCardView->OptionsSelection->InvertSelect;
  ((TMenuItem*)Sender)->Checked = cxGridUsersDBCardView->OptionsSelection->InvertSelect;
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miCellSelectClick(
      TObject *Sender)
{
  cxGridUsersDBCardView->OptionsSelection->CellSelect = !cxGridUsersDBCardView->OptionsSelection->CellSelect;
  ((TMenuItem*)Sender)->Checked = cxGridUsersDBCardView->OptionsSelection->CellSelect;
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miHideFocusRectClick(
      TObject *Sender)
{
  cxGridUsersDBCardView->OptionsSelection->HideFocusRect = !cxGridUsersDBCardView->OptionsSelection->HideFocusRect;
  ((TMenuItem*)Sender)->Checked = cxGridUsersDBCardView->OptionsSelection->HideFocusRect;
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miMulitiSelectClick(
      TObject *Sender)
{
  cxGridUsersDBCardView->OptionsSelection->MultiSelect = !cxGridUsersDBCardView->OptionsSelection->MultiSelect;
  ((TMenuItem*)Sender)->Checked = cxGridUsersDBCardView->OptionsSelection->MultiSelect;
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miExitClick(
      TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TViewCardSimpleDemoMainForm::miShowNavigatorClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  cxGridUsersDBCardView->OptionsView->Navigator = ((TMenuItem*)Sender)->Checked;
}
