//---------------------------------------------------------------------------
#ifndef mainH
#define mainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cspin.h"
#include "dxMasterView.hpp"
#include <Db.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TTable *Table1;
    TDataSource *DataSource1;
    TPanel *plBottom;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label3;
    TLabel *Label4;
    TGroupBox *GroupBox1;
    TCheckBox *chbPaymantMethod;
    TComboBox *cmbPaymentMethod;
    TGroupBox *GroupBox2;
    TCheckBox *chbAmountPaid;
    TdxMasterView *MasterView;
    TdxMasterViewStyle *Style1;
    TdxMasterViewStyle *Style2;
    TdxMasterViewStyle *GroupStyle1;
    TdxMasterViewStyle *GroupStyle2;
    TdxMasterViewStyle *GroupStyle3;
    TdxMasterViewLevel *Level1;
    TdxMasterViewColumn *dxMasterView1Level1OrderNo;
    TdxMasterViewColumn *dxMasterView1Level1CustNo;
    TdxMasterViewColumn *dxMasterView1Level1SaleDate;
    TdxMasterViewColumn *dxMasterView1Level1ShipDate;
    TdxMasterViewColumn *dxMasterView1Level1EmpNo;
    TdxMasterViewColumn *dxMasterView1Level1ShipToContact;
    TdxMasterViewColumn *dxMasterView1Level1ShipToAddr1;
    TdxMasterViewColumn *dxMasterView1Level1ShipToAddr2;
    TdxMasterViewColumn *dxMasterView1Level1ShipToCity;
    TdxMasterViewColumn *dxMasterView1Level1ShipToState;
    TdxMasterViewColumn *dxMasterView1Level1ShipToZip;
    TdxMasterViewColumn *dxMasterView1Level1ShipToCountry;
    TdxMasterViewColumn *dxMasterView1Level1ShipToPhone;
    TdxMasterViewColumn *dxMasterView1Level1ShipVIA;
    TdxMasterViewColumn *dxMasterView1Level1PO;
    TdxMasterViewColumn *dxMasterView1Level1Terms;
    TdxMasterViewColumn *dxMasterView1Level1PaymentMethod;
    TdxMasterViewColumn *dxMasterView1Level1ItemsTotal;
    TdxMasterViewColumn *dxMasterView1Level1TaxRate;
    TdxMasterViewColumn *dxMasterView1Level1Freight;
    TdxMasterViewColumn *dxMasterView1Level1AmountPaid;
    TCSpinEdit *sedAmountPaid;
    void __fastcall Level1GetGroupStyle(TdxMasterViewLevel *Sender,
          TdxMasterViewNode *Node, TdxMasterViewColumn *Column,
          TdxMasterViewStyle *&NewStyle);
    void __fastcall Level1GetContentStyle(TdxMasterViewLevel *Sender,
          TdxMasterViewNode *Node, TdxMasterViewColumn *Column,
          TdxMasterViewStyle *&NewStyle);
    void __fastcall cmbPaymentMethodClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall dxMasterView1Level1AmountPaidGetContentStyle(
          TdxMasterViewColumn *Sender, TdxMasterViewNode *Node,
          TdxMasterViewStyle *&NewStyle);
private:	// User declarations
public:		// User declarations
    __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
