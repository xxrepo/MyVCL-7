//---------------------------------------------------------------------------

#ifndef SummaryMultiDemoDataH
#define SummaryMultiDemoDataH
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
class TSummaryMultiDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
        TDataSource *dsCars;
        TDataSource *dsOrders;
        TDataSource *dsCustomers;
        TDatabase *Database;
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
        TTable *tblCustomers;
        TIntegerField *tblCustomersID;
        TStringField *tblCustomersFirstName;
        TStringField *tblCustomersLastName;
        TStringField *tblCustomersCompany;
        TcxStyleRepository *StyleRepository;
        TcxStyle *styleGold;
        TcxStyle *styleBlueLight;
        TcxStyle *styleYellowLight;
        TcxStyle *styleBlue;
        TcxStyle *styleRed;
        TcxStyle *styleNormal;
        TcxStyle *styleSortedSummary;
        TImageList *PaymentTypeImages;
        void __fastcall tblCarsCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TSummaryMultiDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummaryMultiDemoDataDM *SummaryMultiDemoDataDM;
//---------------------------------------------------------------------------
#endif
