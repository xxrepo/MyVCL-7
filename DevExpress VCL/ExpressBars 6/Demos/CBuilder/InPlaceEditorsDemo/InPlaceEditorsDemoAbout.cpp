//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "InPlaceEditorsDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "EBarsAbout"
#pragma resource "*.dfm"
TfrmAbout *frmAbout;
//---------------------------------------------------------------------------
__fastcall TfrmAbout::TfrmAbout(TComponent* Owner)
        : TEBarsAboutForm(Owner)
{
}
//---------------------------------------------------------------------------
