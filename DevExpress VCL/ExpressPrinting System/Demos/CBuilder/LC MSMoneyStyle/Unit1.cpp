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
#pragma link "cxGraphics"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "dxBkgnd"
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

void __fastcall TForm1::FormCreate(TObject *Sender)
{
  FActiveScreen = -1;
  FLastActiveScreen = -1;
  ActiveScreen = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::lcMainGroupCaptionClick(TObject *Sender)
{
  ActiveScreen = ((TdxLayoutGroup*)Sender)->Tag;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbGoBackClick(TObject *Sender)
{
  GoBack();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbGoForwardClick(TObject *Sender)
{
  GoForward();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::sbPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->ReportLink[ActiveScreen]->Preview(true);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::GoBack()
{
  ActiveScreen = 0;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::GoForward()
{
  ActiveScreen = LastActiveScreen;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::RefreshEnableds()
{
  sbGoBack->Enabled = ActiveScreen > 0;
  sbGoForward->Enabled = LastActiveScreen > 0;
}
//---------------------------------------------------------------------------

TdxLayoutControl* TForm1::GetLayoutControl(int AIndex)
{
  switch (AIndex) {
    case 0: return lcMain;
    case 1: return lcVCL;
    case 2: return lcActiveX;
    case 3: return lcNET;
  default:
    return NULL;
  }
}

void __fastcall TForm1::SetActiveScreen(int Value)
{
  if (FActiveScreen != Value)
  {
    if (GetLayoutControl(FActiveScreen) != NULL)
      GetLayoutControl(FActiveScreen)->Visible = false;
    FLastActiveScreen = FActiveScreen;
    FActiveScreen = Value;
    lcBackgroundSiteItem->Control = GetLayoutControl(FActiveScreen);
    RefreshEnableds();
  }
}
//---------------------------------------------------------------------------

