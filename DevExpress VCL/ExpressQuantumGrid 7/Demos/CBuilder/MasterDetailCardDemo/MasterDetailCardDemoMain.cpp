//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "MasterDetailCardDemoMain.h"
#include "MasterDetailCardDemoData.h"
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
#pragma link "cxCalendar"
#pragma link "cxCheckBox"
#pragma link "cxContainer"
#pragma link "cxDBEdit"
#pragma link "cxDBLookupComboBox"
#pragma link "cxDropDownEdit"
#pragma link "cxGridCardView"
#pragma link "cxGridDBCardView"
#pragma link "cxHyperLinkEdit"
#pragma link "cxLookupEdit"
#pragma link "cxMaskEdit"
#pragma link "cxMemo"
#pragma link "cxTextEdit"
#pragma link "cxDBLookupEdit"
#pragma link "cxNavigator"
#pragma link "cxDBNavigator"
#pragma link "cxLookAndFeels"
#pragma resource "*.dfm"
TMasterDetailCardDemoMainForm *MasterDetailCardDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TMasterDetailCardDemoMainForm::TMasterDetailCardDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TMasterDetailCardDemoMainForm::miGrid4Click(
      TObject *Sender)
{
  if (miGrid4->Checked)
    SetStandardMasterDetailStyle();
  else
    SetGrid4MasterDetailStyle();
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void TMasterDetailCardDemoMainForm::SetStandardMasterDetailStyle(void)
{
  TcxGridDBDataController *AData;
  lvFilmsPersons->Visible = False;
  AData = cvFilmsPersons->DataController;
  AData->DataModeController->SmartRefresh = False;
  MasterDetailCardDemoDataDM->qryFilmsPersons->DataSource =
    MasterDetailCardDemoDataDM->dsFilms;
  MasterDetailCardDemoDataDM->qryFilmsPersons->Params->CreateParam(ftAutoInc, "ID", ptUnknown);
  MasterDetailCardDemoDataDM->qryFilmsPersons->SQL->Add("and FilmID = :ID");
  MasterDetailCardDemoDataDM->qryFilmsPersons->Open();
  pnlDetail->Visible = True;
  lblMaster->Visible = True;
  lblStyle->Caption = "Standard master-detail style";
}
//---------------------------------------------------------------------------

void TMasterDetailCardDemoMainForm::SetGrid4MasterDetailStyle(void)
{
  TcxGridDBDataController *AData;
  lvFilmsPersons->Visible = True;
  AData = cvFilmsPersons->DataController;
  AData->DataModeController->SmartRefresh = True;
  pnlDetail->Visible = False;
  MasterDetailCardDemoDataDM->qryFilmsPersons->DataSource = NULL;
  MasterDetailCardDemoDataDM->qryFilmsPersons->Close();
  MasterDetailCardDemoDataDM->qryFilmsPersons->Params->Clear();
  MasterDetailCardDemoDataDM->qryFilmsPersons->SQL->Delete(
    MasterDetailCardDemoDataDM->qryFilmsPersons->SQL->Count-1);
  MasterDetailCardDemoDataDM->qryFilmsPersons->Open();
  lblMaster->Visible = False;
  lblStyle->Caption = "ExpressQuantumGrid master-detail style";
}



