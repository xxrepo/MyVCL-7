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
#include <DBTables.hpp>
#include <Chart.hpp>
#include <DBChart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include "dxPSCore.hpp"
#include "dxPSDBTCLnk.hpp"
#include "dxPSTCLnk.hpp"
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
#include <DB.hpp>
#include <DbChart.hpp>
#include <ImgList.hpp>
//---------------------------------------------------------------------------
class TMainForm : public TForm
{
__published:  // IDE-managed Components
    TToolBar *ToolBar1;
    TToolButton *tbSetup;
    TToolButton *tbPreview;
    TToolButton *tbPrint;
    TToolButton *tbDevider;
    TToolButton *tbDX;
    TToolButton *tbExit;
    TMainMenu *MainMenu;
    TMenuItem *miFile;
    TMenuItem *miPageSetup;
    TMenuItem *miPrintPreview;
    TMenuItem *miPrint;
    TMenuItem *N1;
    TMenuItem *miExit;
    TMenuItem *miHelp;
    TMenuItem *miDX;
    TdxComponentPrinter *dxComponentPrinter1;
    TImageList *ilButtons;
    TdxTeeChartReportLink *dxComponentPrinter1Link1;
    TPageControl *PageControl1;
    TTabSheet *tsDBTeeChart;
    TTabSheet *tsTeeChart;
    TBarSeries *Series5;
    TBarSeries *Series7;
    TBarSeries *Series6;
    TTable *TeeChartTable;
    TDataSource *DataSource1;
    TStringField *TeeChartTableNAME;
    TSmallintField *TeeChartTableSIZE;
    TSmallintField *TeeChartTableWEIGHT;
    TChart *TeeChart;
    TDBChart *DBChart;
    TPieSeries *PieSeries1;
    void __fastcall tbDXClick(TObject *Sender);
    void __fastcall tbSetupClick(TObject *Sender);
    void __fastcall tbPreviewClick(TObject *Sender);
    void __fastcall tbPrintClick(TObject *Sender);
    void __fastcall tbDesignerClick(TObject *Sender);
    void __fastcall tbExitClick(TObject *Sender);
    void __fastcall PageControl1Change(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
private:  // User declarations
public:   // User declarations
    __fastcall TMainForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMainForm *MainForm;
//---------------------------------------------------------------------------
#endif
