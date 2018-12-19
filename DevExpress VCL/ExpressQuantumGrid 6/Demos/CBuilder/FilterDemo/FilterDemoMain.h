//---------------------------------------------------------------------------

#ifndef FilterDemoMainH
#define FilterDemoMainH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "cxClasses.hpp"
#include "cxControls.hpp"
#include "cxCustomData.hpp"
#include "cxData.hpp"
#include "cxDataStorage.hpp"
#include "cxDBLookupComboBox.hpp"
#include "cxEdit.hpp"
#include "cxEditRepositoryItems.hpp"
#include "cxFilter.hpp"
#include "cxGraphics.hpp"
#include "cxGrid.hpp"
#include "cxGridCustomTableView.hpp"
#include "cxGridCustomView.hpp"
#include "cxGridLevel.hpp"
#include "cxGridTableView.hpp"
#include "cxStyles.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Menus.hpp>
//---------------------------------------------------------------------------
class TfrmMain : public TForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TPanel *Panel1;
        TPanel *pnlMaskInfo;
        TcxGrid *Grid;
        TcxGridTableView *TableView;
        TcxGridColumn *TableViewOrderID;
        TcxGridColumn *TableViewCompany;
        TcxGridColumn *TableViewCountry;
        TcxGridColumn *TableViewProduct;
        TcxGridColumn *TableViewOrderDate;
        TcxGridColumn *TableViewQuantity;
        TcxGridLevel *GridLevel1;
        TDatabase *dbMain;
        TDataSource *dsCompanies;
        TDataSource *dsCountries;
        TTable *tblCompanies;
        TStringField *tblCompaniesCOMPANYNAME;
        TIntegerField *tblCompaniesCOUNTRYID;
        TTable *tblCountries;
        TTable *tblProducts;
        TAutoIncField *tblProductsID;
        TStringField *tblProductsName;
        TMainMenu *mmMain;
        TMenuItem *miFile;
        TMenuItem *miExit;
        TMenuItem *miView;
        TMenuItem *miColumnFilterPopupMultiSelect;
        TMenuItem *miApplyMultiSelectChanges;
        TMenuItem *miApplyMultiSelectChangesImmediately;
        TMenuItem *miApplyMultiSelectChangesOnButtonClick;
        TMenuItem *N1;
        TMenuItem *miColumnFilterPopupFilteredList;
        TMenuItem *N2;
        TMenuItem *miFilterRow;
        TMenuItem *miApplyFilterRowChanges;
        TMenuItem *miApplyFilterRowChangesOnCellExit;
        TMenuItem *miApplyFilterRowChangesImmediately;
        TMenuItem *miDateTimeFilters;
        TMenuItem *miDateTimeFilterRelativeDays;
        TMenuItem *miDateTimeFilterRelativeDayPeriods;
        TMenuItem *miDateTimeFilterRelativeWeeks;
        TMenuItem *miDateTimeFilterRelativeMonths;
        TMenuItem *miDateTimeFilterRelativeYears;
        TMenuItem *miDateTimeFilterPastFuture;
        TMenuItem *miDateTimeFilterMonths;
        TMenuItem *miDateTimeFilterYears;
        TMenuItem *miAbout;
        TcxEditRepository *erMain;
        TcxEditRepositoryImageItem *erMainFlag;
        void __fastcall miExitClick(TObject *Sender);
        void __fastcall miColumnFilterPopupMultiSelectClick(
          TObject *Sender);
        void __fastcall miApplyMultiSelectChangesClick(TObject *Sender);
        void __fastcall miColumnFilterPopupFilteredListClick(
          TObject *Sender);
        void __fastcall miFilterRowClick(TObject *Sender);
        void __fastcall miApplyFilterRowChangesClick(TObject *Sender);
        void __fastcall miDateTimeFilterClick(TObject *Sender);
        void __fastcall miAboutClick(TObject *Sender);
protected:
    void GenerateData();
    AnsiString GetProductName(int AID);
    void UpdateMenuValues();
public:		// User declarations
        __fastcall TfrmMain(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmMain *frmMain;
//---------------------------------------------------------------------------
#endif
