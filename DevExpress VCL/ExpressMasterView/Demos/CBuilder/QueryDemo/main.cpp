//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxMasterView"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::lvlCustomersExpanding(TdxMasterViewLevel *Sender,
      TdxMasterViewNode *Node, bool &Allow)
{
  if (Node->NodeType == ntData) {
    if (RadioGroup1->ItemIndex == 0) Sender->Control->BeginLayout();
    try {
      //with Query1 do
        Query1->Params->Items[0]->Value = Node->Values[lvlCustomersCustNo->Index];
        Query1->Active = False;
        Query1->Active = True;
      }
    __finally
    {
      if (RadioGroup1->ItemIndex == 0) Sender->Control->CancelLayout();
    };
  };
}
//---------------------------------------------------------------------------
