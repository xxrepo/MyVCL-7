//---------------------------------------------------------------------------
#define STRICT
#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include <stdlib.h>
#include <shellAPI.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxPSCore"
#pragma link "dxPSdxFCLnk"
#pragma link "dxBkgnd"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSEngn"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSGraphicLnk"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"
#pragma link "dxflchrt"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbDXClick(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbSetupClick(TObject *Sender)
{
  dxComponentPrinter1->PageSetup(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true, NULL, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbDesignerClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------




