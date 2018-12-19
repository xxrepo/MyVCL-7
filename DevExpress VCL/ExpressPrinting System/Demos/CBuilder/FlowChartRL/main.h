//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Graphics.hpp>
#include <Forms.hpp>
#include <checklst.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <Menus.hpp>
#include <ToolWin.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include "dxflchrt.hpp"
#include "dxPSCore.hpp"
#include "dxPSdxFCLnk.hpp"
#include "dxBkgnd.hpp"
#include "dxPrnDev.hpp"
#include "dxPrnPg.hpp"
#include "dxPSCompsProvider.hpp"
#include "dxPSEdgePatterns.hpp"
#include "dxPSEngn.hpp"
#include "dxPSFillPatterns.hpp"
#include "dxPSGlbl.hpp"
#include "dxPSGraphicLnk.hpp"
#include "dxPSUtl.hpp"
#include "dxWrap.hpp"
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:	// IDE-managed Components
    TToolBar *ToolBar1;
    TToolButton *tbSetup;
    TToolButton *tbPreview;
    TToolButton *tbPrint;
    TToolButton *tbDevider;
    TToolButton *tbDesigner;
    TToolButton *tbSeparator;
    TToolButton *tbDX;
    TToolButton *tbExit;
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
    TdxComponentPrinter *dxComponentPrinter1;
    TImageList *ilButtons;
    TdxFlowChartReportLink *dxFlowChartReportLink1;
    TdxFlowChartReportLink *dxComponentPrinter1Link1;
        TdxFlowChart *dxFlowChart;
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    
    
private:	// User declarations
public:		// User declarations
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
