//---------------------------------------------------------------------------

#ifndef MasterDetailDemoDataH
#define MasterDetailDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxGridCardView.hpp"
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TMasterDetailDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TDataSource *dsFilms;
        TDataSource *dsFilmsPersons;
        TDataSource *dsPersonsLine;
        TTable *tblFilms;
        TAutoIncField *tblFilmsID;
        TStringField *tblFilmsCAPTION;
        TIntegerField *tblFilmsYEAR;
        TStringField *tblFilmsTAGLINE;
        TStringField *tblFilmsPLOTOUTLINE;
        TIntegerField *tblFilmsRUNTIME;
        TStringField *tblFilmsCOLOR;
        TBlobField *tblFilmsPHOTO;
        TBlobField *tblFilmsICON;
        TStringField *tblFilmsWEBSITE;
        TTable *tblPersonsLine;
        TAutoIncField *tblPersonsLineID;
        TStringField *tblPersonsLineNAME;
        TDatabase *Database;
        TQuery *qryFilmsPersons;
        TIntegerField *qryFilmsPersonsID;
        TIntegerField *qryFilmsPersonsFilmID;
        TIntegerField *qryFilmsPersonsPersonID;
        TIntegerField *qryFilmsPersonsPersonLineID;
        TMemoField *qryFilmsPersonsBIOGRAPHY;
        TIntegerField *qryFilmsPersonsBIRTHCOUNTRY;
        TStringField *qryFilmsPersonsBIRTHNAME;
        TDateTimeField *qryFilmsPersonsDATEOFBIRTH;
        TStringField *qryFilmsPersonsFIRSTNAME;
        TStringField *qryFilmsPersonsLOCATIONOFBIRTH;
        TStringField *qryFilmsPersonsNICKNAME;
        TStringField *qryFilmsPersonsSECONDNAME;
        TStringField *qryFilmsPersonsHOMEPAGE;
        TBooleanField *qryFilmsPersonsGender;
        TStringField *qryFilmsPersonsName;
        TTable *tblPersonsHelper;
        TAutoIncField *tblPersonsHelperID;
        TStringField *tblPersonsHelperFIRSTNAME;
        TStringField *tblPersonsHelperSECONDNAME;
        TBooleanField *tblPersonsHelperGENDER;
        TStringField *tblPersonsHelperBIRTHNAME;
        TDateTimeField *tblPersonsHelperDATEOFBIRTH;
        TIntegerField *tblPersonsHelperBIRTHCOUNTRY;
        TStringField *tblPersonsHelperLOCATIONOFBIRTH;
        TMemoField *tblPersonsHelperBIOGRAPHY;
        TStringField *tblPersonsHelperNICKNAME;
        TStringField *tblPersonsHelperHOMEPAGE;
        TTable *tblPersonsStaffHelper;
        TAutoIncField *tblPersonsStaffHelperID;
        TIntegerField *tblPersonsStaffHelperFILMID;
        TIntegerField *tblPersonsStaffHelperPERSONLINEID;
        TIntegerField *tblPersonsStaffHelperPERSONID;
        TStringField *tblPersonsStaffHelperDESCRIPTION;
        TDataSource *dsFilmsCompanies;
        TQuery *qryFilmsCompanies;
        TStringField *qryFilmsCompaniesName;
        TStringField *qryFilmsCompaniesType;
        TStringField *qryFilmsCompaniesCountry;
        TStringField *qryFilmsCompaniesWebSite;
        TIntegerField *qryFilmsCompaniesID;
        TIntegerField *qryFilmsCompaniesFILMID;
        TTable *tblFilmsScreens;
        TAutoIncField *tblFilmsScreensID;
        TIntegerField *tblFilmsScreensFILMID;
        TBlobField *tblFilmsScreensSCREEN;
        TBlobField *tblFilmsScreensICON;
        TDataSource *dsFilmsScreens;
        TUpdateSQL *UpdateSQL;
  void __fastcall qryFilmsPersonsCalcFields(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterPost(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterInsert(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterDelete(TDataSet *DataSet);
private:	// User declarations
        bool FIsInserting;
	void InsertNewPersonStaff();
public:		// User declarations
  __fastcall TMasterDetailDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailDemoDataDM *MasterDetailDemoDataDM;
//---------------------------------------------------------------------------
#endif
