//---------------------------------------------------------------------------
#include "..\cxDemosBCB.inc"
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxGraphics.hpp"
#include "cxScheduler.hpp"
#include "cxSchedulerCustomControls.hpp"
#include "cxSchedulerCustomResourceView.hpp"
#include "cxSchedulerDateNavigator.hpp"
#include "cxSchedulerDayView.hpp"
#include "cxStyles.hpp"
#include <Classes.hpp>
#include <ComCtrls.hpp>
#include <Controls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include <StdCtrls.hpp>
#include "cxSchedulerStorage.hpp"
#include "cxSchedulerTimeGridView.hpp"
#include "cxSchedulerUtils.hpp"
#include "cxSchedulerWeekView.hpp"
#include "cxSchedulerYearView.hpp"

#ifndef DemoBasicMainH
#define DemoBasicMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxGraphics.hpp"
#include "cxScheduler.hpp"
#include "cxSchedulerStorage.hpp"
#include "cxSchedulerOutlookExchange.hpp"
#include "cxSchedulerCustomControls.hpp"
#include "cxSchedulerCustomResourceView.hpp"
#include "cxSchedulerDateNavigator.hpp"
#include "cxSchedulerDayView.hpp"
#include "cxStyles.hpp"
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
extern int MaxRandomPeriod;

class TDemoBasicMainForm : public TForm
{
__published:	// IDE-managed Components
        TLabel *lbDescrip;
        TcxScheduler *Scheduler;
        TPanel *pnlControls;
        TMemo *Memo1;
        TStatusBar *StatusBar;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *Outlook1;
        TMenuItem *Exportto1;
        TMenuItem *Outlook2;
        TMenuItem *Separator2;
        TMenuItem *Excel1;
        TMenuItem *ext1;
        TMenuItem *Html1;
        TMenuItem *Xml1;
        TMenuItem *Separator1;
        TMenuItem *miExit;
        TMenuItem *miView;
        TMenuItem *miDay;
        TMenuItem *miWorkweek;
        TMenuItem *miWeek;
        TMenuItem *miMonth;
        TMenuItem *N3;
        TMenuItem *miGotoDate;
        TMenuItem *N2;
        TMenuItem *miViewDateNavigator;
        TMenuItem *miControlBox;
        TMenuItem *miViewposition;
        TMenuItem *miAtLeft;
        TMenuItem *miAtRight;
        TMenuItem *Resources1;
        TMenuItem *GroupBy1;
        TMenuItem *miGroupByNone;
        TMenuItem *miGroupByResources;
        TMenuItem *miGroupByDate;
        TMenuItem *Resourcelayout1;
        TMenuItem *miLookFeel;
        TMenuItem *Kind1;
        TMenuItem *miFlat;
        TMenuItem *miStandard;
        TMenuItem *miUltraFlat;
        TMenuItem *Office111;
        TMenuItem *miNativeStyle;
        TMenuItem *miAbout;
        TTimer *Timer1;
        TSaveDialog *SaveDialog;
        TMenuItem *miTimeGrid1;
        TMenuItem *miYear1;
        TMenuItem *N4;
        TMenuItem *miResPerPage;
        TMenuItem *miWorktimeonly;
        TMenuItem *miAllDayContainer;
        TMenuItem *Alwaysshoweventtime1;
        TMenuItem *Displayminutesontimeruler1;
        TMenuItem *miSingleColumn;
        TMenuItem *miOneResPerPage;
        TMenuItem *miTwoResPerPage;
        TMenuItem *miThreeResPerPage;
        TMenuItem *miAllResPerPage;
        TMenuItem *miSeparator;
        TMenuItem *miTimeWorktimeonly;
        TMenuItem *Alldayeventsonly1;
        TMenuItem *miCompressweekends;
        TMenuItem *miWeekCompressWeekends;
        TMenuItem *Options1;
        TMenuItem *miTimeGrid;
        TMenuItem *miYear;
        TMenuItem *Outlooksynchronization1;
        TMenuItem *miIntersection;
        TMenuItem *miSharing;
        TMenuItem *miEventsOpt;

        void __fastcall FileExitExecute(TObject* Sender);
        void __fastcall LookAndFeelChange(TObject* Sender);
        void __fastcall miViewDateNavigatorClick(TObject* Sender);
        void __fastcall ViewClick(TObject* Sender);
        void __fastcall ViewModeClick(TObject* Sender);
        void __fastcall ViewPositionClick(TObject* Sender);
        void __fastcall miAboutClick(TObject* Sender);
        void __fastcall miGotoDateClick(TObject* Sender);
        void __fastcall FormCreate(TObject* Sender);
        void __fastcall Timer1Timer(TObject* Sender);
        void __fastcall Resourcelayout1Click(TObject* Sender);
        void __fastcall miGroupByClick(TObject* Sender);
        void __fastcall ExportToClick(TObject* Sender);
        void __fastcall SyncClick(TObject *Sender);
        void __fastcall miResCountClick(TObject *Sender);
        void __fastcall miTimeWorktimeonlyClick(TObject *Sender);
        void __fastcall miDaySettingsClick(TObject *Sender);
        void __fastcall miWeekViewClick(TObject *Sender);
        void __fastcall miCompressweekendsClick(TObject *Sender);
        void __fastcall AlldayeventsonlyClick(TObject *Sender);
        void __fastcall miSharingClick(TObject *Sender);
        void __fastcall miIntersectionClick(TObject *Sender);
        void __fastcall miWeekCompressWeekendsClick(TObject *Sender);


private:	// User declarations
public:		// User declarations
        TDateTime AnchorDate;
        __fastcall TDemoBasicMainForm(TComponent* Owner);
        void GenerateRandomEvents(int ACount, bool ARandomResource = false);
protected:
    String GetRandomCaption();
    TDateTime GetRandomDate();
    TColor GetRandomLabelColor();
    Variant GetRandomResourceID();
    int GetRandomState();
    virtual void __fastcall TDemoBasicMainForm::OnNewEvent(TcxSchedulerEvent *AEvent, int AIndex);
    void  TDemoBasicMainForm::CreateEventObject(bool AAllDayEvent, bool ARandomResource);
};
//---------------------------------------------------------------------------
extern PACKAGE TDemoBasicMainForm *DemoBasicMainForm;
//---------------------------------------------------------------------------
#endif
