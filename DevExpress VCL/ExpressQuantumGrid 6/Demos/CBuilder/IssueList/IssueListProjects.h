//---------------------------------------------------------------------------

#ifndef IssueListProjectsH
#define IssueListProjectsH
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
class TfrmProjects : public TfrmBasic
{
__published:	// IDE-managed Components
  TLabel *Label1;
  TcxDBTextEdit *cxDBTextEdit1;
  TLabel *Label5;
  TcxDBLookupComboBox *cxDBLookupComboBox3;
private:	// User declarations
public:		// User declarations
  __fastcall TfrmProjects(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmProjects *frmProjects;
//---------------------------------------------------------------------------
#endif
