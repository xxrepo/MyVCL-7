//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "dxLayoutControl"
#pragma link "dxLayoutLookAndFeels"
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
TdxLayoutControl* __fastcall TForm1::GetLayoutControl(int AIndex)
{
  switch (AIndex)
  {
    case 0: return lcMain;
    case 1: return lcVCL;
    case 2: return lcActiveX;
    case 3: return lcNET;
    default : return NULL;
  }
}
//---------------------------------------------------------------------------
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
  sbGoBack->Enabled = (ActiveScreen > 0);
  sbGoForward->Enabled = (LastActiveScreen > 0);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::dxLayoutGroup1CaptionClick(TObject *Sender)
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

