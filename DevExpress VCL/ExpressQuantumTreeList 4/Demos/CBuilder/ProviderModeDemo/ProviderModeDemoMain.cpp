//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ProviderModeDemoMain.h"
#include "ProviderModeDemoClasses.h"
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
#pragma link "cxStyles"
#pragma link "cxLookAndFeels"
#pragma link "DemoBasicMain"
#pragma link "cxCalendar"
#pragma link "cxInplaceContainer"
#pragma link "cxSpinEdit"
#pragma link "cxTextEdit"
#pragma link "cxTL"
#pragma link "cxTLData"
#pragma resource "*.dfm"
TProviderModeDemoMainForm *ProviderModeDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TProviderModeDemoMainForm::TProviderModeDemoMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::FormShow(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code *

  ShowMessage("WARNING: tutorial not completed. First, please apply the steps "
    "shown in the doc file");

//*/
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::LookAndFeelChange(TObject *Sender)
{
  if (((TMenuItem*)Sender)->Tag > 3){
    cxLookAndFeelController->NativeStyle =
      !cxLookAndFeelController->NativeStyle;
    ((TMenuItem*)Sender)->Checked = cxLookAndFeelController->NativeStyle;
  }
  else{
    ((TMenuItem*)Sender)->Checked = true;
    cxLookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->Tag;
    cxLookAndFeelController->NativeStyle = false;
    miNativeStyle->Checked = false;
  }
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::FormCreate(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  TreeList->OptionsData->SmartLoad = true;
  RecreateDemoDataSource(TreeList);

//*/
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::FormDestroy(TObject *Sender)
{
  delete TreeList->DataController->CustomDataSource;
  TreeList->DataController->CustomDataSource = NULL;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miShowTreeLinesClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->TreeLineStyle =
    (TcxTreeListTreeLineStyle)((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miShowIndicatorClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->Indicator = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miShowRootClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->ShowRoot = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miShowButtonsClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->Buttons = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miSmartLoadModeClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsData->SmartLoad = ((TMenuItem*)Sender)->Checked;
  RecreateDemoDataSource(TreeList);
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miCellAutoHeightClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->CellAutoHeight = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miCellEndEllipsisClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->CellEndEllipsis = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TProviderModeDemoMainForm::miColumnAutoWidthClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  TreeList->OptionsView->ColumnAutoWidth = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------


void __fastcall TProviderModeDemoMainForm::TreeListDragOver(
      TObject *Sender, TObject *Source, int X, int Y, TDragState State,
      bool &Accept)
{
//        
}
//---------------------------------------------------------------------------

