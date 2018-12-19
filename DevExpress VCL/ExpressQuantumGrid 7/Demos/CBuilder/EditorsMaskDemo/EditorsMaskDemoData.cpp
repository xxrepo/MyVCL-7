//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "EditorsMaskDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxGridTableView"
#pragma link "cxStyles"
#pragma resource "*.dfm"
TEditorsMaskDemoMainDM *EditorsMaskDemoMainDM;
//---------------------------------------------------------------------------
__fastcall TEditorsMaskDemoMainDM::TEditorsMaskDemoMainDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
