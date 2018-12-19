//---------------------------------------------------------------------------

#ifndef EditorsInPlaceDemoCarsH
#define EditorsInPlaceDemoCarsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxCalc.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDBEdit.hpp"
#include "cxEdit.hpp"
#include "cxMemo.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxListBox.hpp"
//---------------------------------------------------------------------------
class TEditorsInPlaceDemoCarsForm : public TForm
{
__published:	// IDE-managed Components
  TPanel *pnlCarInfo;
  TLabel *Label6;
  TcxDBMemo *cxDBMemo1;
  TPanel *Panel1;
  TLabel *Label3;
  TLabel *Label4;
  TcxDBTextEdit *cxDBTextEdit1;
  TcxDBTextEdit *cxDBTextEdit2;
  TGroupBox *GroupBox1;
  TcxDBTextEdit *cxDBTextEdit5;
  TcxDBTextEdit *cxDBTextEdit4;
  TcxDBTextEdit *cxDBTextEdit8;
  TGroupBox *GroupBox2;
  TcxDBCheckBox *cxDBCheckBox;
  TcxDBListBox *cxDBListBox;
  TGroupBox *GroupBox3;
  TcxDBTextEdit *cxDBTextEdit7;
  TcxDBTextEdit *cxDBTextEdit6;
private:	// User declarations
public:		// User declarations
  __fastcall TEditorsInPlaceDemoCarsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsInPlaceDemoCarsForm *EditorsInPlaceDemoCarsForm;
//---------------------------------------------------------------------------
#endif
 