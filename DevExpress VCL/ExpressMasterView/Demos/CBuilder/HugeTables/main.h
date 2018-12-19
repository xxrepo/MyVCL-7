//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxMasterView.hpp"
#include <ComCtrls.hpp>
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TStatusBar *StatusBar;
    TPanel *Panel1;
    TButton *btnCustomize;
    TButton *btnFullCollapse;
    TButton *btnFullExpand;
    TCheckBox *chbSmartLoadLevel1;
    TButton *btnReloadDataset;
    TCheckBox *chbSmartLoadLevel2;
    TCheckBox *chbSmartLoadLevel3;
    TTable *tbCustomers;
    TIntegerField *tbCustomersID;
    TStringField *tbCustomersCustomerName;
    TStringField *tbCustomersCompany;
    TStringField *tbCustomersAddress;
    TBooleanField *tbCustomersCustomer;
    TStringField *tbCustomersCity;
    TStringField *tbCustomersState;
    TStringField *tbCustomersHomePhone;
    TDateTimeField *tbCustomersPurchaseDate;
    TDataSource *dsCustomers;
    TTable *tbOrders;
    TIntegerField *tbOrdersOrderNo;
    TIntegerField *tbOrdersCustomerNo;
    TStringField *tbOrdersPaymentType;
    TCurrencyField *tbOrdersPaymentAmount;
    TDataSource *dsOrders;
    TTable *tbItems;
    TIntegerField *tbItemsItemNo;
    TIntegerField *tbItemsOrderNo;
    TIntegerField *tbItemsPartNo;
    TIntegerField *tbItemsQty;
    TDataSource *dsItems;
    TdxMasterView *MasterView;
    TdxMasterViewLevel *Level1;
    TdxMasterViewColumn *Level1ID;
    TdxMasterViewColumn *Level1CustomerName;
    TdxMasterViewColumn *Level1Company;
    TdxMasterViewColumn *Level1PurchaseDate;
    TdxMasterViewColumn *Level1Address;
    TdxMasterViewColumn *Level1Customer;
    TdxMasterViewColumn *Level1City;
    TdxMasterViewColumn *Level1State;
    TdxMasterViewColumn *Level1HomePhone;
    TdxMasterViewLevel *Level2;
    TdxMasterViewColumn *Level2OrderNo;
    TdxMasterViewColumn *Level2CustomerNo;
    TdxMasterViewColumn *Level2PaymentType;
    TdxMasterViewColumn *Level2PaymentAmount;
    TdxMasterViewLevel *Level3;
    TdxMasterViewColumn *Level3ItemNo;
    TdxMasterViewColumn *Level3OrderNo;
    TdxMasterViewColumn *Level3PartNo;
    TdxMasterViewColumn *Level3Qty;
    TProgressBar *ProgressBar;
    void __fastcall FormActivate(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall TablesCreate();
    void __fastcall btnCustomizeClick(TObject *Sender);
    void __fastcall btnFullExpandClick(TObject *Sender);
    void __fastcall btnFullCollapseClick(TObject *Sender);
    void __fastcall chbSmartLoadLevel1Click(TObject *Sender);
    void __fastcall btnReloadDatasetClick(TObject *Sender);
    void __fastcall chbSmartLoadLevel2Click(TObject *Sender);
    void __fastcall chbSmartLoadLevel3Click(TObject *Sender);
    void __fastcall BeforeLoadData();
    void __fastcall AfterLoadData();
private:	// User declarations
public:		// User declarations
    __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
