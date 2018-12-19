//---------------------------------------------------------------------------

#ifndef MasterDetailCardDemoDataH
#define MasterDetailCardDemoDataH
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
class TMasterDetailCardDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TDataSource *dsFilms;
        TDataSource *dsFilmsPersons;
        TDataSource *dsPersonsLine;
        TTable *tblFilms;
        TTable *tblPersonsLine;
        TAutoIncField *tblPersonsLineID;
        TStringField *tblPersonsLineNAME;
        TDatabase *DataBase;
        TQuery *qryFilmsPersons;
        TAutoIncField *qryFilmsPersonsID;
        TIntegerField *qryFilmsPersonsFilmID;
        TAutoIncField *qryFilmsPersonsPersonID;
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
        TStringField *qryFilmsPersonsName;
        TBooleanField *qryFilmsPersonsGender;
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
        TcxStyle *cxStyle15;
        TcxStyle *cxStyle16;
        TcxStyle *cxStyle17;
        TcxStyle *cxStyle18;
        TcxStyle *cxStyle19;
        TcxStyle *cxStyle20;
        TcxStyle *cxStyle21;
        TcxStyle *cxStyle22;
        TcxStyle *cxStyle23;
        TcxStyle *cxStyle24;
        TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
        TcxGridCardViewStyleSheet *GridCardViewStyleSheetDevExpress;
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
	TUpdateSQL *UpdateSQL;
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
  void __fastcall qryFilmsPersonsCalcFields(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterPost(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterInsert(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterDelete(TDataSet *DataSet);
private:	// User declarations
        bool FIsInserting;
	void InsertNewPersonStaff();
public:		// User declarations
  __fastcall TMasterDetailCardDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMasterDetailCardDemoDataDM *MasterDetailCardDemoDataDM;
//---------------------------------------------------------------------------
#endif
