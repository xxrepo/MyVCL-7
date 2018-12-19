//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdlib.h>
#pragma hdrstop
#include "FeaturesDemoMain.h"
#include "FeatureChild.h"
#include <cxSSData.hpp>
#include <cxSSUtils.hpp>
#include <cxSSRes.hpp>
#include <winuser.h>
#include "extctrls.hpp"
#include <assert.h>
#include "FeatureModify.h"
//---------------------------------------------------------------------------

#pragma package(smart_init)
#pragma resource "*.dfm"

TFeaturesMainForm *FeaturesMainForm;
//---------------------------------------------------------------------------
__fastcall TFeaturesMainForm::TFeaturesMainForm(TComponent* Owner)
  : TForm(Owner)
{
  TForm::TForm(Owner);
  cbxFont->Items->Assign(Screen->Fonts);
  cbxFont->Text = "Tahoma";
  cbxSize->Text = "10";
  FSummaryItemHeight = 10;
  #if __BORLANDC__ >= 0x0560
    pmRedo->AutoHotkeys = maManual;
    pmUndo->AutoHotkeys = maManual;
  #endif
}

//---------------------------------------------------------------------------
void __fastcall TFeaturesMainForm::NewSheet(String SheetName)
{
  TFeatureChildForm* Child;
	Child = new TFeatureChildForm(this);
  if (SheetName == "")
  	Child->Caption = "WorkBook - " + IntToStr(this->MDIChildCount);
  else
    Child->Caption = ExtractFileName(SheetName);
  Child->cxSpreadSheetBook->OnSetSelection = cxSpreadBookSetSelection;
  Child->SetSelection();
}

void __fastcall TFeaturesMainForm::actNewExecute(TObject *Sender)
{
  NewSheet("");
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actCloseWorkBookExecute(TObject *Sender)
{
  ActiveMDIChild->Close();
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actExitExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::SaveSpreadSheet1Click(TObject *Sender)
{
  String FileName;
  if(OpenDialog->Execute())
  {
    FileName = ChangeFileExt(OpenDialog->FileName, ".xls");
    SheetBook->SaveToFile(FileName);
    ActiveMDIChild->Caption = FileName;
  }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actAutomaticCalcExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->AutoRecalc = ((TCustomAction*)Sender)->Checked;
  if (SheetBook->AutoRecalc)
      SheetBook->Recalc();
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actRecalcFormulasExecute(TObject *Sender)
{
  CheckMenuItem(Sender); 
  SheetBook->Recalc();
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actCopyExecute(TObject *Sender)
{
  TRect rec;
  rec = SheetBook->ActiveSheet->SelectionRect;
  SheetBook->ActiveSheet->Copy(rec, false);
}
//---------------------------------------------------------------------------


void __fastcall TFeaturesMainForm::AlwaysEnabled(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = true;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actCutExecute(TObject *Sender)
{
  TRect rec;
  rec = SheetBook->SelectionRect;
  SheetBook->ActiveSheet->Copy(rec, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actPasteExecute(TObject *Sender)
{
  TRect rec;
  rec = SheetBook->SelectionRect;
  SheetBook->ActiveSheet->Paste(Point(rec.left, rec.top));
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::edtCellEditChange(TObject *Sender)
{
  if (FIsUpdate) return;
  TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(ActiveSpreadSheet->SelectionRect.Left,
    ActiveSpreadSheet->SelectionRect.Top);
  try {
    CellObject->SetCellText(((TEdit*)Sender)->Text, false);
  }
  __finally {
    delete CellObject;
  }
  SheetBook->UpdateControl();
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::edtCellEditExit(TObject *Sender)
{
  TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(ActiveSpreadSheet->SelectionRect.Left,
    ActiveSpreadSheet->SelectionRect.Top);
  try {
    CellObject->Text = CellObject->Text;
  }
  __finally {
    delete CellObject;
  }
  SheetBook->UpdateControl();
  SheetBook->SetFocus();
  cxSpreadBookSetSelection(this, ActiveSpreadSheet);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::SetStates()
{
  TFontStyles AStyle;
  TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(ActiveSpreadSheet->SelectionRect.Left,
    ActiveSpreadSheet->SelectionRect.Top);
    try
    {
      tbLeftAlign->Down =  (CellObject->DisplayTextAlignment == dtaLEFT) ||
        (CellObject->DisplayTextAlignment == dtaFILL) || (CellObject->DisplayTextAlignment == dtaJUSTIFY);
      tbCenterAlign->Down = CellObject->DisplayTextAlignment == dtaCENTER;
      tbRightAlign->Down = CellObject->DisplayTextAlignment == dtaRIGHT;

      AStyle = CellObject->Style->Font->Style;

      tbBold->Down = AStyle.Contains(fsBold);
      tbItalic->Down = AStyle.Contains(fsItalic);
      tbUnderline->Down = AStyle.Contains(fsUnderline);
      tbStrikeOut->Down = AStyle.Contains(fsStrikeOut);

      edtCellEdit->Text = CellObject->Text;
      cbxFont->Text = CellObject->Style->Font->Name;
      cbxSize->Text = IntToStr(CellObject->Style->Font->Size);
    }
    __finally
    {
      delete CellObject;
    }
    {
      actBeveledLookandFeel->Checked = SheetBook->PainterType == ptOfficeXPStyle;
      actBufferedpaint->Checked = SheetBook->BufferedPaint;
      actShowcaptions->Checked = SheetBook->ShowCaptionBar;
      actShowgrid->Checked = SheetBook->ShowGrid;
      actShowheaders->Checked = SheetBook->ShowHeaders;
      actShowformulas->Checked = SheetBook->ShowFormulas;
      actR1C1Referencestyle->Checked = SheetBook->R1C1ReferenceStyle;
      actAutomaticCalc->Checked = SheetBook->AutoRecalc;
    }
}
String __fastcall TFeaturesMainForm::GetCellText(TRect SelectionRect, bool R1C1)
{
  return SheetBook->CellsNameByRef(SheetBook->ActivePage, SelectionRect, true);
}

void __fastcall TFeaturesMainForm::cxSpreadBookSetSelection(TObject *Sender, TcxSSBookSheet *ASheet)
{
  try {
    FIsUpdate = true;
    SetStates();
    pnCellsRect->Caption = GetCellText(ASheet->SelectionRect, SheetBook->R1C1ReferenceStyle);
    }
  __finally{
    FIsUpdate = False;
   }
}

void __fastcall TFeaturesMainForm::cbxSizeKeyPress(TObject *Sender, char &Key)
{
  if (Key == 13)
    _WINUSER_::SetFocus(SheetBook->Handle);
  else
    if ((Key < 48) || (Key > 58))
      Key = 0;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actBeveledLookandFeelExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->PainterType = (TcxSSPainterType)((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actBufferedpaintExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->BufferedPaint = ((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowcaptionsExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->ShowCaptionBar = ((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowgridExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->ShowGrid = ((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowheadersExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->ShowHeaders = ((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowformulasExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->ShowFormulas = ((TCustomAction*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actR1C1ReferencestyleExecute(TObject *Sender)
{
  if (IsUpdate) return;
  CheckMenuItem(Sender);
  SheetBook->R1C1ReferenceStyle = ((TCustomAction*)Sender)->Checked;
  pnCellsRect->Caption = GetCellText(ActiveSpreadSheet->SelectionRect, SheetBook->R1C1ReferenceStyle);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::SetValue(TStyleValues AValueSet, TFontStyles AStyles, TStyleValue AFlag, TFontStyle ANeedStyle,
    TFontStyles *ASetStyles)
{
  if (AValueSet.Contains(AFlag)) {
    if (AStyles.Contains(ANeedStyle))
      ASetStyles->operator <<(ANeedStyle);
    else
      ASetStyles->operator >>(ANeedStyle);
  }
}

void __fastcall TFeaturesMainForm::SetCellsStyle(TStyleValues AValuesSet, TcxHorzTextAlign AAlign,
  int AFontSize, String AFontName, TFontStyles AStyles){
  TFontStyles AStyle;
  int i, j;
  try {
    SheetBook->BeginUpdate();
    int lf = ActiveSpreadSheet->SelectionRect.left;
    int rg = ActiveSpreadSheet->SelectionRect.right;
    int tp = ActiveSpreadSheet->SelectionRect.top;
    int bt = ActiveSpreadSheet->SelectionRect.bottom;
    TcxSSCellObject *CellObject;
      for (i = lf; i <= rg; i++)
        for (j = tp; j <= bt; j++) {
          CellObject = ActiveSpreadSheet->GetCellObject(i, j);
          try {
              AStyle = CellObject->Style->Font->Style;
              if (AValuesSet.Contains(svFontName))
                CellObject->Style->Font->Name = AFontName;
              if (AValuesSet.Contains(svSize))
                CellObject->Style->Font->Size = AFontSize;
              if (AValuesSet.Contains(svAlign))
                CellObject->Style->HorzTextAlign = AAlign;
              SetValue(AValuesSet, AStyles, svBold, fsBold, &AStyle);
              SetValue(AValuesSet, AStyles, svItalic, fsItalic, &AStyle);
              SetValue(AValuesSet, AStyles, svUnderline, fsUnderline, &AStyle);
              SetValue(AValuesSet, AStyles, svStrikeOut, fsStrikeOut, &AStyle);
              CellObject->Style->Font->Style = AStyle;
            }
          __finally {
          delete CellObject;
          }
        }
  }
  __finally
  {
    SheetBook->EndUpdate();
    SheetBook->UpdateControl();
  }
}

void __fastcall TFeaturesMainForm::actCellLeftAlignExecute(TObject *Sender)
{
  SetCellsStyle(TStyleValues() << svAlign, haLEFT, 0, cbxFont->Text, TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actCellRightAlignExecute(TObject *Sender)
{
  SetCellsStyle(TStyleValues() << svAlign, haRIGHT, 0, cbxFont->Text, TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actBoldExecute(TObject *Sender)
{
  if (tbBold->Down){
    SetCellsStyle(TStyleValues() << svBold, haGENERAL, 0, "", TFontStyles() << fsBold);
  }
  else
    SetCellsStyle(TStyleValues() << svBold, haGENERAL, 0, "", TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actFontSizeExecute(TObject *Sender)
{
  int ASize;
  if (Cxssutils::cxTryStrToInt(cbxSize->Text, ASize)) 
    SetCellsStyle(TStyleValues() << svSize, haGENERAL, ASize, cbxFont->Text, TFontStyles());
}

void __fastcall TFeaturesMainForm::actCellCenterAlignExecute(TObject *Sender)
{
  SetCellsStyle(TStyleValues() << svAlign, haCENTER, 0, cbxFont->Text, TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actMergeCellsExecute(TObject *Sender)
{
  ActiveSpreadSheet->SetMergedState(ActiveSpreadSheet->SelectionRect, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actSplitCellsExecute(TObject *Sender)
{
  ActiveSpreadSheet->SetMergedState(ActiveSpreadSheet->SelectionRect, false);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::CalculateSummary(int AType)
{
  String S;
  TRect ARect;
  String AFunc[5] = {"Sum", "Average", "Count", "Max", "Min"};
  try {
    ARect = SheetBook->SelectionRect;
    S = SheetBook->CellsNameByRef(SheetBook->ActivePage, ARect, false);
    TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(ARect.Right, ARect.Bottom + 1);
    try {
      CellObject->Text = "=" + AFunc[AType] + "(" + S + ")";
    }
    __finally {
      delete CellObject;
     }
  }
  __finally {
    SheetBook->UpdateControl();
    }
}

void __fastcall TFeaturesMainForm::actSummaryExecute(TObject *Sender)
{
  CalculateSummary(((TComponent*)Sender)->Tag);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actRowExecute(TObject *Sender)
{
   ActiveSpreadSheet->InsertCells(ActiveSpreadSheet->SelectionRect, msAllRow);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actColumnExecute(TObject *Sender)
{
   ActiveSpreadSheet->InsertCells(ActiveSpreadSheet->SelectionRect, msAllCol);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actSheetExecute(TObject *Sender)
{
  SheetBook->PageCount++;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actFontExecute(TObject *Sender)
{
  SetCellsStyle(TStyleValues() << svFontName, haGENERAL, 0, cbxFont->Text, TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actSortAscendingExecute(TObject *Sender)
{
  TcxSortType *SortType;
  SortType = new TcxSortType;
  *SortType = Cxsstypes::stAscending;
  if (((TComponent*)Sender)->Tag)
    *SortType = Cxsstypes::stDescending;
  try{
    ActiveSpreadSheet->Sort(ActiveSpreadSheet->SelectionRect, SortType, 0);
  }
  __finally {
    delete SortType;
  }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actStrikeOutExecute(TObject *Sender)
{
  if (tbStrikeOut->Down){
    SetCellsStyle(TStyleValues() << svStrikeOut, haGENERAL, 0, "", TFontStyles() << fsStrikeOut);
  }
  else
    SetCellsStyle(TStyleValues() << svStrikeOut, haGENERAL, 0, "", TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actUnderlineExecute(TObject *Sender)
{
  if (tbUnderline->Down){
    SetCellsStyle(TStyleValues() << svUnderline, haGENERAL, 0, "", TFontStyles() << fsUnderline);
  }
  else
    SetCellsStyle(TStyleValues() << svUnderline, haGENERAL, 0, "", TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actItalicExecute(TObject *Sender)
{
  if (tbItalic->Down){
    SetCellsStyle(TStyleValues() << svItalic, haGENERAL, 0, "", TFontStyles() << fsItalic);
  }
  else
    SetCellsStyle(TStyleValues() << svItalic, haGENERAL, 0, "", TFontStyles());
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowRowExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, false, true, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actHideRowExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, false, true, false);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actHideColExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, true, false, false);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowColExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, true, false, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actFormatCellsExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->FormatCells(ActiveSpreadSheet->SelectionRect);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actHideCellsExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, true, true, false);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actShowCellsExecute(TObject *Sender)
{
  if (IsUpdate) return;
  ActiveSpreadSheet->SetVisibleState(ActiveSpreadSheet->SelectionRect, true, true, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actCellsExecute(TObject *Sender)
{
  TFeatureModifyForm *Modify;
  Modify = new TFeatureModifyForm(this);
     try {
      div_t sHeight, mHeight, sWidth, mWidth;
      sHeight = div(SheetBook->Height, 2);
      mHeight = div(Modify->Height, 2);
      Modify->Top = (SheetBook->Top + sHeight.quot) + mHeight.quot;

      sWidth = div(SheetBook->Width, 2);
      mWidth = div(Modify->Width, 2);
      Modify->Left = (SheetBook->Left + sWidth.quot) + mWidth.quot;
      TcxSSModifyType ModifyType = mtDelete;
      if (((TComponent*)Sender)->Tag)
        ModifyType = mtInsert;
       if (Modify->Execute(ModifyType))
         if (ModifyType == mtInsert)
           ActiveSpreadSheet->InsertCells(ActiveSpreadSheet->SelectionRect, Modify->Modify);
          else
            ActiveSpreadSheet->DeleteCells(ActiveSpreadSheet->SelectionRect, Modify->Modify);
     }
     __finally {
       Modify->Free();
     }
}
//---------------------------------------------------------------------------
void __fastcall TFeaturesMainForm::actOpenSpreadSheetExecute(TObject *Sender)
{
  if (OpenDialog->Execute())
  {
    NewSheet(OpenDialog->FileName);
    try {
      try {
        SheetBook->LoadFromFile(OpenDialog->FileName);
      }
      catch (Exception &err) {
        Application->ShowException(&err);
        ActiveMDIChild->Close();
      }
    }
    __finally {
      actShowgrid->Checked = SheetBook->ShowGrid;
    }
  }
}
//---------------------------------------------------------------------------
void __fastcall TFeaturesMainForm::actSaveSpeadSheetExecute(TObject *Sender)
{
  String AFileName;
  if (SaveDialog->Execute())
  {
    AFileName = ChangeFileExt(SaveDialog->FileName, ".xls");
    SheetBook->SaveToFile(AFileName);
    ActiveMDIChild->Caption = ExtractFileName(AFileName);
  }
}

void __fastcall TFeaturesMainForm::edtCellEditKeyPress(TObject *Sender, char &Key)
{
  if (Key == 13)
  {
    _WINUSER_::SetFocus(SheetBook->Handle);
    edtCellEditExit(Sender);
  }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::SetHorzStyle(TRect ARect, int ARow, TcxSSEdgeLineStyle AStyle)
{
  if (AStyle != lsNone)
  {
    for(int i = ARect.Left; i <= ARect.Right; i++)
    {
      TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(i, ARow);
      try {
        CellObject->Style->Borders->Edges[eTop]->Style = AStyle;
      }
    __finally {
        delete CellObject;
      }
    }
  }
}
void __fastcall TFeaturesMainForm::SetVertStyle(TRect ARect, int ACol, TcxSSEdgeLineStyle AStyle)
{
    if (AStyle != lsNone)
      for (int i = ARect.Top; i <= ARect.Bottom; i++)
      {
        TcxSSCellObject *CellObject = ActiveSpreadSheet->GetCellObject(ACol, i);
        try {
          CellObject->Style->Borders->Edges[eLeft]->Style = AStyle;
        }
        __finally {
          delete CellObject;
        }
      }
}

void __fastcall TFeaturesMainForm::MeasureItem(TObject *Sender, TCanvas *ACanvas,
      int &Width, int &Height)
{
  Width = 14;
  Height = 24;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::DrawItem(TObject *Sender, TCanvas *ACanvas,
      TRect &ARect, bool Selected)
{
  if (Selected)
    ACanvas->Brush->Color = clHighlight;
  else
    ACanvas->Brush->Color = clMenu;
  ACanvas->Brush->Style = bsSolid;
  ACanvas->FillRect(ARect);
  imgBordersImages->Draw(ACanvas, ARect.Left + 2, ARect.Top + 2, ((TMenuItem*)Sender)->ImageIndex, true);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::BordersClick(TObject *Sender)
{
  TcxSSEdgeLineStyle AOutBorders[12][4]  =
    {{lsDefault, lsDefault, lsDefault, lsDefault},
     {lsNone, lsNone, lsNone, lsDouble},
     {lsNone, lsThin, lsNone, lsThick},
     {lsNone, lsNone, lsNone, lsThin},
     {lsNone, lsNone, lsNone, lsThick},
     {lsThin, lsThin, lsThin, lsThin},
     {lsThin, lsNone, lsNone, lsNone},
     {lsNone, lsThin, lsNone, lsThin},
     {lsThin, lsThin, lsThin, lsThin},
     {lsNone, lsNone, lsThin, lsNone},
     {lsNone, lsThin, lsNone, lsDouble},
     {lsThick, lsThick, lsThick, lsThick}};

  TcxSSEdgeLineStyle AInBorders[2] = {lsDefault, lsThin};
  TRect ARect;
  SheetBook->BeginUpdate();
  try {
    ARect = ActiveSpreadSheet->SelectionRect;
    int AKey = ((TMenuItem*)Sender)->ImageIndex;
    SetVertStyle(ARect, ARect.Left, AOutBorders[AKey][eLeft]);
    SetHorzStyle(ARect, ARect.Top, AOutBorders[AKey][eTop]);
    SetVertStyle(ARect, ARect.Right + 1, AOutBorders[AKey][eRight]);
    SetHorzStyle(ARect, ARect.Bottom + 1, AOutBorders[AKey][eBottom]);
    for (int i = ARect.Top + 1; i <= ARect.Bottom; i++)
      SetHorzStyle(ARect, i, AInBorders[AKey == 5]);
    for (int i = ARect.Left + 1; i <= ARect.Right; i++)
      SetVertStyle(ARect, i, AInBorders[AKey == 5]);
  }
  __finally{
    SheetBook->EndUpdate();
    SheetBook->UpdateControl();
  }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actSaveAsExecute(TObject *Sender)
{
  if (SaveDialog->Execute()) {
    SheetBook->SaveToFile(SaveDialog->FileName);
    }
}
//---------------------------------------------------------------------------
void __fastcall TFeaturesMainForm::tbBorderStyleClick(TObject *Sender)
{
  TRect ARect;
  TPoint APoint;
  ARect = tbBorderStyle->BoundsRect;
  ARect.Left = tbsFormatting->ClientToScreen(Point(ARect.Left, ARect.Top)).x;
  ARect.Top = tbsFormatting->ClientToScreen(Point(ARect.Left, ARect.Top)).y;

  ARect.Right = tbsFormatting->ClientToScreen(Point(ARect.Right, ARect.Bottom)).x;
  ARect.Bottom = tbsFormatting->ClientToScreen(Point(ARect.Right, ARect.Bottom)).y;

  tbBorderStyle->Down = true;
  pmBorders->Popup(ARect.Left, ARect.Bottom);
  tbBorderStyle->Down = false;
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::cbxFontKeyPress(TObject *Sender, char &Key)
{
  if (Key == 13)
    _WINUSER_::SetFocus(SheetBook->Handle);
}
//---------------------------------------------------------------------------


void __fastcall TFeaturesMainForm::pmUndoPopup(TObject *Sender)
{
  while (((TPopupMenu*)Sender)->Items->Count > 0)
    ((TPopupMenu*)Sender)->Items->Delete(0);
  TMenuItem *Item;
  for(int i=0; i <= SheetBook->History->UndoActions->Count; i++)
  {
     Item = new TMenuItem(static_cast<TPopupMenu*>(Sender));
     if (i < SheetBook->History->UndoActions->Count)
       Item->Caption = SheetBook->History->UndoActions->Item[i]->Description;
     else
       Item->Caption = " ";
     Item->OnMeasureItem = URMeasureItem;
     Item->OnDrawItem = URDrawItem;
     Item->OnClick = UndoItemClick;
     static_cast<TPopupMenu*>(Sender)->Items->Add(Item);
  }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::pmRedoPopup(TObject *Sender)
{
  while (((TPopupMenu*)Sender)->Items->Count > 0)
    ((TPopupMenu*)Sender)->Items->Delete(0);

  TMenuItem *Item;
   for(int i=0; i <= SheetBook->History->RedoActions->Count; i++)
   {
      Item = new TMenuItem((TComponent*)Sender);
      if (i < SheetBook->History->RedoActions->Count)
        Item->Caption = SheetBook->History->RedoActions->Item[i]->Description;
      else
        Item->Caption = " ";
      Item->OnMeasureItem = URMeasureItem;
      Item->OnDrawItem = URDrawItem;
      Item->OnClick = RedoItemClick;
      ((TPopupMenu*)Sender)->Items->Add(Item);
   }
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::URMeasureItem(TObject *Sender,
      TCanvas *ACanvas, int &Width, int &Height)
{
  Width = 90;
  if (((TMenuItem*)Sender)->MenuIndex == ((TPopupMenu*)((TComponent*)Sender)->Owner)->Items->Count - 1)
    Height = ACanvas->TextHeight("W") + FSummaryItemHeight; else
  Height = ACanvas->TextHeight("W");
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::URDrawItem(TObject *Sender,
      TCanvas *ACanvas, const TRect &ARect, bool Selected)
{
  String Str;
  if (((TComponent*)Sender)->Owner->Name == "pmUndo")
    Str = "Undo %d Actions";
  else
    Str = "Redo %d Actions";
  DrawUndoRedoItem((TPopupMenu*)((TComponent*)Sender)->Owner, (TMenuItem*)Sender, ACanvas, ARect, Selected, Str);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::UndoItemClick(TObject *Sender)
{
  if (((TMenuItem*)Sender)->MenuIndex < ((TPopupMenu*)((TMenuItem*)Sender)->Owner)->Items->Count - 1)
    SheetBook->History->Undo(((TMenuItem*)Sender)->MenuIndex + 1);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::RedoItemClick(TObject *Sender)
{
  if (((TMenuItem*)Sender)->MenuIndex < ((TPopupMenu*)((TMenuItem*)Sender)->Owner)->Items->Count - 1)
    SheetBook->History->Redo(((TMenuItem*)Sender)->MenuIndex + 1);
}
//---------------------------------------------------------------------------

void __fastcall UpdatePreviousItems(TPopupMenu *APopupMenu, TCanvas *ACanvas, const TRect ARect, int AIndex)
{
  TRect Rec;
  Rec = ARect;
  String Str;
  int i;
  for(i = AIndex - 1; i >= 0; i--){
    Rec = Rect(Rec.Left, ACanvas->TextHeight('W') * i, Rec.Right, ACanvas->TextHeight('W') * (i + 1));
    ACanvas->Brush->Color = clHighlight;
    ACanvas->Brush->Style = bsSolid;
    ACanvas->FillRect(Rec);
    ACanvas->TextRect(Rec, Rec.Left, Rec.Top, APopupMenu->Items[0].Items[i]->Caption);
  }
}
void __fastcall UpdateNextItems(TPopupMenu *APopupMenu, TCanvas *ACanvas, TRect ARect, int Index)
{
  TRect Rec;
  Rec = ARect;
  String Str;
  for (int i=Index+1; i <= APopupMenu->Items->Count - 2; i++){
    Rec = Rect(Rec.Left, Rec.Top + ACanvas->TextHeight('W'), Rec.Right, Rec.Bottom + ACanvas->TextHeight('W'));
    ACanvas->Brush->Color = clMenu;
    ACanvas->Brush->Style = bsSolid;
    ACanvas->FillRect(Rec);
    ACanvas->TextRect(Rec, Rec.Left, Rec.Top, APopupMenu->Items[0].Items[i]->Caption);
  }
}
void __fastcall TFeaturesMainForm::DrawActionsCount(TPopupMenu *APopupMenu, TCanvas *ACanvas, TMenuItem *ASender, const TRect ARect, String AInfoStr)
{
  TRect Rec;
  int ActionsCount, Btn;
  String Str;
  if ((APopupMenu->Items->Count - 1) == ASender->MenuIndex)
  {
    Btn = (APopupMenu->Items->Count - 1) * ACanvas->TextHeight('W') - 1 + (ARect.Bottom -  ARect.Top);
    ActionsCount = ASender->MenuIndex;
  } else
  {
    Btn = (APopupMenu->Items->Count - 1) * ACanvas->TextHeight('W') - 1 + FSummaryItemHeight + (ARect.Bottom -  ARect.Top);
    ActionsCount = ASender->MenuIndex + 1;
  }
  Rec = Rect(ARect.Left + 1, (APopupMenu->Items->Count - 1) * ACanvas->TextHeight('W') + 1,
    ARect.Right - 1, Btn);

  ACanvas->Brush->Color = clMenu;
  ACanvas->Brush->Style = bsSolid;
  ACanvas->FillRect(Rec);

  Str = Format(AInfoStr, ARRAYOFCONST(((int)ActionsCount)));
  div_t lft = div(Rec.Left + Rec.Right, 2), tw = div(ACanvas->TextWidth(Str), 2);
  int leftpar = lft.quot - tw.quot;
  div_t tp = div(Rec.Top + Rec.Bottom, 2), th = div(ACanvas->TextHeight(Str), 2);
  int toppar = tp.quot - th.quot;
  Frame3D(ACanvas, Rec, clBtnShadow, clBtnHighlight, 1);
  ACanvas->TextRect(Rec, leftpar, toppar, Str);
}

void __fastcall TFeaturesMainForm::DrawUndoRedoItem(TPopupMenu *APopupMenu, TMenuItem *ASender, TCanvas *ACanvas, const TRect ARect, bool Selected, String AInfoStr)
{
  if (ASender->MenuIndex == (APopupMenu->Items->Count - 1)) {
    ACanvas->Brush->Color = clMenu;
    ACanvas->Brush->Style = bsSolid;
    ACanvas->FillRect(ARect);
    if (Selected){
      UpdatePreviousItems(APopupMenu, ACanvas, ARect, ASender->MenuIndex);
    }
  }
  else{
    if (Selected){
      ACanvas->Brush->Color = clHighlight;
      ACanvas->Brush->Style = bsSolid;
      ACanvas->FillRect(Rect(ARect.Left, ARect.Top, ARect.Right, ARect.Bottom));
      UpdatePreviousItems(APopupMenu, ACanvas, ARect, ASender->MenuIndex);
    }
    else {
      ACanvas->Brush->Color = clMenu;
      ACanvas->Brush->Style = bsSolid;
      ACanvas->FillRect(ARect);
      UpdateNextItems(APopupMenu, ACanvas, ARect, ASender->MenuIndex);
    }
    ACanvas->TextRect(ARect, ARect.Left, ARect.Top, ASender->Caption);
  }
  DrawActionsCount(APopupMenu, ACanvas, ASender, ARect, AInfoStr);
}

void __fastcall TFeaturesMainForm::actHistory(TObject *Sender)
{
  ((TCustomAction*)(Sender))->Enabled = (SheetBook->History->UndoActions->Count > 0);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actRedoUpdate(TObject *Sender)
{
  ((TCustomAction*)(Sender))->Enabled = (SheetBook->History->RedoActions->Count > 0);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actUndoExecute(TObject *Sender)
{
  SheetBook->History->Undo(1);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::actRedoExecute(TObject *Sender)
{
  SheetBook->History->Redo(1);
}
//---------------------------------------------------------------------------

void __fastcall TFeaturesMainForm::IsEditorMode(TObject *Sender)
{
  ((TCustomAction*)Sender)->Enabled = !((TFeatureChildForm*)ActiveMDIChild)->IsEditorMode;
}
//---------------------------------------------------------------------------

 