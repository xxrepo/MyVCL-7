//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesMultiDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TStylesMultiDemoDataDM *StylesMultiDemoDataDM;
//---------------------------------------------------------------------------

void PopulateStyleSheetsList(TList *AList)
{
  if (AList != NULL){
    TcxStyleRepository *ARepository = StylesMultiDemoDataDM->strepUserDefined;
    AList->Clear();
     for (int I = 0; I < ARepository->StyleSheetCount; I++)
        AList->Add(ARepository->StyleSheets[I]);
  }
}
//---------------------------------------------------------------------------

__fastcall TStylesMultiDemoDataDM::TStylesMultiDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoDataDM::SetParentValue(Variant AValue)
{
  if (tblDepartments->State == dsEdit || tblDepartments->State == dsInsert)
    tblDepartments->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------



