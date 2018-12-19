//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SampleDockingAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TSampleDockingAboutForm *SampleDockingAboutForm;
//---------------------------------------------------------------------------
__fastcall TSampleDockingAboutForm::TSampleDockingAboutForm(TComponent* Owner)
  : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
 