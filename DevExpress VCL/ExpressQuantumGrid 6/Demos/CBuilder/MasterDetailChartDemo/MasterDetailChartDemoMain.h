//---------------------------------------------------------------------------

#ifndef MasterDetailChartDemoMainH
#define MasterDetailChartDemoMainH
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
#include "cxLookAndFeels.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TDatabase *dbMain;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miAbout;
        TcxLookAndFeelController *LookAndFeelController;
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
        TTable *tblProducts;
        TTable *tblCustomers;
        TQuery *qryProducts;
        TDataSource *dsCustomers;
        TDataSource *dsProducts;
        TcxGrid *grMain;
        TcxGridDBTableView *tvCustomers;
        TcxGridDBColumn *tvCustomersID;
        TcxGridDBColumn *tvCustomersFirstName;
        TcxGridDBColumn *tvCustomersLastName;
        TcxGridDBColumn *tvCustomersCompany;
        TcxGridDBColumn *tvCustomersAddress;
        TcxGridDBColumn *tvCustomersCity;
        TcxGridDBColumn *tvCustomersState;
        TcxGridDBColumn *tvCustomersZipCode;
        TcxGridDBColumn *tvCustomersEmail;
        TcxGridDBChartView *chvOrders;
        TcxGridDBChartSeries *chvOrdersPaymentAmountSeries;
        TcxGridDBChartSeries *chvOrdersProductIDSeries;
        TcxGridDBChartSeries *chvOrdersQuantitySeries;
        TcxGridDBChartView *chvProducts;
        TcxGridDBChartSeries *chvProductsCopiesSeries;
        TcxGridLevel *grMainLevel1;
        TcxGridLevel *grMainLevel2;
        TcxGridLevel *grMainLevel3;
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall miAboutClick(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall chvOrdersGetValueHint(TcxGridChartView *Sender,
          TcxGridChartSeries *ASeries, int AValueIndex, String &AHint);
        void __fastcall chvOrdersCategoriesGetValueDisplayText(
          TObject *Sender, const Variant &AValue,
          String &ADisplayText);
protected:
    AnsiString GetProductName(int AID);
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
