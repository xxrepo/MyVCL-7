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
void __fastcall TfmMain::lvlProductsFilterRecord(
      TdxMasterViewLevel *Sender, const Variant &AID,
      const Variant &AKeyValue, bool &Accept)
{
  //load only the root level's records
  Accept = Sender->DataSet->FieldByName("Pr_Parent")->AsInteger == -1;    
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btnFullCollapseClick(TObject *Sender)
{
  MasterView->FullCollapse();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::btnFullExpandClick(TObject *Sender)
{
  MasterView->FullExpand();    
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::CustomizeClick(TObject *Sender)
{
  MasterView->Customizing = !MasterView->Customizing;     
}
//---------------------------------------------------------------------------
