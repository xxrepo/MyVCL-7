//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RibbonNotepadDemoOptions.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TRibbonDemoOptionsForm *RibbonDemoOptionsForm;
//---------------------------------------------------------------------------
__fastcall TRibbonDemoOptionsForm::TRibbonDemoOptionsForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
bool __fastcall TRibbonDemoOptionsForm::GetOptions(String &AColorSchemeName, TScreenTipOptions &AScreenTipOptions)
{
  cbColorScheme->ItemIndex = cbColorScheme->Items->IndexOf(AColorSchemeName);
  if (AScreenTipOptions.ShowScreenTips)
    if (AScreenTipOptions.ShowDescripitons)
      cbScreenTipStyle->ItemIndex = 0;
    else
      cbScreenTipStyle->ItemIndex = 1;
  else
    cbScreenTipStyle->ItemIndex = 2;

  bool Result = ShowModal() == mrOk;

  if (Result)
  {
    AColorSchemeName = cbColorScheme->Text;
    AScreenTipOptions.ShowScreenTips = (cbScreenTipStyle->ItemIndex != 2);
    AScreenTipOptions.ShowDescripitons = (cbScreenTipStyle->ItemIndex == 0);
  };
  return (Result);
}
//---------------------------------------------------------------------------
