//---------------------------------------------------------------------------
#include <vcl.h>
#include <shellapi.h>
#pragma hdrstop

#include "EBarMDIDemoMain.h"
#include "EBarMDIDemoChild.h"
#include "EBarsDemoRating.h"
#include "EBarMDIDemoAbout.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "dxBar"
#pragma link "dxBarExtItems"
#pragma link "cxControls"
#pragma link "dxStatusBar"
#pragma link "cxGraphics"
#pragma link "dxStatusBar"
#pragma link "cxClasses"
#pragma resource "*.dfm"
TEBarMDIDemoMainForm *EBarMDIDemoMainForm;

char
  *sRichEditFoundResultCaption = "Information",
  *sRichEditTextNotFound = "The search text is not found.",
  *sRichEditReplaceAllResult = "Replaced %d occurances.";

//---------------------------------------------------------------------------

__fastcall TEBarMDIDemoMainForm::TEBarMDIDemoMainForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

TRichEdit *__fastcall TEBarMDIDemoMainForm::GetEditor()
{
  if (ActiveMDIChild == NULL) return NULL;
  else return ((TEBarMDIDemoChildForm*) ActiveMDIChild)->Editor;
}
//---------------------------------------------------------------------------

int __fastcall TEBarMDIDemoMainForm::GetEditorCol()
{
  return Editor->SelStart - SendMessage(Editor->Handle, EM_LINEINDEX, EditorRow, 0);
}
//---------------------------------------------------------------------------

int __fastcall TEBarMDIDemoMainForm::GetEditorRow()
{
  return SendMessage(Editor->Handle, EM_LINEFROMCHAR, Editor->SelStart, 0);
}
//---------------------------------------------------------------------------

AnsiString __fastcall TEBarMDIDemoMainForm::GetFileName()
{
  if (ActiveMDIChild == NULL) return NULL;
  else return ((TEBarMDIDemoChildForm*) ActiveMDIChild)->FileName;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::SetFileName(AnsiString Value)
{
  if (ActiveMDIChild != NULL)
    ((TEBarMDIDemoChildForm*) ActiveMDIChild)->FileName = Value;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::EditorChange(TObject *Sender)
{
  if (Editor == NULL) return;
  Editor->OnSelectionChange(Editor);
  SetModified(Editor->Modified);
  dxStatusBar->Panels->Items[1]->Text = ActiveMDIChild->Caption;
  ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[1]->PanelStyle)->ImageIndex = 0;
  ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[0]->PanelStyle)->ImageIndex = 2;
  dxBarButtonUndo->Enabled = (SendMessage(Editor->Handle, EM_CANUNDO, 0, 0) != 0);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::EditorSelectionChange(TObject *Sender)
{
  FUpdating = True;
  try
  {
    dxBarComboFontSize->OnChange = 0;
    dxBarComboFontName->OnChange = 0;
    dxBarComboFontColor->OnChange = 0;
    dxStatusBar->Panels->Items[0]->Text =
      Format("Line: %3d   Col: %3d", ARRAYOFCONST((1 + EditorRow, 1 + EditorCol)));

    dxBarButtonCopy->Enabled = Editor->SelLength > 0;
    dxBarButtonCut->Enabled = dxBarButtonCopy->Enabled;
    dxBarButtonPaste->Enabled = (SendMessage(Editor->Handle, EM_CANPASTE, 0, 0) != 0);
    dxBarButtonClear->Enabled = dxBarButtonCopy->Enabled;

    dxBarComboFontSize->Text = IntToStr(Editor->SelAttributes->Size);
    dxBarComboFontName->Text = Editor->SelAttributes->Name;
    dxBarComboFontColor->Color = Editor->SelAttributes->Color;

    dxBarButtonBold->Down = Editor->SelAttributes->Style.Contains(fsBold);
    dxBarButtonItalic->Down = Editor->SelAttributes->Style.Contains(fsItalic);
    dxBarButtonUnderline->Down = Editor->SelAttributes->Style.Contains(fsUnderline);

    dxBarButtonBullets->Down = Boolean(Editor->Paragraph->Numbering);
    switch ((int) Editor->Paragraph->Alignment)
    {
      case 0: dxBarButtonAlignLeft->Down = True; break;
      case 1: dxBarButtonAlignRight->Down = True; break;
      case 2: dxBarButtonCenter->Down = True; break;
    }
    dxBarButtonProtected->Down = Editor->SelAttributes->Protected;
  }
  __finally
  {
    FUpdating = False;
    dxBarComboFontSize->OnChange = dxBarComboFontSizeChange;
    dxBarComboFontName->OnChange = dxBarComboFontNameChange;
    dxBarComboFontColor->OnChange = dxBarComboFontColorChange;
  }
}
//---------------------------------------------------------------------------

bool __fastcall TEBarMDIDemoMainForm::SaveFile(bool ASaveAs)
{
  if (ASaveAs || (FileName == ""))
  {
    SaveDialog->FileName = FileName;
    if (!SaveDialog->Execute()) return False;
    FileName = SaveDialog->FileName;
  }
  Editor->Lines->SaveToFile(FileName);
  SetModified(False);
  return True;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::SetModified(bool Value)
{
  Editor->Modified = Value;
  if (Value) {
    dxStatusBar->Panels->Items[2]->Text = "Modified";
    ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[2]->PanelStyle)->ImageIndex = 1;
  }
  else {
    dxStatusBar->Panels->Items[2]->Text = "";
    ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[2]->PanelStyle)->ImageIndex = 4;
  }  
  dxBarButtonSave->Enabled = Value;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::ShowItems(bool AShow)
{
  TdxBarItemVisible AVisible;

  BarManager->LockUpdate = True;

  if (!AShow)
  {
    dxStatusBar->Panels->Items[0]->Text = "";
    dxStatusBar->Panels->Items[1]->Text = "";
  }
  BarManager->Groups[0]->Enabled = AShow;

  if (AShow) AVisible = ivAlways;
  else AVisible = ivInCustomizing;

  dxBarSubItemEdit->Visible = AVisible;
  dxBarSubItemFormat->Visible = AVisible;

  BarManager->LockUpdate = False;
  ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[0]->PanelStyle)->ImageIndex = 5;
  ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[1]->PanelStyle)->ImageIndex = 3;
  ((TdxStatusBarTextPanelStyle*)dxStatusBar->Panels->Items[2]->PanelStyle)->ImageIndex = 4;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::FormCreate(TObject *Sender)
{
  dmCommonData->AboutFormClass = __classid(TEBarMDIDemoAboutForm);

  const AnsiString Filter = "Rich Text Files (*.RTF)|*.RTF";

  OpenDialog->Filter = Filter;
  SaveDialog->Filter = Filter;
  OpenDialog->InitialDir = ExtractFilePath(ParamStr(0));
  SaveDialog->InitialDir = OpenDialog->InitialDir;
  ShowItems(False);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonNewClick(TObject *Sender)
{
  new TEBarMDIDemoChildForm(Application);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonOpenClick(TObject *Sender)
{
  OpenDialog->FileName = "";
  if (OpenDialog->Execute())
  {
    TEBarMDIDemoChildForm *AForm = new TEBarMDIDemoChildForm(Application);
    AForm->FileName = OpenDialog->FileName;
    AForm->Editor->Lines->LoadFromFile(AForm->FileName);
    SetModified(False);
    dxBarMRUFiles->RemoveItem(OpenDialog->FileName, NULL);
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonCloseClick(TObject *Sender)
{
  ActiveMDIChild->Close();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonSaveClick(TObject *Sender)
{
  SaveFile(False);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::FindOne(TObject *Sender)
{
  TFindDialog *ADialog = ((TFindDialog*) Sender);
  int StartPos, FindLength, FoundAt;
  TSearchTypes Flags;
  TPoint P;
  RECT R, CaretR, IntersectR;

  if (ADialog->Options.Contains(frDown))
  {
    if (Editor->SelLength == 0) StartPos = Editor->SelStart;
    else StartPos = Editor->SelStart + Editor->SelLength;
    FindLength = Editor->Text.Length() - StartPos;
  }
  else
  {
    StartPos = Editor->SelStart;
    FindLength = -StartPos;
  }
  Flags.Clear();
  if (ADialog->Options.Contains(frMatchCase)) Flags << stMatchCase;
  if (ADialog->Options.Contains(frWholeWord)) Flags << stWholeWord;
  Screen->Cursor = crHourGlass;
  FoundAt = Editor->FindText(ADialog->FindText, StartPos, FindLength, Flags);
  if (!(ADialog->Options.Contains(frReplaceAll))) Screen->Cursor = crDefault;
  if (FoundAt > -1)
    if (ADialog->Options.Contains(frReplaceAll))
    {
      Editor->SelStart = FoundAt;
      Editor->SelLength = ADialog->FindText.Length();
    }
    else
    {
      Editor->SetFocus();
      Editor->SelStart = FoundAt;
      Editor->SelLength = ADialog->FindText.Length();

      GetCaretPos(&P);
      P = Editor->ClientToScreen(P);
      CaretR = Rect(P.x, P.y, P.x + 2, P.y + 20);
      GetWindowRect(Editor->Handle, &R);
      if (IntersectRect(&IntersectR, &CaretR, &R))
        if (P.y < Screen->Height / 2)
          ADialog->Top = P.y + 40;
        else
          ADialog->Top = P.y - (R.bottom - R.top + 20);
    }
  else
    if (!(ADialog->Options.Contains(frReplaceAll)))
	  MessageBox(0, sRichEditTextNotFound,
        sRichEditFoundResultCaption, MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::ReplaceOne(TObject *Sender)
{
  TReplaceDialog *ADialog = ((TReplaceDialog*) Sender);
  int ReplacedCount, OldSelStart, PrevSelStart;
  AnsiString S;

  ReplacedCount = 0;
  OldSelStart = Editor->SelStart;
  if (ADialog->Options.Contains(frReplaceAll)) Screen->Cursor = crHourGlass;
  do
  {
    if ((Editor->SelLength > 0) && ((Editor->SelText == ADialog->FindText) ||
      (!(ADialog->Options.Contains(frMatchCase)) &&
       (AnsiUpperCase(Editor->SelText) == AnsiUpperCase(ADialog->FindText)))))
    {
      Editor->SelText = ADialog->ReplaceText;
      ReplacedCount++;
    }
    PrevSelStart = Editor->SelStart;
    FindOne(Sender);
  }
  while (!(!(ADialog->Options.Contains(frReplaceAll)) || (Editor->SelStart == PrevSelStart)));
  if (ADialog->Options.Contains(frReplaceAll))
  {
    Screen->Cursor = crDefault;
    if (ReplacedCount == 0) S = sRichEditTextNotFound;
    else
    {
      Editor->SelStart = OldSelStart;
      S = Format(sRichEditReplaceAllResult, ARRAYOFCONST((ReplacedCount)));
    }
    MessageBox(0, S.c_str(), sRichEditFoundResultCaption,
      MB_ICONINFORMATION);
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonSaveAsClick(TObject *Sender)
{
  SaveFile(True);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonPrintClick(TObject *Sender)
{
  if (PrintDialog->Execute()) Editor->Print(FileName);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonUndoClick(TObject *Sender)
{
  SendMessage(Editor->Handle, EM_UNDO, 0, 0);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonCutClick(TObject *Sender)
{
  Editor->CutToClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonCopyClick(TObject *Sender)
{
  Editor->CopyToClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonPasteClick(TObject *Sender)
{
  Editor->PasteFromClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonClearClick(TObject *Sender)
{
  Editor->ClearSelection();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonSelectAllClick(TObject *Sender)
{
  Editor->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonFindClick(TObject *Sender)
{
  Editor->SelLength = 0;
  FindDialog->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonReplaceClick(TObject *Sender)
{
  Editor->SelLength = 0;
  ReplaceDialog->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarComboFontNameChange(TObject *Sender)
{
  if (!FUpdating)
    Editor->SelAttributes->Name = dxBarComboFontName->Text;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarComboFontSizeChange(TObject *Sender)
{
  if (!FUpdating)
    Editor->SelAttributes->Size = StrToInt(dxBarComboFontSize->Text);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonBoldClick(TObject *Sender)
{
  if (dxBarButtonBold->Down)
    Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsBold;
  else
    Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsBold;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonItalicClick(TObject *Sender)
{
  if (dxBarButtonItalic->Down)
    Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsItalic;
  else
    Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsItalic;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonUnderlineClick(TObject *Sender)
{
  if (dxBarButtonUnderline->Down)
    Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsUnderline;
  else
    Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsUnderline;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarComboFontColorChange(TObject *Sender)
{
  Editor->SelAttributes->Color = dxBarComboFontColor->Color;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonBulletsClick(TObject *Sender)
{
  Editor->Paragraph->Numbering = (TNumberingStyle) dxBarButtonBullets->Down;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonAlignClick(TObject *Sender)
{
  if (((TdxBarButton *)Sender)->Down)
    Editor->Paragraph->Alignment = (TAlignment)((TdxBarButton *)Sender)->Tag;
  else
    Editor->Paragraph->Alignment = taLeftJustify;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonProtectedClick(TObject *Sender)
{
  Editor->SelAttributes->Protected = !Editor->SelAttributes->Protected;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonFontClick(TObject *Sender)
{
  FontDialog->Font->Assign(Editor->SelAttributes);
  if (FontDialog->Execute())
    Editor->SelAttributes->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonArrangeAllClick(TObject *Sender)
{
  Tile();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonNextWindowClick(TObject *Sender)
{
  Next();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonPreviousWindowClick(TObject *Sender)
{
  Previous();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarListWindowsClick(TObject *Sender)
{
  ((TCustomForm *)dxBarListWindows->Items->Objects[dxBarListWindows->ItemIndex])->Show();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarListWindowsGetData(TObject *Sender)
{
  dxBarListWindows->ItemIndex = dxBarListWindows->Items->IndexOfObject(ActiveMDIChild);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonOnWebClick(TObject *Sender)
{
  ShellExecute(0, NULL, "http://www.devexpress.com", NULL, NULL, SW_RESTORE);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonEnhancedStyleClick(TObject *Sender)
{
  BarManager->Style = bmsEnhanced;
  dxStatusBar->PaintStyle = stpsStandard;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonStdStyleClick(TObject *Sender)
{
  BarManager->Style = bmsStandard;
  dxStatusBar->PaintStyle = stpsStandard;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonFlatStyleClick(TObject *Sender)
{
  BarManager->Style = bmsFlat;
  dxStatusBar->PaintStyle = stpsFlat;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarMRUFilesClick(TObject *Sender)
{
  AnsiString AFileName;
  TEBarMDIDemoChildForm *CForm;

  AFileName = dxBarMRUFiles->Items->Strings[dxBarMRUFiles->ItemIndex];
  if (FileExists(AFileName))
  {
   CForm = new TEBarMDIDemoChildForm(Application);
   CForm->FileName = AFileName;
   CForm->Editor->Lines->LoadFromFile(FileName);
   SetModified(False);
  }
  else
    MessageBox(0, AnsiString(AFileName+"\nFile not found.").c_str(),"Open",MB_OK || MB_ICONERROR);

}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonOffice11StyleClick(TObject *Sender)
{
  BarManager->Style = bmsOffice11;
  dxStatusBar->PaintStyle = stpsOffice11;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoMainForm::dxBarButtonXPStyleClick(TObject *Sender)
{
  BarManager->Style = bmsXP;
  dxStatusBar->PaintStyle = stpsXP;
}
//---------------------------------------------------------------------------