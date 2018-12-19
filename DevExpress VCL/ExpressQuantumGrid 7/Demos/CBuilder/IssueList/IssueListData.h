//---------------------------------------------------------------------------

#ifndef IssueListDataH
#define IssueListDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxContainer.hpp"
#include "cxDBEditRepository.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <ImgList.hpp>
#include <DBTables.hpp>
#include <Db.hpp>
//---------------------------------------------------------------------------
class TdmMain : public TDataModule
{
__published:	// IDE-managed Components
        TDatabase *DataBase;
        TTable *tblUsers;
        TAutoIncField *tblUsersID;
        TStringField *tblUsersFNAME;
        TStringField *tblUsersMNAME;
        TStringField *tblUsersLNAME;
        TStringField *tblUsersEMAIL;
        TStringField *tblUsersPHONE;
        TIntegerField *tblUsersDEPARTMENTID;
        TStringField *tblUsersDepartmentName;
        TStringField *tblUsersFullName;
        TDataSource *dsUsers;
        TTable *tblDepartments;
        TAutoIncField *tblDepartmentsID;
        TStringField *tblDepartmentsNAME;
        TDataSource *dsDepartment;
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
        TDataSource *dsItems;
        TTable *tblProjects;
        TAutoIncField *tblProjectsID;
        TStringField *tblProjectsNAME;
        TIntegerField *tblProjectsMANAGERID;
        TDataSource *dsProjects;
        TTable *tblTeams;
        TAutoIncField *tblTeamsID;
        TIntegerField *tblTeamsPROJECTID;
        TIntegerField *tblTeamsUSERID;
        TStringField *tblTeamsFUNCTION;
        TDataSource *dsTeams;
        TImageList *imStat;
        TImageList *ilMain;
        TcxEditRepository *edrepMain;
        TcxEditRepositoryLookupComboBoxItem *edrepUserLookup;
        TcxEditRepositoryLookupComboBoxItem *edrepUserFullName;
        TcxEditRepositoryLookupComboBoxItem *edrepDepartmentName;
        TcxEditRepositoryLookupComboBoxItem *edrepProjectName;
        TcxEditRepositoryImageComboBoxItem *edrepItemStatus;
        TcxEditRepositoryImageComboBoxItem *edrepItemType;
        TcxEditRepositoryImageComboBoxItem *edrepItemPriority;
        TcxStyleRepository *strepMain;
        TcxStyle *stFixed;
        TcxStyle *stRejected;
        TcxStyle *stNew;
        TcxStyle *stPostponed;
        TcxStyle *stPreview;
        TcxStyle *stLightYellow;
        TcxStyle *stSelected;
        TcxStyle *stLightBlue;
        TcxStyle *stGold;
        TcxStyle *stBlue;
        TcxGridTableViewStyleSheet *ssTableStyles;
        TTable *tblSchedule;
        TAutoIncField *tblScheduleID;
        TIntegerField *tblSchedulePROJECTID;
        TIntegerField *tblScheduleUSERID;
        TSmallintField *tblScheduleSUNDAY;
        TSmallintField *tblScheduleMONDAY;
        TSmallintField *tblScheduleTUESDAY;
        TSmallintField *tblScheduleWEDNESDAY;
        TSmallintField *tblScheduleTHURSDAY;
        TSmallintField *tblScheduleFRIDAY;
        TSmallintField *tblScheduleSATURDAY;
        TFloatField *tblScheduleRowSum;
        TFloatField *tblScheduleRowAvg;
        TDataSource *dsSchedule;
        TcxEditStyleController *edstcMain;
        void __fastcall DataModuleCreate(TObject *Sender);
        void __fastcall tblUsersCalcFields(TDataSet* DataSet);
        void __fastcall tblScheduleCalcFields(TDataSet* DataSet);
private:	// User declarations
public:		// User declarations
        __fastcall TdmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmMain *dmMain;
//---------------------------------------------------------------------------
#endif
