//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "CardLayoutDemoMain.h"
#include "AboutDemoForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDataStorage"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxEditRepositoryItems"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCardView"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBCardView"
#pragma link "cxGridLevel"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TfrmMain *frmMain;
//---------------------------------------------------------------------------
__fastcall TfrmMain::TfrmMain(TComponent* Owner)
        : TForm(Owner)
{
  UpdateMenuValues();
}
//---------------------------------------------------------------------------

void TfrmMain::UpdateMenuValues()
{
  TcxGridCardView* AView = (TcxGridCardView*)Grid->ActiveView;
  miCardAutoWidth->Checked = AView->OptionsView->CardAutoWidth;
  miCellSelection->Checked = AView->OptionsSelection->CellSelect;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miCardAutoWidthClick(TObject *Sender)
{
  TcxGridCardView* AView = (TcxGridCardView*)Grid->ActiveView;
  AView->OptionsView->CardAutoWidth = !AView->OptionsView->CardAutoWidth;
  UpdateMenuValues();
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miCellSelectionClick(TObject *Sender)
{
  TcxGridCardView* AView = (TcxGridCardView*)Grid->ActiveView;
  AView->OptionsSelection->CellSelect = !AView->OptionsSelection->CellSelect;
  UpdateMenuValues();
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miCustomizeClick(TObject *Sender)
{
  TcxGridCardView* AView = (TcxGridCardView*)Grid->ActiveView;
  AView->Controller->Customization = true;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::GridActiveTabChanged(TcxCustomGrid *Sender,
      TcxGridLevel *ALevel)
{
  UpdateMenuValues();
}
//---------------------------------------------------------------------------

void __fastcall TfrmMain::tblCarsCalcFields(TDataSet *DataSet)
{
  tblCarsFuelEconomy->AsString =
    tblCarsMPG_City->AsString + "/" + tblCarsMPG_Highway->AsString;
}
//---------------------------------------------------------------------------

