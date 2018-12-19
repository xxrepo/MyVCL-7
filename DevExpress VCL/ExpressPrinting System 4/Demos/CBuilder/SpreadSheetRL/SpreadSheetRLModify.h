//---------------------------------------------------------------------------
#ifndef SpreadSheetRLModifyH
#define SpreadSheetRLModifyH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxSSCtrls.hpp"
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TControlAccess : public TControl {
public:
	__property Caption;
};

class TSpreadSheetRLModifyForm : public TForm
{
__published:	// IDE-managed Components
  TButton *btnOk;
  TButton *btnCancel;
  TPanel *gpPanel;
  TRadioButton *rbShiftCol;
  TRadioButton *rbShiftRw;
  TRadioButton *rbRw;
  TRadioButton *rbCol;
  TcxLabelBevel *cxLB;
private:	// User declarations
  TcxSSCellsModify FModifySheet;
  void __fastcall SetCaptions(AnsiString ACaptions[8]);
public:		// User declarations
  __fastcall TSpreadSheetRLModifyForm(TComponent* Owner);
  bool __fastcall Execute(TcxSSModifyType AModifySheet);
  __property TcxSSCellsModify Modify = {read = FModifySheet, write = FModifySheet};
};
//---------------------------------------------------------------------------
extern PACKAGE TSpreadSheetRLModifyForm *SpreadSheetRLModifyForm;
//---------------------------------------------------------------------------
#endif
 