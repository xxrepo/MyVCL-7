//---------------------------------------------------------------------------

#ifndef EBarMegaDemoDataH
#define EBarMegaDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TEBarMegaDemoMainDM : public TDataModule
{
__published:	// IDE-managed Components
  TTable *tblContacts;
  TAutoIncField *tblContactsID;
  TIntegerField *tblContactsProductID;
  TStringField *tblContactsFirstName;
  TStringField *tblContactsLastName;
  TStringField *tblContactsCompany;
  TStringField *tblContactsAddress;
  TStringField *tblContactsCity;
  TStringField *tblContactsState;
  TDateField *tblContactsPurchaseDate;
  TStringField *tblContactsPaymentType;
  TBCDField *tblContactsPaymentAmount;
  TStringField *tblContactsproduct;
  TStringField *tblContactsCustName;
  TTable *tblProducts;
  TIntegerField *tblProductsID;
  TStringField *tblProductsNAME;
  TStringField *tblProductsDescription;
  TDatabase *Database;
  TDataSource *dsProducts;
  TDataSource *dsContacts;
  void __fastcall tblContactsCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TEBarMegaDemoMainDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEBarMegaDemoMainDM *EBarMegaDemoMainDM;
//---------------------------------------------------------------------------
#endif
