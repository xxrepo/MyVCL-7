//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "DemoBasicDM.h"
//---------------------------------------------------------------------
#pragma resource "*.dfm"
TdmOrders *dmOrders;
//---------------------------------------------------------------------
__fastcall TdmOrders::TdmOrders(TComponent* AOwner)
	: TDataModule(AOwner)
{
}
//---------------------------------------------------------------------
void __fastcall TdmOrders::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsCarName->Value = tblCarsTrademark->Value + ": " + tblCarsModel->Value;
}
//---------------------------------------------------------------------------

void __fastcall TdmOrders::tblOrdersCalcFields(TDataSet *DataSet)
{
  tblOrdersPaymentAmount->Value = tblOrdersQuantity->Value * tblOrdersUnitPrice->Value;
}
//---------------------------------------------------------------------------

