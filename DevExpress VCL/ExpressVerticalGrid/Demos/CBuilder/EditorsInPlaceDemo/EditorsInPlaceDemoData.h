//---------------------------------------------------------------------------

#ifndef EditorsInPlaceDemoDataH
#define EditorsInPlaceDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxVGrid.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TEditorsInPlaceDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblCustomers;
  TDataSource *dsCustomers;
  TDataSource *dsCars;
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
  TStringField *tblOrdersPaymentType;
  TDateTimeField *tblOrdersTime;
  TFloatField *tblOrdersPaymentAmount;
  TMemoField *tblOrdersDescription;
  TIntegerField *tblOrdersQuantity;
  TStringField *tblOrdersCustomerEmail;
  TDataSource *dsOrders;
  TcxStyleRepository *StyleRepository;
  TcxStyle *styCaption;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxVerticalGridStyleSheet *cxVerticalGridStyleSheetDevExpress;
  TImageList *PaymentTypeImages;
  void __fastcall tblCarsCalcFields(TDataSet *DataSet);
  void __fastcall tblOrdersCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TEditorsInPlaceDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorsInPlaceDemoDataDM *EditorsInPlaceDemoDataDM;
//---------------------------------------------------------------------------
#endif
