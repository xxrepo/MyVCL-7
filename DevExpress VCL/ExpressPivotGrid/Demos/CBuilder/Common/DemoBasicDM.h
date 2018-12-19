//----------------------------------------------------------------------------
#ifndef DemoBasicDMH
#define DemoBasicDMH
//----------------------------------------------------------------------------
#include <vcl\System.hpp>
#include <vcl\SysUtils.hpp>
#include <vcl\Windows.hpp>
#include <vcl\Messages.hpp>
#include <vcl\Classes.hpp>
#include <vcl\Graphics.hpp>
#include <vcl\Controls.hpp>
#include <vcl\Forms.hpp>
#include <vcl\Dialogs.hpp>
#include <vcl\DBTables.hpp>
#include <vcl\DB.hpp>
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
