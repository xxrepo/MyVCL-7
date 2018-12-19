//---------------------------------------------------------------------------

#ifndef DragDropDemoDataH
#define DragDropDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridBandedTableView.hpp"
#include "cxGridCardView.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TDragDropDemoMainDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsFilms;
  TDataSource *dsFilmsPersons;
  TDataSource *dsPersonsLine;
  TDataSource *dsFilmsCompanies;
  TDataSource *dsFilmsScreens;
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
  TcxStyle *cxStyle25;
  TcxStyle *cxStyle26;
  TcxStyle *cxStyle27;
  TcxStyle *cxStyle28;
  TcxStyle *cxStyle29;
  TcxStyle *cxStyle30;
  TcxStyle *cxStyle31;
  TcxStyle *cxStyle32;
  TcxStyle *cxStyle33;
  TcxStyle *cxStyle34;
  TcxStyle *cxStyle35;
  TcxStyle *cxStyle36;
  TcxStyle *cxStyle37;
  TcxStyle *cxStyle38;
  TcxStyle *cxStyle39;
  TcxStyle *cxStyle40;
  TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
  TcxGridBandedTableViewStyleSheet *GridBandedTableViewStyleSheetDevExpress;
  TcxGridCardViewStyleSheet *GridCardViewStyleSheetDevExpress;
  TDataSource *dsPersons;
  TDataSource *dsCompanies;
  TDataSource *dsFilmsDict;
  TDataSource *dsCountries;
  TDataSource *dsCompaniesType;
  TQuery *qryFilms;
  TIntegerField *qryFilmsPrimeID;
  TIntegerField *qryFilmsID;
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
  TDatabase *Database;
  TQuery *qryFilmsCompanies;
  TIntegerField *qryFilmsCompaniesID;
  TIntegerField *qryFilmsCompaniesFilmID;
  TIntegerField *qryFilmsCompaniesCompanyID;
  TIntegerField *qryFilmsCompaniesCompanyID_1;
  TStringField *qryFilmsCompaniesCompanyName;
  TTable *tblPersons;
  TTable *tblCompanies;
  TTable *tblFilmsDict;
  TTable *tblCompaniesType;
  TQuery *qryFilmsPersons;
  TStringField *qryFilmsPersonsName;
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
  TTable *tblPersonsLine;
  TAutoIncField *tblPersonsLineID;
  TStringField *tblPersonsLineNAME;
  TTable *tblFilmsCompaniesStaff;
  TAutoIncField *tblFilmsCompaniesStaffID;
  TIntegerField *tblFilmsCompaniesStaffFILMID;
  TIntegerField *tblFilmsCompaniesStaffCOMPANYID;
  TStringField *tblFilmsCompaniesStaffDESCRIPTION;
  TTable *tblFilmsGenres;
  TAutoIncField *tblFilmsGenresID;
  TIntegerField *tblFilmsGenresFILMID;
  TIntegerField *tblFilmsGenresGENREID;
  TTable *tblFilmsPersonsStaff;
  TAutoIncField *tblFilmsPersonsStaffID;
  TIntegerField *tblFilmsPersonsStaffFILMID;
  TIntegerField *tblFilmsPersonsStaffPERSONLINEID;
  TIntegerField *tblFilmsPersonsStaffPERSONID;
  TStringField *tblFilmsPersonsStaffDESCRIPTION;
  TTable *tlbCountries;
  TUpdateSQL *usqFilmsCompanies;
  TUpdateSQL *usqFilmsPersons;
  TUpdateSQL *usqFilms;
  TTable *tblFilmsScreens;
  void __fastcall qryFilmsBeforeDelete(TDataSet *DataSet);
  void __fastcall qryFilmsCompaniesBeforeDelete(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsAfterPost(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsBeforeDelete(TDataSet *DataSet);
  void __fastcall tblPersonsAfterUpdate(TDataSet *DataSet);
  void __fastcall tblPersonsBeforeUpdate(TDataSet *DataSet);
  void __fastcall tblCompaniesAfterUpdate(TDataSet *DataSet);
  void __fastcall tblCompaniesBeforeUpdate(TDataSet *DataSet);
  void __fastcall tblFilmsDictAfterUpdate(TDataSet *DataSet);
  void __fastcall tblFilmsDictBeforeUpdate(TDataSet *DataSet);
  void __fastcall qryFilmsPersonsCalcFields(TDataSet *DataSet);
private:
  TNotifyEvent FOnNextRecord;
  int FFilmID, FCompanyID, FPersonID;
protected:
  void __fastcall DoNextRecord(TObject* Sender);
public:
  __fastcall TDragDropDemoMainDM(TComponent* Owner);
  __property TNotifyEvent OnNextRecord = {read = FOnNextRecord, write = FOnNextRecord};
};
//---------------------------------------------------------------------------
extern PACKAGE TDragDropDemoMainDM *DragDropDemoMainDM;
//---------------------------------------------------------------------------
#endif
