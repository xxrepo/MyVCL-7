//---------------------------------------------------------------------------

#ifndef StylesSimpleDemoDataH
#define StylesSimpleDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TStylesSimpleDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblPersons;
  TAutoIncField *tblPersonsID;
  TStringField *tblPersonsFIRSTNAME;
  TStringField *tblPersonsSECONDNAME;
  TStringField *tblPersonsBIRTHNAME;
  TDateTimeField *tblPersonsDATEOFBIRTH;
  TIntegerField *tblPersonsBIRTHCOUNTRY;
  TStringField *tblPersonsLOCATIONOFBIRTH;
  TMemoField *tblPersonsBIOGRAPHY;
  TStringField *tblPersonsNICKNAME;
  TDataSource *dsPersons;
  TTable *tblCountries;
  TAutoIncField *tblCountriesID;
  TStringField *tblCountriesName;
  TDataSource *dsCountries;
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
        TcxGridTableViewStyleSheet *UserStyleSheet;
private:	// User declarations
public:		// User declarations
  __fastcall TStylesSimpleDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStylesSimpleDemoDataDM *StylesSimpleDemoDataDM;
//---------------------------------------------------------------------------
#endif
