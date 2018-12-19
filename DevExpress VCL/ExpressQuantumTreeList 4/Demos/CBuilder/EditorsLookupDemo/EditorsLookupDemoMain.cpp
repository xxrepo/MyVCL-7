//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EditorsLookupDemoMain.h"
#include "EditorsLookupDemoData.h"
#include "EditorsLookupDemoNewUser.h"
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
#pragma link "cxCheckBox"
#pragma link "cxContainer"
#pragma link "cxDBEdit"
#pragma link "cxDBLookupComboBox"
#pragma link "cxDBLookupEdit"
#pragma link "cxDBNavigator"
#pragma link "cxDropDownEdit"
#pragma link "cxImageComboBox"
#pragma link "cxLookupEdit"
#pragma link "cxMaskEdit"
#pragma link "cxMemo"
#pragma link "cxNavigator"
#pragma link "cxPropertiesStore"
#pragma link "cxTextEdit"
#pragma resource "*.dfm"
TEditorsLookupDemoMainForm *EditorsLookupDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TEditorsLookupDemoMainForm::TEditorsLookupDemoMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::FormShow(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code *

  ShowMessage("WARNING: tutorial not completed. First, please apply the steps "
    "shown in the doc file");

//*/
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::LookAndFeelChange(TObject *Sender)
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

void __fastcall TEditorsLookupDemoMainForm::FormCreate(TObject *Sender)
{
  FStream = new TMemoryStream();
  cxPropertiesStore->StorageStream = FStream;
  if (!miStoringGridLookFeel->Checked){
    miStoringGridLookFeel->Checked = true;
    miStoringGridLookFeelClick(miStoringGridLookFeel);
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::FormDestroy(TObject *Sender)
{
  delete FStream;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::lcbCreatorNewLookupDisplayText(TObject *Sender,
    const TCaption AText)
{
/* remove/add the closing slash on this line to disable/enable the following code*/

  TcxDBLookupComboBox *ALookupControl = (TcxDBLookupComboBox*)Sender;
  ALookupControl->Reset();
  if (EditorsLookupDemoNewUserForm->ShowEx(AText) == mrOk) {
    ALookupControl->Text = EditorsLookupDemoDataDM->tblUsersUserName->AsString;
    ALookupControl->DataBinding->Field->Value =
      EditorsLookupDemoDataDM->tblUsersID->Value;
  }
  Abort();

//*/
}
//---------------------------------------------------------------------------


void __fastcall TEditorsLookupDemoMainForm::ChangeLookupModeClick(TObject *Sender)
{
  ((TMenuItem*)Sender)->Checked = true;
  switch (((TMenuItem*)Sender)->Tag){
    case 1: SetPickLookupMode(); break;
    case 2: SetStandardLookupMode(); break;
    case 3: SetEditLookupMode(); break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::StorageTypeClick(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  ((TMenuItem*)Sender)->Checked = true;
  ((TMenuItem*)Sender)->Parent->Tag = ((TMenuItem*)Sender)->Tag;
  cxPropertiesStore->StorageType = (TcxStorageType)((TMenuItem*)Sender)->Tag;
  if (((TMenuItem*)Sender)->Tag == 0)
    cxPropertiesStore->StorageName = cxPropertiesStore->Name + ".ini";
  else
    cxPropertiesStore->StorageName = cxPropertiesStore->Name;

//*/
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::miStoreClick(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  cxPropertiesStore->StoreTo(true);

//*/
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::miRestoreClick(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  FStream->Position = 0;
  cxPropertiesStore->RestoreFrom();

//*/
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::miStoringGridLookFeelClick(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  int AIndex = IndexOfPropertiesStoreComponent(cxLookAndFeelController);
  if (((TMenuItem*)Sender)->Checked){
    if (AIndex > -1){
      cxPropertiesStore->Components->ComponentItems[AIndex]->Properties->Add("NativeStyle");
      cxPropertiesStore->Components->ComponentItems[AIndex]->Properties->Add("Kind");
    }
    else{
      TcxPropertiesStoreComponent *AStoreComponent =
        (TcxPropertiesStoreComponent*)cxPropertiesStore->Components->Add();
      AStoreComponent->Component = cxLookAndFeelController;
      AStoreComponent->Properties->Add("NativeStyle");
      AStoreComponent->Properties->Add("Kind");
    }
    AddMenuItemStoreComponent(miNativeStyle);
    AddMenuItemStoreComponent(miUltraFlat);
    AddMenuItemStoreComponent(miFlat);
    AddMenuItemStoreComponent(miStandard);
  }
  else
    if (AIndex > -1){
      delete cxPropertiesStore->Components->Items[AIndex];
      AIndex = IndexOfPropertiesStoreComponent(miNativeStyle);
      delete cxPropertiesStore->Components->Items[AIndex];
      AIndex = IndexOfPropertiesStoreComponent(miStandard);
      delete cxPropertiesStore->Components->Items[AIndex];
      AIndex = IndexOfPropertiesStoreComponent(miFlat);
      delete cxPropertiesStore->Components->Items[AIndex];
      AIndex = IndexOfPropertiesStoreComponent(miUltraFlat);
      delete cxPropertiesStore->Components-> Items[AIndex];
    }

//*/
}

//---------------------------------------------------------------------------
int TEditorsLookupDemoMainForm::IndexOfPropertiesStoreComponent(TComponent *AComponent)
{
  for (int I = 0; I < cxPropertiesStore->Components->Count; I++)
    if (cxPropertiesStore->Components->ComponentItems[I]->Component == AComponent)
      return I;
  return -1;
}

//---------------------------------------------------------------------------
void TEditorsLookupDemoMainForm::AddMenuItemStoreComponent(TComponent *AItem)
{
  int AIndex = IndexOfPropertiesStoreComponent(AItem);
  if (AIndex > -1)
    cxPropertiesStore->Components->ComponentItems[AIndex]->Properties->Add("Checked");
  else{
    TcxPropertiesStoreComponent *AStoreComponent =
      (TcxPropertiesStoreComponent*)cxPropertiesStore->Components->Add();
    AStoreComponent->Component = AItem;
    AStoreComponent->Properties->Add("Checked");
  }
}

//---------------------------------------------------------------------------
void __fastcall TEditorsLookupDemoMainForm::miStorageActiveClick(TObject *Sender)
{
/* remove/add the closing slash on this line to disable/enable the following code */

  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  cxPropertiesStore->Active = ((TMenuItem*)Sender)->Checked;
  miStoringGridLookFeel->Enabled = ((TMenuItem*)Sender)->Checked;

//*/
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetPickLookupMode()
{
/* remove/add the closing slash on this line to disable/enable the following code*/

  lcbCreator->Properties->DropDownListStyle = lsEditFixedList;
  lcbCreator->Properties->ImmediateDropDown = true;
  lcbOwner->Properties->DropDownListStyle = lsEditFixedList;
  lcbOwner->Properties->ImmediateDropDown = true;
  lcbProject->Properties->DropDownListStyle = lsEditFixedList;

//*/
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetStandardLookupMode()
{
/* remove/add the closing slash on this line to disable/enable the following code*/

  lcbCreator->Properties->DropDownListStyle = lsFixedList;
  lcbCreator->Properties->ImmediateDropDown = true;
  lcbOwner->Properties->DropDownListStyle = lsFixedList;
  lcbOwner->Properties->ImmediateDropDown = true;
  lcbProject->Properties->DropDownListStyle = lsFixedList;

//*/
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetEditLookupMode()
{
/* remove/add the closing slash on this line to disable/enable the following code*/

  lcbCreator->Properties->DropDownListStyle = lsEditList;
  lcbCreator->Properties->ImmediateDropDown = false;
  lcbOwner->Properties->DropDownListStyle = lsEditList;
  lcbOwner->Properties->ImmediateDropDown = false;
  lcbProject->Properties->DropDownListStyle = lsEditFixedList;

//*/
}
//---------------------------------------------------------------------------

