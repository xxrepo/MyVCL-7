//---------------------------------------------------------------------------

#ifndef SummaryGroupDemoDataH
#define SummaryGroupDemoDataH
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
class TSummaryGroupDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TDataSource *dsCars;
        TDataSource *dsOrders;
        TDataSource *dsCustomers;
        TDatabase *DataBase;
        TTable *tblCars;
        TAutoIncField *tblCarsID;
        TStringField *tblCarsTrademark;
        TStringField *tblCarsModel;
        TSmallintField *tblCarshp;
        TFloatField *tblCarsliter;
        TSmallintField *tblCarscyl;
        TSmallintField *tblCarsTransmissSpeedCount;
        TStringField *tblCarsTransmissAutomatic;
        TSmallintField *tblCarsMPG_City;
        TSmallintField *tblCarsMPG_Highway;
        TStringField *tblCarsCategory;
        TMemoField *tblCarsDescription;
        TStringField *tblCarsHyperlink;
        TBlobField *tblCarsPicture;
        TFloatField *tblCarsPrice;
        TStringField *tblCarsCarName;
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
        TStringField *tblOrdersPurchaseMonth;
        TTable *tblCustomers;
        TIntegerField *tblCustomersID;
        TStringField *tblCustomersFirstName;
        TStringField *tblCustomersLastName;
        TStringField *tblCustomersCompany;
        TcxStyleRepository *StyleRepository;
        TcxStyle *stBlueLight;
        TcxStyle *stGreyLight;
        TcxStyle *stBlueSky;
        TImageList *PaymentTypeImages;
        TcxStyle *stClear;
        TcxStyle *stRed;
        void __fastcall tblCarsCalcFields(TDataSet *DataSet);
        void __fastcall tblOrdersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TSummaryGroupDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummaryGroupDemoDataDM *SummaryGroupDemoDataDM;
//---------------------------------------------------------------------------
#endif
