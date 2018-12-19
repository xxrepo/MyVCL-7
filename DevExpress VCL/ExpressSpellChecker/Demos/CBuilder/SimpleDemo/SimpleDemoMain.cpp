//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SimpleDemoMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxCalendar"
#pragma link "cxContainer"
#pragma link "cxControls"
#pragma link "cxDropDownEdit"
#pragma link "cxEdit"
#pragma link "cxGroupBox"
#pragma link "cxLabel"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxMaskEdit"
#pragma link "cxMemo"
#pragma link "cxRichEdit"
#pragma link "cxTextEdit"
#pragma link "dxSpellChecker"
#pragma resource "*.dfm"
TfmCV *fmCV;
//---------------------------------------------------------------------------
void Browse(dxSitePage ASitePage)
{
  PCHAR AURL;
  switch (ASitePage)
  {
    case spDownloads: AURL = dxDownloadURL; break;
    case spSupport: AURL = dxSupportURL; break;
    case spStart: AURL = dxStartURL; break;
    case spProducts: AURL = dxProductsURL; break;
    case spMyDX: AURL = dxMyDXURL; break;
  }
  ShellExecute(0, "OPEN", AURL, NULL, NULL, SW_SHOWMAXIMIZED);
}
//---------------------------------------------------------------------------
__fastcall TfmCV::TfmCV(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::dxSpellChecker1CheckAsYouTypeStart(
	  TdxCustomSpellChecker *Sender, TWinControl *AControl, bool &AAllow)
{
  AAllow = AControl != edtName;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::dxSpellChecker1CheckControlInContainer(
	  TdxCustomSpellChecker *Sender, TWinControl *AControl, bool &AAllow,
	  bool &AContinue)
{
  AAllow = AControl != edtName;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aViewExecute(TObject *Sender)
{
  switch (((TAction*)Sender)->Tag)
  {
	case 0:
	case 1:
	case 2:
	case 3:
	  {
		cxLookAndFeelController1->Kind = TcxLookAndFeelKind(((TAction*)Sender)->Tag);
		cxLookAndFeelController1->NativeStyle = False;
		break;
	  };
	case 4: cxLookAndFeelController1->NativeStyle = True; break;
  };
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aOutlookSpellTypeExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingFormType = TdxSpellCheckerSpellingFormType(((TAction*)Sender)->Tag);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aCheckFromCursorPosExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->CheckFromCursorPos = aCheckFromCursorPos->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aCheckSelectedTextFirstExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->CheckSelectedTextFirst = aCheckSelectedTextFirst->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreEmailsExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreEmails = aIgnoreEmails->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreMixedCaseWordsExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreMixedCaseWords = aIgnoreMixedCaseWords->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aCAYTActiveExecute(TObject *Sender)
{
  dxSpellChecker1->CheckAsYouTypeOptions->Active = aCAYTActive->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreRepeatedWordsExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreRepeatedWords = aIgnoreRepeatedWords->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreUpperCaseWordsExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreUpperCaseWords = aIgnoreUpperCaseWords->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreURLsExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreUrls = aIgnoreURLs->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aIgnoreWordsWithNumbersExecute(TObject *Sender)
{
  dxSpellChecker1->SpellingOptions->IgnoreWordsWithNumbers = aIgnoreWordsWithNumbers->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::aCheckSpellingExecute(TObject *Sender)
{
  dxSpellChecker1->CheckContainer(this, True);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::actDownloadsExecute(TObject *Sender)
{
  Browse(spDownloads);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::actSupportExecute(TObject *Sender)
{
  Browse(spSupport);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::actDXOnTheWebExecute(TObject *Sender)
{
  Browse(spStart);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::actProductsExecute(TObject *Sender)
{
  Browse(spProducts);
}
//---------------------------------------------------------------------------
void __fastcall TfmCV::actExitExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------