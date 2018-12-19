//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesMultiDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma resource "*.dfm"
TStylesMultiDemoDataDM *StylesMultiDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TStylesMultiDemoDataDM::TStylesMultiDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoDataDM::tblUsersCalcFields(TDataSet *DataSet)
{
 tblUsersFullName->AsString = tblUsersFNAME->AsString + " " +
   tblUsersMNAME->AsString + " " + tblUsersLNAME->AsString;
}
//---------------------------------------------------------------------------

void TStylesMultiDemoDataDM::PopulateStyleSheetsList(TList *AList)
{
  if (AList != NULL)
  {
    AList->Clear();
     for (int I = 0; I < strepUserDefined->StyleSheetCount; I++)
        AList->Add(strepUserDefined->StyleSheets[I]);
  }
}
//---------------------------------------------------------------------------


