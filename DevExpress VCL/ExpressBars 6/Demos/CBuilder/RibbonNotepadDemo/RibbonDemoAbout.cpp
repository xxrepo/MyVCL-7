//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RibbonDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRibbonDemoAboutForm *RibbonDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TRibbonDemoAboutForm::TRibbonDemoAboutForm(TComponent* Owner)
        : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
