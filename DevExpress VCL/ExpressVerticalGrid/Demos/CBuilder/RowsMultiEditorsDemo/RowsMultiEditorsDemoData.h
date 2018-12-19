//---------------------------------------------------------------------------

#ifndef RowsMultiEditorsDemoDataH
#define RowsMultiEditorsDemoDataH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include "cxVGrid.hpp"
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TRowsMultiEditorsDemoDataDM : public TDataModule
{
__published:  // IDE-managed Components
  TDatabase *DataBase;
  TQuery *queOrders;
  TDateTimeField *queOrdersPurchaseDate;
  TDateTimeField *queOrdersTime;
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
  TcxStyleRepository *StyleRepository;
  TcxStyle *Sunny;
  TcxStyle *Dark;
  TcxStyle *Golden;
  TcxStyle *Summer;
  TcxStyle *Autumn;
  TcxStyle *Bright;
  TcxStyle *Cold;
  TcxStyle *Spring;
  TcxStyle *Light;
  TcxStyle *Winter;
  TcxStyle *Depth;
  TcxVerticalGridStyleSheet *UserStyleSheet;
  TUpdateSQL  *updOrders;
  TUpdateSQL  *updCustomers;
  TUpdateSQL  *updCars;
  void __fastcall queOrdersUpdateRecord(TDataSet *DataSet,
    TUpdateKind UpdateKind, TUpdateAction &UpdateAction);
  void __fastcall queOrdersAfterPost(TDataSet *DataSet);
  void __fastcall queOrdersAfterCancel(TDataSet *DataSet);
  void __fastcall RowsMultiEditorsDemoDataDMCreate(
    TObject *Sender);
private:  // User declarations
public:   // User declarations
  __fastcall TRowsMultiEditorsDemoDataDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRowsMultiEditorsDemoDataDM *RowsMultiEditorsDemoDataDM;
//---------------------------------------------------------------------------
#endif
