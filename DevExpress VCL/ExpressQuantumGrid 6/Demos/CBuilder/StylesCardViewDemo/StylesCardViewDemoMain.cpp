//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "StylesCardViewDemoMain.h"
#include "StylesCardViewDemoData.h"
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
#pragma link "cxCheckBox"
#pragma link "cxContainer"
#pragma link "cxGridCardView"
#pragma link "cxGridDBCardView"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxSpinEdit"
#pragma link "cxStyleSheetEditor"
#pragma link "cxTextEdit"
#pragma link "cxLookAndFeels"
#pragma link "cxGridStyleSheetsPreview"
#pragma resource "*.dfm"
TStylesCardViewDemoMainForm *StylesCardViewDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TStylesCardViewDemoMainForm::TStylesCardViewDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::miExitClick(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::spedCardWidthPropertiesChange(
      TObject *Sender)
{
  ((TcxGridDBCardView*)cxGrid->FocusedView)->OptionsView->CardWidth =
    spedCardWidth->Value;
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::spedCardBorderWidthPropertiesChange(
      TObject *Sender)
{
  ((TcxGridDBCardView*)cxGrid->FocusedView)->OptionsView->CardBorderWidth =
    spedCardBorderWidth->Value;
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::cbCellAutoHeightPropertiesChange(
      TObject *Sender)
{
  ((TcxGridDBCardView*)cxGrid->FocusedView)->OptionsView->CellAutoHeight =
    cbCellAutoHeight->Checked;
}
//---------------------------------------------------------------------------


void __fastcall TStylesCardViewDemoMainForm::spedCardWidthKeyPress(
      TObject *Sender, char &Key)
{
  Set <char, '0', '9'> s1;
  s1 <<'0'<<'1'<<'2'<<'3'<<'4'<<'5'<<'6'<<'7'<<'8'<<'9';

  if (!(s1.Contains(Key) || (Key == 8)))
    Key = 0;
}
//---------------------------------------------------------------------------

void TStylesCardViewDemoMainForm::GetViewOptions(TcxGridDBCardView *AView)
{
  cbCellAutoHeight->Checked = AView->OptionsView->CellAutoHeight;
  spedCardBorderWidth->Value = AView->OptionsView->CardBorderWidth;
//  AView->OptionsView->CardBorderWidth = spedCardBorderWidth->Value;
  spedCardWidth->Value = AView->OptionsView->CardWidth;
}
//---------------------------------------------------------------------------


void __fastcall TStylesCardViewDemoMainForm::cxGridActiveTabChanged(
      TcxCustomGrid *Sender, TcxGridLevel *ALevel)
{
  btnEdit->Enabled = (ALevel == lvUserDefined);
  GetViewOptions((TcxGridDBCardView*)ALevel->GridView);
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::btnEditClick(TObject *Sender)
{
  ShowcxStyleSheetEditor(StylesCardViewDemoDataDM->cvssUserDefined, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::cxGridLayoutChanged(
      TcxCustomGrid *Sender, TcxCustomGridView *AGridView)
{
  if (((TcxGrid*)Sender)->FocusedView != NULL)
  {
    TcxGridDBCardView *AView = (TcxGridDBCardView*)(Sender->FocusedView);
    spedCardWidth->Value = AView->OptionsView->CardWidth;
    spedCardBorderWidth->Value = AView->OptionsView->CardBorderWidth;
  }
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::FormCreate(TObject *Sender)
{
  spedCardWidth->Properties->MinValue = cxGridCardMinWidth;
  spedCardBorderWidth->Properties->MinValue = cxGridCardBorderMinWidth;
}
//---------------------------------------------------------------------------

void __fastcall TStylesCardViewDemoMainForm::miNativeStyleClick(
      TObject *Sender)
{
  LookAndFeelController->NativeStyle = !LookAndFeelController->NativeStyle;
  ((TMenuItem*)Sender)->Checked = LookAndFeelController->NativeStyle;
}
//---------------------------------------------------------------------------


void __fastcall TStylesCardViewDemoMainForm::miLookAndFeelKindClick(
      TObject *Sender)
{
  LookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->MenuIndex;
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------

