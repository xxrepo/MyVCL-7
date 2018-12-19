//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DragDropDemoData.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxClasses"
#pragma link "cxStyles"
#pragma link "cxTL"
#pragma resource "*.dfm"
TDragDropDemoDataDM *DragDropDemoDataDM;
//---------------------------------------------------------------------------
__fastcall TDragDropDemoDataDM::TDragDropDemoDataDM(TComponent* Owner)
  : TDataModule(Owner)
{
}
//---------------------------------------------------------------------------

void TDragDropDemoDataDM::SetParentValue(Variant AValue)
{
  if (tblDepartments->State == dsEdit || tblDepartments->State == dsInsert)
    tblDepartments->FindField("ParentID")->Value = AValue;
}
//---------------------------------------------------------------------------

