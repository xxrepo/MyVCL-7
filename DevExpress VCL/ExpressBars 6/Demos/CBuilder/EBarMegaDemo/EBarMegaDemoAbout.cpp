//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EBarMegaDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEBarMegaDemoAboutForm *EBarMegaDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TEBarMegaDemoAboutForm::TEBarMegaDemoAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
