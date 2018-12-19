//---------------------------------------------------------------------------

#ifndef MasterDetailTableDemoDataH
#define MasterDetailTableDemoDataH
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
//---------------------------------------------------------------------------
class TMasterDetailTableDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsFilms;
  TDataSource *dsFilmsPersonsStaff;
  TDataSource *dsPersons;
  TDataSource *dsPersonsLine;
  TTable *tblFilms;
  TTable *tblFilmsPersonsStaff;
  TTable *tblPersons;
  TAutoIncField *tblPersonsID;
  TStringField *tblPersonsFIRSTNAME;
  TStringField *tblPersonsSECONDNAME;
  TBooleanField *tblPersonsGENDER;
  TStringField *tblPersonsNAME;
  TDateTimeField *tblPersonsDATEOFBIRTH;
  TIntegerField *tblPersonsBIRTHCOUNTRY;
  TStringField *tblPersonsLOCATIONOFBIRTH;
  TMemoField *tblPersonsBIOGRAPHY;
  TStringField *tblPersonsNICKNAME;
  TTable *tblPersonsLine;
  TDatabase *DataBase;
  TcxStyleRepository *cxStyleRepository;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxStyle *cxStyle8;
  TcxStyle *cxStyle9;
  TcxStyle *cxStyle10;
  TcxStyle *cxStyle11;
  TcxStyle *cxStyle12;
  TcxStyle *cxStyle13;
  TcxStyle *cxStyle14;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  void __fastcall tblPersonsCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TMasterDetailTableDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailTableDemoDataDM *MasterDetailTableDemoDataDM;
//---------------------------------------------------------------------------
#endif
