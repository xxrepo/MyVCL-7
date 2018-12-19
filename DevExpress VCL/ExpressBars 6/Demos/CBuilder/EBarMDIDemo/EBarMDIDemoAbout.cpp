//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EBarMDIDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEBarMDIDemoAboutForm *EBarMDIDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TEBarMDIDemoAboutForm::TEBarMDIDemoAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
