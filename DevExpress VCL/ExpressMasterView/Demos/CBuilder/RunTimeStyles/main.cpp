//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cspin"
#pragma link "dxMasterView"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::Level1GetGroupStyle(TdxMasterViewLevel *Sender,
      TdxMasterViewNode *Node, TdxMasterViewColumn *Column,
      TdxMasterViewStyle *&NewStyle)
{
  switch (Node->GroupIndex) {
    case 0: NewStyle = GroupStyle1; break;
    case 1: NewStyle = GroupStyle2; break;
    case 2: NewStyle = GroupStyle3; break;
  default :
    NewStyle = Style1;
  }
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::Level1GetContentStyle(TdxMasterViewLevel *Sender,
      TdxMasterViewNode *Node, TdxMasterViewColumn *Column,
      TdxMasterViewStyle *&NewStyle)
{
  int ColInd = dxMasterView1Level1PaymentMethod->Index;
  if (chbPaymantMethod->Checked)
    if (Node->NodeType == ntData)
      if (Node->Strings[ColInd] == cmbPaymentMethod->Text)
        NewStyle = Style2;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cmbPaymentMethodClick(TObject *Sender)
{
  MasterView->Invalidate();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::FormCreate(TObject *Sender)
{
  cmbPaymentMethod->ItemIndex = 0;
  dxMVGroupByBoxText = "Group several columns to receive a new style for each grouped node";
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::dxMasterView1Level1AmountPaidGetContentStyle(
      TdxMasterViewColumn *Sender, TdxMasterViewNode *Node,
      TdxMasterViewStyle *&NewStyle)
{
    if (chbAmountPaid->Checked)
      if (Node->NodeType == ntData)
        if ((int)(Node->Values[Sender->Index]) > sedAmountPaid->Value)
          NewStyle = Style1;
}
//---------------------------------------------------------------------------
