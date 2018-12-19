//---------------------------------------------------------------------------
#include <vcl\vcl.h>
#include <vcl\Sysutils.hpp>
#pragma hdrstop

#include "Unit1.h"
#include "Unit2.h"
//---------------------------------------------------------------------------
#pragma link "dxCore"
#pragma link "cxDrawTextUtils"
#pragma link "dxCntner"
#pragma link "dxDBInRw"
#pragma link "dxDBInsp"
#pragma link "dxInspct"
#pragma link "dxInspRw"
#pragma link "dxPSCore"
#pragma link "dxPSdxDBInsLnk"
#pragma link "dxPSdxInsLnk"
#pragma resource "*.dfm"
TfmMain *fmMain;
//---------------------------------------------------------------------------
__fastcall TfmMain::TfmMain(TComponent* Owner)
    : TForm(Owner)
{
  Screen->Cursors[1] = LoadCursor(HInstance, "DRAG_INSERT");
  Screen->Cursors[2] = LoadCursor(HInstance, "DRAG_ADDCHILD");
  Screen->Cursors[3] = LoadCursor(HInstance, "DRAG_ADD");
  Screen->Cursors[4] = LoadCursor(HInstance, "DRAG_KILL");
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::FormCreate(TObject *Sender)
{
  tProducts->DatabaseName = "..\\..\\Data\\";
  tProducts->Open();
  tContacts->DatabaseName = "..\\..\\Data\\";
  tContacts->Open();
  // check boxes
  FlagLoading = true;
  cbColumnSizing->Checked = dxDBInspector->Options.Contains(dioColumnSizing);
  cbEditing->Checked = dxDBInspector->Options.Contains(dioEditing);
  cbTabs->Checked = dxDBInspector->Options.Contains(dioTabs);
  cbTabThrough->Checked = dxDBInspector->Options.Contains(dioTabThrough);
  cbAutoWidth->Checked = dxDBInspector->Options.Contains(dioAutoWidth);
  cbCancelOnExit->Checked = dxDBInspector->Options.Contains(dioCancelOnExit);
  cbEnterThrough->Checked = dxDBInspector->Options.Contains(dioEnterThrough);
  cbNoCancel->Checked = dxDBInspector->Options.Contains(dioNoCancel);
  cbDrawEndEllipsis->Checked = dxDBInspector->Options.Contains(dioDrawEndEllipsis);
  FlagLoading = false;
  // other
  rgPaintStyle->ItemIndex = (Integer)dxDBInspector->PaintStyle;
  UpDown1->Position = (short)dxDBInspector->MinColumnWidth;
  Image1->ControlStyle = Image1->ControlStyle << csDisplayDragImage;
  cbShowRowHint->Checked = dxDBInspector->ShowRowHint;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::dxDBInspectorRow23EditButtonClick(TObject *Sender)
{
  //
  fmDialog = &TfmDialog(NULL);
  fmDialog->ShowModal();
  fmDialog->Free();
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cbColumnSizingClick(TObject *Sender)
{
  TCheckBox *CheckTmp;
  if (FlagLoading) return;
  // Change Options
  CheckTmp = (TCheckBox*)Sender;
  if (CheckTmp->Checked)
    dxDBInspector->Options = dxDBInspector->Options << TdxDBInspectorOption(CheckTmp->TabOrder - cbColumnSizing->TabOrder);
  else
    dxDBInspector->Options = dxDBInspector->Options >> TdxDBInspectorOption(CheckTmp->TabOrder - cbColumnSizing->TabOrder);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::edMinColumnWidthKeyDown(TObject *Sender,
      WORD &Key, TShiftState Shift)
{
  bool b;
  switch (Key)
  {
    case VK_RETURN: UpDown1Changing(NULL, b); break;
    case VK_ESCAPE: edMinColumnWidth->Text = IntToStr(dxDBInspector->MinColumnWidth); break;
  }

}
//---------------------------------------------------------------------------
void __fastcall TfmMain::rgPaintStyleClick(TObject *Sender)
{
  dxDBInspector->PaintStyle = TdxInspectorPaintStyle(rgPaintStyle->ItemIndex);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::UpDown1Changing(TObject *Sender,
      bool &AllowChange)
{
  UpDown1->OnChanging = NULL;
  dxDBInspector->MinColumnWidth = StrToInt(edMinColumnWidth->Text);
  UpDown1->Position = (short)dxDBInspector->MinColumnWidth;
  edMinColumnWidth->Text = IntToStr(dxDBInspector->MinColumnWidth);
  UpDown1->OnChanging = UpDown1Changing;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BColorClick(TObject *Sender)
{
   if (ColorDialog->Execute())
     dxDBInspector->Color = ColorDialog->Color;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BFontClick(TObject *Sender)
{
  if (FontDialog->Execute())
    dxDBInspector->Font->Assign(FontDialog->Font);
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BGridColorClick(TObject *Sender)
{
   if (ColorDialog->Execute())
     dxDBInspector->GridColor = ColorDialog->Color;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::dxDBInspectorDragOver(TObject *Sender,
      TObject *Source, int X, int Y, TDragState State, bool &Accept)
{
  TdxInspectorHitTest hTest;

  if (Source == dxDBInspector)
  {
    Accept = true;
    if (dxDBInspector->DragNode == NULL)
    {
      Accept = false;
      return;
    }
    hTest = dxDBInspector->GetHitTestInfoAt(X, Y);
    switch (hTest)
    {
      case ihtIndent :
      case ihtDisplayLabel:      
      case ihtButton : dxDBInspector->DragCursor = (TCursor)1; break;
      case ihtLabel :
      case ihtColumnEdge : dxDBInspector->DragCursor = (TCursor)2; break;
      case ihtNowhere : dxDBInspector->DragCursor = (TCursor)3; break;
    }
  }
  else
    Accept = false;
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::dxDBInspectorDragDrop(TObject *Sender,
      TObject *Source, int X, int Y)
{
  TdxInspectorNode *AItem, *AnItem;
  TdxInspectorNodeAttachMode AttachMode;
  TdxInspectorHitTest HT;

  if (Source == dxDBInspector)
  {
    HT = dxDBInspector->GetHitTestInfoAt(X, Y);
    AnItem = dxDBInspector->GetNodeAt(X, Y);
    if ((HT == Dxinspct::ihtNowhere) || (HT == Dxinspct::ihtColumnEdge) || (HT == Dxinspct::ihtIndent) ||
        (HT == Dxinspct::ihtButton) || (HT == Dxinspct::ihtLabel) || (HT == Dxinspct::ihtDisplayLabel))
    {
      AttachMode = inaAddChild;
      if (HT == Dxinspct::ihtLabel)
        AttachMode = inaAddChild;
      else if (HT == ihtNowhere)
      {
        AnItem = dxDBInspector->Items[0];
        AttachMode = inaAdd;
      }
      else
        if ((HT == Dxinspct::ihtIndent) || (HT == Dxinspct::ihtButton)  || (HT == Dxinspct::ihtDisplayLabel)) AttachMode = inaInsert;
      AItem = dxDBInspector->DragNode;
      // move rows in DBInspector
      if ((AItem != NULL) && (AnItem != NULL))
      {
        AItem->MoveTo(AnItem, AttachMode);
      }
    }
  }

}
//---------------------------------------------------------------------------
void __fastcall TfmMain::cbDragDropClick(TObject *Sender)
{
  if (cbDragDrop->Checked)
    dxDBInspector->DragMode = dmAutomatic;
  else dxDBInspector->DragMode = dmManual;

}
//---------------------------------------------------------------------------
void __fastcall TfmMain::Image1DragOver(TObject *Sender, TObject *Source,
      int X, int Y, TDragState State, bool &Accept)
{
  Accept = true;
  dxDBInspector->DragCursor = (TCursor)4;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::Image1DragDrop(TObject *Sender, TObject *Source,
      int X, int Y)
{
  if (Source == dxDBInspector)
  {
    if (dxDBInspector->DragNode != NULL)
      dxDBInspector->DragNode->Free();
  }
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::dxDBInspectorDrawCaption(TdxInspectorRow *Sender,
      TCanvas *ACanvas, TRect &ARect, AnsiString &AText, TFont *AFont,
      TColor &AColor, bool &ADone)
{
  CustomDraw(Sender, AColor, AFont);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cbCustomDrawClick(TObject *Sender)
{
  dxDBInspector->Refresh();
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::DBGrid1ColEnter(TObject *Sender)
{
  dxDBInspector->FocusedField = DBGrid1->SelectedField;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cbFlatClick(TObject *Sender)
{
  dxDBInspector->Flat = !dxDBInspector->Flat;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::cbShowRowHintClick(TObject *Sender)
{
  dxDBInspector->ShowRowHint = cbShowRowHint->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::tContactsCalcFields(TDataSet *DataSet)
{
  tContactsCustName->Value = tContactsFirstName->Value + ' ' + tContactsLastName->Value;     
}
//---------------------------------------------------------------------------


void __fastcall TfmMain::BDesignClick(TObject *Sender)
{
  dxComponentPrinter1->DesignReport(NULL);    
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BPreviewClick(TObject *Sender)
{
  dxComponentPrinter1->Preview(true,NULL);    
}
//---------------------------------------------------------------------------
void __fastcall TfmMain::BPrintClick(TObject *Sender)
{
  dxComponentPrinter1->Print(true,NULL,NULL);
}
//---------------------------------------------------------------------------

void __fastcall TfmMain::dxComponentPrinter1Link1CustomDrawCaption(
      TBasedxReportLink *Sender, TdxInspectorRow *ARow, TCanvas *ACanvas,
      TRect &ABoundsRect, TRect &AClientRect, AnsiString &AText,
      TColor &AColor, TFont *AFont, TcxTextAlignX &ATextAlignX,
      TcxTextAlignY &ATextAlignY, bool &ADone)
{
  CustomDraw(ARow, AColor, AFont);
}
void __fastcall TfmMain::CustomDraw(TdxInspectorRow *Sender, TColor &AColor,
          TFont *AFont)
{
  if (!cbCustomDraw->Checked) return;
  if (Sender->Node->Count > 0)
  {
    AFont->Style = AFont->Style << fsBold;
    if (Sender->Node->Focused)
      AFont->Color = clBlue;
    AColor = clAqua;
  }
  else
  if (Sender->Node->Parent != NULL)
  {
    AFont->Style = AFont->Style << fsItalic;
    AColor = clLime;
    if (Sender->Node->Focused)
      AFont->Color = clBlue;
  }
  else
    if (Sender->Node->Focused)
    if (dxDBInspector->PaintStyle != ipsSimple)
      AFont->Color = clNavy;
}

//---------------------------------------------------------------------------

