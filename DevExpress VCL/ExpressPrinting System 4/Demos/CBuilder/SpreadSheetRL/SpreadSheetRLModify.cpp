//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "SpreadSheetRLModify.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "cxSSCtrls"
#pragma resource "*.dfm"
TSpreadSheetRLModifyForm *SpreadSheetRLModifyForm;
//---------------------------------------------------------------------------
__fastcall TSpreadSheetRLModifyForm::TSpreadSheetRLModifyForm(TComponent* Owner)
  : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSpreadSheetRLModifyForm::SetCaptions(AnsiString ACaptions[8])
{
  ((TControlAccess*)this)->Caption = ACaptions[0];
  cxLB->CaptionText = ACaptions[1];
  ((TControlAccess*)rbShiftCol)->Caption = ACaptions[2];
  ((TControlAccess*)rbShiftRw)->Caption = ACaptions[3];
  ((TControlAccess*)rbRw)->Caption = ACaptions[4];
  ((TControlAccess*)rbCol)->Caption = ACaptions[5];
  ((TControlAccess*)btnOk)->Caption = ACaptions[6];
  ((TControlAccess*)btnCancel)->Caption = ACaptions[7];
}

bool __fastcall TSpreadSheetRLModifyForm::Execute(TcxSSModifyType AModifySheet)
{
  AnsiString ACaptions[8];
  ACaptions[2] = "Shift cells left";
  ACaptions[3] = "Shift cells top";
  ACaptions[4] = "Entire row";
  ACaptions[5] = "Entire column";
  ACaptions[6] = "&Ok";
  ACaptions[7] = "&Cancel";
  if (AModifySheet == mtInsert) {
    ACaptions[0] = "Insert";
    ACaptions[1] = "Insert";
    SetCaptions(ACaptions);
  }
  else {
    ACaptions[0] = "Delete";
    ACaptions[1] = "Delete";
    SetCaptions(ACaptions);
  }
  bool Result;
  Result = TForm::ShowModal() == mrOk;
  if (Result) {
    if (rbShiftCol->Checked)
      FModifySheet = msShiftCol;
    else
      if (rbShiftRw->Checked)
        FModifySheet = msShiftRow;
      else
        if (rbRw->Checked)
          FModifySheet = msAllCol;
        else
          FModifySheet = msAllRow;
  }
  return Result;
}
