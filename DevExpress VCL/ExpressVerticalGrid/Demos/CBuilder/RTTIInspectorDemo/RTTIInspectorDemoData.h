//---------------------------------------------------------------------------

#ifndef RTTIInspectorDemoDataH
#define RTTIInspectorDemoDataH
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
class TRTTIInspectorDemoMainDM : public TDataModule
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
        TcxVerticalGridStyleSheet *cxVerticalGridStyleSheetUserFormat3;
        TImageList *PaymentTypeImages;
private:	// User declarations
public:		// User declarations
  __fastcall TRTTIInspectorDemoMainDM(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRTTIInspectorDemoMainDM *RTTIInspectorDemoMainDM;
//---------------------------------------------------------------------------
#endif
