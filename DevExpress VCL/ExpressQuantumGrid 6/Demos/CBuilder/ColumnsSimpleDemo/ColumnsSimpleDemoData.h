//---------------------------------------------------------------------------

#ifndef ColumnsSimpleDemoDataH
#define ColumnsSimpleDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxGridBandedTableView.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TColumnsSimpleDemoDataDM : public TDataModule
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
  TSmallintField *tblCarsHP;
  TFloatField *tblCarsLiter;
  TSmallintField *tblCarsCyl;
  TSmallintField *tblCarsTransmissSpeedCount;
  TStringField *tblCarsTransmissAutomatic;
  TSmallintField *tblCarsMPG_City;
  TSmallintField *tblCarsMPG_Highway;
  TStringField *tblCarsCategory;
  TMemoField *tblCarsDescription;
  TStringField *tblCarsHyperlink;
  TBlobField *tblCarsPicture;
  TFloatField *tblCarsPrice;
  TStringField *tblCarsCar;
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
  TImageList *PaymentTypeImages;
  TDataSource *dsCities;
  TTable *tblCities;
  void __fastcall tblCarsCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TColumnsSimpleDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColumnsSimpleDemoDataDM *ColumnsSimpleDemoDataDM;
//---------------------------------------------------------------------------
#endif
