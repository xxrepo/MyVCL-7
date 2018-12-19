//---------------------------------------------------------------------------

#ifndef Office11GroupRowStyleDemoMainH
#define Office11GroupRowStyleDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#if __BORLANDC__ >= 0x0560
#include <DateUtils.hpp>
#endif
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <ActnList.hpp>
#include <ComCtrls.hpp>
#include <DB.hpp>
#include <ImgList.hpp>
#include <Menus.hpp>
#include "cxButtons.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include "cxGridCardView.hpp"
#include "cxGridDBCardView.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxMaskEdit.hpp"
#include "cxSpinEdit.hpp"
#include "cxTextEdit.hpp"
#include <ExtCtrls.hpp>
#include "cxLookAndFeels.hpp"
#include "cxCalendar.hpp"
#include "cxDropDownEdit.hpp"
#include "cxDataStorage.hpp"
#include "cxImageComboBox.hpp"
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TOffice11GroupRowStyleDemoMainForm : public TForm
{
__published:  // IDE-managed Components
        TLabel *lbDescrip;
        TcxGrid *Grid;
        TcxGridTableView *tvMail;
        TcxGridColumn *tvMailImportance;
        TcxGridColumn *tvMailIcon;
        TcxGridColumn *tvMailAttachment;
        TcxGridColumn *tvMailFrom;
        TcxGridColumn *tvMailSubject;
        TcxGridColumn *tvMailReceived;
        TcxGridColumn *tvMailSent;
        TcxGridLevel *lvMail;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miOptions;
        TMenuItem *miOffice11GroupRowStyle;
        TMenuItem *miGroupBySorting;
        TMenuItem *miAlwaysExpandedGroups;
        TMenuItem *miDateTimeGrouping;
        TMenuItem *miDateTimeGroupingByDateAndTime;
        TMenuItem *miDateTimeGroupingRelativeToToday;
        TMenuItem *miDateTimeGroupingByHour;
        TMenuItem *miDateTimeGroupingByDate;
        TMenuItem *miDateTimeGroupingByMonth;
        TMenuItem *miDateTimeGroupingByYear;
        TMenuItem *miAbout;
        TcxLookAndFeelController *LookAndFeelController;
        TImageList *imgImportance;
        TDatabase *Database;
        TTable *tblPersons;
        TStringField *tblPersonsFullName;
        TStringField *tblPersonsFNAME;
        TStringField *tblPersonsLNAME;
        TDataSource *dsPersons;
        TcxStyleRepository *StyleRepository;
        TcxStyle *UnreadStyle;
        void __fastcall miAboutClick(TObject *Sender);
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall tvMailStylesGetContentStyle(
                TcxCustomGridTableView *Sender, TcxCustomGridRecord *ARecord,
                TcxCustomGridTableItem *AItem, TcxStyle *&AStyle);
        void __fastcall miOffice11GroupRowStyleClick(TObject *Sender);
        void __fastcall miAlwaysExpandedGroupsClick(TObject *Sender);
        void __fastcall miGroupBySortingClick(TObject *Sender);
        void __fastcall tblPersonsCalcFields(TDataSet *DataSet);
        void __fastcall miDateTimeGroupingClick(TObject *Sender);
private:
        // record data random generating
        void __fastcall AddRecordIntoTable(int ARecordIndex);
        void __fastcall AddRecordsIntoTable();
        int GetImportance();
        int GetIcon();
        TDateTime GetSent();
        TDateTime GetReceived(TDateTime ASent);
        String GetSubject();
protected:
        void UpdateMenu();
public:   // User declarations
        __fastcall TOffice11GroupRowStyleDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOffice11GroupRowStyleDemoMainForm *Office11GroupRowStyleDemoMainForm;
//---------------------------------------------------------------------------
#endif
