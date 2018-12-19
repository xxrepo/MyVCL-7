//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "dxMasterView.hpp"
#include <Db.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *Panel1;
    TRadioGroup *RadioGroup1;
    TTable *Table1;
    TDataSource *DataSource1;
    TQuery *Query1;
    TDataSource *DataSource2;
    TPanel *pnBottom;
    TLabel *Label1;
    TDBGrid *DBGrid1;
    TdxMasterView *MasterView;
    TdxMasterViewLevel *lvlCustomers;
    TdxMasterViewColumn *lvlCustomersCustNo;
    TdxMasterViewColumn *lvlCustomersCompany;
    TdxMasterViewColumn *lvlCustomersAddr1;
    TdxMasterViewColumn *lvlCustomersAddr2;
    TdxMasterViewColumn *lvlCustomersCity;
    TdxMasterViewColumn *lvlCustomersState;
    TdxMasterViewColumn *lvlCustomersZip;
    TdxMasterViewColumn *lvlCustomersCountry;
    TdxMasterViewColumn *lvlCustomersPhone;
    TdxMasterViewColumn *lvlCustomersFAX;
    TdxMasterViewColumn *lvlCustomersTaxRate;
    TdxMasterViewColumn *lvlCustomersContact;
    TdxMasterViewColumn *lvlCustomersLastInvoiceDate;
    TdxMasterViewLevel *lvlOrders;
    TdxMasterViewColumn *lvlOrdersOrderNo;
    TdxMasterViewColumn *lvlOrdersCustNo;
    TdxMasterViewColumn *lvlOrdersSaleDate;
    TdxMasterViewColumn *lvlOrdersShipDate;
    TdxMasterViewColumn *lvlOrdersEmpNo;
    TdxMasterViewColumn *lvlOrdersShipToContact;
    TdxMasterViewColumn *lvlOrdersShipToAddr1;
    TdxMasterViewColumn *lvlOrdersShipToAddr2;
    TdxMasterViewColumn *lvlOrdersShipToCity;
    TdxMasterViewColumn *lvlOrdersShipToState;
    TdxMasterViewColumn *lvlOrdersShipToZip;
    TdxMasterViewColumn *lvlOrdersShipToCountry;
    TdxMasterViewColumn *lvlOrdersShipToPhone;
    TdxMasterViewColumn *lvlOrdersShipVIA;
    TdxMasterViewColumn *lvlOrdersPO;
    TdxMasterViewColumn *lvlOrdersTerms;
    TdxMasterViewColumn *lvlOrdersPaymentMethod;
    TdxMasterViewColumn *lvlOrdersItemsTotal;
    TdxMasterViewColumn *lvlOrdersTaxRate;
    TdxMasterViewColumn *lvlOrdersFreight;
    TdxMasterViewColumn *lvlOrdersAmountPaid;
    void __fastcall lvlCustomersExpanding(TdxMasterViewLevel *Sender,
          TdxMasterViewNode *Node, bool &Allow);
private:	// User declarations
public:		// User declarations
    __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
