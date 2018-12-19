//---------------------------------------------------------------------------

#ifndef IssueListItemsH
#define IssueListItemsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "IssueListForm.h"
#include <DBCtrls.hpp>
#include <ExtCtrls.hpp>
#include "cxCalendar.hpp"
#include "cxContainer.hpp"
#include "cxControls.hpp"
#include "cxDBEdit.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxDropDownEdit.hpp"
#include "cxEdit.hpp"
#include "cxImageComboBox.hpp"
#include "cxLookupEdit.hpp"
#include "cxMaskEdit.hpp"
#include "cxMemo.hpp"
#include "cxTextEdit.hpp"
#include <ComCtrls.hpp>
#include "cxDBLookupComboBox.hpp"
//---------------------------------------------------------------------------
class TfrmItems : public TfrmBasic
{
__published:	// IDE-managed Components
  TPageControl *PageControl;
  TTabSheet *tsGeneral;
  TScrollBox *ScrollBox;
  TLabel *Label2;
  TLabel *Label1;
  TLabel *Label5;
  TLabel *Label4;
  TLabel *Label10;
  TLabel *Label8;
  TLabel *Label6;
  TLabel *Label3;
  TLabel *Label7;
  TLabel *Label11;
  TcxDBTextEdit *cxDBTextEdit1;
  TcxDBLookupComboBox *cxDBLookupComboBox3;
  TcxDBImageComboBox *cxDBImageComboBox3;
  TcxDBImageComboBox *cxDBImageComboBox2;
  TcxDBImageComboBox *cxDBImageComboBox1;
  TcxDBLookupComboBox *cxDBLookupComboBox1;
  TcxDBDateEdit *cxDBDateEdit3;
  TcxDBLookupComboBox *cxDBLookupComboBox2;
  TcxDBDateEdit *cxDBDateEdit2;
  TcxDBDateEdit *cxDBDateEdit1;
  TTabSheet *tsDescription;
  TcxDBMemo *cxDBMemo1;
  TTabSheet *tsResolution;
  TcxDBMemo *cxDBMemo2;
private:	// User declarations
public:		// User declarations
  __fastcall TfrmItems(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmItems *frmItems;
//---------------------------------------------------------------------------
#endif
