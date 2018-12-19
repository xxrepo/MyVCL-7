//---------------------------------------------------------------------------

#include <vcl.h>
#include <shellapi.hpp>
#pragma hdrstop

#include "EditorsStylesDemoMain.h"
#include "EditorsStylesDemoUtils.h"
#include "AboutDemoForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxFontNameComboBox"
#pragma link "cxGroupBox"
#pragma link "cxHint"
#pragma link "cxLookAndFeels"
#pragma link "cxMaskEdit"
#pragma link "cxMemo"
#pragma link "cxSpinEdit"
#pragma link "cxSplitter"
#pragma link "cxTextEdit"
#pragma link "cxTreeView"
#pragma link "cxPC"
#pragma resource "*.dfm"
TEditorsStylesDemoDemoMainForm *EditorsStylesDemoDemoMainForm;
TEditorsStylesDemoBaseFrame* ActiveFrame;
//---------------------------------------------------------------------------
__fastcall TEditorsStylesDemoDemoMainForm::TEditorsStylesDemoDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEditorsStylesDemoDemoMainForm::FormCreate(TObject *Sender)
{
  RegisterFrames();
  AdjustDescriptionsPageControl();
  FillTreeViewItems();
  cxTreeView->Items->GetFirstNode()->Expand(true);
  cxTreeView->Items->GetFirstNode()->Selected = true;
  cxTreeViewChange(Sender, cxTreeView->Items->GetFirstNode());
  FDefaultHintStyle = false;
  FDefaultDisplayStyle = false;
  FCurrentDisplayStyle = shtLightBlue;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::RegisterFrames()
{
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(TextProcessingFrameID));
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(ImageProcessingFrameID));
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(SolarSystemFrameID));
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(NoteBookFrameID));
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(IssuesFrameID ));
  EditorsStylesDemoFrameManager()->AddFrame(CreateFrameByID(StylesPaletteFrameID));
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AddChildNodes(TcxExtEditorTypes AExtEditorTypes, TStrings* AStrings, TTreeNode* ANode)
{
  cxGetEditorsNamesListByTypes(AStrings, AExtEditorTypes);
  for (int i=0; i < AStrings->Count; i++)
    cxTreeView->Items->AddChild(ANode, AStrings->Strings[i]);
  ANode->AlphaSort();  
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AdjustDescriptionsPageControl()
{
  for (int I = 0; I < EditorsStylesDemoFrameManager()->FramesCount; I++){
    TcxTabSheet *APage = new TcxTabSheet(PageControl);
    APage->PageControl = PageControl;
    TEditorsStylesDemoBaseFrame *AFrame = EditorsStylesDemoFrameManager()->Frames[I];
    APage->Caption = AFrame->BriefName();
    AFrame->pnlDescription->Parent = APage;
    AFrame->pnlDescription->Visible = true;
    AFrame->pnlDescription->Align = alClient;
    AFrame->memDescrip->Properties->WordWrap = true;
    APage->ImageIndex = APage->TabIndex;
  }
}

void __fastcall TEditorsStylesDemoDemoMainForm::FillTreeViewItems()
{
  cxTreeView->Items->Clear();
  TStringList* AStrings = new TStringList();
  TTreeNode* ANode;
  for (int i=0; i < EditorsStylesDemoFrameManager()->FramesCount; i++) {
    EditorsStylesDemoFrameManager()->Frames[i]->OnFileNameChanged = UpdateFileNameStatusPanel;
    ANode = cxTreeView->Items->AddChildObject(NULL,
      EditorsStylesDemoFrameManager()->Frames[i]->Name(), EditorsStylesDemoFrameManager()->Frames[i]);
    AddChildNodes(EditorsStylesDemoFrameManager()->Frames[i]->
      GetExtEditorTypes(EditorsStylesDemoFrameManager()->Frames[i]), AStrings, ANode);
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::FormDestroy(TObject *Sender)
{
  delete EditorsStylesDemoFrameManager();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::ClickCorrespondingHintMenuItem(TcxHintType AHintType, bool ADefaultHintStyle)
{
  TMenuItem* AMenuItem;
  if (!ADefaultHintStyle) {
    if (AHintType == hcstNoHint)
      AMenuItem = miCurHintStyle->Items[(int)AHintType + 1];
    else
      AMenuItem = miCurHintStyle->Items[(int)AHintType];
    AMenuItem->OnClick(AMenuItem);
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AdjustFrameDisplayStyle(TEditorsStylesDemoBaseFrame* AFrame,
  bool ADefaultDisplayStyle)
{
  if (ADefaultDisplayStyle)
    ActiveFrame->ChangeDisplayStyle(FCurrentDisplayStyle);
  else {
    miCurDisplayStyle->Items[(int)AFrame->DisplayStyle]->Checked = true;
    AFrame->DisplayStyle = AFrame->DisplayStyle;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AdjustFileNameStatusPanel()
{
  sbMain->Panels->Items[1]->Text = ExtractFileName(ActiveFrame->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AdjustNotePane(TEditorsStylesDemoBaseFrame* AFrame)
{
  gbDescription->Color = AFrame->GetStyleBackgroundColor();
  gbDescription->CaptionBkColor = AFrame->GetStyleBackgroundColor();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::AdjustFileMenu()
{
  miFileOpen->Visible = ActiveFrame->MenuOpenFileVisible();
  miFileSave->Visible = ActiveFrame->MenuSaveFileVisible();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::cxTreeViewChange(
      TObject *Sender, TTreeNode *Node)
{
  String AControlClassName;
  if (Node) {
    if (Node->Parent) {
      AControlClassName = Node->Text;
      Node = Node->Parent;
    }
    TEditorsStylesDemoBaseFrame* AFrame = (TEditorsStylesDemoBaseFrame*)Node->Data;
    if (ActiveFrame)
      ActiveFrame->Flickering = false;
    if ((AFrame) && (AControlClassName != NULL))
      AFrame->FlickerControls(AControlClassName);
    if (ActiveFrame != AFrame) {
      if ((ActiveFrame) && (AFrame)){
        ActiveFrame->Visible = false;
        ActiveFrame->Parent = NULL;
      }
      ActiveFrame = AFrame;
      ActiveFrame->Parent = cxGroupBox;
      ActiveFrame->Visible = true;
      ClickCorrespondingHintMenuItem(ActiveFrame->HintStyle, DefaultHintStyle);
      AdjustFrameDisplayStyle(ActiveFrame, DefaultDisplayStyle);
      AdjustFileMenu();
      AdjustNotePane(AFrame);
      PageControl->ActivePage = PageControl->Pages[Node->Index];
      AdjustFileNameStatusPanel();
      miStyle->Visible = AFrame->StyleMenuVisible();
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::UncheckMenuItems(TMenuItem* AItems)
{
  for (int i=0; i < AItems->Count; i++)
    AItems->Items[i]->Checked = false;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetLightInfoHintStyle()
{
  if (!ShowHint) ShowHint = true;
  cxHintStyleController->HintStyle->Standard = false;
  cxHintStyleController->HintStyle->Animate = cxhaFadeIn;
  cxHintStyleController->HintStyle->Color = clInfoBk;
  cxHintStyleController->HintStyle->Font->Color = clBlack;
  cxHintStyleController->HintStyle->Font->Height = -11;
  cxHintStyleController->HintStyle->Font->Style.Clear();
  cxHintStyleController->HintStyle->IconType = cxhiInformation;
  cxHintStyleController->HintStyle->IconSize = cxisDefault;
  cxHintStyleController->HintStyle->Rounded = false;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetLightSlideLeftHintStyle()
{
  if (!ShowHint) ShowHint = true;
  cxHintStyleController->HintStyle->Standard = false;
  cxHintStyleController->HintStyle->Animate = cxhaSlideFromLeft;
  cxHintStyleController->HintStyle->Color = TColor(0x00EDCBB6);
  cxHintStyleController->HintStyle->Font->Color = clBlack;
  cxHintStyleController->HintStyle->Font->Height = -13;
  cxHintStyleController->HintStyle->Font->Style.Clear();
  cxHintStyleController->HintStyle->IconType = cxhiCurrentApplication;
  cxHintStyleController->HintStyle->IconSize = cxisSmall;
  cxHintStyleController->HintStyle->Rounded = false;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetBlueSlideUpHintStyle()
{
  if (!ShowHint) ShowHint = true;
  cxHintStyleController->HintStyle->Standard = false;
  cxHintStyleController->HintStyle->Animate = cxhaSlideUpward;

  cxHintStyleController->HintStyle->Color = TColor(0x00EDBB87);
  cxHintStyleController->HintStyle->Font->Color = TColor(0x00AD3F29);
  cxHintStyleController->HintStyle->Font->Height = -13;
  cxHintStyleController->HintStyle->Font->Style.Clear();
  cxHintStyleController->HintStyle->IconType = cxhiCustom;
  cxHintStyleController->HintStyle->IconSize = cxisDefault;
  cxHintStyleController->HintStyle->Rounded = false;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetRoundedInfoHintStyle()
{
  if (!ShowHint) ShowHint = true;
  cxHintStyleController->HintStyle->Standard = false;
  cxHintStyleController->HintStyle->Animate = cxhaFadeIn;
  cxHintStyleController->HintStyle->Color = clInfoBk;
  cxHintStyleController->HintStyle->Font->Color = clBlack;
  cxHintStyleController->HintStyle->Font->Height = -11;
  cxHintStyleController->HintStyle->Font->Style.Clear();
  cxHintStyleController->HintStyle->IconType = cxhiInformation;
  cxHintStyleController->HintStyle->IconSize = cxisDefault;
  cxHintStyleController->HintStyle->Rounded = true;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetStandardHintStyle()
{
  if (!ShowHint) ShowHint = true;
  cxHintStyleController->HintStyle->Color = clInfoBk;
  cxHintStyleController->HintStyle->Standard = true;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetNoHintStyle()
{
  ShowHint = false;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::SetHintStyle(TcxHintType AHintType)
{
  switch (AHintType) {
    case hcstLightInfo: {
      SetLightInfoHintStyle(); break; }
    case hcstLightSlideLeft: {
      SetLightSlideLeftHintStyle(); break; }
    case hcstBlueSlideUp: {
      SetBlueSlideUpHintStyle(); break; }
    case hcstRoundedInfo: {
      SetRoundedInfoHintStyle(); break; }
    case hcstStandard: {
      SetStandardHintStyle(); break; }
    case hcstNoHint: {
      SetNoHintStyle(); break; }
    default: SetLightInfoHintStyle();
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miCurDisplayStyleClick(
      TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  UncheckMenuItems(miDefDisplayStyle);
  DefaultDisplayStyle = false;
  ActiveFrame->DisplayStyle = (TcxStyleSheetType)((TMenuItem*)Sender)->Tag;
  gbDescription->Color = ActiveFrame->GetStyleBackgroundColor();
  gbDescription->CaptionBkColor = ActiveFrame->GetStyleBackgroundColor();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miDefaultDisplayStyleClick(
      TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  UncheckMenuItems(miCurDisplayStyle);
  DefaultDisplayStyle = true;
  FCurrentDisplayStyle = (TcxStyleSheetType)((TMenuItem*)Sender)->Tag;
  ActiveFrame->ChangeDisplayStyle((TcxStyleSheetType)((TMenuItem*)Sender)->Tag);
  gbDescription->Color = ActiveFrame->GetStyleBackgroundColor();
  gbDescription->CaptionBkColor = ActiveFrame->GetStyleBackgroundColor();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miCurHintStyleClick(
      TObject *Sender)
{
  DefaultHintStyle = false;
  UncheckMenuItems(miDefHintStyle);
  ((TMenuItem*)Sender)->Checked = true;
  ActiveFrame->HintStyle = (TcxHintType)((TMenuItem*)Sender)->Tag;
  SetHintStyle((TcxHintType)((TMenuItem*)Sender)->Tag);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miHintStyleClick(
      TObject *Sender)
{
  DefaultHintStyle = true;
  UncheckMenuItems(miCurHintStyle);
  ((TMenuItem*)Sender)->Checked = true;
  SetHintStyle((TcxHintType)((TMenuItem*)Sender)->Tag);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miLookAndFeelKindClick(TObject *Sender)
{
  LookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->MenuIndex;
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------



void __fastcall TEditorsStylesDemoDemoMainForm::miNativeStyleClick(
      TObject *Sender)
{
  LookAndFeelController->NativeStyle = !LookAndFeelController->NativeStyle;
  ((TMenuItem*)Sender)->Checked = LookAndFeelController->NativeStyle;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::UpdateFileNameStatusPanel(String AFileName)
{
  sbMain->Panels->Items[1]->Text = ExtractFileName(AFileName);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miFileOpenClick(TObject *Sender)
{
  ActiveFrame->OpenFile(this);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::miFileSaveClick(TObject *Sender)
{
  ActiveFrame->SaveFile(this);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsStylesDemoDemoMainForm::PageControlChange(
      TObject *Sender)
{
  int APageIndex = PageControl->ActivePage->TabIndex;
  if (APageIndex != -1) {
  gbDescription->Caption = EditorsStylesDemoFrameManager()->Frames[APageIndex]->Description();
  }
}
//---------------------------------------------------------------------------


