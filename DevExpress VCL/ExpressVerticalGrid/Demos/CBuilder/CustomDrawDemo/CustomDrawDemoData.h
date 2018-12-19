//---------------------------------------------------------------------------

#ifndef CustomDrawDemoDataH
#define CustomDrawDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include "cxVGrid.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TCustomDrawDemoDataDM : public TDataModule
{
__published:  // IDE-managed Components
  TcxStyleRepository *StyleRepository;
  TcxStyle *stCustomer;
  TcxStyle *stNoCustomer;
  TcxStyle *cxStyle1;
  TcxStyle *cxStyle2;
  TcxStyle *cxStyle3;
  TcxStyle *cxStyle4;
  TcxStyle *cxStyle5;
  TcxStyle *cxStyle6;
  TcxStyle *cxStyle7;
  TcxVerticalGridStyleSheet *cxVerticalGridStyleSheetDevExpress;
  TDatabase *DataBase;
  TQuery *queOrders;
  TDateTimeField *queOrdersPurchaseDate;
  TDateTimeField *queOrdersOrders_Time;
  TStringField *queOrdersPaymentType;
  TFloatField *queOrdersPaymentAmount;
  TIntegerField *queOrdersQuantity;
  TStringField *queOrdersFirstName;
  TStringField *queOrdersLastName;
  TStringField *queOrdersCompany;
  TStringField *queOrdersPrefix;
  TStringField *queOrdersTitle;
  TStringField *queOrdersAddress;
  TStringField *queOrdersCity;
  TStringField *queOrdersState;
  TStringField *queOrdersZipCode;
  TStringField *queOrdersSource;
  TStringField *queOrdersCustomer;
  TStringField *queOrdersHomePhone;
  TStringField *queOrdersFaxPhone;
  TStringField *queOrdersSpouse;
  TStringField *queOrdersOccupation;
  TStringField *queOrdersEmail;
  TStringField *queOrdersTrademark;
  TStringField *queOrdersModel;
  TSmallintField *queOrdersHP;
  TFloatField *queOrdersLiter;
  TSmallintField *queOrdersCyl;
  TSmallintField *queOrdersTransmissSpeedCount;
  TStringField *queOrdersTransmissAutomatic;
  TSmallintField *queOrdersMPG_City;
  TSmallintField *queOrdersMPG_Highway;
  TStringField *queOrdersCategory;
  TMemoField *queOrdersCars_Description;
  TStringField *queOrdersHyperlink;
  TBlobField *queOrdersPicture;
  TFloatField *queOrdersPrice;
  TDataSource *dsOrders;
  TUpdateSQL  *updOrders;
  TUpdateSQL  *updCustomers;
  TUpdateSQL  *updCars;
  void __fastcall queOrdersUpdateRecord(TDataSet *DataSet,
    TUpdateKind UpdateKind, TUpdateAction &UpdateAction);
  void __fastcall queOrdersAfterPost(TDataSet *DataSet);
  void __fastcall queOrdersAfterCancel(TDataSet *DataSet);
  void __fastcall CustomDrawDemoDataDMCreate(
    TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TCustomDrawDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomDrawDemoDataDM *CustomDrawDemoDataDM;
//---------------------------------------------------------------------------
#endif
