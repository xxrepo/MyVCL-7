//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "EQGrid6RLMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxEditRepositoryItems"
#pragma link "dxPSCore"
#pragma link "dxPScxGrid6Lnk"
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
#pragma link "cxGridCustomView"
#pragma link "cxDataStorage"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxDrawTextUtils"
#pragma link "DemoBasicMain"
#pragma link "dxPScxEditorProducers"
#pragma link "dxPScxExtEditorProducers"
#pragma link "dxPScxPageControlProducer"
#pragma link "dxPSPDFExport"
#pragma link "dxPSPDFExportCore"
#pragma link "dxPSPrVwStd"
#pragma link "dxPScxCommon"
#pragma resource "*.dfm"
TEQGrid6RLMainForm *EQGrid6RLMainForm;
//---------------------------------------------------------------------------
__fastcall TEQGrid6RLMainForm::TEQGrid6RLMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actLookAndFeelKindUltraFlatExecute(TObject *Sender)
{
  if(cxGrid->LookAndFeel->Kind != lfUltraFlat){
    cxGrid->LookAndFeel->Kind = lfUltraFlat;
    ((TMenuItem*)Sender)->Checked = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actLookAndFeelKindFlatExecute(TObject *Sender)
{
  if(cxGrid->LookAndFeel->Kind != lfFlat){
    cxGrid->LookAndFeel->Kind = lfFlat;
    ((TMenuItem*)Sender)->Checked = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actLookAndFeelKindStandardExecute(TObject *Sender)
{
  if(cxGrid->LookAndFeel->Kind != lfStandard){
    cxGrid->LookAndFeel->Kind = lfStandard;
    ((TMenuItem*)Sender)->Checked = true;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::miNativeStyleClick(TObject *Sender)
{
  cxGrid->LookAndFeel->NativeStyle = !cxGrid->LookAndFeel->NativeStyle;
  ((TCustomAction*)Sender)->Checked = !((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------



void __fastcall TEQGrid6RLMainForm::actShowDemoDescriptionExecute(
      TObject *Sender)
{
  lbDescrip->Visible = !lbDescrip->Visible;
  ((TCustomAction*)Sender)->Checked = !((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actGridNativeStyleExecute(
      TObject *Sender)
{
  cxGrid->LookAndFeel->NativeStyle = !cxGrid->LookAndFeel->NativeStyle;
  ((TCustomAction*)Sender)->Checked = !((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actDownloadsExecute(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com/downloads/index.asp", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actForumExecute(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://24.234.251.34/dxforum/dxforumisapi.dll/", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actDXOnTheWebExecute(
      TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com/index.shtm", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actProductsExecute(TObject *Sender)
{
  ShellExecute(Handle, "OPEN", "http://www.devexpress.com/products/index.asp", NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::AlwaysEnabled(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actExitExecute(TObject *Sender)
{
  Close();  
}
//---------------------------------------------------------------------------


void __fastcall TEQGrid6RLMainForm::CustomizeColumns()
{
  const cDistance = 3;
  const cPeriod = 4;
  const cRadius = 7;
  DecimalSeparator = '.';
  for(int i=0; i < tvPlanets->ColumnCount; i++)
    if((i == cDistance) || (i == cRadius))
      tvPlanets->Columns[i]->DataBinding->ValueTypeClass = __classid(TcxIntegerValueType);
    else
      if (i == cPeriod)
        tvPlanets->Columns[i]->DataBinding->ValueTypeClass = __classid(TcxFloatValueType);
      else
        tvPlanets->Columns[i]->DataBinding->ValueTypeClass = __classid(TcxStringValueType);
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::InitRecord(String const Str, int AInt, TStringList* AValues)
{
  Variant V;
  AValues->CommaText = Str;
  for(int i=0; i < AValues->Count; i++)
   if (AValues->Strings[i] != "-") {
     V = AValues->Strings[i];
      if (!VarIsNull(V)) {
        if (tvPlanets->Columns[i]->DataBinding->ValueTypeClass == __classid(TcxFloatValueType))
          V = VarAsType(StrToFloat(V), varDouble);
        tvPlanets->DataController->Values[AInt][i] = V;
      }
   }
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::LoadData()
{
  const String AFileName = "nineplanets.txt";
  const int AHeaderLineCount = 2;

  if (!FileExists(AFileName))
    throw Exception("Data file not found");

  TStringList* ARecords = new TStringList();
  TStringList* AValues = new TStringList();
  try {
    ARecords->LoadFromFile(AFileName);
    tvPlanets->BeginUpdate();
    tvPlanets->DataController->RecordCount = ARecords->Count - AHeaderLineCount;
    for (int i=0; i < ARecords->Count - (AHeaderLineCount + 1) + 1; i++)
      InitRecord(ARecords->Strings[i + AHeaderLineCount], i, AValues);
  }
  __finally {
    tvPlanets->EndUpdate();
    delete ARecords;
    delete AValues;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::FormCreate(TObject *Sender)
{
  TDemoBasicMainForm::FormCreate(Sender);
  CustomizeColumns();
  LoadData();
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::FormShow(TObject *Sender)
{
  tvPlanets->DataController->Groups->FullExpand();
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actFullExpandExecute(TObject *Sender)
{
  tvPlanets->DataController->Groups->FullExpand();
}
//---------------------------------------------------------------------------

void __fastcall TEQGrid6RLMainForm::actFullCollapseExecute(TObject *Sender)
{
  tvPlanets->DataController->Groups->FullCollapse();
}
//---------------------------------------------------------------------------

 
