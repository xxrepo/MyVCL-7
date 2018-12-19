//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "main.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxdbtree"
#pragma link "dxPSCore"
#pragma link "dxPSdxDBTVLnk"
#pragma link "dxPSTVLnk"
#pragma link "dxtree"
#pragma link "dxBkgnd"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSEngn"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"
TForm1 *Form1;
//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miPageSetupClick(TObject *Sender)
{
  dxComponentPrinter1->PageSetup(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miPrintPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true,NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true,NULL,NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miDesignerClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::miDXClick(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DBTreeView1Collapsed(TObject *Sender,
      TTreeNode *Node)
{
  Node->ImageIndex = 0;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::DBTreeView1Expanded(TObject *Sender,
      TTreeNode *Node)
{
  Node->ImageIndex = 1;
}
//---------------------------------------------------------------------------

void __fastcall TForm1::DBTreeView1GetSelectedIndex(TObject *Sender,
      TTreeNode *Node)
{
  Node->SelectedIndex = Node->ImageIndex;
}
//---------------------------------------------------------------------------


void __fastcall TForm1::FormCreate(TObject *Sender)
{
  Table->DatabaseName = ExtractFilePath(Application->ExeName) + "..\\..\\Data\\";
  Table->Active = true;
}
//---------------------------------------------------------------------------

