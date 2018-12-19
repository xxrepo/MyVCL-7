//---------------------------------------------------------------------------

#include <vcl.h>
#include "..\cxDemosBCB.inc"
#pragma hdrstop

#include "SummariesDemoMain.h"
#include "SummariesDemoData.h"
#include "SummariesDemoEditSummary.h"
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
#pragma link "cxStyles"
#pragma link "cxLookAndFeels"
#pragma link "DemoBasicMain"
#pragma link "cxCalc"
#pragma link "cxDBEditRepository"
#pragma link "cxDBLookupComboBox"
#pragma link "cxDBTL"
#pragma link "cxEditRepositoryItems"
#pragma link "cxImageComboBox"
#pragma link "cxInplaceContainer"
#pragma link "cxMaskEdit"
#pragma link "cxSpinEdit"
#pragma link "cxTimeEdit"
#pragma link "cxTL"
#pragma link "cxTLData"
#pragma link "cxCalendar"
#pragma resource "*.dfm"
TSummariesDemoMainForm *SummariesDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TSummariesDemoMainForm::TSummariesDemoMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::FormShow(TObject *Sender)
{
  FCalcForVisaOnly = false;
  FCalcSelectedOnly = false;
  miCustomizeSummariesClick(NULL);
/* remove/add the closing slash on this line to disable/enable the following code *

  ShowMessage("WARNING: tutorial not completed. First, please apply the steps "
    "shown in the doc file");

//*/
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::LookAndFeelChange(TObject *Sender)
{
  if (((TMenuItem*)Sender)->Tag > 3){
    cxLookAndFeelController->NativeStyle =
      !cxLookAndFeelController->NativeStyle;
    ((TMenuItem*)Sender)->Checked = cxLookAndFeelController->NativeStyle;
  }
  else{
    ((TMenuItem*)Sender)->Checked = true;
    cxLookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->Tag;
    cxLookAndFeelController->NativeStyle = false;
    miNativeStyle->Checked = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::miCustomizeSummariesClick(TObject *Sender)
{
  if (SummariesDemoEditSummaryForm == NULL){
    SummariesDemoEditSummaryForm = new TSummariesDemoEditSummaryForm(Application);
    SummariesDemoEditSummaryForm->TreeList = tlOrders;
  }
  SummariesDemoEditSummaryForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::miIgnoreNullValuesClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  tlOrders->OptionsData->SummaryNullIgnore = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::miMultiselectClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  tlOrders->OptionsSelection->MultiSelect = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::miOnlyVisaPaymentTypeClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  tlOrders->DataController->Summary->BeginUpdate();
  __try{
    FCalcForVisaOnly = ((TMenuItem*)Sender)->Checked;
  }
  __finally{
    tlOrders->DataController->Summary->EndUpdate();
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::miSelectedRecordsOnlyClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  tlOrders->DataController->Summary->BeginUpdate();
  __try{
    miOnlyVisaPaymentType->Enabled = !((TMenuItem*)Sender)->Checked;
    miIgnoreNullValues->Enabled = !((TMenuItem*)Sender)->Checked;
    FCalcForVisaOnly = miOnlyVisaPaymentType->Enabled &&
    miOnlyVisaPaymentType->Checked;
    FCalcSelectedOnly = ((TMenuItem*)Sender)->Checked;
  }
  __finally{
    tlOrders->DataController->Summary->EndUpdate();
  }
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::tlOrdersAfterSummary(
      TcxDataSummary *ASender)
{
const String ACalculatedTableName = "Orders";
#if BCB6
  const String ABackSeparator = "'";
  const String AFrontSeparator =  "'";
#else
  const String ABackSeparator = "'";
  const String AFrontSeparator = "'";
#endif

/* remove/add the closing slash on this line to disable/enable the following code */

  if (!FCalcSelectedOnly) return;
  String AKeyFieldName = tlOrders->DataController->KeyField;
  TcxDataFooterSummaryItems *ASummaryItems = ASender->FooterSummaryItems;
  String ASQL = "Select ";
  TcxDBDataSummaryItem *ASummaryItem;
  String AFieldName;
  for (int I = 0; I < ASummaryItems->Count; I++){
    ASummaryItem = (TcxDBDataSummaryItem*)ASummaryItems->Items[I];
    AFieldName = ASummaryItem->FieldName;
    if (AFieldName == "")
      AFieldName =
        ((TcxDBTreeListColumn*)ASummaryItem->ItemLink)->DataBinding->FieldName;
    AFieldName = ABackSeparator + ACalculatedTableName + AFrontSeparator +
       "."+ ABackSeparator + AFieldName + AFrontSeparator;
    ASQL += SummaryKindToStr(ASummaryItem->Kind) + "(" + AFieldName + "), ";
  }
  ASQL.Delete(ASQL.Length() - 1, 2);
  ASQL += " From " + ACalculatedTableName;
  SummariesDemoDataDM->qryOrdersSummary->Close();
  SummariesDemoDataDM->qryOrdersSummary->SQL->Clear();
  SummariesDemoDataDM->qryOrdersSummary->SQL->Add(ASQL);
  if (tlOrders->SelectionCount > 0){
    SummariesDemoDataDM->qryOrdersSummary->SQL->Add("where " + AKeyFieldName + " in ");
    SummariesDemoDataDM->qryOrdersSummary->SQL->Add(GetSQLCondition());
  }
  SummariesDemoDataDM->qryOrdersSummary->Open();
  for (int I = 0; I < ASummaryItems->Count; I++)
    ASender->FooterSummaryValues[I] =
      SummariesDemoDataDM->qryOrdersSummary->Fields->Fields[I]->Value;
  SummariesDemoDataDM->qryOrdersSummary->Close();

//*/
}

String TSummariesDemoMainForm::SummaryKindToStr(TcxSummaryKind AKind)
{
  String Result;
  switch (AKind){
    case skSum:
      Result = "SUM"; break;
    case skMin:
      Result = "MIN"; break;
    case skMax:
      Result = "MAX"; break;
    case skCount:
      Result = "Count"; break;
    case skAverage:
      Result = "AVG"; break;
    default:
      Result = "";
  }
  return Result;
}

String TSummariesDemoMainForm::GetSQLCondition()
{
    String Result = " (";
    for (int I = 0; I < tlOrders->SelectionCount; I++){
      Result += VarToStr(((TcxTreeListDataNode*)tlOrders->Selections[I])->KeyValue) + ", ";
    }
    Result.Delete(Result.Length() - 1, 2);
    Result += ")";
    return Result;
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::tlOrdersSummary(
      TcxDataSummaryItems *ASender, TcxSummaryEventArguments &Arguments,
      TcxSummaryEventOutArguments &OutArguments)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  if (!FCalcForVisaOnly) return;
  if (VarToStr(ASender->DataController->Values[Arguments.RecordIndex][tlOrdersPaymentType->ItemIndex]) != "Visa")
    OutArguments.Done = true;

//*/
}
//---------------------------------------------------------------------------

void __fastcall TSummariesDemoMainForm::tlOrdersSelectionChanged(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  tlOrders->DataController->Summary->Calculate();

//*/
}
//---------------------------------------------------------------------------


