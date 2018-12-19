//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "FilterControlDemoMain.h"
#include "cxFilterControlDialog.hpp"
#include "FilterControlDemoFilterDialog.h"
#include "AboutDemoForm.h"
#include "shellapi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxButtons"
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDBData"
#pragma link "cxDBEditRepository"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxFilterControl"
#pragma link "cxDBFilterControl"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomPopupMenu"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridPopupMenu"
#pragma link "cxGridTableView"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxLookAndFeels"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TFilterControlDemoMainForm *FilterControlDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TFilterControlDemoMainForm::TFilterControlDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::FormCreate(TObject *Sender)
{
  OpenDialog->InitialDir = ExtractFileDir(Application->ExeName);
  SaveDialog->InitialDir = OpenDialog->InitialDir;

  cxFilterControl->Align = alClient;
  cxDBFilterControl->Align = alClient;
  pnlFilterDialog->Width = 240;
  FFilterControl = cxFilterControl;
  FFilterControlAlign = ltLeft;
  PageControl->ActivePage = tsGrid4DisplayStyle;
  PageControlChange(PageControl);
  cxFilterControl->LoadFromFile("ExtendedFilter.flt");
  cxFilterControl->ApplyFilter();
  cxDBFilterControl->LoadFromFile("StandardFilter.sft");
  cxDBFilterControl->ApplyFilter();
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miAboutClick(
      TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::cxFilterControlApplyFilter(
      TObject *Sender)
{
  ((TcxGridTableView*)((TcxFilterControl*)Sender)->LinkComponent)->DataController->Filter->Active = true;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::cxDBFilterControlApplyFilter(
      TObject *Sender)
{
  TDataSet* ADataSet = ((TcxDBFilterControl*)Sender)->DataSet;
  try {
    ADataSet->DisableControls();
    ADataSet->Filtered = false;
    ADataSet->Filter =
      ((TcxDBFilterControl*)Sender)->FilterText;
    ADataSet->Filtered = true;
  }
  __finally {
    ADataSet->EnableControls();
  }
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::btnLoadClick(TObject *Sender)
{
 if (PageControl->ActivePage == tsGrid4DisplayStyle)
   OpenDialog->Filter = "Grid Filters(*.flt)|*.flt|All files|*.*";
 else
   OpenDialog->Filter = "Standard Filters(*.sft)|*.sft|All files|*.*";
 if (OpenDialog->Execute())
   FFilterControl->LoadFromFile(OpenDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::btnSaveAsClick(TObject *Sender)
{
 if (PageControl->ActivePage == tsGrid4DisplayStyle)
   SaveDialog->Filter = "Grid Filters(*.flt)|*.flt";
 else
   SaveDialog->Filter = "Standard Filters(*.sft)|*.sft";
 if (SaveDialog->Execute())
   FFilterControl->SaveToFile(SaveDialog->FileName);
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::btnApplyClick(TObject *Sender)
{
  FFilterControl->ApplyFilter();
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::PageControlChange(
      TObject *Sender)
{
  FFilterControl->Visible = False;
  if (((TPageControl*)Sender)->ActivePage == tsStandardDisplayStyle)
    FFilterControl = cxDBFilterControl;
  else
    FFilterControl = cxFilterControl;
  FFilterControl->Visible = true;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miFiltConrolPosClick(
      TObject *Sender)
{
 if (!((TMenuItem*)Sender)->Checked) {
   ((TMenuItem*)Sender)->Checked = true;
   FFilterControlAlign = (TcxLocate)((TMenuItem*)Sender)->Tag;
   Relocate(FFilterControlAlign);
 }
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::Relocate(TcxLocate ALocate)
{
  TAlign AAlign;
  Splitter->Visible = false;
  pnlFilterDialog->Visible = false;
  if (ALocate == ltNone) return;
  if (ALocate == ltTop)
    AAlign = alTop;
  else
    AAlign = alLeft;
  if(ALocate == ltLeft)
    Splitter->Align = AAlign;
  pnlFilterDialog->Align = AAlign;
  if(ALocate == ltTop)
    Splitter->Align = AAlign;
  Splitter->Visible = true;
  pnlFilterDialog->Visible = true;
  lbDescription->Top = 0;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::ShowButtons(bool AShow)
{
  btnOK->Visible = AShow;
  btnCancel->Visible = AShow;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miFillterControlModalClick(
      TObject *Sender)
{
  if (PageControl->ActivePage == tsGrid4DisplayStyle)
   tvOrders->Filtering->RunCustomizeDialog(NULL);
  else {
    miFiltConrolPosClick(miFiltConrolNone);
    int AHeight = pnlFilterDialog->Height;
    int AWidth = pnlFilterDialog->Width;
    TAlign AAlign = pnlFilterDialog->Align;
    ShowButtons(true);
    pnlFilterDialog->Parent = FilterControlDemoFilterDialogForm;
    pnlFilterDialog->Align = alClient;
    pnlFilterDialog->Visible = true;
    FilterControlDemoFilterDialogForm->ShowModal();
    pnlFilterDialog->Align = AAlign;
    ShowButtons(false);
    pnlFilterDialog->Visible = false;
    pnlFilterDialog->Parent = this;
    pnlFilterDialog->Height = AHeight;
    pnlFilterDialog->Width = AWidth;
  }
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::tvOrdersFilterControlDialogShow(
      TObject *Sender)
{
  FCloseEvent = ((TfmFilterControlDialog*)Sender)->OnClose;
  ((TfmFilterControlDialog*)Sender)->OnClose = FilterDialogClose;
  Relocate(ltNone);
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::FilterDialogClose(System::TObject* Sender, TCloseAction &Action)
{
  Relocate(FFilterControlAlign);
  if (FCloseEvent)
    FCloseEvent(Sender, Action);
  ((TForm*)Sender)->OnClose = FCloseEvent;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::tvOrdersDataControllerFilterChanged(
      TObject *Sender)
{
  cxFilterControl->UpdateFilter();
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miShowFilterPnlClick(
      TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  tvOrders->Filtering->Visible =
    (TcxGridFilterVisible)((TMenuItem*)Sender)->Tag;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miShowFilterBtnClick(
      TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  tvOrders->Filtering->CustomizeDialog = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TFilterControlDemoMainForm::miNativeStyleClick(
      TObject *Sender)
{
  LookAndFeelController->NativeStyle = !LookAndFeelController->NativeStyle;
  ((TMenuItem*)Sender)->Checked = LookAndFeelController->NativeStyle;
}
//---------------------------------------------------------------------------


void __fastcall TFilterControlDemoMainForm::miLookAndFeelKindClick(
      TObject *Sender)
{
  LookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->MenuIndex;
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------

