//---------------------------------------------------------------------------

#ifndef SummariesDemoDataH
#define SummariesDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxTL.hpp"
#include <ImgList.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TSummariesDemoDataDM : public TDataModule
{
__published:	// IDE-managed Components
  TDatabase *DataBase;
  TTable *tblCars;
  TAutoIncField *tblCarsID;
  TStringField *tblCarsTrademark;
  TStringField *tblCarsModel;
  TBlobField *tblCarsPicture;
  TStringField *tblCarsCarName;
  TMemoField *tblCarsDescription;
  TFloatField *tblCarsPrice;
  TDataSource *dsCars;
  TTable *tblCustomers;
  TAutoIncField *tblCustomersID;
  TStringField *tblCustomersFirstName;
  TStringField *tblCustomersLastName;
  TStringField *tblCustomersName;
  TDataSource *dsCustomers;
  TTable *tblOrders;
  TAutoIncField *tblOrdersID;
  TIntegerField *tblOrdersCustomerID;
  TIntegerField *tblOrdersProductID;
  TDateTimeField *tblOrdersPurchaseDate;
  TStringField *tblOrdersPaymentType;
  TDateTimeField *tblOrdersTime;
  TFloatField *tblOrdersPaymentAmount;
  TIntegerField *tblOrdersQuantity;
  TDataSource *dsOrders;
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
  TcxStyle *stlGroupNode;
  TcxStyle *stlFixedBand;
  TcxTreeListStyleSheet *TreeListStyleSheetDevExpress;
  TImageList *PaymentTypeImages;
  TQuery *qryOrdersSummary;
  TDataSource *dsOrdersSummary;
  void __fastcall tblCustomersCalcFields(TDataSet *DataSet);
  void __fastcall tblCarsCalcFields(TDataSet *DataSet);
private:	// User declarations
public:		// User declarations
  __fastcall TSummariesDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSummariesDemoDataDM *SummariesDemoDataDM;
//---------------------------------------------------------------------------
#endif
