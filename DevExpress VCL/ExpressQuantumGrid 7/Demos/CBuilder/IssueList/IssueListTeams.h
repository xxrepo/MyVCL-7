//---------------------------------------------------------------------------

#ifndef IssueListTeamsH
#define IssueListTeamsH
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
class TfrmTeams : public TfrmBasic
{
__published:	// IDE-managed Components
  TLabel *Label5;
  TcxDBLookupComboBox *cxDBLookupComboBox3;
  TLabel *Label1;
  TcxDBLookupComboBox *cxDBLookupComboBox1;
  TLabel *Label9;
  TcxDBTextEdit *cxDBTextEdit1;
private:	// User declarations
public:		// User declarations
  __fastcall TfrmTeams(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmTeams *frmTeams;
//---------------------------------------------------------------------------
#endif
