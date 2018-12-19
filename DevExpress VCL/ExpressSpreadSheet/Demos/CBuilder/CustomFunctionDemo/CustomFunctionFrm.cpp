//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "CustomFunctionFrm.h"
#include "AreaCustomFunc.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxControls"
#pragma link "cxSSheet"
#pragma resource "*.dfm"
TCustomFunctionForm *CustomFunctionForm;
//---------------------------------------------------------------------------
__fastcall TCustomFunctionForm::TCustomFunctionForm(TComponent* Owner)
  : TForm(Owner)
{
  TcxSSCellObject *CellObject;
  try {

    cxSpreadSheet->LoadFromFile(ExtractFilePath(Application->ExeName) + "\CustomFunctionEx.xls");
    CellObject = cxSpreadSheet->Sheet->GetCellObject(1,4);
    try {
      CellObject->Text = "=Area(B3:B4)";
    }
    __finally {
      delete CellObject;
    }
  }
  catch (Exception &err) {
    Application->ShowException(&err);
    ActiveMDIChild->Close();
  }
}
//---------------------------------------------------------------------------
