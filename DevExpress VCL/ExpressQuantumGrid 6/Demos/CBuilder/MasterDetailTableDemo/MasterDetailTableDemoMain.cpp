//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "MasterDetailTableDemoMain.h"
#include "MasterDetailTableDemoData.h"
#include "AboutDemoForm.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxControls"
#pragma link "cxCustomData"
#pragma link "cxData"
#pragma link "cxDBData"
#pragma link "cxEdit"
#pragma link "cxFilter"
#pragma link "cxGraphics"
#pragma link "cxGrid"
#pragma link "cxGridCustomTableView"
#pragma link "cxGridCustomView"
#pragma link "cxGridDBTableView"
#pragma link "cxGridLevel"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TMasterDetailTableDemoMainForm *MasterDetailTableDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TMasterDetailTableDemoMainForm::TMasterDetailTableDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailTableDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailTableDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailTableDemoMainForm::miGrid4Click(
      TObject *Sender)
{
 if (miGrid4->Checked)
   SetStandardMasterDetailStyle();
 else
   SetGrid4MasterDetailStyle();
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void TMasterDetailTableDemoMainForm::SetGrid4MasterDetailStyle(void)
{
  TcxGridDBTableView *AView;
  TcxGridDBDataController *AData;

  // remove master/detail link in the data module
  MasterDetailTableDemoDataDM->tblFilmsPersonsStaff->MasterSource = NULL;

  // create view in the first grid (Grid)
  AView = (TcxGridDBTableView*)(Grid->CreateView(__classid(TcxGridDBTableView)));
  AView->Assign(lvDetail->GridView);
  AData = (TcxGridDBDataController*)(AView->DataController);
  AData->KeyFieldNames = "ID";
  AData->MasterKeyFieldNames = "ID";
  AData->DetailKeyFieldNames = "FilmID";
  AData->DataModeController->SmartRefresh = True;

  // hide the second grid (GridDetail)
  delete lvDetail->GridView;
  pnlDetail->Visible = False;
  Splitter->Visible = False;
  // bind AView to first grid's detail level
  lvFilmsPersonsStaff->Visible = True;
  lvFilmsPersonsStaff->GridView = AView;

  lblMaster->Visible = False;
  lblStyle->Caption = "ExpressQuantumGrid master-detail style";
}
//---------------------------------------------------------------------------

void TMasterDetailTableDemoMainForm::SetStandardMasterDetailStyle(void)
{
  TcxGridDBTableView *AView;
  TcxGridDBDataController *AData;

  // restore master/detail link in the data module
  MasterDetailTableDemoDataDM->tblFilmsPersonsStaff->MasterSource =
    MasterDetailTableDemoDataDM->dsFilms;

  // create view in the second grid (GridDetail)
  AView = (TcxGridDBTableView*)(GridDetail->CreateView(__classid(TcxGridDBTableView)));
  AView->Assign(lvFilmsPersonsStaff->GridView);
  AData = (TcxGridDBDataController*)(AView->DataController);
  AData->KeyFieldNames = "ID";
  AData->MasterKeyFieldNames = "";
  AData->DetailKeyFieldNames = "";
  AData->DataModeController->SmartRefresh = False;

  // remove the detail level from the first grid (Grid)
  lvFilmsPersonsStaff->Visible = False;
  delete lvFilmsPersonsStaff->GridView;

  // bind AView to second grid's level
  lvDetail->GridView = AView;
  pnlDetail->Visible = True;
  Splitter->Visible = True;

  lblMaster->Visible = True;
  lblStyle->Caption = "Standard master-detail style";
}
