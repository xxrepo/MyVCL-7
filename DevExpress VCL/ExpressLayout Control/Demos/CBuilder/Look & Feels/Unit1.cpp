//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
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
  switch (AIndex)
  {
    case 0: return lfStandard;
    case 1: return lfOffice;
    case 2: return lfWeb;
    default : return NULL;
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::SpeedButton1Click(TObject *Sender)
{
  lcMain->LookAndFeel = GetLookAndFeel(((TSpeedButton*)Sender)->Tag);
}
//---------------------------------------------------------------------------
