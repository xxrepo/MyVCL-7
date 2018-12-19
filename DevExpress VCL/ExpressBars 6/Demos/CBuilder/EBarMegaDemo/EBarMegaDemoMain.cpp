//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "EBarMegaDemoMain.h"
#include "EBarMegaDemoData.h"
#include "EBarMegaDemoOptions.h"
#include "EBarMegaDemoAbout.h"
#include "EBarsDemoRating.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)

#pragma link "dxBar"
#pragma link "dxBarDBNav"
#pragma link "dxBarExtDBItems"
#pragma link "dxBarExtItems"
#pragma link "dxsbar"
#pragma link "dxCore"

#if (__BORLANDC__ >= 0x540) && (__BORLANDC__ < 0x550)   // BCB = 4
#pragma link "SHDocVw_OCX_4"
#endif

#if __BORLANDC__ >= 0x550   // BCB = 5, BCB = 6
#pragma link "SHDocVw_OCX"
#endif


#pragma link "cxClasses"
#pragma resource "*.dfm"

TEBarMegaDemoMainForm *EBarMegaDemoMainForm;
char
  *sRichEditFoundResultCaption = "Information",
  *sRichEditTextNotFound = "The search text is not found.",
  *sRichEditReplaceAllResult = "Replaced %d occurances.";

//---------------------------------------------------------------------------
__fastcall TEBarMegaDemoMainForm::TEBarMegaDemoMainForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoMainForm::FormCreate(TObject *Sender)
{
  const AnsiString Filter = "Rich Text Files (*.RTF)|*.RTF";

  dmCommonData->AboutFormClass = __classid(TEBarMegaDemoAboutForm);

  #if __BORLANDC__ > 0x540   // BCB version > 4
  HTML = new TCppWebBrowser(HTMLPanel);
  #else
  HTML = new TWebBrowserProxy(HTMLPanel);
  #endif


  HTML->OnDocumentComplete = DocumentComplete;
  HTML->OnProgressChange = ProgressChange;
  HTML->OnBeforeNavigate2 = BeforeNavigate;
  HTML->OnStatusTextChange = StatusTextChange;
  HTML->OnTitleChange = TitleChange;

  ((TWinControl*)HTML)->Parent = HTMLPanel;
  HTML->Align = alClient;

  Address = "";
  ShortDateFormat = "mm/dd/yyyy";
  UpdateCombo = true;
  OpenDialog->Filter = Filter;
  SaveDialog->Filter = Filter;
  OpenDialog->InitialDir = ExtractFilePath(ParamStr(0));
  SaveDialog->InitialDir = OpenDialog->InitialDir;
  Editor->Lines->Clear();
  PanelRE->Visible = false;
  SetModified(false);
  ShowItems(false);
  BarManager->LockUpdate = true;
  UpdateToolBar(0);
  BarManager->LockUpdate = false;
  HistoryIndex = -1;
  HistoryList = new TStringList;
  EBarMegaDemoMainDM->tblProducts->Close();
  EBarMegaDemoMainDM->tblContacts->Close();
  EBarMegaDemoMainDM->tblProducts->Open();
  EBarMegaDemoMainDM->tblContacts->Open();
  dxDate->Text = "";
  Editor->Lines->LoadFromFile("lipsum.rtf");
  SetModified(false);
  ShowItems(true);
  dxSideBarItemClick(NULL, dxSideBar->Groups->Items[0]->Items->Items[0]);
  dxSideBar->SelectedItem = dxSideBar->Groups->Items[0]->Items->Items[0];
}
//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoMainForm::UpdateToolBar( int index)
{
typedef
  Set <int, 0, 12> TVisibleItems;
const
  Boolean SunkenBorders[] = {False, False, True, False};
  TVisibleItems VisibleBars[] = {
    TVisibleItems () << 0,
    TVisibleItems () << 0 << 1 << 2 << 3 << 9,
    TVisibleItems () << 0 << 4 << 5 << 6 << 9,
    TVisibleItems () << 0 << 7 <<8};
  TVisibleItems VisibleCategories[] = {
    TVisibleItems () << 0 << 4 << 5,
    TVisibleItems () << 0 << 1 << 2 << 3 << 4 << 5,
    TVisibleItems () << 0 << 1 << 5 << 4 << 6 << 7 << 8 << 10 << 11,
    TVisibleItems () << 0 << 4 << 5 << 9 << 12};
int i;

  BarManager->SunkenBorder = SunkenBorders[index];

  for( i = 0; i < BarManager->Categories->Count ; i++)
   BarManager->CategoryVisible[i] = VisibleCategories[index].Contains(i);

  for( i = BarManager->Bars->Count - 1; i >= 0; i--)
   if ((! VisibleBars[index].Contains(i)) || (i == 0))
     {
       BarManager->Bars->Items[i]->Visible = false;
       BarManager->Bars->Items[i]->Hidden = true;
     };

  for( i = 0; i < BarManager->ItemCount; i++)
   if ((BarManager->Items[i]->Tag == 0 ) || (BarManager->Items[i]->Tag == index))
     BarManager->Items[i]->Visible = ivAlways;
   else
     BarManager->Items[i]->Visible = ivNever;

  for( i = 0; i < BarManager->Bars->Count; i++ )
   if (VisibleBars[index].Contains(i) || (i == 0))
     {
       BarManager->Bars->Items[i]->Visible = true;
       BarManager->Bars->Items[i]->Hidden = false;
     };
  Nb->PageIndex = index;
  dxBSIEStatus->Caption = "";
  dxBSStatus->Caption = "";
  dxBSPosition->Caption = "";
  dxBarProgress->Position = 0;
  dxBSIEStatus->Glyph = 0;
  if (index == 2)
    dxBSIEStatus->Glyph->Assign(Image->Picture->Bitmap);

}
void __fastcall TEBarMegaDemoMainForm::dxSideBarItemClick(TObject *Sender,
      TdxSideBarItem *Item)
{
 Caption = "ExpressBars Demo";
 LockWindowUpdate(EBarMegaDemoMainForm->Handle);
 BarManager->LockUpdate = true;
 UpdateToolBar(Item->Tag);
 BarManager->LockUpdate = false;
 LockWindowUpdate(0);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonNewClick(TObject *Sender)
{
  int Res;

 if (Editor->Modified) {
   Res = MessageDlg("Do you want to save the changes you made ?",
                     mtConfirmation, TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
   switch (Res) {
     case mrYes : if (!SaveFile(false)) return; break;
     case mrCancel  : return;
   };
 };
 Editor->Lines->Clear();
 FileName = "";
 ShowItems(true);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonOpenClick(TObject *Sender)
{
  int Res;

  if (Editor->Modified) {
    Res = MessageDlg("Do you want to save the changes you made to \""+FileName+"\" ?",
                      mtConfirmation, TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
    switch (Res) {
      case mrYes    : if (! SaveFile(false)) return; break;
      case mrCancel : return;
    };
  };

  OpenDialog->FileName = "";
  if (OpenDialog->Execute()) {
    FileName = OpenDialog->FileName;
    Editor->Lines->LoadFromFile(FileName);
    SetModified(false);
    ShowItems(true);
  };
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonCloseClick(TObject *Sender)
{
  int Res;

  if (Editor->Modified) {
    Res = MessageDlg("Do you want to save the changes you made to \""+FileName+"\" ?",
                      mtConfirmation, TMsgDlgButtons() << mbYes << mbNo << mbCancel, 0);
    switch (Res) {
      case mrYes    : if (! SaveFile(false)) return; break;
      case mrCancel : return;
    };
  };
  Editor->Lines->Clear();
  ShowItems(false);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::EditorChange(TObject *Sender)
{
  if (Editor == NULL) return;
  Editor->OnSelectionChange(Editor);
  SetModified(Editor->Modified);
  dxBarButtonUndo->Caption = "&Undo";
  dxBarButtonUndo->Enabled = SendMessage(Editor->Handle, EM_CANUNDO, 0, 0) != 0;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::EditorSelectionChange(TObject *Sender)
{
  int Col, Row;

  Row = SendMessage(Editor->Handle, EM_LINEFROMCHAR, Editor->SelStart, 0);
  Col = Editor->SelStart - SendMessage(Editor->Handle, EM_LINEINDEX, Row, 0);

  FUpdating = true;

  dxBSPosition->Caption = "Line: "+IntToStr(Row + 1)+"   Col: "+IntToStr(Col + 1);

  dxBarButtonCopy->Enabled = Editor->SelLength > 0;
  dxBarButtonCut->Enabled = dxBarButtonCopy->Enabled;
  dxBarButtonPaste->Enabled = ((SendMessage(Editor->Handle, EM_CANPASTE, 0, 0) != 0) && dxBarButtonSave->Enabled);
  dxBarButtonClear->Enabled = dxBarButtonCopy->Enabled;

  dxBarComboFontSize->Text = IntToStr(Editor->SelAttributes->Size);
  dxBarComboFontName->Text = Editor->SelAttributes->Name;

  dxBarButtonBold->Down = Editor->SelAttributes->Style.Contains(fsBold);
  dxBarButtonItalic->Down = Editor->SelAttributes->Style.Contains(fsItalic);
  dxBarButtonUnderline->Down = Editor->SelAttributes->Style.Contains(fsUnderline);

  dxBarButtonBullets->Down = (bool)(Editor->Paragraph->Numbering);

  switch (Editor->Paragraph->Alignment) {
    case 0: dxBarButtonAlignLeft->Down = true; break;
    case 1: dxBarButtonAlignRight->Down = true; break;
    case 2: dxBarButtonCenter->Down = true; break;
  };

  dxBarButtonURLDetection->Down = (bool)(SendMessage(Editor->Handle, EM_GETAUTOURLDETECT, 0, 0));

  dxBarComboFontColor->Color = Editor->SelAttributes->Color;

  FUpdating = false;
}
//---------------------------------------------------------------------------

bool __fastcall TEBarMegaDemoMainForm::SaveFile(bool ASaveAs)
{
  bool Res;

  if (ASaveAs || (FileName == "")) {
    SaveDialog->FileName = FileName;
    Res = SaveDialog->Execute();
    if (! Res) return (Res);
    FileName = SaveDialog->FileName;
  };
  Editor->Lines->SaveToFile(FileName);
  SetModified(false);
  return(true);
};
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::SetModified(bool Value)
{
  Editor->Modified = Value;
  if (Value)
    dxBSStatus->Caption = "Modified";
  else
    dxBSStatus->Caption = "";
  if (FileName != "")
    dxBarButtonSave->Enabled = Value;
};
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::ShowItems(bool AShow)
{
  TdxBarItemVisible AVisible;

  if (! AShow) {
    dxBSStatus->Caption = "";
    dxBSPosition->Caption = "";
  };
  BarManager->Groups[0]->Enabled = AShow;

  if (AShow) AVisible = ivAlways;
  else AVisible = ivInCustomizing;

  dxBarSubItemEdit->Visible = AVisible;
  dxBarSubItemFormat->Visible = AVisible;

  PanelRE->Visible = AShow;
  Editor->Repaint();
};

//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonExitClick(TObject *Sender)
{
  Close();
}

//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonSaveClick(TObject *Sender)
{
  SaveFile(false);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonSaveAsClick(TObject *Sender)
{
  SaveFile(true);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonPrintClick(TObject *Sender)
{
  if (PrintDialog->Execute())
    Editor->Print(FileName);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonUndoClick(TObject *Sender)
{
  SendMessage(Editor->Handle, EM_UNDO, 0, 0);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonCutClick(TObject *Sender)
{
  Editor->CutToClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonCopyClick(TObject *Sender)
{
  Editor->CopyToClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonPasteClick(TObject *Sender)
{
  Editor->PasteFromClipboard();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonClearClick(TObject *Sender)
{
  Editor->ClearSelection();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonSelectAllClick(TObject *Sender)
{
  Editor->SelectAll();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonFindClick(TObject *Sender)
{
  Editor->SelLength = 0;
  FindDialog->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonReplaceClick(TObject *Sender)
{
  Editor->SelLength = 0;
  ReplaceDialog->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonFontClick(TObject *Sender)
{
  FontDialog->Font->Assign(Editor->SelAttributes);
  if (FontDialog->Execute())
    Editor->SelAttributes->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonBulletsClick(TObject *Sender)
{
  Editor->Paragraph->Numbering = (TNumberingStyle)dxBarButtonBullets->Down;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonProtectedClick(TObject *Sender)
{
  Editor->SelAttributes->Protected = ! Editor->SelAttributes->Protected;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontColorChange(TObject *Sender)
{
  if (! FUpdating)
    Editor->SelAttributes->Color = dxBarComboFontColor->Color;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontColorClick(TObject *Sender)
{
  FontDialog->Font->Assign(Editor->SelAttributes);
  if (FontDialog->Execute())
    Editor->SelAttributes->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonURLDetectionClick(TObject *Sender)
{
  bool URLDetection;

  URLDetection = (bool)(SendMessage(Editor->Handle, EM_GETAUTOURLDETECT, 0, 0));
  URLDetection = ! URLDetection;
  SendMessage(Editor->Handle, EM_AUTOURLDETECT, (int)(URLDetection), 0);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonOnWebClick(TObject *Sender)
{
  ShellExecute(0, NULL, "http://www.devexpress.com", NULL, NULL, SW_RESTORE);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontNameChange(TObject *Sender)
{
  if (! FUpdating)
    Editor->SelAttributes->Name = dxBarComboFontName->Text;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontNameClick(TObject *Sender)
{
  FontDialog->Font->Assign(Editor->SelAttributes);
  if (FontDialog->Execute())
    Editor->SelAttributes->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonBoldClick(TObject *Sender)
{
    if (dxBarButtonBold->Down)
      Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsBold;
    else
      Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsBold;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonItalicClick(TObject *Sender)
{
    if (dxBarButtonItalic->Down)
      Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsItalic;
    else
      Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsItalic;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonUnderlineClick(TObject *Sender)
{
    if (dxBarButtonUnderline->Down)
      Editor->SelAttributes->Style = Editor->SelAttributes->Style << fsUnderline;
    else
      Editor->SelAttributes->Style = Editor->SelAttributes->Style >> fsUnderline;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonAlignLeftClick(TObject *Sender)
{
  if (((TdxBarButton*)Sender)->Down)
    Editor->Paragraph->Alignment = (TAlignment)0;
  else
    Editor->Paragraph->Alignment = taLeftJustify;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonCenterClick(TObject *Sender)
{
  if (((TdxBarButton*)Sender)->Down)
    Editor->Paragraph->Alignment = (TAlignment)2;
  else
    Editor->Paragraph->Alignment = taLeftJustify;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarButtonAlignRightClick(TObject *Sender)
{
  if (((TdxBarButton*)Sender)->Down)
    Editor->Paragraph->Alignment = (TAlignment)1;
  else
    Editor->Paragraph->Alignment = taLeftJustify;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxAddressComboKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
  if (Key == VK_RETURN) dxAddressCombo->Items->Insert(0, Address);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxAddressComboDrawItem(
      TdxBarCustomCombo *Sender, int AIndex, TRect &ARect,
      TOwnerDrawState AState)
{
   TRect RectText;

   Sender->Canvas->Brush->Color = clWindow;
   Sender->Canvas->FillRect(ARect);
   RectText = ARect;
   RectText.Left += 16;
   if (AIndex >= 0)  RectText.Right = RectText.Left + Sender->Canvas->TextWidth(Sender->Items->Strings[AIndex]) + 4;
   if ( AState.Contains(odSelected) ) {
     Sender->Canvas->Brush->Color = clHighlight;
     Sender->Canvas->FillRect(RectText);
   };

   if (AIndex >= 0) {
     Sender->Canvas->Draw(ARect.Left + 1, ARect.Top + 2, Image->Picture->Bitmap);
     Sender->Canvas->TextOut(RectText.Left + 2, RectText.Top , Sender->Items->Strings[AIndex]);
   }
   else
     if (Sender->Text != "")
       {
         Sender->Canvas->Draw(ARect.Left + 1, ARect.Top + 2, Image->Picture->Bitmap);
         Sender->Canvas->TextOut(RectText.Left + 2, RectText.Top , Sender->Text);
       }
   if ( AState.Contains(odSelected) )
     Sender->Canvas->DrawFocusRect(RectText);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::FindAddress(void)
{
  #if __BORLANDC__ > 0x530   // BCB version > 3
  TVariant
  #else
  VARIANT
  #endif
   Flags, TargetFrameName, PostData, Headers ;

  try {
    if (Address != "") {
	  WideString S = dxAnsiStringToWideString(Address);
	  HTML->Navigate(S.c_bstr(), &Flags, &TargetFrameName, &PostData, &Headers);
    }
  }
  catch (...) {};
};

void __fastcall TEBarMegaDemoMainForm::dxStopBtnClick(TObject *Sender)
{
  if (HistoryIndex != -1) HTML->Stop();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxRefreshBtnClick(TObject *Sender)
{
  if (HistoryIndex != -1) HTML->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxHomeBtnClick(TObject *Sender)
{
 Address = "http://www.devexpress.com/";
 FindAddress();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxProductsBtnClick(TObject *Sender)
{
  Address = ((TdxBarButton*)Sender)->Hint;
  FindAddress();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxAddressComboChange(TObject *Sender)
{
  if (UpdateCombo) {
    Address = dxAddressCombo->Text;
    FindAddress();
  }  
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::FormDestroy(TObject *Sender)
{
 HTML->Stop();
 HistoryList->Free();
 HTML->Free();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBackBtnClick(TObject *Sender)
{
  Address = HistoryList->Strings[HistoryIndex - 1];
  FindAddress();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxForwardBtnClick(TObject *Sender)
{
  Address = HistoryList->Strings[HistoryIndex + 1];
  FindAddress();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarHistoryClick(TObject *Sender)
{
  if (((TdxBarButton*)Sender)->ClickItemLink != NULL) {
    Address = ((TdxBarButton*)Sender)->ClickItemLink->UserCaption;
    FindAddress();
  };
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxSearchBtnClick(TObject *Sender)
{
  HTML->GoSearch();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxCityComboChange(TObject *Sender)
{
  SetFilter();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::SetFilter(void)
{
const
  String PaymentStr[] = {"CASH", "VISA", "MASTER", "AMEX"};

  AnsiString Filter, S;
  int i;

  Filter = "";

  if (dxCityCombo->Text != "")
    if (dxCityCombo->SelectedNode->Count == 0) Filter = "City = '"+dxCityCombo->Text+"'";
   else
     {
       for( i= 0; i < dxCityCombo->SelectedNode->Count; i++)
         if (Filter == "") Filter = Filter + "( City = '" + dxCityCombo->SelectedNode->Item[i]->Text+"' )";
         else Filter = Filter + " or ( City = '" + dxCityCombo->SelectedNode->Item[i]->Text+"' )";
     };

 if (Filter != "") Filter = "(" + Filter + ")";

 if (dxProductsCombo->Text != "")
   if (Filter == "") Filter = "( ProductID = " +EBarMegaDemoMainDM->tblProducts->FieldByName("ID")->AsString + ")";
   else Filter = Filter + " and ( ProductID = " +EBarMegaDemoMainDM->tblProducts->FieldByName("ID")->AsString + ")";


 if (dxDate->Text != "")
   if (Filter == "") Filter = "( PurchaseDate = '" + DateToStr(dxDate->Date) + "')";
   else Filter = Filter + " and ( PurchaseDate = '" + DateToStr(dxDate->Date) + "')";

 if (dxTypeCombo->Text != "")
   if (Filter == "") Filter = "( PaymentType = '" + PaymentStr[dxTypeCombo->ItemIndex] + "')";
   else Filter = Filter + " and ( PaymentType = '" + PaymentStr[dxTypeCombo->ItemIndex] + "')";

 EBarMegaDemoMainDM->tblContacts->Filter = Filter;
 EBarMegaDemoMainDM->tblContacts->Filtered = true;

};

void __fastcall TEBarMegaDemoMainForm::dxClearBtnClick(TObject *Sender)
{
 dxCityCombo->Text = "";
 dxProductsCombo->KeyValue = NULL;
 dxProductsCombo->Text = "";
 dxDate->Text = "";
 dxTypeCombo->ItemIndex = -1;
 EBarMegaDemoMainDM->tblContacts->Filter = "";
 EBarMegaDemoMainDM->tblContacts->Filtered = false;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxOptionsClick(TObject *Sender)
{
 EBarMegaDemoOptionsForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::ProgressChange(TObject *Sender,
      long Progress, long ProgressMax)
{
  dxBarProgress->Max = ProgressMax;
  dxBarProgress->Position = Progress;
}
//---------------------------------------------------------------------------


void __fastcall TEBarMegaDemoMainForm::FindDialogFind(TObject *Sender)
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
      if (ADialog->Top < 0) ADialog->Top = 0;    
    }
  else
    if (!(ADialog->Options.Contains(frReplaceAll)))
      MessageBox(0, sRichEditTextNotFound,
        sRichEditFoundResultCaption, MB_ICONINFORMATION);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::ReplaceDialogReplace(TObject *Sender)
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
    FindDialogFind(Sender);
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

void __fastcall TEBarMegaDemoMainForm::DocumentComplete(TObject *Sender, LPDISPATCH pDisp,
    #if (__BORLANDC__ == 0x540) && (__BORLANDC__ < 0x550)  // BCB = 4
      void
    #endif
    #if (__BORLANDC__ >= 0x550) && (__BORLANDC__ < 0x560) // BCB = 5
      TVariant
    #endif
    #if __BORLANDC__ >= 0x560 // BCB = 6
    tagVARIANT
    #endif
    * URL)
{
   dxBarProgress->Position = 0;
}

//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoMainForm::BeforeNavigate(TObject *Sender, LPDISPATCH pDisp,
    #if (__BORLANDC__ >= 0x550) && (__BORLANDC__ < 0x560) // BCB = 5
    TVariant* URL, TVariant* Flags, TVariant* TargetFrameName, TVariant* PostData, TVariant* Headers, TOLEBOOL* Cancel
    #elif (__BORLANDC__ == 0x540) && (__BORLANDC__ < 0x550)  // BCB = 4
    void* URL, void* Flags, void* TargetFrameName, void* PostData, void* Headers, void* Cancel
    #else
    tagVARIANT* URL, tagVARIANT* Flags, tagVARIANT* TargetFrameName, tagVARIANT* PostData, tagVARIANT* Headers, short* Cancel
    #endif
    )
{
  int NewIndex, i;
  AnsiString NAddress;
  TdxBarItemLink *AItemLink;
  #if __BORLANDC__  > 0x530   // BCB version > 3
  TVariant* AURL = (TVariant*)URL;
  #else
  Variant AURL = *URL;
  #endif

  #if __BORLANDC__  > 0x530   // BCB version > 3
  NAddress = *AURL;
  #else
  NAddress = AURL;
  #endif
  if (NAddress == "") NAddress = Address;
  if (NAddress == "") return;

  NewIndex = HistoryList->IndexOf(NAddress);
  if (NewIndex == -1) {
    HistoryList->Add(NAddress);
    NewIndex = HistoryList->IndexOf(NAddress);
  };

  UpdateCombo = false;
  dxAddressCombo->Text = NAddress;
  UpdateCombo = true;


  ForwardPopupMenu->ItemLinks->Clear();
  for( i = HistoryList->Count - 1; i >= NewIndex + 1; i--) {
       AItemLink = ForwardPopupMenu->ItemLinks->Add();
       AItemLink->Index = 0;
       AItemLink->Item = dxBarHistory;
       AItemLink->UserCaption = HistoryList->Strings[i];
     };

  BackPopupMenu->ItemLinks->Clear();
  for( i = 0; i< NewIndex; i++) {
       AItemLink = BackPopupMenu->ItemLinks->Add();
       AItemLink->Index = 0;
       AItemLink->Item = dxBarHistory;
       AItemLink->UserCaption = HistoryList->Strings[i];
     }

  HistoryIndex = NewIndex;

  if (HistoryIndex == 0) {
    dxBackBtn->Enabled = false;
    dxIEBackBtn->Enabled = false;
  }
  else
  {
    dxBackBtn->Enabled = true;
    dxIEBackBtn->Enabled = true;
  };

  if (HistoryIndex == HistoryList->Count - 1) {
    dxForwardBtn->Enabled = false;
    dxIEForwardBtn->Enabled = false;
  }
  else
  {
    dxForwardBtn->Enabled = true;
    dxIEForwardBtn->Enabled = true;
  };
}

void __fastcall TEBarMegaDemoMainForm::StatusTextChange(TObject * Sender, BSTR Text)
{
  if ((String)Text == "")
    dxBSIEStatus->Caption = "Done";
  else
    dxBSIEStatus->Caption = TCaption(Text);

}

void __fastcall TEBarMegaDemoMainForm::TitleChange(TObject * Sender, BSTR Text)
{
    Caption = (TCaption)Text;
}

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontSizeChange(TObject *Sender)
{
  if (! FUpdating)
    Editor->SelAttributes->Size = StrToInt(dxBarComboFontSize->Text);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxBarComboFontSizeClick(TObject *Sender)
{
  FontDialog->Font->Assign(Editor->SelAttributes);
  if (FontDialog->Execute())
    Editor->SelAttributes->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------


void __fastcall TEBarMegaDemoMainForm::tContactsCalcFields(TDataSet *DataSet)
{
  DataSet->FieldByName("CustName")->AsString = DataSet->FieldByName("FirstName")->AsString +
    " " + DataSet->FieldByName("LastName")->AsString;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxProductsComboChange(
      TObject *Sender)
{
  SetFilter();
}
//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoMainForm::dxDateChange(TObject *Sender)
{
  SetFilter();
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoMainForm::dxTypeComboChange(TObject *Sender)
{
  SetFilter();
}
//---------------------------------------------------------------------------

