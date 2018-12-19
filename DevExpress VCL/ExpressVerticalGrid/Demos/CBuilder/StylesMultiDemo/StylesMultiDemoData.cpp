//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesMultiDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxVGrid"
#pragma resource "*.dfm"
TStylesMultiDemoDataDM *StylesMultiDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TStylesMultiDemoDataDM::TStylesMultiDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void PopulateStyleSheetsList(TList *AList)
{
  if (AList != NULL){
    AList->Clear();
    TcxStyleRepository *AStRep = StylesMultiDemoDataDM->strepUserDefined;
     for (int I = 0; I < AStRep->StyleSheetCount; I++)
        AList->Add(AStRep->StyleSheets[I]);
  }
}

void __fastcall TStylesMultiDemoDataDM::queOrdersUpdateRecord(TDataSet *DataSet,
  TUpdateKind UpdateKind, TUpdateAction &UpdateAction)
{
  updOrders->Apply(UpdateKind);
  updCustomers->Apply(UpdateKind);
  updCars->Apply(UpdateKind);
  UpdateAction = uaApplied;
}

void __fastcall TStylesMultiDemoDataDM::queOrdersAfterPost(TDataSet *DataSet)
{
  queOrders->ApplyUpdates();
}

void __fastcall TStylesMultiDemoDataDM::queOrdersAfterCancel(TDataSet *DataSet)
{
  queOrders->CancelUpdates();
}

void __fastcall TStylesMultiDemoDataDM::StylesMultiDemoDataDMCreate(
  TObject *Sender)
{
  updOrders->DataSet = queOrders;
  updCustomers->DataSet = queOrders;
  updCars->DataSet = queOrders;
}
