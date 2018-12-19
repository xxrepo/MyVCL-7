//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesSimpleDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TStylesSimpleDemoDataDM *StylesSimpleDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TStylesSimpleDemoDataDM::TStylesSimpleDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesSimpleDemoDataDM::SetParentValue(Variant AValue)
{
  if (tblDEPARTMENTS->State == dsEdit || tblDEPARTMENTS->State == dsInsert)
    tblDEPARTMENTS->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------


