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
#pragma link "dxDBCtrl"
#pragma link "dxDBTL"
#pragma link "dxDBTLCl"
#pragma link "dxPSCore"
#pragma link "dxPSdxDBCtrlLnk"
#pragma link "dxPSdxDBTLLnk"
#pragma link "dxPSdxTLLnk"
#pragma link "dxTL"
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
  Table->DatabaseName = ExtractFilePath(Application->ExeName) + "..\\..\\Data\\";
  Table->Active = true;
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

void __fastcall TMainForm::DBTreeListGetStateIndex(TObject *Sender,
      TdxTreeListNode *Node, int &Index)
{
  if (Node->Expanded) Index = 1;
  else Index = 0;
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbSelectedClick(TObject *Sender)
{
  dxComponentPrinter1Link1->OnlySelected = tbSelected->Down;
}
//---------------------------------------------------------------------------

