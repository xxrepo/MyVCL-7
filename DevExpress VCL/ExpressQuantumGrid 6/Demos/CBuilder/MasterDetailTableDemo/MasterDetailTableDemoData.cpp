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
TMasterDetailTableDemoDataDM *MasterDetailTableDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TMasterDetailTableDemoDataDM::TMasterDetailTableDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMasterDetailTableDemoDataDM::tblPersonsCalcFields(
      TDataSet *DataSet)
{
    tblPersonsNAME->AsString = tblPersonsFIRSTNAME->AsString + " " +
      tblPersonsSECONDNAME->AsString;
}
//---------------------------------------------------------------------------

