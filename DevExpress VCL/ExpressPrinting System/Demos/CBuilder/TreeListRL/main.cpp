//---------------------------------------------------------------------------
#define STRICT
#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include <stdlib.h>
#include <shellAPI.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxCntner"
#pragma link "dxPSCore"
#pragma link "dxPSdxTLLnk"
#pragma link "dxTL"
#pragma link "dxTLClms"
#pragma resource "*.dfm"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::FormCreate(TObject *Sender)
{
    String DataFile;
    DataFile = ExtractFilePath(Application->ExeName)+"\\example.dat";
    if (FileExists(DataFile))
      dxTreeList->LoadFromFile(DataFile);
    dxTreeList->FullExpand();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbDXClick(TObject *Sender)
{
  ShellExecute(Handle, PChar("OPEN"), PChar("http://www.devexpress.com"), NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbSetupClick(TObject *Sender)
{
  dxComponentPrinter1->PageSetup(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true, NULL, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbDesignerClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxTreeListDragDrop(TObject *Sender,
      TObject *Source, int X, int Y)
{
  TdxTreeListNode *AItem, *AnItem;
  TdxTreeListNodeAttachMode AttachMode;
  TdxTreeListHitTest HT;

  if ( dxTreeList->SelectedCount == 0 ) return;
  HT = dxTreeList->GetHitTestInfoAt(X, Y);
  AnItem = dxTreeList->GetNodeAt(X, Y);
  if ( (HT == htButton) || (HT == htIcon) || (HT == htStateIcon) || (HT == htLabel) ||
       (HT == Dxtl::htNowhere) || (HT == htIndent))
    {
      AttachMode = natlInsert;
      if ( (HT == htButton) || (HT == htIcon) || (HT == htStateIcon) || (HT == htLabel))
        AttachMode = natlAddChild;
      else
        if ( HT == Dxtl::htNowhere)
          {
            AnItem = dxTreeList->Items[0];
            AttachMode = natlAdd;
          }
        else
          if (HT == htIndent) AttachMode = natlInsert;
      while (dxTreeList->SelectedCount > 0)
        {
          AItem = dxTreeList->SelectedNodes[0];
          AItem->Selected = false;
          AItem->MoveTo(AnItem, AttachMode);
        };
    };
  RefreshSort(dxTreeList);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxTreeListCompare(TObject *Sender,
      TdxTreeListNode *Node1, TdxTreeListNode *Node2, int &Compare)
{
    int i = 0;
    while( i < ((TdxTreeList*)Sender)->ColumnCount){
      if (((TdxTreeList*)Sender)->Columns[i]->Sorted != csNone)  break;
      i++;
    }

    if (i < ((TdxTreeList*)Sender)->ColumnCount)
      {
        if (((TdxTreeList*)Sender)->Columns[i]->Caption == "Budget")
          try
           {
            Compare = (int)(StrToFloat(Node1->Values[i]) - StrToFloat(Node2->Values[i]));
           }
          catch (...)
           {
            Compare = 0;
           }
        else Compare = CompareStr(Node1->Values[i], Node2->Values[i]);
      }
    else
      Compare = 0;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::RefreshSort(TdxTreeList *Sender)
{
  TdxTreeListColumnSort PrevSort;
  int  i;

  i = 0;
  while (i < Sender->ColumnCount) {
    if (Sender->Columns[i]->Sorted != csNone) break;
    i++;
  };

  if (i < Sender->ColumnCount) {
    PrevSort = Sender->Columns[i]->Sorted;
    if (Sender->Columns[i]->Sorted == csUp)
      Sender->Columns[i]->Sorted = csDown;
    else
      Sender->Columns[i]->Sorted = csUp;
    Sender->Columns[i]->Sorted = PrevSort;
  };
};
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxTreeListEdited(TObject *Sender,
      TdxTreeListNode *Node)
{
  RefreshSort(dxTreeList);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxTreeListGetSelectedIndex(TObject *Sender,
      TdxTreeListNode *Node, int &Index)
{
  Index = Node->ImageIndex;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxTreeListDragOver(TObject *Sender,
      TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
  if ( Source == dxTreeList) Accept = true;
  else Accept = false;
}
//---------------------------------------------------------------------------


void __fastcall TMainForm::tbSelectedClick(TObject *Sender)
{
  dxComponentPrinter1Link1->OnlySelected = tbSelected->Down;    
}
//---------------------------------------------------------------------------

