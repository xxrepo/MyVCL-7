//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BackgroundDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TBackgroundDemoAboutForm *BackgroundDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TBackgroundDemoAboutForm::TBackgroundDemoAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
