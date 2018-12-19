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
TEditorsMaskDemoDataDM *EditorsMaskDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TEditorsMaskDemoDataDM::TEditorsMaskDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
