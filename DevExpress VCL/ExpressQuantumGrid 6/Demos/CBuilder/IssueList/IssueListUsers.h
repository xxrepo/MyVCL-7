//---------------------------------------------------------------------------

#ifndef IssueListUsersH
#define IssueListUsersH
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
#include "cxDBLookupComboBox.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxLookupEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxTextEdit.hpp"
#include "cxDBLookupComboBox.hpp"
//---------------------------------------------------------------------------
class TfrmUsers : public TfrmBasic
{
__published:	// IDE-managed Components
  TLabel *Label9;
  TcxDBTextEdit *cxDBTextEdit1;
  TLabel *Label1;
  TcxDBTextEdit *cxDBTextEdit2;
  TLabel *Label2;
  TcxDBTextEdit *cxDBTextEdit3;
  TLabel *Label5;
  TcxDBLookupComboBox *cxDBLookupComboBox3;
  TLabel *Label3;
  TcxDBMaskEdit *cxDBMaskEdit1;
  TLabel *Label4;
  TcxDBTextEdit *cxDBTextEdit4;
private:	// User declarations
public:		// User declarations
  __fastcall TfrmUsers(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmUsers *frmUsers;
//---------------------------------------------------------------------------
#endif
