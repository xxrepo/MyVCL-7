//---------------------------------------------------------------------------

#ifndef ChartDataDrillingDemoMainH
#define ChartDataDrillingDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBData.hpp"
#include "cxEdit.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridChartView.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridDBChartView.hpp"
#include "cxGridDBTableView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TcxGrid *Grid;
        TcxGridDBChartView *ChartView;
        TcxGridDBChartDataGroup *ChartViewDataGroupPurchaseDate;
        TcxGridDBChartDataGroup *ChartViewDataGroupProduct;
        TcxGridDBChartDataGroup *ChartViewDataGroupCustomer;
        TcxGridDBChartDataGroup *ChartViewDataGroupPaymentType;
        TcxGridDBChartSeries *ChartViewSeriesPaymentAmount;
        TcxGridDBChartSeries *ChartViewSeriesQuantity;
        TcxGridDBChartSeries *ChartViewSeriesCount;
        TcxGridDBTableView *TableView;
        TcxGridDBColumn *TableViewProduct;
        TcxGridDBColumn *TableViewCustomer;
        TcxGridDBColumn *TableViewPaymentType;
        TcxGridDBColumn *TableViewPurchaseDate;
        TcxGridDBColumn *TableViewQuantity;
        TcxGridDBColumn *TableViewPaymentAmount;
        TcxGridDBColumn *TableViewOrderCount;
        TcxGridLevel *GridLevelChart;
        TcxGridLevel *GridLevelTable;
        TDatabase *dbMain;
        TDataSource *dsOrders;
        TTable *tblOrders;
        TAutoIncField *tblOrdersID;
        TIntegerField *tblOrdersCustomerID;
        TIntegerField *tblOrdersProductID;
        TDateTimeField *tblOrdersPurchaseDate;
        TDateTimeField *tblOrdersTime;
        TStringField *tblOrdersPaymentType;
        TCurrencyField *tblOrdersPaymentAmount;
        TMemoField *tblOrdersDescription;
        TIntegerField *tblOrdersQuantity;
        TStringField *tblOrdersCustomer;
        TStringField *tblOrdersProduct;
        TTable *tblCustomers;
        TTable *tblProducts;
        TcxStyleRepository *StyleRepository;
        TcxStyle *styleActiveGroup;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miAbout;
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall miAboutClick(TObject *Sender);
        void __fastcall GridActiveTabChanged(TcxCustomGrid *Sender,
          TcxGridLevel *ALevel);
        void __fastcall TableViewStylesGetGroupStyle(
          TcxGridTableView *Sender, TcxCustomGridRecord *ARecord,
          int ALevel, TcxStyle *&AStyle);
protected:
        DynamicArray<int> ActiveDataGroups;
        TcxGridDBColumn* GetColumnByChartItem(TcxGridChartItem* AChartItem);
        void ShowTableActiveGroup();
        void SynchronizeTableWithChart();
        void UpdateTableGroupingAndColumnVisibility();
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
