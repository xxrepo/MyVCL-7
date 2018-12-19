//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FeatureChild.h"
#include "FeaturesDemoMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxSSheet"
#pragma resource "*.dfm"
TFeatureChildForm *FeatureChildForm;
//---------------------------------------------------------------------------
__fastcall TFeatureChildForm::TFeatureChildForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFeatureChildForm::FormClose(TObject *Sender, TCloseAction &Action)
{
  if (Application->MainForm->MDIChildCount > 1){
    Application->MainForm->Next();
    Action = caFree;
  }
}
//---------------------------------------------------------------------------
void __fastcall TFeatureChildForm::SetSelection()
{
  if (cxSpreadSheetBook->OnSetSelection != NULL)
      cxSpreadSheetBook->OnSetSelection(cxSpreadSheetBook, cxSpreadSheetBook->ActiveSheet);
}


void __fastcall TFeatureChildForm::FormActivate(TObject *Sender)
{
  SetSelection();
}
//---------------------------------------------------------------------------

void __fastcall TFeatureChildForm::FormCreate(TObject *Sender)
{
  SetSelection();
}
//---------------------------------------------------------------------------

void __fastcall TFeatureChildForm::cxSpreadSheetBookSheetPopupMenu(TObject *Sender,
      int X, int Y)
{
  FeaturesMainForm->pmSheetPopup->Popup(X, Y);
}
//---------------------------------------------------------------------------


void __fastcall TFeatureChildForm::cxSpreadSheetBookEditing(
      TcxSSBookSheet *Sender, const int ACol, const int ARow,
      bool &CanEdit)
{
  FIsEditorMode = true;
}
//---------------------------------------------------------------------------

void __fastcall TFeatureChildForm::cxSpreadSheetBookEndEdit(
      TObject *Sender)
{
  FIsEditorMode = false;
}
//---------------------------------------------------------------------------


void __fastcall TFeatureChildForm::cxSpreadSheetBookContextPopup(
      TObject *Sender, TPoint &MousePos, bool &Handled)
{
  if ((MousePos.x == -1) && (MousePos.y == -1))
  {
    MousePos = this->ClientToScreen(Point(0, 0));
  }
  FeaturesMainForm->pmSheetPopup->Popup(MousePos.x, MousePos.y);
  Handled = true;
}
//---------------------------------------------------------------------------

