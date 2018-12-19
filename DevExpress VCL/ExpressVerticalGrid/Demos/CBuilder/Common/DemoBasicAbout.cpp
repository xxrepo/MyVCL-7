//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DemoBasicAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxImage"
#pragma link "cxLookAndFeelPainters"
#pragma resource "*.dfm"
TDemoBasicAboutForm *DemoBasicAboutForm;
//---------------------------------------------------------------------------
__fastcall TDemoBasicAboutForm::TDemoBasicAboutForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicAboutForm::btnOKClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicAboutForm::FormClose(TObject *Sender,
  TCloseAction &Action)
{
  Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicAboutForm::FormDestroy(TObject *Sender)
{
  DemoBasicAboutForm = NULL;
}
//---------------------------------------------------------------------------


