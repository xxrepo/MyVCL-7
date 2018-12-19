  //---------------------------------------------------------------------------

#ifndef EditorsLookupDemoDataH
#define EditorsLookupDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxContainer.hpp"
#include "cxEdit.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TEditorsLookupDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsProjects;
  TDataSource *dsItems;
  TTable *tblItems;
  TAutoIncField *tblItemsID;
  TStringField *tblItemsNAME;
  TBooleanField *tblItemsTYPE;
  TIntegerField *tblItemsPROJECTID;
  TSmallintField *tblItemsPRIORITY;
  TSmallintField *tblItemsSTATUS;
  TIntegerField *tblItemsCREATORID;
  TDateTimeField *tblItemsCREATEDDATE;
  TIntegerField *tblItemsOWNERID;
  TDateTimeField *tblItemsLASTMODIFIEDDATE;
  TDateTimeField *tblItemsFIXEDDATE;
  TMemoField *tblItemsDESCRIPTION;
  TMemoField *tblItemsRESOLUTION;
  TTable *tblUsers;
  TAutoIncField *tblUsersID;
  TStringField *tblUsersUserName;
  TStringField *tblUsersFNAME;
  TStringField *tblUsersMNAME;
  TStringField *tblUsersLNAME;
  TStringField *tblUsersCOUNTRY;
  TStringField *tblUsersPOSTALCODE;
  TStringField *tblUsersCITY;
  TStringField *tblUsersADDRESS;
  TStringField *tblUsersPHONE;
  TStringField *tblUsersFAX;
  TStringField *tblUsersEMAIL;
  TStringField *tblUsersHOMEPAGE;
  TIntegerField *tblUsersDEPARTMENTID;
  TStringField *tblUsersDepartment;
  TDataSource *dsUsers;
  TDatabase *DataBase;
  TDataSource *dsDepartments;
  TTable *tblDepartments;
  TImageList *imStat;
  TQuery *qryProjects;
  TAutoIncField *qryProjectsID;
  TStringField *qryProjectsNAME;
  TIntegerField *qryProjectsMANAGERID;
  TStringField *qryProjectsManager;
  TcxEditStyleController *StyleController;
  void __fastcall tblUsersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TEditorsLookupDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsLookupDemoDataDM *EditorsLookupDemoDataDM;
//---------------------------------------------------------------------------
#endif
