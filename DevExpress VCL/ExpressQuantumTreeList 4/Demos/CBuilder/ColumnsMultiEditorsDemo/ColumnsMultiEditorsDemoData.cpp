//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColumnsMultiEditorsDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TColumnsMultiEditorsDemoDataDM *ColumnsMultiEditorsDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TColumnsMultiEditorsDemoDataDM::TColumnsMultiEditorsDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------
