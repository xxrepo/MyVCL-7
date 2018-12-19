//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RowsMultiEditorsDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxVGrid"
#pragma resource "*.dfm"
TRowsMultiEditorsDemoDataDM *RowsMultiEditorsDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TRowsMultiEditorsDemoDataDM::TRowsMultiEditorsDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TRowsMultiEditorsDemoDataDM::queOrdersUpdateRecord(TDataSet *DataSet,
  TUpdateKind UpdateKind, TUpdateAction &UpdateAction)
{
  updOrders->Apply(UpdateKind);
  updCustomers->Apply(UpdateKind);
  updCars->Apply(UpdateKind);
  UpdateAction = uaApplied;
}

void __fastcall TRowsMultiEditorsDemoDataDM::queOrdersAfterPost(TDataSet *DataSet)
{
  queOrders->ApplyUpdates();
}

void __fastcall TRowsMultiEditorsDemoDataDM::queOrdersAfterCancel(TDataSet *DataSet)
{
  queOrders->CancelUpdates();
}

void __fastcall TRowsMultiEditorsDemoDataDM::RowsMultiEditorsDemoDataDMCreate(
  TObject *Sender)
{
  updOrders->DataSet = queOrders;
  updCustomers->DataSet = queOrders;
  updCars->DataSet = queOrders;
}
