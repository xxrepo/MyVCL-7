//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "dxLayoutControl"
#pragma link "dxLayoutLookAndFeels"
#pragma link "dxPSContainerLnk"
#pragma link "dxPSCore"
#pragma link "dxPSdxLC2Lnk"
#pragma link "dxPSDBCtrlProducers"
#pragma link "cxGraphics"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "dxBkgnd"
#pragma link "dxLayoutControlAdapters"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSEngn"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::SpeedButton4Click(TObject *Sender)
{
  lcMain->Customization = ((TSpeedButton*)Sender)->Down;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lcMainCustomization(TObject *Sender)
{
  SpeedButton4->Down = lcMain->Customization;
}
//---------------------------------------------------------------------------

TdxCustomLayoutLookAndFeel* __fastcall TForm1::GetLookAndFeel(int AIndex)
{
  switch (AIndex) {
    case 0:
      return lfStandard;
    case 1:
      return lfOffice;
    case 2:
      return lfWeb;
  default:
    return NULL;
  }
}

void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  lcMain->LookAndFeel = GetLookAndFeel(((TSpeedButton*)Sender)->Tag);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::dxComponentPrinter1Link1InitializeItem(
    TdxCustomContainerReportLink *Sender, TdxReportVisualItem *AnItem,
    TComponent *AComponent)
{
  if (lcMain->LookAndFeel == lfWeb)
    if (dynamic_cast<TdxLayoutGroup*>(AComponent) != 0)
    {
      TdxLayoutGroup *Group = (TdxLayoutGroup*)AComponent;
      if ((Group == dxLayoutGroup1) || (Group == lcMainGroup4) || (Group == lcMainGroup5))
        ((TdxReportLayoutGroup*)AnItem)->CaptionTransparent = false;
    }
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnDesignClick(TObject *Sender)
{
  dxComponentPrinter1Link1->DesignReport();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnPrintPreviewClick(TObject *Sender)
{
  dxComponentPrinter1Link1->Preview(true);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnPrintClick(TObject *Sender)
{
  dxComponentPrinter1Link1->Print(true, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::btnPageSetupClick(TObject *Sender)
{
  dxComponentPrinter1Link1->PageSetup();
}
//---------------------------------------------------------------------------

