//----------------------------------------------------------------------------
#ifndef DemoBasicDMH
#define DemoBasicDMH
//----------------------------------------------------------------------------
#include <System.hpp>
#include <SysUtils.hpp>
#include <Windows.hpp>
#include <Messages.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <Controls.hpp>
#include <Forms.hpp>
#include <Dialogs.hpp>
#include <DBTables.hpp>
#include <DB.hpp>
#include <Db.hpp>
#include <ImgList.hpp>
#include <cxStyles.hpp>
//----------------------------------------------------------------------------
class TdmOrders : public TDataModule
{
__published:
        TDatabase *dbOrders;
        TDataSource *dsCustomers;
        TDataSource *dsOrders;
        TTable *tblCustomers;
        TIntegerField *tblCustomersID;
        TStringField *tblCustomersCompany;
        TTable *tblOrders;
        TAutoIncField *tblOrdersID;
        TIntegerField *tblOrdersCustomerID;
        TIntegerField *tblOrdersProductID;
        TDateTimeField *tblOrdersPurchaseDate;
        TStringField *tblOrdersPaymentType;
        TIntegerField *tblOrdersQuantity;
        TStringField *tblOrdersCarName;
        TCurrencyField *tblOrdersUnitPrice;
        TStringField *tblOrdersCompanyName;
        TCurrencyField *tblOrdersPaymentAmount;
        TTable *tblCars;
        TAutoIncField *tblCarsID;
        TStringField *tblCarsTrademark;
        TStringField *tblCarsModel;
        TFloatField *tblCarsPrice;
        TStringField *tblCarsCarName;
        TDataSource *dsCars;
        TImageList *PaymentTypeImages;
        TcxStyleRepository *cxStyleRepository1;
        TcxStyle *stBoldBlueFont;
        TcxStyle *stBoldRedFont;
        TcxStyle *stBoldBlackFont;

        void __fastcall tblCarsCalcFields(TDataSet *DataSet);
        void __fastcall tblOrdersCalcFields(TDataSet *DataSet);
private:
public:
	virtual __fastcall TdmOrders(TComponent* AOwner);
};
//----------------------------------------------------------------------------
extern PACKAGE TdmOrders *dmOrders;
//----------------------------------------------------------------------------
#endif    
