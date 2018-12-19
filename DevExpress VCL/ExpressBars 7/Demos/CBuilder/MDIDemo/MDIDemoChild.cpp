//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "MDIDemoChild.h"
#include <stdio.h>
#include "MDIDemoMain.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TfrmMDIChild *frmMDIChild;
//---------------------------------------------------------------------------
__fastcall TfrmMDIChild::TfrmMDIChild(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::SetFileName(AnsiString Value)
{
  int I;

  FFileName = Value;
  Caption = FFileName;
  I = frmMDIMain->dxBarListWindows->Items->IndexOfObject(this);
  if ((0 <= I) && (I < frmMDIMain->dxBarListWindows->Items->Count))
    frmMDIMain->dxBarListWindows->Items->Strings[I] = FFileName;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::FormCreate(TObject *Sender)
{
  frmMDIMain->CreatedMDICount++;
  Caption = "Document" + IntToStr(frmMDIMain->CreatedMDICount);
  Editor->OnChange = frmMDIMain->EditorChange;
  Editor->OnSelectionChange = frmMDIMain->EditorSelectionChange;
  frmMDIMain->dxBarListWindows->Items->AddObject(Caption, this);
  Editor->Modified;

  if (frmMDIMain->MDIChildCount == 1) frmMDIMain->ShowItems(True);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::FormClose(TObject *Sender,
      TCloseAction &Action)
{
  if (frmMDIMain->FileName != "")
    frmMDIMain->dxBarMRUFiles->AddItem(frmMDIMain->FileName, NULL);

  Action = caFree;
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::FormActivate(TObject *Sender)
{
  Editor->OnChange(Editor);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::FormDestroy(TObject *Sender)
{
  frmMDIMain->dxBarListWindows->Items->Delete(frmMDIMain->dxBarListWindows->Items->IndexOfObject(this));

  if (frmMDIMain->MDIChildCount == 1) frmMDIMain->ShowItems(False);
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::FormCloseQuery(TObject *Sender, bool &CanClose)
{
  if (Editor->Modified)
  {
	int Res = MessageBox(0,
	   dxStringToAnsiString(Format("Do you want to save the changes you made to ""%s""?", ARRAYOFCONST((Caption))), 0).c_str(),
	   dxStringToAnsiString(Application->Title, 0).c_str(), MB_ICONQUESTION | MB_YESNOCANCEL);
	switch (Res)
    {
      case ID_YES: CanClose = frmMDIMain->SaveFile(False); break;
      case ID_NO: CanClose = True; break;
      case ID_CANCEL: CanClose = False; break;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TfrmMDIChild::EditorMouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  if (Button == mbRight)
	frmMDIMain->dxBarPopupMenu->PopupFromCursorPos();
}
//---------------------------------------------------------------------------

