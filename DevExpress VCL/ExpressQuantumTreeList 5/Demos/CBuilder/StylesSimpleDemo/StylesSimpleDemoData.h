//---------------------------------------------------------------------------

#ifndef StylesSimpleDemoDataH
#define StylesSimpleDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxTL.hpp"
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TStylesSimpleDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblDEPARTMENTS;
  TDataSource *dsDEPARTMENTS;
  TTable *tblPERSONS;
  TAutoIncField *tblPERSONSID;
  TStringField *tblPERSONSName;
  TStringField *tblPERSONSCountry;
  TStringField *tblPERSONSPostalCode;
  TStringField *tblPERSONSCity;
  TStringField *tblPERSONSAddress;
  TStringField *tblPERSONSPhone;
  TStringField *tblPERSONSFax;
  TStringField *tblPERSONSEMAIL;
  TStringField *tblPERSONSHOMEPAGE;
  TIntegerField *tblPERSONSDepartmentID;
  TDataSource *dsPERSONS;
  TcxStyleRepository *StyleRepository;
  TcxStyle *Sunny;
  TcxStyle *Dark;
  TcxStyle *Golden;
  TcxStyle *Summer;
  TcxStyle *Autumn;
  TcxStyle *Bright;
  TcxStyle *Cold;
  TcxStyle *Spring;
  TcxStyle *Light;
  TcxStyle *Winter;
  TcxStyle *Depth;
  TcxTreeListStyleSheet *UserStyleSheet;
private:	// User declarations
public:		// User declarations
  void __fastcall SetParentValue(Variant AValue);
  __fastcall TStylesSimpleDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStylesSimpleDemoDataDM *StylesSimpleDemoDataDM;
//---------------------------------------------------------------------------
#endif
