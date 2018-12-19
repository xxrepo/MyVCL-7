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
#pragma link "cxLookAndFeelPainters"
#pragma resource "*.dfm"
TEditorsLookupDemoMainForm *EditorsLookupDemoMainForm;
//---------------------------------------------------------------------------
__fastcall TEditorsLookupDemoMainForm::TEditorsLookupDemoMainForm(TComponent* Owner)
  : TDemoBasicMainForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::SetDefaultLookAndFeel()
{
//
}

void __fastcall TEditorsLookupDemoMainForm::FormCreate(TObject *Sender)
{
  TDemoBasicMainForm::FormCreate(Sender);
  FStream = new TMemoryStream();
  cxPropertiesStore->StorageStream = FStream;
  miStoringGridLookFeel->Checked = true;
  miStoringGridLookFeelClick(miStoringGridLookFeel);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::FormDestroy(TObject *Sender)
{
  if (cxPropertiesStore->StorageType == stStream)
    miIniStoreType->Click();
  delete FStream;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::lcbCreatorNewLookupDisplayText(TObject *Sender,
    const TCaption AText)
{
  TcxDBLookupComboBox *ALookupControl = (TcxDBLookupComboBox*)Sender;
  ALookupControl->Reset();
  if (EditorsLookupDemoNewUserForm->ShowEx(AText) == mrOk) {
    ALookupControl->Text = EditorsLookupDemoDataDM->tblUsersUserName->AsString;
    ALookupControl->DataBinding->Field->Value =
      EditorsLookupDemoDataDM->tblUsersID->Value;
  }
  Abort();
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
  ((TMenuItem*)Sender)->Checked = true;
  ((TMenuItem*)Sender)->Parent->Tag = ((TMenuItem*)Sender)->Tag;
  cxPropertiesStore->StorageType = (TcxStorageType)((TMenuItem*)Sender)->Tag;
  if (((TMenuItem*)Sender)->Tag == 0)
    cxPropertiesStore->StorageName = cxPropertiesStore->Name + ".ini";
  else
    cxPropertiesStore->StorageName = cxPropertiesStore->Name;
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::miStoreClick(TObject *Sender)
{
  cxPropertiesStore->StoreTo(true);
}
//---------------------------------------------------------------------------

void __fastcall TEditorsLookupDemoMainForm::miRestoreClick(TObject *Sender)
{
  FStream->Position = 0;
  cxPropertiesStore->RestoreFrom();
}
//---------------------------------------------------------------------------


TMenuItem* __fastcall GetLookAndFeelMenuItem(TMenuItem* AParentMenuItem)
{
  for (int i = 0; i < AParentMenuItem->Count; i++)
	if (AParentMenuItem->Items[i]->Caption == "&Look&&Feel")
	{
	  return(AParentMenuItem->Items[i]);
	};
  return(NULL);
}

void __fastcall TEditorsLookupDemoMainForm::miStoringGridLookFeelClick(TObject *Sender)
{
  int AIndex = IndexOfPropertiesStoreComponent(cxLookAndFeelController);
  TMenuItem* ALookAndFeelMenuItem = GetLookAndFeelMenuItem(miOptions);
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
	for (int i = 0; i < ALookAndFeelMenuItem->Count; i++)
	  {AddMenuItemStoreComponent(ALookAndFeelMenuItem->Items[i]);};
  }
  else
    if (AIndex > -1){
	  delete cxPropertiesStore->Components->Items[AIndex];
	  for (int i = 0; i < ALookAndFeelMenuItem->Count; i++)
	  {
		AIndex = IndexOfPropertiesStoreComponent(ALookAndFeelMenuItem->Items[i]);
        delete cxPropertiesStore->Components->Items[AIndex];
	  };
    }
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
  ((TMenuItem*)Sender)->Checked = !((TMenuItem*)Sender)->Checked;
  cxPropertiesStore->Active = ((TMenuItem*)Sender)->Checked;
  miStoringGridLookFeel->Enabled = ((TMenuItem*)Sender)->Checked;
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetPickLookupMode()
{
  lcbCreator->Properties->DropDownListStyle = lsEditFixedList;
  lcbCreator->Properties->ImmediateDropDown = true;
  lcbCreator->Properties->IncrementalFiltering = true;
  lcbOwner->Properties->DropDownListStyle = lsEditFixedList;
  lcbOwner->Properties->ImmediateDropDown = true;
  lcbOwner->Properties->IncrementalFiltering = true;
  lcbProject->Properties->DropDownListStyle = lsEditFixedList;
  lcbProject->Properties->IncrementalFiltering = True;
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetStandardLookupMode()
{
  lcbCreator->Properties->DropDownListStyle = lsFixedList;
  lcbCreator->Properties->ImmediateDropDown = true;
  lcbCreator->Properties->IncrementalFiltering = false;
  lcbOwner->Properties->DropDownListStyle = lsFixedList;
  lcbOwner->Properties->ImmediateDropDown = true;
  lcbOwner->Properties->IncrementalFiltering = false;
  lcbProject->Properties->DropDownListStyle = lsFixedList;
  lcbProject->Properties->IncrementalFiltering = false;
  lcbProject->Properties->ImmediateDropDown = true;
}
//---------------------------------------------------------------------------

void TEditorsLookupDemoMainForm::SetEditLookupMode()
{
  lcbCreator->Properties->DropDownListStyle = lsEditList;
  lcbCreator->Properties->ImmediateDropDown = false;
  lcbCreator->Properties->IncrementalFiltering = false;
  lcbOwner->Properties->DropDownListStyle = lsEditList;
  lcbOwner->Properties->ImmediateDropDown = false;
  lcbOwner->Properties->IncrementalFiltering = false;
  lcbProject->Properties->DropDownListStyle = lsEditFixedList;
  lcbProject->Properties->IncrementalFiltering = false;
}
//---------------------------------------------------------------------------

