//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Unit1.h"
#include "shellapi.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxCntner"
#pragma link "dxDBCtrl"
#pragma link "dxDBGrid"
#pragma link "dxDBTLCl"
#pragma link "dxGrClms"
#pragma link "dxPgsDlg"
#pragma link "dxPSCore"
#pragma link "dxPSdxDBCtrlLnk"
#pragma link "dxPSdxDBGrLnk"
#pragma link "dxPSdxTLLnk"
#pragma link "dxPSEngn"
#pragma link "dxTL"
#pragma resource "*.dfm"
TfrmMain *frmMain;

//---------------------------------------------------------------------------
void __fastcall TfrmMain::InvertMICheck(TMenuItem* Item)
{
  Item->Checked = !Item->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::BuildStylesMenu(void)
{
  int I;
  TMenuItem* NewItem;

  while (miStyles->Count > StylesMenuItemsCount)
    miStyles->Items[0]->Free();
  for (I = dxPrintStyleManager1->Count - 1; I >= 0; I--)
  {
    NewItem = new TMenuItem(this);
    NewItem->Caption = dxPrintStyleManager1->Styles[I]->StyleCaption;
    NewItem->Tag = Integer(dxPrintStyleManager1->Styles[I]);
    NewItem->RadioItem = true;
    NewItem->Checked = dxPrintStyleManager1->Styles[I]->IsCurrentStyle;
    NewItem->OnClick = StyleItemClick;
    miStyles->Insert(0, NewItem);
  }
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::StyleItemClick(TObject* Sender)
{
  TMenuItem* Item = (TMenuItem *)Sender;
  Item->Checked = true;
  ((TdxPSPrintStyle *)Item->Tag)->IsCurrentStyle = true;
}
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
    : TForm(Owner)
{
  // Engine
  miFlat->Checked = (bool)dxPSEngineController1->LookAndFeel;
  miSaveFrmPos->Checked = dxPSEngineController1->SaveFormsPosition;
  // Styles
  if (dxPrintStyleManager1->StorageName == "")
    dxPrintStyleManager1->AutoSave = false;
  miAutoSave->Checked = dxPrintStyleManager1->AutoSave;
  StylesMenuItemsCount = miStyles->Count;
  BuildStylesMenu();
  miSimpleDialog->Checked = (dxPrintStyleManager1->PageSetupDialog != NULL);
  if (dxPrintStyleManager1->Count > 0)
    dxPrintStyleManager1->CurrentStyleIndex = 0;
}
//---------------------------------------------------------------------------
void __fastcall TfrmMain::miReportDesignerClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true, NULL, NULL);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miExitClick(TObject *Sender)
{
  Close();    
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miShowClick(TObject *Sender)
{
  bool SaveAllowChangeScale;

  SaveAllowChangeScale = dxPrintStyleManager1->CurrentStyle->AllowChangeScale;
  dxPrintStyleManager1->CurrentStyle->AllowChangeScale = !miSimpleDialog->Checked;
  dxComponentPrinter1->PageSetup(NULL);
  dxPrintStyleManager1->CurrentStyle->AllowChangeScale = SaveAllowChangeScale;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miDefineStylesClick(TObject *Sender)
{
  dxPrintStyleManager1->DefinePrintStylesDlg(NULL, NULL);    
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::dxPrintStyleManager1ChangeCurrentStyle(
      TObject *Sender)
{
  miStyles->Items[dxPrintStyleManager1->CurrentStyleIndex]->Checked = true;    
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::dxPrintStyleManager1StyleListChanged(
      TObject *Sender)
{
  BuildStylesMenu();    
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miSimpleDialogClick(TObject *Sender)
{
  InvertMICheck((TMenuItem *)Sender);
  if (((TMenuItem *)Sender)->Checked)
    dxPrintStyleManager1->PageSetupDialog = dxPageSetupDialog1;
  else
    dxPrintStyleManager1->PageSetupDialog = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miAutoSaveClick(TObject *Sender)
{
  TMenuItem* Item = (TMenuItem *)Sender;

  if (!Item->Checked)
    Item->Checked = SaveStyles(false);
  else
    Item->Checked = false;
  dxPrintStyleManager1->AutoSave = Item->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miLoadClick(TObject *Sender)
{
  OpenDialog1->FileName = dxPrintStyleManager1->StorageName;
  if (OpenDialog1->Execute())
  {
    dxPrintStyleManager1->StorageName = OpenDialog1->FileName;
    dxPrintStyleManager1->LoadFromFile(dxPrintStyleManager1->StorageName);
  }
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miSaveClick(TObject *Sender)
{
  SaveStyles(false);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miSaveAsClick(TObject *Sender)
{
  SaveStyles(true);
}
//---------------------------------------------------------------------------

bool __fastcall TfrmMain::SaveStyles(bool ShowDialog)
{
  bool Result = true;
  SaveDialog1->FileName = dxPrintStyleManager1->StorageName;
  if ((dxPrintStyleManager1->StorageName == "") || ShowDialog)
    Result = SaveDialog1->Execute();
  if (Result)
  {
    dxPrintStyleManager1->StorageName = SaveDialog1->FileName;
    dxPrintStyleManager1->SaveToFile(dxPrintStyleManager1->StorageName);
  }
  return Result;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miWebClick(TObject *Sender)
{
  ShellExecute(0, NULL, "http://www.devexpress.com", NULL, NULL, SW_RESTORE);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miFlatClick(TObject *Sender)
{
  InvertMICheck((TMenuItem *)Sender);
  dxPSEngineController1->LookAndFeel = (TdxPSLookAndFeel)((TMenuItem *)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miSaveFrmPosClick(TObject *Sender)
{
  InvertMICheck((TMenuItem *)Sender);
  dxPSEngineController1->SaveFormsPosition = ((TMenuItem *)Sender)->Checked;
}
//---------------------------------------------------------------------------

