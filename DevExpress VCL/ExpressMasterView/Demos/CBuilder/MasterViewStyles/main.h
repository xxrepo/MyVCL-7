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
#include <DBTables.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
//---------------------------------------------------------------------------
class TfmMain : public TForm
{
__published:	// IDE-managed Components
    TPanel *pnBottom;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TLabel *Label6;
    TComboBox *cmbLevels;
    TComboBox *cmbLevelElements;
    TComboBox *cmbLevelStyle;
    TComboBox *cmbColumns;
    TComboBox *cmbColumnElements;
    TComboBox *cmbColumnStyle;
    TPanel *pnLeft;
    TGroupBox *GroupBox1;
    TButton *btnNew;
    TButton *btnDelete;
    TButton *btnColor;
    TPanel *plColor;
    TPanel *plAnotherColor;
    TButton *btnAnotherColor;
    TButton *btnFont;
    TListBox *cmbStyles;
    TButton *btnCustomize;
    TTable *tbCustomer;
    TDataSource *dsCustomer;
    TTable *tbOrders;
    TDataSource *dsOrders;
    TColorDialog *ColorDialog;
    TFontDialog *FontDialog;
    TdxMasterView *MasterView;
    TdxMasterViewStyle *Style1;
    TdxMasterViewStyle *Style2;
    TdxMasterViewLevel *Level1;
    TdxMasterViewColumn *CustNo;
    TdxMasterViewColumn *Company;
    TdxMasterViewColumn *Addr1;
    TdxMasterViewColumn *Addr2;
    TdxMasterViewColumn *City;
    TdxMasterViewColumn *State;
    TdxMasterViewColumn *Zip;
    TdxMasterViewColumn *Country;
    TdxMasterViewColumn *Phone;
    TdxMasterViewColumn *FAX;
    TdxMasterViewColumn *TaxRate;
    TdxMasterViewColumn *Contact;
    TdxMasterViewColumn *LastInvoiceDate;
    TdxMasterViewLevel *Level2;
    TdxMasterViewColumn *OrderNo;
    TdxMasterViewColumn *CustNoL2;
    TdxMasterViewColumn *SaleDate;
    TdxMasterViewColumn *ShipDate;
    TdxMasterViewColumn *EmpNo;
    TdxMasterViewColumn *ShipToContact;
    TdxMasterViewColumn *ShipToAddr1;
    TdxMasterViewColumn *ShipToAddr2;
    TdxMasterViewColumn *ShipToCity;
    TdxMasterViewColumn *ShipToState;
    TdxMasterViewColumn *ShipToZip;
    TdxMasterViewColumn *ShipToCountry;
    TdxMasterViewColumn *ShipToPhone;
    TdxMasterViewColumn *ShipVIA;
    TdxMasterViewColumn *PO;
    TdxMasterViewColumn *Terms;
    TdxMasterViewColumn *PaymentMethod;
    TdxMasterViewColumn *ItemsTotal;
    TdxMasterViewColumn *TaxRateL2;
    TdxMasterViewColumn *Freight;
    TdxMasterViewColumn *AmountPaid;
    void __fastcall btnColorClick(TObject *Sender);
    void __fastcall btnFontClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall cmbStylesChange(TObject *Sender);
    void __fastcall btnAnotherColorClick(TObject *Sender);
    void __fastcall btnNewClick(TObject *Sender);
    void __fastcall btnDeleteClick(TObject *Sender);
    void __fastcall cmbLevelsChange(TObject *Sender);
    void __fastcall cmbColumnsChange(TObject *Sender);
    void __fastcall cmbLevelElementsChange(TObject *Sender);
    void __fastcall cmbColumnElementsChange(TObject *Sender);
    void __fastcall cmbLevelStyleChange(TObject *Sender);
    void __fastcall cmbColumnStyleChange(TObject *Sender);
    void __fastcall btnCustomizeClick(TObject *Sender);
private:	// User declarations
public:
    TdxMasterViewStyle *CurrentStyle;
    TdxMasterViewLevel *CurrentLevel;
    TdxMasterViewColumn *CurrentColumn;
    void __fastcall StyleControlsUpdate();
    void __fastcall FillColumnsCombos(TdxMasterViewLevel *Level);
    void __fastcall AssignStyles();
     __fastcall TfmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfmMain *fmMain;
//---------------------------------------------------------------------------
#endif
