//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "EBarMDIDemoChild.h"
#include <stdio.h>
#include "EBarMDIDemoMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TEBarMDIDemoChildForm *EBarMDIDemoChildForm;
//---------------------------------------------------------------------------
__fastcall TEBarMDIDemoChildForm::TEBarMDIDemoChildForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::SetFileName(AnsiString Value)
{
  int I;

  FFileName = Value;
  Caption = FFileName;
  I = EBarMDIDemoMainForm->dxBarListWindows->Items->IndexOfObject(this);
  if ((0 <= I) && (I < EBarMDIDemoMainForm->dxBarListWindows->Items->Count))
    EBarMDIDemoMainForm->dxBarListWindows->Items->Strings[I] = FFileName;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::FormCreate(TObject *Sender)
{
  EBarMDIDemoMainForm->CreatedMDICount++;
  Caption = "Document" + IntToStr(EBarMDIDemoMainForm->CreatedMDICount);
  Editor->OnChange = EBarMDIDemoMainForm->EditorChange;
  Editor->OnSelectionChange = EBarMDIDemoMainForm->EditorSelectionChange;
  EBarMDIDemoMainForm->dxBarListWindows->Items->AddObject(Caption, this);
  Editor->Modified;

  if (EBarMDIDemoMainForm->MDIChildCount == 1) EBarMDIDemoMainForm->ShowItems(True);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::FormClose(TObject *Sender,
      TCloseAction &Action)
{
  if (EBarMDIDemoMainForm->FileName != "")
    EBarMDIDemoMainForm->dxBarMRUFiles->AddItem(EBarMDIDemoMainForm->FileName, NULL);

  Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::FormActivate(TObject *Sender)
{
  Editor->OnChange(Editor);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::FormDestroy(TObject *Sender)
{
  EBarMDIDemoMainForm->dxBarListWindows->Items->Delete(EBarMDIDemoMainForm->dxBarListWindows->Items->IndexOfObject(this));

  if (EBarMDIDemoMainForm->MDIChildCount == 1) EBarMDIDemoMainForm->ShowItems(False);
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  if (Editor->Modified)
  {
	int Res = MessageBox(0,
	  dxStringToAnsiString(Format("Do you want to save the changes you made to ""%s""?", ARRAYOFCONST((Caption)))).c_str(),
	  dxStringToAnsiString(Application->Title).c_str(), MB_ICONQUESTION | MB_YESNOCANCEL);
	switch (Res)
    {
      case ID_YES: CanClose = EBarMDIDemoMainForm->SaveFile(False); break;
      case ID_NO: CanClose = True; break;
      case ID_CANCEL: CanClose = False; break;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TEBarMDIDemoChildForm::EditorMouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  if (Button == mbRight)
    EBarMDIDemoMainForm->dxBarPopupMenu->PopupFromCursorPos();
}
//---------------------------------------------------------------------------

