//---------------------------------------------------------------------------

#include <vcl.h>
#include "shellapi.hpp"
#pragma hdrstop

#include "IssueListMain.h"
#include "IssueListData.h"
#include "AboutDemoForm.h"
#include "IssueListStyles.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TIssueListMainForm *IssueListMainForm;
//---------------------------------------------------------------------------
__fastcall TIssueListMainForm::TIssueListMainForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actExitExecute(TObject *Sender)
{
  Close();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actGoProjectExecute(TObject *Sender)
{
  GridForm->DoGoProject(((TMenuItem*)Sender)->Tag);
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::FormCreate(TObject *Sender)
{
  FGridForm =  new TIssueListGridForm(this);
  FGridForm->Parent = this;
  FGridForm->Align = alClient;
  FGridForm->Visible = True;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actShowPicturesExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowPictures(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actGroupingExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowGrouping(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::miNativeStyleClick(TObject *Sender)
{
  LookAndFeelController->NativeStyle = !LookAndFeelController->NativeStyle;
  ((TMenuItem*)Sender)->Checked = LookAndFeelController->NativeStyle;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actIndicatorExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowIndicator(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actAboutExecute(TObject *Sender)
{
  ShowAboutDemoForm();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actHeaderExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowHeader(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actSummaryFooterExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowFooter(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actAutoWidthExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetAutoWidth(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actInvertSelectedExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetInvertSelected(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actIndicatorUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->Indicator;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actGroupingUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->GroupByBox;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actSummaryFooterUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->Footer;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actHeaderUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->Header;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actAutoWidthUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->ColumnAutoWidth; 
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actInvertSelectedUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsSelection->InvertSelect;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actFullCollapseExecute(TObject *Sender)
{
  GridForm->DoFullCollapse();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actFullExpandExecute(TObject *Sender)
{
  GridForm->DoFullExpand();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actShowEditButtonsExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowEditButtons(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actGridLinesExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowGridLines(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actShowEditButtonsUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->ShowEditButtons != gsebNever;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actGridLinesUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->GridLines != glNone;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actAutoPreviewUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->Preview->Visible;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actAutoPreviewExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetAutoPreview(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actBestFitExecute(TObject *Sender)
{
  GridForm->DoBestFit();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actColumnsCustomizeExecute(TObject *Sender)
{
  GridForm->DoColumnsCustomization();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actShowDependsOnDataExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowDependsOnData(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actNewItemRowExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetShowNewItemRow(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actNewItemRowUpdate(TObject *Sender)
{
  ((TAction*)Sender)->Checked = FocusedView->OptionsView->NewItemRow;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actSelectStyleSheetExecute(TObject *Sender)
{
  TIssueListStylesForm *AStylesForm = new TIssueListStylesForm(Application);
  AStylesForm->Show();
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::actEditorsShadowExecute(TObject *Sender)
{
 ((TAction*)Sender)->Checked = !((TAction*)Sender)->Checked;
  GridForm->DoSetEditorsShadow(((TAction*)Sender)->Checked);
}
//---------------------------------------------------------------------------

TcxGridDBTableView* TIssueListMainForm::GetFocusedView(void)
{
   return (TcxGridDBTableView*)GridForm->FocusedView;
}
//---------------------------------------------------------------------------

void __fastcall TIssueListMainForm::miOffice11Click(TObject *Sender)
{
  LookAndFeelController->Kind = (TcxLookAndFeelKind)((TMenuItem*)Sender)->MenuIndex;
  ((TMenuItem*)Sender)->Checked = true;
}
//---------------------------------------------------------------------------

