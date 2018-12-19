//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EditorsLookupDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxContainer"
#pragma link "cxEdit"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TEditorsLookupDemoDataDM *EditorsLookupDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TEditorsLookupDemoDataDM::TEditorsLookupDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoDataDM::tblUsersCalcFields(TDataSet *DataSet)
{
  tblUsersUserName->AsString = tblUsersFNAME->AsString + " " +
    tblUsersLNAME->AsString;
}
//---------------------------------------------------------------------------



