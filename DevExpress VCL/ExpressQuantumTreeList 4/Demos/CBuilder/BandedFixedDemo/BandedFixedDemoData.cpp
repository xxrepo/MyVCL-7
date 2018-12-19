//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BandedFixedDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TBandedFixedDemoDataDM *BandedFixedDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TBandedFixedDemoDataDM::TBandedFixedDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TBandedFixedDemoDataDM::tblShedulerCalcFields(TDataSet *DataSet)
{
  tblShedulerWeekSum->Value = tblShedulerSUNDAY->Value + tblShedulerMONDAY->Value +
    tblShedulerTUESDAY->Value + tblShedulerWEDNESDAY->Value + tblShedulerTHURSDAY->Value +
    tblShedulerFRIDAY->Value + tblShedulerSATURDAY->Value;
  tblShedulerWeekAVG->Value = tblShedulerWeekSum->Value/7;
}
//---------------------------------------------------------------------------

String TBandedFixedDemoDataDM::GetProjectNameByID(int AProjectID)
{
  return tblProjects->Lookup("ID", AProjectID, "Name");
}
//---------------------------------------------------------------------------

String TBandedFixedDemoDataDM::GetPersonNameByID(int APersonID)
{
  return tblPersons->Lookup("ID", APersonID, "Name");
}
//---------------------------------------------------------------------------

