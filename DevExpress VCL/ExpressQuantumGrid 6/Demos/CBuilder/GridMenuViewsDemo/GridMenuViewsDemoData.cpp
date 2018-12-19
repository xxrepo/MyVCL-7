//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "GridMenuViewsDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TGridMenuViewsDemoDataDM *GridMenuViewsDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TGridMenuViewsDemoDataDM::TGridMenuViewsDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TGridMenuViewsDemoDataDM::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCarName->AsString = tblCarsTrademark->AsString + ' ' +
    tblCarsModel->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TGridMenuViewsDemoDataDM::tblOrdersCalcFields(TDataSet *DataSet)
{
  String s;
  DateTimeToString( s, "mmmm", tblOrdersPurchaseDate->AsDateTime);
  tblOrdersPurchaseMonth->AsString = s;
}
//---------------------------------------------------------------------------


