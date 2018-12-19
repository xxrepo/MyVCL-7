//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DemoBasicMain.h"
#include "DemoRating.h"
#include "DemoBasicAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TDemoBasicMainForm *DemoBasicMainForm;
//---------------------------------------------------------------------------
__fastcall TDemoBasicMainForm::TDemoBasicMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actAboutExecute(TObject *Sender)
{
  ShowAbout(true, false);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actDownloadsExecute(TObject *Sender)
{
  ShellExecute(Handle, PAnsiChar("OPEN"), PAnsiChar("http://www.devexpress.com/downloads"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actDXOnTheWebExecute(TObject *Sender)
{
  ShellExecute(Handle, PAnsiChar("OPEN"), PAnsiChar("http://www.devexpress.com"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actExitExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actForumExecute(TObject *Sender)
{
  ShellExecute(Handle, PAnsiChar("OPEN"), PAnsiChar("https://www.devexpress.com/ClientCenter"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actHelpExecute(TObject *Sender)
{
  Application->HelpCommand(HELP_FINDER, 0);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actProductsExecute(TObject *Sender)
{
  ShellExecute(Handle, PAnsiChar("OPEN"), PAnsiChar("http://www.devexpress.com/products"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actRateDemoExecute(TObject *Sender)
{
  TDemoRatingForm *AForm = new TDemoRatingForm(this);
    __try{
      AForm->ShowModal();
    }
    __finally{
      AForm->Free();
    }
}
//---------------------------------------------------------------------------

void __fastcall TDemoBasicMainForm::actShowDemoDescriptionExecute(TObject *Sender)
{
  lscrip->Visible = !lscrip->Visible;
  ((TCustomAction*)Sender)->Checked = !((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void TDemoBasicMainForm::AdjustAboutText(TStrings *AAboutText)
{
  AAboutText->Assign(memAboutText->Lines);
}
//---------------------------------------------------------------------------

void TDemoBasicMainForm::ShowAbout(bool AModal, bool AOnTop)
{
  if (DemoBasicAboutForm == NULL)
    DemoBasicAboutForm = new TDemoBasicAboutForm(Application);
  AdjustAboutText(DemoBasicAboutForm->reDemoInfo->Lines);
  DemoBasicAboutForm->lmoName->Caption = ChangeFileExt(ExtractFileName(Application->ExeName),"");
  if (AOnTop)
    DemoBasicAboutForm->FormStyle = fsStayOnTop;
  else
    DemoBasicAboutForm->FormStyle = fsNormal;
  if (AModal)
    DemoBasicAboutForm->ShowModal();
  else
    DemoBasicAboutForm->Show();
}
//---------------------------------------------------------------------------


void __fastcall TDemoBasicMainForm::actSupportExecute(TObject *Sender)
{
  ShellExecute(Handle, PAnsiChar("OPEN"), PAnsiChar("http://www.devexpress.com/Support/Center"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

