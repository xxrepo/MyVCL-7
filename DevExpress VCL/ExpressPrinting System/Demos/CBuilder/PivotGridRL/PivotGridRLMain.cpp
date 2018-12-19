//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include "PivotGridRLMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxCustomPivotGrid"
#pragma link "cxPivotGrid"
#pragma link "dxPSCore"
#pragma link "dxPScxCommon"
#pragma link "dxPScxPivotGrid2Lnk"
#pragma resource "*.dfm"
TPivotGridRLMainForm *PivotGridRLMainForm;
//---------------------------------------------------------------------------
__fastcall TPivotGridRLMainForm::TPivotGridRLMainForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPivotGridRLMainForm::FormCreate(TObject *Sender)
{
  //#if __BORLANDC__ >= 0x610 // BCB >= 12
  #if defined(_DELPHI_STRING_UNICODE)
	PChar S = PChar(WideString("PIVOTDATA"));
  #else
	PChar S = "PIVOTDATA";
  #endif
  TStream * AStream = new TResourceStream((int)HInstance, "PIVOTPREVIEWDATA", S);
  try {
    AStream->Position = 0;
    PivotGrid->DataController->LoadFromStream(AStream);
   }
  __finally{
    delete AStream;
  }
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miDXClick(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miPageSetupClick(TObject *Sender)
{
  dxComponentPrinter1->PageSetup(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miPrintPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true, NULL, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miDesignerClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TPivotGridRLMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------


void __fastcall TPivotGridRLMainForm::pgfPaymentTypeGetGroupImageIndex(
      TcxPivotGridField *Sender, const TcxPivotGridViewDataItem *AItem,
      int &AImageIndex, TAlignment &AImageAlignHorz,
      TcxAlignmentVert &AImageAlignVert)
{
  AnsiString Card = ((TcxPivotGridViewDataItem *)AItem)->Value;
  if (SameText(Card, "AmEx")) AImageIndex = 0;
  else if (SameText(Card, "Cash")) AImageIndex = 1;
       else if (SameText(Card, "Master")) AImageIndex = 2;
            else if (SameText(Card, "Visa")) AImageIndex = 3;
}
//---------------------------------------------------------------------------

