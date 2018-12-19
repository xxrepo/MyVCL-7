//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColumnsSimpleDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxGridBandedTableView"
#pragma resource "*.dfm"
TColumnsSimpleDemoDataDM *ColumnsSimpleDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TColumnsSimpleDemoDataDM::TColumnsSimpleDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColumnsSimpleDemoDataDM::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCar->AsString = tblCarsTrademark->AsString + " " + tblCarsModel->AsString;
}
//---------------------------------------------------------------------------

