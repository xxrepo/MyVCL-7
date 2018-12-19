//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "IssueListData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxContainer"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma link "cxEditRepositoryItems"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TdmMain *dmMain;
//---------------------------------------------------------------------------
__fastcall TdmMain::TdmMain(TComponent* Owner)
        : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TdmMain::DataModuleCreate(TObject *Sender)
{
  DataBase->Connected = true;
  for(int i = 0; i < ComponentCount; i++)
  if (TTable* tbl = dynamic_cast<TTable *>(Components[i]))
    tbl->Open();
}
//---------------------------------------------------------------------------

void __fastcall TdmMain::tblUsersCalcFields(TDataSet* DataSet)
{
  tblUsersFullName->AsString = tblUsersFNAME->AsString + ' ' +
    tblUsersMNAME->AsString + ' ' + tblUsersLNAME->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TdmMain::tblScheduleCalcFields(TDataSet* DataSet)
{
  tblScheduleRowSum->AsFloat = tblScheduleSUNDAY->AsFloat +
    tblScheduleMONDAY->AsFloat + tblScheduleTUESDAY->AsFloat +
    tblScheduleWEDNESDAY->AsFloat + tblScheduleTHURSDAY->AsFloat +
    tblScheduleFRIDAY->AsFloat + tblScheduleSATURDAY->AsFloat;
  tblScheduleRowAvg->AsString = FormatFloat("0.00", tblScheduleRowSum->AsFloat / 7);

}
//---------------------------------------------------------------------------


