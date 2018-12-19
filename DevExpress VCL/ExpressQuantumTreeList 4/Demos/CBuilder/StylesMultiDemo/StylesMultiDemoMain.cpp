//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "StylesMultiDemoMain.h"
#include "StylesMultiDemoData.h"
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
#pragma link "cxButtons"
#pragma link "cxCalc"
#pragma link "cxCheckBox"
#pragma link "cxDBLookupComboBox"
#pragma link "cxDBTL"
#pragma link "cxInplaceContainer"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxMemo"
#pragma link "cxRadioGroup"
#pragma link "cxTextEdit"
#pragma link "cxTL"
#pragma link "cxTLData"
#pragma link "cxStyleSheetEditor"
#pragma link "cxTLStyleSheetPreview"
#pragma resource "*.dfm"
TStylesMultiDemoMainForm *StylesMultiDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TStylesMultiDemoMainForm::TStylesMultiDemoMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::FormShow(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code *

  ShowMessage("WARNING: tutorial not completed. First, please apply the steps "
    "shown in the doc file");

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::LookAndFeelChange(TObject *Sender)
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

void __fastcall TStylesMultiDemoMainForm::FormCreate(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  CreateStyleSheetsList(shtUserDefined);
  CreateStyleSheetsList(shtPredefined);
  SelectFistChild(shtPredefined);
  cxDBTreeList->FullExpand();

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::actSaveToFileExecute(TObject *Sender)
{
  if (SaveDialog->Execute())
    SaveUserDefinedStyleSheets(SaveDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::actLoadFromFileExecute(TObject *Sender)
{
  if (OpenDialog->Execute()){
    LoadUserDefinedStyleSheets(OpenDialog->FileName);
    SelectFistChild(shtUserDefined);
  }
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::actEditStyleSheetExecute(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  ShowcxStyleSheetEditor(GetCurrentStyleSheet(), NULL);

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::FormActivate(TObject *Sender)
{
  OpenDialog->InitialDir = ExtractFileDir(Application->ExeName);
  SaveDialog->InitialDir = OpenDialog->InitialDir;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::tlStyleSheetsIsGroupNode(
  TObject *Sender, TcxTreeListNode *ANode, bool &IsGroup)
{
  if (ANode->Level == 0 && ANode->Index != (int)shtNone)
   IsGroup = true;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::tlStyleSheetsStylesGetContentStyle(
  TObject *Sender, TObject *AItem, TcxTreeListNode *ANode, TcxStyle *&AStyle)
{
  if (ANode->Level == 0)
    AStyle = StylesMultiDemoDataDM->styGroupNode;
  else
    AStyle = StylesMultiDemoDataDM->styOptionalNode;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::tlStyleSheetsStylesGetNodeIndentStyle(
  TObject *Sender, TcxTreeListNode *ANode, int ALevel, TcxStyle *&AStyle)
{
  AStyle = StylesMultiDemoDataDM->styGroupNode;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::tlStyleSheetsSelectionChanged(
  TObject *Sender)
{
  if (tlStyleSheets->SelectionCount > 0){
    TcxTreeListNode *ANode = tlStyleSheets->Selections[0];
    if (!ANode->IsGroupNode){
      SetCheckedNode(ANode);
      UpdateGridStyleSheets((TcxTreeListStyleSheet*)ANode->Data);
      ANode->Values[clnRadio->ItemIndex] = true;
      ChangeVisibility((TcxStyleRepositoryType)ANode->Parent->Index);
    }
    tlStyleSheets->Update();
  }
}

void __fastcall TStylesMultiDemoMainForm::SetCheckedNode(TcxTreeListNode *ANode)
{
    if (ANode != NULL)
      ANode->Values[0] = 1;
    for (int I = 0; I < tlStyleSheets->Nodes->Count; I++)
      if (tlStyleSheets->Nodes->Items[I] != ANode)
        tlStyleSheets->Nodes->Items[I]->Values[clnRadio->ItemIndex] = false;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::cxDBTreeListInitInsertingRecord(
  TObject *Sender, TcxTreeListDataNode *AFocusedNode, bool &AHandled)
{
  if (AFocusedNode != NULL)
    StylesMultiDemoDataDM->SetParentValue(AFocusedNode->ParentValue);
}
//---------------------------------------------------------------------------

TcxTreeListStyleSheet* __fastcall TStylesMultiDemoMainForm::GetCurrentStyleSheet()
{
  return (TcxTreeListStyleSheet*)cxDBTreeList->Styles->StyleSheet;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::CreateStyleSheetsList(
  TcxStyleRepositoryType AStyleRepositoryType)
{
  if (AStyleRepositoryType == shtNone)
    return;
  TcxStyleRepository *AStyleRepository;
  if (AStyleRepositoryType == shtUserDefined)
    AStyleRepository = StylesMultiDemoDataDM->strepUserDefined;
  else
    AStyleRepository = StylesMultiDemoDataDM->strepPredefined;
  TcxTreeListNode *ANode = tlStyleSheets->Nodes->Root->Items[(int)AStyleRepositoryType];
  ANode->DeleteChildren();
  TcxTreeListNode *AStyleNode;
  for (int I = 0; I < AStyleRepository->StyleSheetCount; I++){
    AStyleNode = ANode->AddChild();
    AStyleNode->Values[clnGroupName->ItemIndex] =
      AStyleRepository->StyleSheets[I]->Caption;
    AStyleNode->Data = AStyleRepository->StyleSheets[I];
  }
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::UpdateGridStyleSheets(
  TcxTreeListStyleSheet *AStyleSheet)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  if (GetCurrentStyleSheet() == AStyleSheet) return;
  cxDBTreeList->Styles->StyleSheet = AStyleSheet;
  if (AStyleSheet != NULL)
    pnlCurrentStyleSheet->Caption = AStyleSheet->Caption;
  else
    pnlCurrentStyleSheet->Caption = "None";
  cxDBTreeList->Update();

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::ChangeVisibility(
  TcxStyleRepositoryType AType)
{
  btnEdit->Enabled = AType == shtUserDefined;
  btnSave->Enabled = AType == shtUserDefined;
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::ClearUserDefinedStyleSheets()
{
  StylesMultiDemoDataDM->strepUserDefined->Clear();
  StylesMultiDemoDataDM->strepUserDefined->ClearStyleSheets();
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::LoadUserDefinedStyleSheets(
  TFileName AFileName)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  UpdateGridStyleSheets(NULL);
  ClearUserDefinedStyleSheets();

  LoadStyleSheetsFromIniFile(AFileName, StylesMultiDemoDataDM->strepUserDefined,
    __classid(TcxTreeListStyleSheet), NULL, NULL, NULL, NULL);

  CreateStyleSheetsList(shtUserDefined);

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::SaveUserDefinedStyleSheets(
  TFileName AFileName)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  TList *AList = new TList();
  __try{
    PopulateStyleSheetsList(AList);
    SaveStyleSheetsToIniFile(AFileName, AList);
  }
  __finally{
    delete AList;
  }

//*/
}
//---------------------------------------------------------------------------

void __fastcall TStylesMultiDemoMainForm::SelectFistChild(
  TcxStyleRepositoryType AStyleRepositoryType)
{
  TcxTreeListNode *ANode =
    tlStyleSheets->Nodes->Root->Items[(int)AStyleRepositoryType];
  if (ANode->Count > 0){
    ANode->Items[0]->Focused = true;
    ANode->Items[0]->MakeVisible();
  }
}
//---------------------------------------------------------------------------


void __fastcall TStylesMultiDemoMainForm::cxDBTreeListDragOver(
      TObject *Sender, TObject *Source, int X, int Y, TDragState State,
      bool &Accept)
{
//        
}
//---------------------------------------------------------------------------

