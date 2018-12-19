//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MasterDetailTableDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TMasterDetailTableDemoMainDM *MasterDetailTableDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TMasterDetailTableDemoMainDM::TMasterDetailTableDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailTableDemoMainDM::tblPersonsCalcFields(
      TDataSet *DataSet)
{
    tblPersonsNAME->AsString = tblPersonsFIRSTNAME->AsString + " " +
      tblPersonsSECONDNAME->AsString;
}
//---------------------------------------------------------------------------

