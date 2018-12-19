//---------------------------------------------------------------------------

#ifndef FilterControlDemoDataH
#define FilterControlDemoDataH
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
#include <Db.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TFilterControlDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDataSource *dsCars;
  TDataSource *dsOrders;
  TDataSource *dsCustomers;
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
  TDataSource *dsOrdersStd;
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
  TCurrencyField *tblCarsPrice;
  TStringField *tblCarsName;
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
  TTable *tblCustomers;
  TAutoIncField *tblCustomersID;
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
  TTable *tblOrdersStd;
  TStringField *tblOrdersStdCompany;
  TStringField *tblOrdersStdCar;
  TIntegerField *tblOrdersStdCustomerID;
  TIntegerField *tblOrdersStdProductID;
  TDateTimeField *tblOrdersStdPurchaseDate;
  TDateTimeField *tblOrdersStdTime;
  TStringField *tblOrdersStdPaymentType;
  TCurrencyField *tblOrdersStdPaymentAmount;
  TMemoField *tblOrdersStdDescription;
  TIntegerField *tblOrdersStdQuantity;
  TDatabase *Database;
  void __fastcall tblCarsCalcFields(TDataSet *DataSet);
  void __fastcall tblCustomersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TFilterControlDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFilterControlDemoDataDM *FilterControlDemoDataDM;
//---------------------------------------------------------------------------
#endif
