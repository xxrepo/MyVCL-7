//---------------------------------------------------------------------------

#ifndef SummaryFooterDemoDataH
#define SummaryFooterDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TSummaryFooterDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TDataSource *dsCars;
        TDataSource *dsOrders;
        TDataSource *dsCustomers;
        TDatabase *DataBase;
        TTable *tblCars;
        TTable *tblOrders;
        TAutoIncField *tblOrdersID;
        TIntegerField *tblOrdersCustomerID;
        TIntegerField *tblOrdersProductID;
        TDateTimeField *tblOrdersPurchaseDate;
        TDateTimeField *tblOrdersTime;
        TStringField *tblOrdersPaymentType;
        TMemoField *tblOrdersDescription;
        TIntegerField *tblOrdersQuantity;
        TCurrencyField *tblOrdersPaymentAmount;
        TTable *tblCustomers;
        TIntegerField *tblCustomersID;
        TStringField *tblCustomersFirstName;
        TStringField *tblCustomersLastName;
        TStringField *tblCustomersCompany;
        TStringField *tblCustomersPrefix;
        TStringField *tblCustomersTitle;
        TStringField *tblCustomersAddress;
        TStringField *tblCustomersCity;
        TStringField *tblCustomersState;
        TStringField *tblCustomersZipCode;
        TStringField *tblCustomersSource;
        TStringField *tblCustomersCustomer;
        TStringField *tblCustomersHomePhone;
        TStringField *tblCustomersFaxPhone;
        TStringField *tblCustomersSpouse;
        TStringField *tblCustomersOccupation;
        TMemoField *tblCustomersDescription;
        TStringField *tblCustomersName;
        TcxStyleRepository *StyleRepository;
        TcxStyle *cxStyle1;
        TcxStyle *cxStyle2;
        TcxStyle *cxStyle3;
        TcxStyle *cxStyle4;
        TcxStyle *cxStyle5;
        TcxStyle *cxStyle6;
        TcxStyle *cxStyle7;
        TcxStyle *cxStyle8;
        TcxStyle *cxStyle9;
        TcxStyle *cxStyle10;
        TcxStyle *cxStyle11;
        TcxStyle *cxStyle12;
        TcxStyle *cxStyle13;
        TcxStyle *cxStyle14;
        TcxGridTableViewStyleSheet *GridTableViewStyleSheetDevExpress;
        TImageList *PaymentTypeImages;
        void __fastcall tblCustomersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TSummaryFooterDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummaryFooterDemoDataDM *SummaryFooterDemoDataDM;
//---------------------------------------------------------------------------
#endif
