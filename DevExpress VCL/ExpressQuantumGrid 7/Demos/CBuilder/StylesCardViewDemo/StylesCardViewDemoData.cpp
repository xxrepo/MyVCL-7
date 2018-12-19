//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesCardViewDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma link "cxEditRepositoryItems"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TStylesCardViewDemoDataDM *StylesCardViewDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TStylesCardViewDemoDataDM::TStylesCardViewDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TStylesCardViewDemoDataDM::tblPersonsCalcFields(
      TDataSet *DataSet)
{
  tblPersonsFullName->AsString = tblPersonsFIRSTNAME->AsString + " " +
    tblPersonsSECONDNAME->AsString + " " + "(" +
    IntToStr(tblPersonsID->AsInteger) + ")";
}
//---------------------------------------------------------------------------

