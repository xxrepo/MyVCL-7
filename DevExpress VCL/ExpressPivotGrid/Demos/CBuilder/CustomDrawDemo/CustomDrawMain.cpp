//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CustomDrawMain.h"
//---------------------------------------------------------------------------
#include "cxGraphics.hpp"

#pragma package(smart_init)
#pragma link "cxLookAndFeels"
#pragma link "DemoBasicMain"
#pragma link "cxControls"
#pragma link "cxCustomPivotGrid"
#pragma link "cxDBPivotGrid"
#pragma link "cxClasses"
#pragma link "cxCustomData"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TfrmCustomDraw *frmCustomDraw;

// we do not use dxOffice11.FillGradientRect because of the problem in C++Builder during linking
void __fastcall FillGradientRectEx(TcxCanvas* ACanvas, const TRect &ARect, TColor AColor1, TColor AColor2, bool AHorizontal)
{
  int AFirstOffset, ALastOffset, APixelSteps, AColorStepsR, AColorStepsG, AColorStepsB;
  TRect R = ARect;

  if (AHorizontal) {
    AFirstOffset = ARect.Left;
    ALastOffset = ARect.Right - 1;
  }
  else
  {
    AFirstOffset = ARect.Top;
    ALastOffset = ARect.Bottom - 1;
  }
  APixelSteps = ALastOffset - AFirstOffset;
  AColorStepsR = GetRValue(AColor2) - GetRValue(AColor1);
  AColorStepsG = GetGValue(AColor2) - GetGValue(AColor1);
  AColorStepsB = GetBValue(AColor2) - GetBValue(AColor1);

  for (int I = AFirstOffset; I <= ALastOffset; I++) {
    if (AHorizontal) {
      R.Left = I;
      R.Right = I + 1;
    }
    else
    {
      R.Top = I;
      R.Bottom = I + 1;
    }
    ACanvas->Brush->Color = (TColor)RGB(
      GetRValue(AColor1) + MulDiv(I - AFirstOffset, AColorStepsR, APixelSteps),
      GetGValue(AColor1) + MulDiv(I - AFirstOffset, AColorStepsG, APixelSteps),
      GetBValue(AColor1) + MulDiv(I - AFirstOffset, AColorStepsB, APixelSteps));
    ACanvas->FillRect(R, NULL, False);
  }
}


//---------------------------------------------------------------------------
__fastcall TfrmCustomDraw::TfrmCustomDraw(TComponent* Owner)
        : TfrmDemoBaisicMain(Owner)
{
}

TcxCustomPivotGrid* __fastcall TfrmCustomDraw::PivotGrid()
{
  return DBPivotGrid;
}

//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::DrawingClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  switch (((TMenuItem*)Sender)->Tag){
    case 0: {
      if (((TMenuItem*)Sender)->Checked) {
        DBPivotGrid->OnCustomDrawPart = DBPivotGridCustomDrawPart;
      }
      else {
        DBPivotGrid->OnCustomDrawPart = NULL;
      }
    break;
    }
    case 1: {
      if (((TMenuItem*)Sender)->Checked) {
        DBPivotGrid->OnCustomDrawCell = DBPivotGridCustomDrawCell;
      }
      else {
        DBPivotGrid->OnCustomDrawCell = NULL;
      }
    break;
    }
    case 2: {
      if (((TMenuItem*)Sender)->Checked) {
        DBPivotGrid->OnCustomDrawFieldHeader = DBPivotGridCustomDrawFieldHeader;
      }
      else {
        DBPivotGrid->OnCustomDrawFieldHeader = NULL;
      }
    break;
    }
    case 3: {
      if (((TMenuItem*)Sender)->Checked) {
        DBPivotGrid->OnCustomDrawColumnHeader = DBPivotGridCustomDrawColumnHeader;
        DBPivotGrid->OnCustomDrawRowHeader = DBPivotGridCustomDrawRowHeader;
      }
      else {
        DBPivotGrid->OnCustomDrawColumnHeader = NULL;
        DBPivotGrid->OnCustomDrawRowHeader = NULL;
      }
    }
  }
  PivotGrid()->LayoutChanged();
}
//---------------------------------------------------------------------------


void __fastcall TfrmCustomDraw::DBPivotGridCustomDrawColumnHeader(
      TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
      TcxPivotGridHeaderCellViewInfo *AViewInfo, bool &ADone)
{
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, clGreen, AViewInfo->Color, false);
  AViewInfo->Transparent = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::DBPivotGridCustomDrawFieldHeader(
      TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
      TcxPivotGridFieldHeaderCellViewInfo *AViewInfo, bool &ADone)
{
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, clRed, AViewInfo->Color, false);
  AViewInfo->Transparent = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::DBPivotGridCustomDrawPart(
      TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
      TcxPivotGridCustomCellViewInfo *AViewInfo, bool &ADone)
{
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, clBlue, AViewInfo->Color, true);
  AViewInfo->Transparent = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::DBPivotGridCustomDrawRowHeader(
      TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
      TcxPivotGridHeaderCellViewInfo *AViewInfo, bool &ADone)
{
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, clAqua, AViewInfo->Color, true);
  AViewInfo->Transparent = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::DBPivotGridCustomDrawCell(
      TcxCustomPivotGrid *Sender, TcxCanvas *ACanvas,
      TcxPivotGridDataCellViewInfo *AViewInfo, bool &ADone)
{
  if (VarIsNull(AViewInfo->Value)) {
    ACanvas->Brush->Color = clBtnShadow;
    ACanvas->FillRect(AViewInfo->Bounds, NULL, false);
    ACanvas->Pen->Color = clBlack;
    ACanvas->Pen->Width = 1;
    ACanvas->MoveTo(AViewInfo->Bounds.Left, AViewInfo->Bounds.Top);
    ACanvas->LineTo(AViewInfo->Bounds.Right, AViewInfo->Bounds.Bottom);
    ACanvas->MoveTo(AViewInfo->Bounds.Right, AViewInfo->Bounds.Top);
    ACanvas->LineTo(AViewInfo->Bounds.Left, AViewInfo->Bounds.Bottom);
    AViewInfo->Transparent = true;
  }
  else {
    if ((AViewInfo->RowIndex % 2 == 0) || (AViewInfo->RowIndex % 2 == 0)) {
      FillGradientRectEx(ACanvas, AViewInfo->Bounds, clYellow, clRed, true);
      AViewInfo->Transparent = true;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TfrmCustomDraw::FormCreate(TObject *Sender)
{
   lfController->Kind = lfUltraFlat;
}
//---------------------------------------------------------------------------

