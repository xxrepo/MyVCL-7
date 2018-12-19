//---------------------------------------------------------------------------

#ifndef IssueListScheduleH
#define IssueListScheduleH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "IssueListForm.h"
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDBEdit.hpp"
#include "cxEdit.hpp"
#include "cxTextEdit.hpp"
//---------------------------------------------------------------------------
class TfrmSchedule : public TfrmBasic
{
__published:	// IDE-managed Components
  TLabel *Label5;
  TcxDBTextEdit *cxDBTextEdit1;
  TLabel *Label9;
  TcxDBTextEdit *cxDBTextEdit2;
  TLabel *Label2;
  TcxDBTextEdit *cxDBTextEdit3;
  TLabel *Label3;
  TcxDBTextEdit *cxDBTextEdit4;
  TLabel *Label6;
  TcxDBTextEdit *cxDBTextEdit5;
  TLabel *Label7;
  TcxDBTextEdit *cxDBTextEdit6;
  TLabel *Label8;
  TcxDBTextEdit *cxDBTextEdit7;
  TLabel *Label1;
  TcxDBTextEdit *cxDBTextEdit8;
  TLabel *Label4;
  TcxDBTextEdit *cxDBTextEdit9;
  TScrollBox *ScrollBox;
private:	// User declarations
public:		// User declarations
  __fastcall TfrmSchedule(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmSchedule *frmSchedule;
//---------------------------------------------------------------------------
#endif
