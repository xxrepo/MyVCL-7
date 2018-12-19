//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#define HDC unsigned int

#include "CustomDrawDemoMain.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxEdit"
#pragma link "cxGraphics"
#pragma link "cxScheduler"
#pragma link "cxSchedulerCustomControls"
#pragma link "cxSchedulerCustomResourceView"
#pragma link "cxSchedulerDateNavigator"
#pragma link "cxSchedulerDayView"
#pragma link "cxStyles"
#pragma link "DemoBasicMain"
#pragma link "cxSchedulerStorage"
#pragma link "cxFormats"
#pragma link "dxOffice11"

#pragma link "DemoBasicMain"
#pragma resource "*.dfm"

TCustomDrawDemoMainForm *CustomDrawDemoMainForm;

  int W1;
  int H1;
  int C1;
  int C2;
  Graphics::TBitmap *ABitmap;
  unsigned char FDaysOffIndexes[2];

void FillGradientRectEx(TcxCanvas *ACanvas, TRect ARect, int AColor1, int AColor2, bool AHorizontal)
{
  W1 = ARect.Width();
  H1 = ARect.Height();
  if ((ARect.Width() < 1) || (ARect.Height() < 1))
    return;

  if (((ABitmap->Height != H1) || (ABitmap->Width != W1)) || ((AColor1 != C1) || (AColor2 != C2)))
  {
    C1 = AColor1;
    C2 = AColor2;
    delete ABitmap;
    ABitmap = new Graphics::TBitmap();
    ABitmap->PixelFormat = pf32bit;
    ABitmap->Height = H1;
    ABitmap->Width = W1;
    FillGradientRect((unsigned int)ABitmap->Canvas->Handle, Rect(0, 0, W1, H1),
      (TColor)AColor1, (TColor)AColor2, AHorizontal);
  }
  BitBlt((void*)ACanvas->Handle, ARect.Left, ARect.Top, W1, H1,
    ABitmap->Canvas->Handle, 0, 0, SRCCOPY);
}

//---------------------------------------------------------------------------
__fastcall TCustomDrawDemoMainForm::TCustomDrawDemoMainForm(TComponent* Owner)
        : TDemoBasicMainForm(Owner)
{
//
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::FormCreate(TObject *Sender)
{
  ABitmap = new Graphics::TBitmap();
  ABitmap->PixelFormat = pf32bit;
  Scheduler->OptionsView->RotateResourceCaptions = false;
  Scheduler->ViewDay->EventShadows = false;
  int I = cxFormatController()->StartOfWeek + (int)(dSunday);
  int J = (int)(dSunday) - I;
  if (J < 0) J = J + 7;
  FDaysOffIndexes[0] = J;
  J = (int)(dSaturday) - I;
  if (J < 0) J = J + 7;
  FDaysOffIndexes[1] = J;
  GenerateRandomEvents(100, true);
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::FormDestroy(TObject *Sender)
{
  delete ABitmap;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerDateNavigatorCustomDrawHeader(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerDateNavigatorMonthHeaderViewInfo *AViewInfo, bool &ADone)
{
  if (!miMonthHeaders->Checked)
    return;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, 0xFFE0E0, 0xFF8080, false);
  ACanvas->FrameRect(AViewInfo->Bounds, clBlue, 1, TcxBorders()<<bLeft<<bRight<<bTop<<bBottom, False);
  AViewInfo->Transparent = true;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerDateNavigatorCustomDrawDayCaption(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerDateNavigatorDayCaptionViewInfo *AViewInfo, bool &ADone)
{
  if (!miDayCaptions->Checked)
    return;
  if (AViewInfo->Index == FDaysOffIndexes[0] || AViewInfo->Index == FDaysOffIndexes[1])
    ACanvas->Font = csRed->Font;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerDateNavigatorCustomDrawDayNumber(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerDateNavigatorDayNumberViewInfo *AViewInfo, bool &ADone)
{
  if (!miDays->Checked) return;
  int ADay = DayOfWeek(AViewInfo->Date);
  if (AViewInfo->Selected)
    ACanvas->Brush->Color = clAppWorkSpace;
  else
    if (ADay == 1 || ADay == 7)
      ACanvas->Font = csRed->Font;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerCustomDrawDayHeader(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerDayHeaderCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miHeaders->Checked) return;
  AViewInfo->Transparent = true;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, 0xA0A0A0, 0x707070, false);
  ACanvas->FrameRect(AViewInfo->Bounds, clGray, 1, TcxBorders()<<bLeft<<bRight<<bTop<<bBottom, false);
  ACanvas->Brush->Style = bsClear;
  ACanvas->Font = csItalic->Font;
  ACanvas->DrawTexT(AViewInfo->DisplayText, AViewInfo->Bounds, cxAlignCenter, true);
  ACanvas->Brush->Style = bsSolid;
  ADone = True;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerViewDayCustomDrawRuler(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerTimeRulerCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miTimeRuler->Checked) return;
  AViewInfo->Transparent = true;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds[true], 0x909090, 0xE0E0E0, true);
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerViewDayCustomDrawContainer(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerContainerCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miContainer->Checked || AViewInfo->Selected) return;
  AViewInfo->Transparent = true;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, 0xC0E0C0, 0x70A070, false);
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerCustomDrawEvent(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerEventCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miEvents->Checked) return;
  AViewInfo->Transparent = true;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, clWhite, AViewInfo->Color, false);
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::UpdateCustomDraw(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  Scheduler->LayoutChanged();
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerCustomDrawContent(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerContentCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miContent->Checked) return;
  AViewInfo->Transparent = true;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds,
    AViewInfo->Color, GetMiddleRGB(AViewInfo->Color, clBlack, 75), true);
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerCustomDrawResourceHeader(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerHeaderCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miResources->Checked) return;
  AViewInfo->Transparent = True;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, 0x50F0F0, 0x009090, false);
  ACanvas->Brush->Style = bsClear;
  ACanvas->Font = csBoldItalic->Font;
  ACanvas->DrawTexT(AViewInfo->DisplayText, AViewInfo->Bounds, cxAlignCenter, true);
  ACanvas->Brush->Style = bsSolid;
  ADone = True;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerCustomDrawGroupSeparator(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerGroupSeparatorCellViewInfo *AViewInfo, bool &ADone)
{
  if (!miGroupSeparator->Checked) return;
  FillGradientRectEx(ACanvas, AViewInfo->Bounds, 0x50F0F0, 0x009090, true);
  ADone = True;
}
//---------------------------------------------------------------------------
void __fastcall TCustomDrawDemoMainForm::SchedulerDateNavigatorCustomDrawContent(
  TObject *Sender, TcxCanvas *ACanvas, TcxSchedulerDateNavigatorMonthContentViewInfo *AViewInfo, bool &ADone)
{
  TColor AColor;
  if (!miDNContent->Checked) return;
  if (AViewInfo->Month >= 3 && AViewInfo->Month <= 11)
  {
    if (AViewInfo->Month <= 5)
      AColor = (TColor)0xD0FFD0;
    else
      if (AViewInfo->Month <= 8)
        AColor = (TColor)0xD0D0FF;
      else
        if (AViewInfo->Month <= 11)
          AColor = (TColor)0xD0FFFF;
  }
  else
    AColor = (TColor)0xFFE7E7;
  TRect R = AViewInfo->Bounds;
  ACanvas->Brush->Color = AColor;
  ACanvas->FillRect(R, NULL, false);
  ACanvas->Font->Height = R.Height();
  ACanvas->Font->Color = (TColor)GetMiddleRGB(AColor, clBlack, 85);
  ACanvas->DrawTexT(IntToStr(AViewInfo->Month), R, cxAlignCenter, true);
  ACanvas->Font = AViewInfo->ViewParams.Font;
  AViewInfo->Transparent = true;
  ADone = True;
}
//---------------------------------------------------------------------------


