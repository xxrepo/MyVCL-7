//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "ViewBandedDemoMain.h"
#include "ViewBandedDemoData.h"
#include "ViewBandeDemoBands.h"
#include "controls.hpp"
#include "AboutDemoForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridBandedTableView"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBBandedTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxListBox"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TViewBandedDemoMainForm *ViewBandedDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TViewBandedDemoMainForm::TViewBandedDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TViewBandedDemoMainForm::DeleteBand(String ABandCaption)
{
  TcxGridBand* Band;
  Band = GetBandByCaption(ABandCaption);
  if(Band != NULL)
    Band->Free();
}

TcxGridBand* __fastcall TViewBandedDemoMainForm::GetBandByCaption(String ABandCaption)
{
  for(int i=0; i < btvItems->Bands->Count; i++)
    if (btvItems->Bands->Items[i]->Caption == ABandCaption){
      return(btvItems->Bands->Items[i]);
    }
  return(NULL);
}

void __fastcall TViewBandedDemoMainForm::FormShow(TObject *Sender)
{
  ((TcxGridTableView*)cxGrid->FocusedView)->DataController->Groups->FullExpand();
}

void __fastcall TViewBandedDemoMainForm::miCreateBandClick(
      TObject *Sender)
{
  String BandCaption;
  if(InputQuery("Create band", "Specify a caption of the band", BandCaption))
    if(GetBandByCaption(BandCaption) != NULL)
       MessageDlg("Band with this caption already exists", mtWarning, TMsgDlgButtons() << mbOK, 0);
    else{
      TcxGridBand *ABand = btvItems->Bands->Add();
      ABand->Caption = BandCaption;
      TcxGridBandViewInfo *ABandViewInfo = 
        btvItems->ViewInfo->HeaderViewInfo->BandsViewInfo->Items[ABand->VisibleIndex];
      btvItems->Controller->LeftPos = ABandViewInfo->Bounds.Right;
    }  
}

void __fastcall TViewBandedDemoMainForm::HideCoulmns()
{
  for(int j=0; j < btvItems->ColumnCount; j++)
    if((btvItems->Columns[j]->Position->Band == NULL) && (btvItems->Columns[j]->Visible))
      btvItems->Columns[j]->Visible = false;
}

void __fastcall TViewBandedDemoMainForm::RemoveBands(TcxListBox* AListBox)
{
  for(int i=0; i < AListBox->Items->Count; i++)
    if(AListBox->Selected[i])
      DeleteBand(AListBox->Items->Strings[i]);
  HideCoulmns();
}

void __fastcall TViewBandedDemoMainForm::AddBands(TStrings* AStringList)
{
  for(int i=0; i < btvItems->Bands->Count; i++)
    AStringList->Add(btvItems->Bands->Items[i]->Caption);
}

void __fastcall TViewBandedDemoMainForm::miDeleteBandClick(TObject *Sender)
{
  TViewBandeDemoBandsForm *ViewBandeDemoBandsForm;
  ViewBandeDemoBandsForm = new TViewBandeDemoBandsForm(NULL);
  try {
    ViewBandeDemoBandsForm->lbBands->Items->Clear();
    AddBands(ViewBandeDemoBandsForm->lbBands->Items);
    if(ViewBandeDemoBandsForm->ShowModal() == mrOk)
      RemoveBands(ViewBandeDemoBandsForm->lbBands);
  }
  __finally {
    ViewBandeDemoBandsForm->Free();
  }
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miColumnsCustomizationClick(
      TObject *Sender)
{
  btvItems->Controller->Customization = true;
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miShowPreviewRowClick(
      TObject *Sender)
{
  if (btvItems->Preview->Visible) {
    btvItems->Preview->Visible = false;
    btvItems->Preview->Column = NULL;
  }
  else {
    btvItemsDESCRIPTION->Visible = false;
    btvItems->Preview->Column = btvItemsDESCRIPTION;
    btvItems->Preview->Visible = true;
  };
  ((TMenuItem*)Sender)->Checked = btvItems->Preview->Visible;
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miBandMovingClick(
      TObject *Sender)
{
  btvItems->OptionsCustomize->BandMoving = !btvItems->OptionsCustomize->BandMoving;
  ((TMenuItem*)Sender)->Checked = btvItems->OptionsCustomize->BandMoving;
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miBandSizingClick(
      TObject *Sender)
{
  btvItems->OptionsCustomize->BandSizing = !btvItems->OptionsCustomize->BandSizing;
  ((TMenuItem*)Sender)->Checked = btvItems->OptionsCustomize->BandSizing;
}
//---------------------------------------------------------------------------

void __fastcall TViewBandedDemoMainForm::miShowNavigatorClick(
      TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  btvItems->OptionsView->Navigator = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

