//---------------------------------------------------------------------------
#define STRICT
#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include "preview.h"
#include <stdlib.h>
#include <shellAPI.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxCntner"
#pragma link "dxDBCtrl"
#pragma link "dxDBGrid"
#pragma link "dxDBTLCl"
#pragma link "dxGrClms"
#pragma link "dxPSCore"
#pragma link "dxPSdxDBGrLnk"
#pragma link "dxPSdxTLLnk"
#pragma link "dxTL"
#pragma link "dxPSdxDBCtrlLnk"
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
  dxGrid->OnDragEndHeader = GrDragEnd;
  dxGrid->OnDragOverHeader = GrDragOver;
  try
  {
    tBiolife->Open();
    dxGrid->FullExpand();
  }
  __finally
  {
  }
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

void __fastcall TMainForm::dxGridColumnSorting(TObject *Sender,
      TdxDBTreeListColumn *Column, bool &Allow)
{
  if (Column == dxDBGridGraphicColumn1) Allow = false;
}
//---------------------------------------------------------------------------

void _fastcall TMainForm::dxDBGridGraphicColumn1CustomClick(
      TObject *Sender)
{
   if (previewForm == NULL)
     previewForm = new TpreviewForm(this);
   previewForm->DBImage->DataField = "";
   previewForm->DBImage->DataSource = dsBiolife;
   previewForm->DBImage->DataField = "Graphic";
   previewForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbSelectedClick(TObject *Sender)
{
  dxComponentPrinter1Link1->OnlySelected = tbSelected->Down;    
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::GrDragEnd(TObject *Sender,TdxTreeListColumn *AColumn,
          #if __BORLANDC__  > 0x530   // BCB version > 3
          const TPoint &P,
          #else
          tagPOINT &P,
          #endif
          TdxHeaderPosInfo &NewPosInfo, bool &Accept)
{
  if (NewPosInfo.BandIndex != -1)
    Accept = AColumn->BandIndex == dxGrid->Bands->GetAbsoluteIndex(NewPosInfo.BandIndex);
  else Accept = false;
}
//---------------------------------------------------------------------------
void __fastcall TMainForm::GrDragOver(TObject *Sender, TdxTreeListColumn *AColumn,
          #if __BORLANDC__  > 0x530   // BCB version > 3
          const TPoint &P,
          #else
          tagPOINT &P,
          #endif
          bool &Accept)
{
  TdxTreeListColumn *C = dxGrid->GetColumnAt(P.x, P.y);
  if (C != NULL)
    Accept = C->BandIndex == AColumn->BandIndex;
}
