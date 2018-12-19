//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "ESBarDemoMain.h"
#include "EBarsDemoRating.h"
#include "ESBarDemoAbout.h"
//---------------------------------------------------------------------------
#pragma link "dxsbar"
#pragma link "dxBar"
#pragma resource "*.dfm"
TESBarDemoMainForm *ESBarDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TESBarDemoMainForm::TESBarDemoMainForm(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::SideBarItemClick(TObject *Sender, TdxSideBarItem *Item)
{
  Edit1->Text = Item->Caption;	
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::CheckBox1Click(TObject *Sender)
{
  SideBar->CanSelected = CheckBox1->Checked;
  SideBar->SelectedItem = NULL;
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::SideBarChangeActiveGroup(TObject *Sender)
{
  if(SideBar->ActiveGroup == NULL)
    Edit2->Text = "";
  else{
    Edit2->Text = SideBar->ActiveGroup->Caption;
    CheckBox3->Checked = SideBar->ActiveGroup->IconType == dxsgLargeIcon;
  }
  CheckBox3->Enabled = SideBar->ActiveGroup != NULL;
  Button2->Enabled = CheckBox3->Enabled;
  Button3->Enabled = CheckBox3->Enabled;
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::SideBarChangeGroupCaption(TObject *Sender,
	TdxSideGroup *Group)
{
  if (Group == SideBar->ActiveGroup)
   Edit2->Text = Group->Caption;
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::Button1Click(TObject *Sender)
{
  SideBar->Groups->Add();	
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::Button2Click(TObject *Sender)
{
  SideBar->EditGroup(SideBar->ActiveGroup);	
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::Button3Click(TObject *Sender)
{
  SideBar->ActiveGroup->Free();	
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::CheckBox3Click(TObject *Sender)
{
  if (CheckBox3->Checked)
    SideBar->ActiveGroup->IconType = dxsgLargeIcon;
  else SideBar->ActiveGroup->IconType = dxsgSmallIcon;
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::FormCreate(TObject *Sender)
{
  TTreeNode * Node, * Node1;
  AnsiString St;
  TdxStoredSideItem * Item;

  for (int i = 0; i  < SideBarStore->Categories->Count; i ++)
  {
    St = SideBarStore->Categories->Strings[i];
    Node = TreeView->Items->Add(NULL, St);
    Node->ImageIndex = -1;
    Node->SelectedIndex = -1;
    for (int j = 0; j < SideBarStore->GetCountByCategory(St); j ++)
    {
      Item = SideBarStore->GetItemByCategory(St, j);
      Node1 = TreeView->Items->AddChild(Node, Item->Caption);
      Node1->Data = Item;
      Node1->ImageIndex = Item->SmallImage;
      Node1->SelectedIndex = Node1->ImageIndex;
    }
  }

  dmCommonData->AboutFormClass = __classid(TESBarDemoAboutForm);
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::TreeViewStartDrag(TObject *Sender,
	TDragObject *&DragObject)
{
  if ((TreeView->Selected != NULL) && (TreeView->Selected->Data != NULL))
    dxSideBarDragObject = new TdxSideBarDragObject(SideBar, DragObject, NULL,
      (TdxStoredSideItem*)TreeView->Selected->Data);
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::actExitExecute(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------
void __fastcall TESBarDemoMainForm::rgSBPaintingStylesClick(
      TObject *Sender)
{
  SideBar->PaintStyle = (TdxsbPaintStyle)((TRadioGroup*)Sender)->ItemIndex;
}
//---------------------------------------------------------------------------
