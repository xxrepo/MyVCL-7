//---------------------------------------------------------------------------

#ifndef UnboundColumnsDemoDataH
#define UnboundColumnsDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxDBEditRepository.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxGridCardView.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TUnboundColumnsDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *Database;
  TTable *tblCustomers;
  TAutoIncField *tblCustomersID;
  TStringField *tblCustomersFIRSTNAME;
  TStringField *tblCustomersLASTNAME;
  TStringField *tblCustomersCOMPANYNAME;
  TIntegerField *tblCustomersPAYMENTTYPE;
  TIntegerField *tblCustomersPRODUCTID;
  TBooleanField *tblCustomersCUSTOMER;
  TDateTimeField *tblCustomersPURCHASEDATE;
  TCurrencyField *tblCustomersPAYMENTAMOUNT;
  TIntegerField *tblCustomersCOPIES;
  TDataSource *dsCustomers;
private:	// User declarations
public:		// User declarations
  __fastcall TUnboundColumnsDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TUnboundColumnsDemoDataDM *UnboundColumnsDemoDataDM;
//---------------------------------------------------------------------------
#endif
