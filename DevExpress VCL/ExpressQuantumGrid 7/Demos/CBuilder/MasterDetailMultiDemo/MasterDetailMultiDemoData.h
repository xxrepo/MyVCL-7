//---------------------------------------------------------------------------

#ifndef MasterDetailMultiDemoDataH
#define MasterDetailMultiDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxGridBandedTableView.hpp"
#include "cxGridCardView.hpp"
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TMasterDetailMultiDemoMainDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsFilms;
  TDataSource *dsFilmsPersons;
  TDataSource *dsPersonsLine;
  TTable *tblPersonsLine;
  TAutoIncField *tblPersonsLineID;
  TStringField *tblPersonsLineNAME;
  TDatabase *DataBase;
  TQuery *qryFilmsPersons;
  TStringField *qryFilmsPersonsName;
  TIntegerField *qryFilmsPersonsPersonLineID;
  TStringField *qryFilmsPersonsFIRSTNAME;
  TStringField *qryFilmsPersonsSECONDNAME;
  TStringField *qryFilmsPersonsNICKNAME;
  TStringField *qryFilmsPersonsBIRTHNAME;
  TDateTimeField *qryFilmsPersonsDATEOFBIRTH;
  TStringField *qryFilmsPersonsLOCATIONOFBIRTH;
  TMemoField *qryFilmsPersonsBIOGRAPHY;
  TStringField *qryFilmsPersonsHOMEPAGE;
  TAutoIncField *qryFilmsPersonsID;
  TIntegerField *qryFilmsPersonsFilmID;
  TIntegerField *qryFilmsPersonsBIRTHCOUNTRY;
  TBooleanField *qryFilmsPersonsGender;
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
  TQuery *qryFilms;
  TAutoIncField *qryFilmsID;
  TStringField *qryFilmsCAPTION;
  TIntegerField *qryFilmsYEAR;
  TStringField *qryFilmsTAGLINE;
  TStringField *qryFilmsPLOTOUTLINE;
  TIntegerField *qryFilmsRUNTIME;
  TStringField *qryFilmsCOLOR;
  TBlobField *qryFilmsPHOTO;
  TBlobField *qryFilmsICON;
  TStringField *qryFilmsWEBSITE;
  TTable *tblGenres;
  TAutoIncField *tblGenresID;
  TStringField *tblGenresNAME;
  TcxStyleRepository *cxStyleRepository;
        TcxStyle *styleBold;
  void __fastcall qryFilmsPersonsBeforePost(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterInsert(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsCalcFields(TDataSet *DataSet);
private:	// User declarations
  bool FIsInserting;
  void InsertNewPerson();
  void InsertNewPersonStaff();
public:		// User declarations
  __fastcall TMasterDetailMultiDemoMainDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailMultiDemoMainDM *MasterDetailMultiDemoMainDM;
//---------------------------------------------------------------------------
#endif
