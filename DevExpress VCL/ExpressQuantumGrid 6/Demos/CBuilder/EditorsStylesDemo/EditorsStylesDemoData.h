//---------------------------------------------------------------------------
#ifndef EditorsStylesDemoDataH
#define EditorsStylesDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TEditorsStylesDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TTable *tblProjects;
        TAutoIncField *tblProjectsID;
        TStringField *tblProjectsNAME;
        TIntegerField *tblProjectsMANAGERID;
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
        TIntegerField *tblItemsPROGRESS;
        TIntegerField *tblItemsCHECKPROGRESS;
        TIntegerField *tblItemsFIRSTTARGET;
        TStringField *tblItemsNOTIFICATIONS;
        TStringField *tblItemsIDES;
        TTable *tblUsers;
        TAutoIncField *tblUsersID;
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
        TStringField *tblUsersUserName;
        TTable *tblNoteBook;
        TAutoIncField *tblNoteBookID;
        TStringField *tblNoteBookNAME;
        TDateTimeField *tblNoteBookDATE;
        TMemoField *tblNoteBookNOTE;
        TStringField *tblNoteBookNOTEFONT;
        TIntegerField *tblNoteBookNOTEFONTCOLOR;
        TIntegerField *tblNoteBookNOTETEXTSIZE;
        TIntegerField *tblNoteBookNOTETEXTBKCOLOR;
        TDatabase *Database;
        TDataSource *dsProjects;
        TDataSource *dsItems;
        TDataSource *dsNoteBook;
        TDataSource *dsUsers;
        void __fastcall tblUsersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
        __fastcall TEditorsStylesDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsStylesDemoDataDM *EditorsStylesDemoDataDM;
//---------------------------------------------------------------------------
#endif
