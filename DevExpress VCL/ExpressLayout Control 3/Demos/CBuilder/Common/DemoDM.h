//---------------------------------------------------------------------------

#ifndef DemoDMH
#define DemoDMH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <cxLookAndFeels.hpp>
#include <dxLayoutLookAndFeels.hpp>
//---------------------------------------------------------------------------
class TdmDemo : public TDataModule
{
__published:	// IDE-managed Components
	TDatabase *Database;
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
	TIntegerField *queOrdersCustomers_ID;
	TIntegerField *queOrdersOrders_ID;
	TIntegerField *queOrdersCars_ID;
	TDataSource *dsOrders;
	TUpdateSQL *updOrders;
	TUpdateSQL *updCustomers;
	TUpdateSQL *updCars;
	TdxLayoutLookAndFeelList *llcfMain;
	TdxLayoutStandardLookAndFeel *dxLayoutStandardLookAndFeel1;
	TdxLayoutOfficeLookAndFeel *dxLayoutOfficeLookAndFeel1;
	TdxLayoutWebLookAndFeel *dxLayoutWebLookAndFeel1;
	TdxLayoutCxLookAndFeel *dxLayoutCxLookAndFeel1;
private:	// User declarations
public:		// User declarations
	__fastcall TdmDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmDemo *dmDemo;
//---------------------------------------------------------------------------
#endif
