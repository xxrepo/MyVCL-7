//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BandedDemoBands.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxListBox"
#pragma link "cxLookAndFeelPainters"
#pragma resource "*.dfm"
TBandedDemoBandsForm *BandedDemoBandsForm;
//---------------------------------------------------------------------------
__fastcall TBandedDemoBandsForm::TBandedDemoBandsForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBandedDemoBandsForm::btnCancelClick(TObject &Sender)
{
  Close();
}
//---------------------------------------------------------------------------
