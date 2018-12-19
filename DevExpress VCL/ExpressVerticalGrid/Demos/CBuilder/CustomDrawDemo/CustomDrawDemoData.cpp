//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CustomDrawDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxVGrid"
#pragma resource "*.dfm"
TCustomDrawDemoDataDM *CustomDrawDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TCustomDrawDemoDataDM::TCustomDrawDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TCustomDrawDemoDataDM::queOrdersUpdateRecord(TDataSet *DataSet,
  TUpdateKind UpdateKind, TUpdateAction &UpdateAction)
{
  updOrders->Apply(UpdateKind);
  updCustomers->Apply(UpdateKind);
  updCars->Apply(UpdateKind);
  UpdateAction = uaApplied;
}

void __fastcall TCustomDrawDemoDataDM::queOrdersAfterPost(TDataSet *DataSet)
{
  queOrders->ApplyUpdates();
}

void __fastcall TCustomDrawDemoDataDM::queOrdersAfterCancel(TDataSet *DataSet)
{
  queOrders->CancelUpdates();
}

void __fastcall TCustomDrawDemoDataDM::CustomDrawDemoDataDMCreate(
  TObject *Sender)
{
  updOrders->DataSet = queOrders;
  updCustomers->DataSet = queOrders;
  updCars->DataSet = queOrders;
}
