//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "DBTreemain.h"
#include "tree.h"
#include "dbgridv.h"
#include "shellapi.h"
#include "system.hpp"
#include "dxtree.hpp"
//---------------------------------------------------------------------------
#pragma link "Grids"
#pragma link "dxdbtrel"
#pragma link "dxdbtree"
#pragma link "dxtree"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox1Click(TObject *Sender)
{
  if(CheckBox1->Checked)
    DBTreeView1->DragMode = dmAutomatic;
  else DBTreeView1->DragMode = dmManual;

}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtnDelClick(TObject *Sender)
{
  if (DBTreeView1->Selected != NULL)
    DBTreeView1->Selected->Delete();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtnAddClick(TObject *Sender)
{
  DBTreeView1->Items->Add(DBTreeView1->Selected, "New Item");
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtnAddChildClick(TObject *Sender)
{
  if (DBTreeView1->Selected != NULL)
    DBTreeView1->Items->AddChild(DBTreeView1->Selected,"Child of " + DBTreeView1->Selected->Text);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtnEditClick(TObject *Sender)
{
  if (DBTreeView1->Selected != NULL)
    DBTreeView1->Selected->EditText();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn2Click(TObject *Sender)
{
  TTreeNode * tr;
  
  if (DBTreeView1->Selected != NULL){
    tr = DBTreeView1->Selected->Parent;
    if(tr != NULL){
      if(tr->Parent != NULL)
        DBTreeView1->Selected->MoveTo(tr->Parent, naAddChild);
      else DBTreeView1->Selected->MoveTo(NULL, naAdd);
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::BitBtn3Click(TObject *Sender)
{
	Form2->Show();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked)
    DBTreeView1->DisplayField = "pr_name;pr_id";
   else DBTreeView1->DisplayField = "";
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DBTreeView1DragDropTreeNode(TTreeNode *Destination,
	TTreeNode *Source, bool &Accept)
{
  if (Destination == NULL)
  {
    Accept = false;
    return;
  }
  if (Source->TreeView == Form2->TreeView1)
  {
    Accept = true;
    return;
  }
  if(CheckBox3->Checked)
    Accept = Source->Level > Destination->Level;
  if ((Accept) && (CheckBox4->Checked))
    Accept = ! (Source->Parent == NULL);

}
//---------------------------------------------------------------------------
void __fastcall TForm1::Button2Click(TObject *Sender)
{
  Form3->Show();
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DBTreeView1CustomDraw(TObject *Sender,
	TTreeNode *TreeNode, TFont *AFont, TColor &AColor, TColor &ABkColor)
{
  if(CheckBox5->Checked){
    if(TreeNode->Index % 2 == 1){
      AFont->Style << fsBold;
      AColor = clBlue;
    } else {
      ABkColor = clYellow;
      AColor = clRed;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TForm1::CheckBox5Click(TObject *Sender)
{
  DBTreeView1->Visible = false;
  DBTreeView1->Visible = true;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DBTreeView1AddNewItem(TObject *Sender,
        TdxDBTreeNode *&DBTreeNode)
{
 DBTreeNode->ImageIndex = 2;
 DBTreeNode->SelectedIndex = 2;
}
//---------------------------------------------------------------------------
void __fastcall TForm1::DBLookUpTreeView1AddNewItem(TObject *Sender,
        TdxDBTreeNode *&DBTreeNode)
{
  DBTreeView1AddNewItem(Sender, DBTreeNode);
}
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
  T1->DatabaseName = ExtractFilePath(Application->ExeName);
  T1->Open();
  T2->DatabaseName = T1->DatabaseName;
  T2->Open();
}
//---------------------------------------------------------------------------

