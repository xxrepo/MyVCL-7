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
#include "cxSchedulerDBStorage.hpp"
#include "cxSchedulerStorage.hpp"
#include "cxStyles.hpp"
#include "DemoBasicMain.h"
#include <Classes.hpp>
#include <ComCtrls.hpp>
#include <Controls.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include <StdCtrls.hpp>
#include "cxButtons.hpp"
#include "cxCheckBox.hpp"
#include "cxContainer.hpp"
#include <Db.hpp>
#include "cxGroupBox.hpp"
#include "cxLookAndFeelPainters.hpp"
#include "cxSchedulerGanttView.hpp"
#include "cxSchedulerHolidays.hpp"
#include "cxSchedulerTimeGridView.hpp"
#include "cxSchedulerUtils.hpp"
#include "cxSchedulerWeekView.hpp"
#include "cxSchedulerYearView.hpp"

#ifndef DBDemoMainUnitH
#define DBDemoMainUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxGraphics.hpp"
#include "cxGroupBox.hpp"
#include "cxScheduler.hpp"
#include "cxSchedulerCustomControls.hpp"
#include "cxSchedulerCustomResourceView.hpp"
#include "cxSchedulerDateNavigator.hpp"
#include "cxSchedulerDayView.hpp"
#include "cxStyles.hpp"
#include "DemoBasicMain.h"
#include <ComCtrls.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
#include "cxSchedulerDBStorage.hpp"
#include "cxSchedulerStorage.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------

class TDBDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
        TcxSchedulerDBStorage *SchedulerDBStorage;
        TDataSource *SchedulerDataSource;
        TTable *EventsTable;
        TcxButton *cxButton1;
		TcxCheckBox *cxCheckBox1;
		TcxGroupBox *cxGroupBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall chDataModeClick(TObject *Sender);
		void __fastcall cxButton1Click(TObject *Sender);
		void __fastcall FormClose(TObject *Sender, TCloseAction &Action);
private:	// User declarations
		int FEventCount;
	  	int FMaxID;
public:		// User declarations
        __fastcall TDBDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBDemoMainForm *DBDemoMainForm;
//---------------------------------------------------------------------------
#endif
