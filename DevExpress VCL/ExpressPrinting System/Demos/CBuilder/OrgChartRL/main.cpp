//---------------------------------------------------------------------------
#define STRICT
#include <vcl.h>
#pragma hdrstop

#include "main.h"
#include <stdlib.h>
#include <shellAPI.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxPSCore"
#pragma link "dxPSdxDBOCLnk"
#pragma link "dxPSdxOCLnk"
#pragma link "dxBkgnd"
#pragma link "dxPrnDev"
#pragma link "dxPrnPg"
#pragma link "dxPSCompsProvider"
#pragma link "dxPSEdgePatterns"
#pragma link "dxPSEngn"
#pragma link "dxPSFillPatterns"
#pragma link "dxPSGlbl"
#pragma link "dxPSGraphicLnk"
#pragma link "dxPSUtl"
#pragma link "dxWrap"
#pragma resource "*.dfm"
#pragma link "dxorgchr"
#pragma link "dxdborgc"
TMainForm *MainForm;
//---------------------------------------------------------------------------
__fastcall TMainForm::TMainForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::tbDXClick(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com", NULL, NULL, SW_SHOWMAXIMIZED);
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

void __fastcall TMainForm::PageControl1Change(TObject *Sender)
{
  dxComponentPrinter1->CurrentLink = dxComponentPrinter1->ReportLink[PageControl1->ActivePage->PageIndex];
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::FormCreate(TObject *Sender)
{
  OCTable->DatabaseName = ExtractFilePath(Application->ExeName);
  if (!OCTable->Active) OCTable->Open();

  dxOrgChart->FullExpand();
  dxDBOrgChart->FullExpand();
  PageControl1Change(PageControl1);
}
//---------------------------------------------------------------------------

void __fastcall TMainForm::dxDBOrgChartCreateNode(TObject *Sender,
      TdxOcNode *Node)
{
    if (OCTable->FindField("width")->AsInteger > 50)
      Node->Width = OCTable->FindField("width")->AsInteger;
    if (OCTable->FindField("height")->AsInteger > 50)
      Node->Height = OCTable->FindField("height")->AsInteger;
    Node->Shape = GetShape(OCTable->FindField("type")->AsString);
    Node->Color = (TColor)OCTable->FindField("color")->AsInteger;
}
//---------------------------------------------------------------------------
TdxOcShape __fastcall TMainForm::GetShape(AnsiString ShapeName)
{
  const AnsiString ShapeArray[] = {"Rectangle", "Round Rect", "Ellipse", "Diamond"};
  for (int i = 0; i<4; i++)
    if (AnsiUpperCase(ShapeArray[i]) == AnsiUpperCase(ShapeName))
      return TdxOcShape(i);
};




