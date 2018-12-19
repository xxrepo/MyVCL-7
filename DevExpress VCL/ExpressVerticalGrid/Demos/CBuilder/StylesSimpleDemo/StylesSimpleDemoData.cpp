//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesSimpleDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxVGrid"
#pragma resource "*.dfm"
TStylesSimpleDemoDataDM *StylesSimpleDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TStylesSimpleDemoDataDM::TStylesSimpleDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesSimpleDemoDataDM::queOrdersUpdateRecord(TDataSet *DataSet,
  TUpdateKind UpdateKind, TUpdateAction &UpdateAction)
{
  updOrders->Apply(UpdateKind);
  updCustomers->Apply(UpdateKind);
  updCars->Apply(UpdateKind);
  UpdateAction = uaApplied;
}

void __fastcall TStylesSimpleDemoDataDM::queOrdersAfterPost(TDataSet *DataSet)
{
  queOrders->ApplyUpdates();
}

void __fastcall TStylesSimpleDemoDataDM::queOrdersAfterCancel(TDataSet *DataSet)
{
  queOrders->CancelUpdates();
}

void __fastcall TStylesSimpleDemoDataDM::StylesSimpleDemoDataDMCreate(
  TObject *Sender)
{
  updOrders->DataSet = queOrders;
  updCustomers->DataSet = queOrders;
  updCars->DataSet = queOrders;
}
