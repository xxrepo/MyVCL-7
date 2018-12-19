//---------------------------------------------------------------------------
#include "cxDemosBCB.inc"
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
#include <ImgList.hpp>
#include <ToolWin.hpp>
#include "dxPSCore.hpp"
#include "dxPScxCommon.hpp"
#include "dxPScxScheduler3Lnk.hpp"

#ifndef SchedulerLinkMainH
#define SchedulerLinkMainH
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
class TDemoBasicMainForm : public TForm
{
__published:	// IDE-managed Components
        TcxScheduler *Scheduler;
        TPanel *pnlControls;
        TMemo *Memo1;
        TStatusBar *StatusBar;
        TcxSchedulerStorage *cxSchedulerStorage1;
        TToolBar *ToolBar1;
        TToolButton *tbSetup;
        TToolButton *tbPreview;
        TToolButton *tbPrint;
        TToolButton *tbDevider;
        TToolButton *tbDesigner;
        TToolButton *tbSeparator;
        TToolButton *tbDX;
        TToolButton *tbExit;
        TImageList *ilButtons;
        TMainMenu *MainMenu;
        TMenuItem *miFile;
        TMenuItem *miPageSetup;
        TMenuItem *miPrintPreview;
        TMenuItem *miPrint;
        TMenuItem *N1;
        TMenuItem *miExit;
        TMenuItem *miDesigner;
        TMenuItem *miHelp;
        TMenuItem *miDX;
        TToolButton *ToolButton1;
        TdxComponentPrinter *dxComponentPrinter1;
        TcxSchedulerReportLink *dxComponentPrinter1Link1;
        void __fastcall FileExitExecute(TObject* Sender);
        void __fastcall FormCreate(TObject* Sender);
        void __fastcall tbExitClick(TObject *Sender);
        void __fastcall tbDXClick(TObject *Sender);
        void __fastcall tbDesignerClick(TObject *Sender);
        void __fastcall tbPrintClick(TObject *Sender);
        void __fastcall tbPreviewClick(TObject *Sender);
        void __fastcall tbSetupClick(TObject *Sender);
        void __fastcall ToolButton1Click(TObject *Sender);
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
};
//---------------------------------------------------------------------------
extern PACKAGE TDemoBasicMainForm *DemoBasicMainForm;
//---------------------------------------------------------------------------
#endif
