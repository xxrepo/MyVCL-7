//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DockingMegaDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TDockingMegaDemoAboutForm *DockingMegaDemoAboutForm;
//---------------------------------------------------------------------------
__fastcall TDockingMegaDemoAboutForm::TDockingMegaDemoAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
