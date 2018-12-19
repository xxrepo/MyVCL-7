//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "CustomRowHeightDemoMain.h"
#include "CustomRowHeightDemoData.h"
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
#pragma link "cxButtons"
#pragma link "cxCheckBox"
#pragma link "cxContainer"
#pragma link "cxGridCardView"
#pragma link "cxGridDBCardView"
#pragma link "cxLookAndFeelPainters"
#pragma link "cxMaskEdit"
#pragma link "cxSpinEdit"
#pragma link "cxTextEdit"
#pragma link "cxLookAndFeels"
#pragma link "dxCore"
#pragma resource "*.dfm"
TCustomRowHeightDemoMainForm *CustomRowHeightDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TCustomRowHeightDemoMainForm::TCustomRowHeightDemoMainForm(TComponent* Owner)
  : TForm(Owner)
{
  FCurrentZoom = 50;
}
//---------------------------------------------------------------------------

void __fastcall TCustomRowHeightDemoMainForm::miAboutClick(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TCustomRowHeightDemoMainForm::miExitClick(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TCustomRowHeightDemoMainForm::miZoomClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  FCurrentZoom = GetZoomByMenuItem(((TMenuItem*)Sender)->MenuIndex);
  tvFilms->SizeChanged(false, false);
}
//---------------------------------------------------------------------------

void __fastcall TCustomRowHeightDemoMainForm::tvFilmsGetCellHeight(TcxCustomGridTableView *Sender,
	TcxCustomGridRecord *ARecord, TcxCustomGridTableItem *AItem,
	TcxGridTableDataCellViewInfo *ACellViewInfo, int &AHeight)
{
  if (AItem != tvFilmsPHOTO){
	AHeight = 0;
	return;
  }
  Variant AEditValue = ARecord->Values[tvFilmsPHOTO->Index];
  if (dxVarIsBlob(AEditValue)){
	TPicture *APicture = new TPicture();
	try{
	  LoadPicture(APicture,
		((TcxImageProperties*)tvFilmsPHOTO->Properties)->GraphicClass, AEditValue);
	  AHeight = APicture->Height;
	  AHeight = div(AHeight * FCurrentZoom, 100).quot;
	}
	__finally{
	  delete APicture;
	}
  }
}
//---------------------------------------------------------------------------

int TCustomRowHeightDemoMainForm::GetZoomByMenuItem(int AMenuItemIndex)
{
  const int Zoom[4]  = {100, 75, 50, 25};
  return Zoom[AMenuItemIndex];
}
//---------------------------------------------------------------------------


