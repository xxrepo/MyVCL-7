//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColumnsShareDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridCardView"
#pragma resource "*.dfm"
TColumnsShareDemoMainDM *ColumnsShareDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TColumnsShareDemoMainDM::TColumnsShareDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColumnsShareDemoMainDM::tblUsersCalcFields(
      TDataSet *DataSet)
{
  tblUsersUserName->AsString = tblUsersFNAME->AsString +  " " + tblUsersLNAME->AsString;
}
//---------------------------------------------------------------------------

