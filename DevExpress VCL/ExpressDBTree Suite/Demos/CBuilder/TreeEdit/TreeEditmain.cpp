//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "TreeEditmain.h"
//---------------------------------------------------------------------------
#pragma link "Grids"
#pragma link "dxdbtrel"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
  TTreeNode *tr, *tr1;

  Table1->DisableControls();
  DBTreeViewEdit1->Items->Clear();
  while (! Table1->Eof ){
    tr = DBTreeViewEdit1->GetTreeNodeByText(NULL, Table1->FindField("country")->AsString, false);
    if(tr == NULL)
      tr = DBTreeViewEdit1->Items->Insert(NULL,Table1->FindField("country")->AsString);
    if(Table1->FindField("state")->AsString != ""){
      tr1 = DBTreeViewEdit1->GetTreeNodeByText(tr, Table1->FindField("state")->AsString, false);
      if(tr1 == NULL)
        tr1 = DBTreeViewEdit1->Items->AddChild(tr,Table1->FindField("state")->AsString);
      tr = tr1;
    }
    tr1 = DBTreeViewEdit1->GetTreeNodeByText(tr, Table1->FindField("city")->AsString, false);
    if(tr1 == NULL)
      DBTreeViewEdit1->Items->AddChild(tr, Table1->FindField("city")->AsString);
    Table1->Next();
  }
  Table1->First();
  Table1->EnableControls();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DBTreeViewEdit1CloseUp(TObject *Sender, bool Accept)
{
  TTreeNode * tr;

  tr = DBTreeViewEdit1->Selected;
  if(Accept){
   Table1->FindField("state")->AsString = "";
    while ((tr != NULL) && (tr->Parent != NULL)){
      tr = tr->Parent;
      if(tr->Level == 1)
        Table1->FindField("state")->AsString = tr->Text;
      if(tr->Level == 0)
        Table1->FindField("country")->AsString = tr->Text;
    }
  }
}
//---------------------------------------------------------------------------
