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
#include "cxLookAndFeelPainters.hpp"
#include "cxSchedulerAggregateStorage.hpp"
#include "cxSchedulerGanttView.hpp"
#include "cxSchedulerHolidays.hpp"
#include "cxSchedulerTimeGridView.hpp"
#include "cxSchedulerUtils.hpp"
#include "cxSchedulerWeekView.hpp"
#include "cxSchedulerYearView.hpp"
#include <DBGrids.hpp>
#include <Grids.hpp>

#ifndef AggregateDemoMainUnitH
#define AggregateDemoMainUnitH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxControls.hpp"
#include "cxEdit.hpp"
#include "cxGraphics.hpp"
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

class TAggregateDemoMainForm : public TDemoBasicMainForm
{
__published:	// IDE-managed Components
		TDataSource *SchedulerDataSource;
		TTable *EventsTable;
		TPanel *Panel1;
		TcxButton *cxButton1;
		TcxSchedulerAggregateStorage *SchedulerAggregateStorage;
		TcxSchedulerStorage *SchedulerStorage;
		TcxSchedulerDBStorage *SchedulerDBStorage;
		TDBGrid *DBGrid1;
		TcxButton *cxButton2;
		void __fastcall FormCreate(TObject *Sender);
		void __fastcall cxButton1Click(TObject *Sender);
		void __fastcall SchedulerAggregateStorageEventInserting(TcxSchedulerAggregateStorage *Sender, TcxSchedulerEvent *AEvent,
		  TcxCustomSchedulerStorage *&AStorage);
	void __fastcall cxButton2Click(TObject *Sender);
public:		// User declarations
		__fastcall TAggregateDemoMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAggregateDemoMainForm *AggregateDemoMainForm1;
//---------------------------------------------------------------------------
#endif
