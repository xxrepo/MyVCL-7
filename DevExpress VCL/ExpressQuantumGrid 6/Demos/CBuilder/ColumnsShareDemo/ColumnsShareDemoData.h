//---------------------------------------------------------------------------

#ifndef ColumnsShareDemoDataH
#define ColumnsShareDemoDataH
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
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TColumnsShareDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TTable *tblProjects;
  TAutoIncField *tblProjectsID;
  TStringField *tblProjectsNAME;
  TIntegerField *tblProjectsMANAGERID;
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
  TDataSource *dsProjectTeam;
  TTable *tblProjectTeam;
  TAutoIncField *tblProjectTeamID;
  TIntegerField *tblProjectTeamPROJECTID;
  TIntegerField *tblProjectTeamUSERID;
  TStringField *tblProjectTeamFUNCTION;
  TDatabase *DataBase;
  TDataSource *dsDepartments;
  TTable *tblDepartments;
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
  TImageList *imStat;
  void __fastcall tblUsersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TColumnsShareDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColumnsShareDemoDataDM *ColumnsShareDemoDataDM;
//---------------------------------------------------------------------------
#endif
