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
#pragma link "dxPSDBTCLnk"
#pragma link "dxPSTCLnk"
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

void __fastcall TMainForm::PageControl1Change(TObject *Sender)
{
  dxComponentPrinter1->CurrentLink = dxComponentPrinter1->ReportLink[((TPageControl*)Sender)->ActivePage->PageIndex];
  TeeChart->AnimatedZoom = true;
  TeeChart->AnimatedZoomSteps = 4;
  for (int t=0; t < TeeChart->SeriesCount(); t++)
    TeeChart->Series[t]->FillSampleValues(TeeChart->Series[t]->NumSampleValues());
  TeeChart->UndoZoom();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormCreate(TObject *Sender)
{
 if (! TeeChartTable->Active) TeeChartTable->Open();
 PageControl1Change(PageControl1);
}
//---------------------------------------------------------------------------

