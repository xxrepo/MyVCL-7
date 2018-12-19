//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "EBarMegaDemoOptions.h"
#include "EBarMegaDemoMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cspin"
#pragma link "CSPIN"
#pragma resource "*.dfm"
TEBarMegaDemoOptionsForm *EBarMegaDemoOptionsForm;
//---------------------------------------------------------------------------
__fastcall TEBarMegaDemoOptionsForm::TEBarMegaDemoOptionsForm(TComponent* Owner)
    : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TEBarMegaDemoOptionsForm::pBeginColorClick(TObject *Sender)
{
 if (ColorDialog->Execute()) {
  ((TPanel*)Sender)->Color = ColorDialog->Color;
   switch(((TComponent*)Sender)->Tag) {
     case 0: EBarMegaDemoMainForm->dxSideBar->BkGround->BeginColor = pBeginColor->Color; break;
     case 1: EBarMegaDemoMainForm->dxSideBar->BkGround->EndColor = pEndColor->Color; break;
   }
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::FormActivate(TObject *Sender)
{
  pBeginColor->Color = EBarMegaDemoMainForm->dxSideBar->BkGround->BeginColor;
  pEndColor->Color = EBarMegaDemoMainForm->dxSideBar->BkGround->EndColor;
  switch(EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle) {
   case bfsHorz: cbFillStyle->ItemIndex = 0; break;
   case bfsNone: cbFillStyle->ItemIndex = 1; break;
   case bfsVert: cbFillStyle->ItemIndex = 2; break;
  }
  seStep->Value = EBarMegaDemoMainForm->dxSideBar->BkGround->Step;

  lbItemFont->Caption = EBarMegaDemoMainForm->dxSideBar->ItemFont->Name + " ("+IntToStr(EBarMegaDemoMainForm->dxSideBar->ItemFont->Size)+")";
  lbGroupFont->Caption = EBarMegaDemoMainForm->dxSideBar->GroupFont->Name + " ("+IntToStr(EBarMegaDemoMainForm->dxSideBar->GroupFont->Size)+")";
  cbShowGroups->Checked = EBarMegaDemoMainForm->dxSideBar->ShowGroups;
  switch (EBarMegaDemoMainForm->dxSideBar->BorderStyle) {
    case bsNone: cbBorderStyle->ItemIndex = 0; break;
    case bsSingle: cbBorderStyle->ItemIndex = 1; break;
  }
  switch (EBarMegaDemoMainForm->dxSideBar->PaintStyle) {
    case sbpsFlat: cbPaintStyle->ItemIndex = 0; break;
    case sbpsStandard: cbPaintStyle->ItemIndex = 1; break;
  }

  cbIconType->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmIconType);
  cbAddGroup->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmAddGroup);
  cbRemoveGroup->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmRemoveGroup);
  cbCustomize->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmCustomize);
  cbRenameGroup->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmRenameGroup);
  cbRenameItem->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmRenameItem);
  cbRemoveItem->Checked = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options.Contains(sbmRemoveItem);

  lbFontName->Caption = EBarMegaDemoMainForm->BarManager->Font->Name + " ("+IntToStr(EBarMegaDemoMainForm->BarManager->Font->Size)+")";
  cbUseF10ForMenu->Checked = EBarMegaDemoMainForm->BarManager->UseF10ForMenu;
  cbCanCustomize->Checked = EBarMegaDemoMainForm->BarManager->CanCustomize;
  cbSunkenBorder->Checked = EBarMegaDemoMainForm->BarManager->SunkenBorder;
  cbAllowReset->Checked = EBarMegaDemoMainForm->BarManager->AllowReset;
  rgStyle->ItemIndex = (int)EBarMegaDemoMainForm->BarManager->Style;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::BitBtn2Click(TObject *Sender)
{
    EBarMegaDemoMainForm->dxSideBar->BkGround->BeginColor = pBeginColor->Color;
    EBarMegaDemoMainForm->dxSideBar->BkGround->EndColor = pEndColor->Color;

    switch (cbFillStyle->ItemIndex) {
      case 0: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsHorz; break;
      case 1: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsNone; break;
      case 2: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsVert; break;
    };
    EBarMegaDemoMainForm->dxSideBar->BkGround->Step = seStep->Value;

    EBarMegaDemoMainForm->dxSideBar->BkPicture = ImSideBarbkPicture->Picture;
    EBarMegaDemoMainForm->dxSideBar->GroupFont = FontGroup;
    EBarMegaDemoMainForm->dxSideBar->ItemFont  = FontItem;

    switch (cbBorderStyle->ItemIndex) {
      case 0: EBarMegaDemoMainForm->dxSideBar->BorderStyle = bsNone; break;
      case 1: EBarMegaDemoMainForm->dxSideBar->BorderStyle = bsSingle; break;
    };

    switch (cbPaintStyle->ItemIndex) {
      case 0: EBarMegaDemoMainForm->dxSideBar->PaintStyle = sbpsFlat; break;
      case 1: EBarMegaDemoMainForm->dxSideBar->PaintStyle = sbpsStandard; break;
    };

   EBarMegaDemoMainForm->dxSideBar->CanSelected = cbCanSelected->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::seStepChange(TObject *Sender)
{
  if (((TCSpinEdit*)Sender)->Value < 1)
    ((TCSpinEdit*)Sender)->Value = 1;
  EBarMegaDemoMainForm->dxSideBar->BkGround->Step = seStep->Value;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::SpeedButton1Click(TObject *Sender)
{
 FontDialog->Font = FontGroup;
 if (FontDialog->Execute()) FontGroup = FontDialog->Font;
 lbGroupFont->Caption = FontGroup->Name + " ("+IntToStr(FontGroup->Size)+")";
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::SpeedButton2Click(TObject *Sender)
{
 FontDialog->Font = FontItem;
 if (FontDialog->Execute()) FontItem = FontDialog->Font;
 lbItemFont->Caption = FontItem->Name + " ("+IntToStr(FontItem->Size)+")";
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::rgStyleClick(TObject *Sender)
{
  EBarMegaDemoMainForm->BarManager->Style = (TdxBarManagerStyle)rgStyle->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnBkBarsLoadClick(
      TObject *Sender)
{
  if (OpenPictureDialog->Execute()){
    imBarsBackground->Picture->LoadFromFile(OpenPictureDialog->FileName);
    EBarMegaDemoMainForm->BarManager->Backgrounds->Bar = imBarsBackground->Picture->Bitmap;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnBkBarsClearClick(
      TObject *Sender)
{
  imBarsBackground->Picture = NULL;
  EBarMegaDemoMainForm->BarManager->Backgrounds->Bar = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnBkSubMenuLoadClick(
      TObject *Sender)
{
  if (OpenPictureDialog->Execute()) {
    imSubMenuBackground->Picture->LoadFromFile(OpenPictureDialog->FileName);
    EBarMegaDemoMainForm->BarManager->Backgrounds->SubMenu = imSubMenuBackground->Picture->Bitmap;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnBkSubMenuClearClick(
      TObject *Sender)
{
  imSubMenuBackground->Picture = NULL;
  EBarMegaDemoMainForm->BarManager->Backgrounds->SubMenu = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::sbFontClick(TObject *Sender)
{
  FontDialog->Font = EBarMegaDemoMainForm->BarManager->Font;
  if (FontDialog->Execute()) {
    EBarMegaDemoMainForm->BarManager->Font = FontDialog->Font;
    lbGroupFont->Caption = EBarMegaDemoMainForm->BarManager->Font->Name + " (" + IntToStr(EBarMegaDemoMainForm->BarManager->Font->Size)+")";
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbUseF10ForMenuClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->BarManager->UseF10ForMenu = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbCanCustomizeClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->BarManager->CanCustomize = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbSunkenBorderClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->BarManager->SunkenBorder = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbAllowResetClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->BarManager->AllowReset = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbFillStyleChange(
      TObject *Sender)
{
  switch (((TComboBox*)Sender)->ItemIndex) {
   case 0: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsHorz; break;
   case 1: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsNone; break;
   case 2: EBarMegaDemoMainForm->dxSideBar->BkGround->FillStyle = bfsVert; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbSBPopupMenuClick(TObject *Sender)
{
  TdxSideBarPopupMenuOption pmOption = (TdxSideBarPopupMenuOption)(((TCheckBox*)Sender)->Tag);
  if (((TCheckBox*)Sender)->Checked)
    EBarMegaDemoMainForm->dxSideBarPopupMenu->Options = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options << pmOption;
  else
    EBarMegaDemoMainForm->dxSideBarPopupMenu->Options = EBarMegaDemoMainForm->dxSideBarPopupMenu->Options >> pmOption;
}
//---------------------------------------------------------------------------


void __fastcall TEBarMegaDemoOptionsForm::spGroupFontClick(TObject *Sender)
{
  FontDialog->Font = EBarMegaDemoMainForm->dxSideBar->GroupFont;
  if (FontDialog->Execute()) {
    EBarMegaDemoMainForm->dxSideBar->GroupFont = FontDialog->Font;
    lbGroupFont->Caption = EBarMegaDemoMainForm->dxSideBar->GroupFont->Name + " ("+IntToStr(EBarMegaDemoMainForm->dxSideBar->GroupFont->Size)+")";
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::spItemFontClick(TObject *Sender)
{
  FontDialog->Font = EBarMegaDemoMainForm->dxSideBar->ItemFont;
  if (FontDialog->Execute()) {
    EBarMegaDemoMainForm->dxSideBar->ItemFont = FontDialog->Font;
    lbItemFont->Caption = EBarMegaDemoMainForm->dxSideBar->ItemFont->Name + " ("+IntToStr(EBarMegaDemoMainForm->dxSideBar->ItemFont->Size)+")";
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnLoadClick(TObject *Sender)
{
  if (OpenPictureDialog->Execute()) {
    ImSideBarbkPicture->Picture->LoadFromFile(OpenPictureDialog->FileName);
    EBarMegaDemoMainForm->dxSideBar->BkPicture = ImSideBarbkPicture->Picture;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbShowGroupsClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->dxSideBar->ShowGroups = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbCanSelectedClick(
      TObject *Sender)
{
  EBarMegaDemoMainForm->dxSideBar->CanSelected = ((TCheckBox*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbPaintStyleChange(
      TObject *Sender)
{
   switch(cbPaintStyle->ItemIndex) {
    case 0: EBarMegaDemoMainForm->dxSideBar->PaintStyle = sbpsFlat; break;
    case 1: EBarMegaDemoMainForm->dxSideBar->PaintStyle = sbpsStandard; break;
   }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::cbBorderStyleChange(
      TObject *Sender)
{
   switch(cbBorderStyle->ItemIndex) {
      case 0: EBarMegaDemoMainForm->dxSideBar->BorderStyle = bsNone;
      case 1: EBarMegaDemoMainForm->dxSideBar->BorderStyle = bsSingle;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMegaDemoOptionsForm::btnCloseClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

