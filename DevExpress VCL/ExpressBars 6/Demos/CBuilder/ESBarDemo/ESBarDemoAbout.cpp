//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ESBarDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TESBarDemoAboutForm *ESBarDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TESBarDemoAboutForm::TESBarDemoAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
