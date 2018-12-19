//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SummariesDemoEditSummary.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxImageComboBox"
#pragma link "cxListBox"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxTextEdit"
#pragma link "cxDBTL"
#pragma resource "*.dfm"
TSummariesDemoEditSummaryForm *SummariesDemoEditSummaryForm;
//---------------------------------------------------------------------------
__fastcall TSummariesDemoEditSummaryForm::TSummariesDemoEditSummaryForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::cbCalculatedFieldPropertiesChange(
  TObject *Sender)
{
  if (FLockColumnSummary) return;
  if (cbCalculatedField->ItemIndex != -1){
    TField *AField = (TField*)cbCalculatedField->Properties->Items->
        Objects[cbCalculatedField->ItemIndex];
    TcxDBTreeListColumn *AColumn = (TcxDBTreeListColumn*)lbColumns->Items->
      Objects[lbColumns->ItemIndex];
    AColumn->SummaryFooter->FieldName = AField->FieldName;
    UpdateSummaryKinds(skNone, AField);
    cbSummaryKindPropertiesChange(NULL);
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::lbColumnsClick(
  TObject *Sender)
{
  TcxDBTreeListColumn *AColumn =
    (TcxDBTreeListColumn*)lbColumns->Items->Objects[lbColumns->ItemIndex];
  UpdateCalcField(AColumn);
  TDataSet *ADataSet = FTreeList->DataController->DataSet;
  TField *AField = ADataSet->FindField(AColumn->SummaryFooter->FieldName);
  if (AField == NULL)
    AField = AColumn->DataBinding->Field;
  TcxSummaryKind AKind = AColumn->SummaryFooter->Kind;
  UpdateSummaryKinds(AKind, AField);
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::cbSummaryKindPropertiesChange(
  TObject *Sender)
{
  if (FLockColumnSummary) return;
  if (cbSummaryKind->ItemIndex != -1 && lbColumns->ItemIndex != -1){
    TcxDBTreeListColumn *AColumn = (TcxDBTreeListColumn*)lbColumns->Items->
      Objects[lbColumns->ItemIndex];
    AColumn->SummaryFooter->Kind = (TcxSummaryKind)(int)cbSummaryKind->EditValue;
    AColumn->Options->Footer = (TcxSummaryKind)(int)cbSummaryKind->EditValue != skNone;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::FormClose(
  TObject *Sender, TCloseAction &Action)
{
  Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::FormDestroy(TObject *Sender)
{
  SummariesDemoEditSummaryForm = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::btnExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::PopulateVisibleColumnsList()
{
  lbColumns->Items->Clear();
  for (int I = 0; I < FTreeList->VisibleColumnCount; I++){
    lbColumns->Items->AddObject(FTreeList->VisibleColumns[I]->Caption->Text,
      FTreeList->VisibleColumns[I]);
  }
  if (lbColumns->Count > 0)
    lbColumns->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::PopulateFieldList(
  TDataSet *ADataSet)
{
  ADataSet->GetFieldNames(cbCalculatedField->Properties->Items);
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::UpdateCalcField(
  TcxDBTreeListColumn *AColumn)
{
  String AFieldName;
  if (AColumn->SummaryFooter->FieldName != "")
    AFieldName = AColumn->SummaryFooter->FieldName;
  else
    AFieldName = AColumn->DataBinding->FieldName;
  FLockColumnSummary = true;
  __try{
    int AIndex = cbCalculatedField->Properties->Items->IndexOf(AFieldName);
    cbCalculatedField->ItemIndex = AIndex;
  }
  __finally{
    FLockColumnSummary = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::UpdateSummaryKinds(
  TcxSummaryKind AKind, TField *AField)
{
  TcxFieldTypes NumberFieldTypes;
  NumberFieldTypes = NumberFieldTypes<<ftSmallint<<ftInteger<<ftWord<<ftFloat<<
    ftCurrency<<ftBCD<<ftDate<<ftTime<<ftDateTime<<ftAutoInc;
  TcxFieldTypes TimeFieldTypes;
  TimeFieldTypes = TimeFieldTypes<<ftDate<<ftTime<<ftDateTime;
  FLockColumnSummary = true;
  __try{
    cbSummaryKind->Properties->Items->Clear();
    if (AField != NULL){
      AddSummaryKind(skNone);
      AddSummaryKind(skCount);
      if (NumberFieldTypes.Contains(AField->DataType)){
        AddSummaryKind(skMax);
        AddSummaryKind(skMin);
        if (!TimeFieldTypes.Contains(AField->DataType)){
          AddSummaryKind(skSum);
          AddSummaryKind(skAverage);
        }
      }
    }
    cbSummaryKind->EditValue = AKind;
  }
  __finally{
    FLockColumnSummary = false;
  }
}

void __fastcall TSummariesDemoEditSummaryForm::AddSummaryKind(TcxSummaryKind AKind)
{
/*  const int ImgIndNone = -1;
  const int ImgIndCNT = 4;
  const int ImgIndMAX = 5;
  const int ImgIndMIN = 6;
  const int ImgIndSUM = 7;
  const int ImgIndAVG = 8;*/
  TcxImageComboBoxItem *AItem =
    (TcxImageComboBoxItem*)cbSummaryKind->Properties->Items->Add();
  switch (AKind){
    case skNone:
      SetItemProperties(AItem, "None", -1, 0); break;
    case skSum:
      SetItemProperties(AItem, "Sum", 7, 1); break;
    case skMin:
      SetItemProperties(AItem, "Min", 6, 2); break;
    case skMax:
      SetItemProperties(AItem, "Max", 5, 3); break;
    case skCount:
      SetItemProperties(AItem, "Count", 4, 4); break;
    case skAverage:
      SetItemProperties(AItem, "Average", 8, 5);
  }
}

void __fastcall TSummariesDemoEditSummaryForm::SetItemProperties(
  TcxImageComboBoxItem *AItem, String ADescription, int AImageIndex,  int AValue)
{
  AItem->Description = ADescription;
  AItem->ImageIndex = AImageIndex;
  AItem->Value = AValue;
}

//---------------------------------------------------------------------------

void __fastcall TSummariesDemoEditSummaryForm::SetTreeList(TcxDBTreeList *Value)
{
  FTreeList = Value;
  PopulateFieldList(FTreeList->DataController->DataSet);
  PopulateVisibleColumnsList();
  lbColumnsClick(lbColumns);
}
//---------------------------------------------------------------------------

