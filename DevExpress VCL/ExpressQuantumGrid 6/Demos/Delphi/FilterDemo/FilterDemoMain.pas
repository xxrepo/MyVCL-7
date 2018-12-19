unit FilterDemoMain;

{$I '..\..\cxVer.inc'}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, DBTables, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDBLookupComboBox, cxEditRepositoryItems, ExtCtrls;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    dbMain: TDatabase;
    dsCompanies: TDataSource;
    tblCompanies: TTable;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    tblCountries: TTable;
    tblCompaniesCOMPANYNAME: TStringField;
    tblCompaniesCOUNTRYID: TIntegerField;
    TableView: TcxGridTableView;
    TableViewCompany: TcxGridColumn;
    TableViewCountry: TcxGridColumn;
    TableViewOrderDate: TcxGridColumn;
    TableViewOrderID: TcxGridColumn;
    tblProducts: TTable;
    TableViewProduct: TcxGridColumn;
    TableViewQuantity: TcxGridColumn;
    tblProductsID: TAutoIncField;
    tblProductsName: TStringField;
    miView: TMenuItem;
    miColumnFilterPopupMultiSelect: TMenuItem;
    miApplyMultiSelectChanges: TMenuItem;
    N1: TMenuItem;
    miColumnFilterPopupFilteredList: TMenuItem;
    N2: TMenuItem;
    miFilterRow: TMenuItem;
    miApplyMultiSelectChangesImmediately: TMenuItem;
    miApplyMultiSelectChangesOnButtonClick: TMenuItem;
    miDateTimeFilters: TMenuItem;
    dsCountries: TDataSource;
    erMain: TcxEditRepository;
    erMainFlag: TcxEditRepositoryImageItem;
    miApplyFilterRowChanges: TMenuItem;
    miApplyFilterRowChangesOnCellExit: TMenuItem;
    miApplyFilterRowChangesImmediately: TMenuItem;
    miDateTimeFilterRelativeDays: TMenuItem;
    miDateTimeFilterRelativeDayPeriods: TMenuItem;
    miDateTimeFilterRelativeWeeks: TMenuItem;
    miDateTimeFilterRelativeMonths: TMenuItem;
    miDateTimeFilterRelativeYears: TMenuItem;
    miDateTimeFilterPastFuture: TMenuItem;
    miDateTimeFilterMonths: TMenuItem;
    miDateTimeFilterYears: TMenuItem;
    Panel1: TPanel;
    pnlMaskInfo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure miColumnFilterPopupMultiSelectClick(Sender: TObject);
    procedure miApplyMultiSelectChangesClick(Sender: TObject);
    procedure miColumnFilterPopupFilteredListClick(Sender: TObject);
    procedure miFilterRowClick(Sender: TObject);
    procedure miApplyFilterRowChangesClick(Sender: TObject);
    procedure miDateTimeFilterClick(Sender: TObject);
  protected
    procedure GenerateData;
    function GetProductName(AID: Integer): string;
    procedure UpdateMenuValues;
  end;

var
  frmMain: TfrmMain;

implementation

uses
{$IFDEF DELPHI6}
  Variants,
{$ENDIF}
  AboutDemoForm;

{$R *.dfm}

procedure TfrmMain.GenerateData;
const
  OrdersPerCustomer = 25;
  DayRange = 3 * 365 div 2;
  MaxQuantity = 50;
var
  ADate: TDateTime;
  ACompanyName: string;
  ACountryID, I, ARecordIndex: Integer;
  ARow: TcxCustomGridRow;
begin
  ADate := Date;
  TableView.DataController.RecordCount := tblCompanies.RecordCount * OrdersPerCustomer;

  TableView.BeginUpdate;
  try
    tblCompanies.First;
    while not tblCompanies.Eof do
    begin
      ACompanyName := tblCompaniesCOMPANYNAME.AsString;
      ACountryID := tblCompaniesCOUNTRYID.AsInteger;

      for I := 0 to OrdersPerCustomer - 1 do
      begin
        ARecordIndex := (tblCompanies.RecNo - 1) * OrdersPerCustomer + I;
        ARow := TableView.ViewData.Rows[ARecordIndex];

        ARow.Values[TableViewCompany.Index] := ACompanyName;
        ARow.Values[TableViewCountry.Index] := ACountryID;
        ARow.Values[TableViewOrderDate.Index] := ADate + Random(DayRange) - DayRange div 2 + Random;
        ARow.Values[TableViewProduct.Index] := GetProductName(1 + Random(tblProducts.RecordCount));
        ARow.Values[TableViewQuantity.Index] := 1 + Random(MaxQuantity);
      end;
      tblCompanies.Next;
    end;
    TableViewOrderDate.SortOrder := soAscending;
  finally
    TableView.EndUpdate;
  end;

  TableView.BeginUpdate;
  try
    for I := 0 to TableView.ViewData.RowCount - 1 do
      TableView.ViewData.Rows[I].Values[TableViewOrderID.Index] := 1 + I;
  finally
    TableView.EndUpdate;
  end;
end;

function TfrmMain.GetProductName(AID: Integer): string;
begin
  if tblProducts.Locate('ID', AID, []) then
    Result := tblProductsName.AsString
  else
    Result := '';
end;

procedure TfrmMain.UpdateMenuValues;
var
  I: Integer;
begin
  miColumnFilterPopupMultiSelect.Checked := TableView.Filtering.ColumnPopup.MultiSelect;
  miApplyMultiSelectChanges.Enabled := TableView.Filtering.ColumnPopup.MultiSelect;
  if TableView.Filtering.ColumnPopup.ApplyMultiSelectChanges = fpacImmediately then
    miApplyMultiSelectChangesImmediately.Checked := True
  else
    miApplyMultiSelectChangesOnButtonClick.Checked := True;

  miColumnFilterPopupFilteredList.Checked := TableView.Filtering.ColumnFilteredItemsList;

  miFilterRow.Checked := TableView.FilterRow.Visible;
  miApplyFilterRowChanges.Enabled := TableView.FilterRow.Visible;
  if TableView.FilterRow.ApplyChanges = fracOnCellExit then
    miApplyFilterRowChangesOnCellExit.Checked := True
  else
    miApplyFilterRowChangesImmediately.Checked := True;

  for I := 0 to miDateTimeFilters.Count - 1 do
    miDateTimeFilters[I].Checked := TcxGridDateTimeFilter(I) in TableView.DateTimeHandling.Filters;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.miApplyFilterRowChangesClick(Sender: TObject);
begin
  TableView.FilterRow.ApplyChanges :=
    TcxGridFilterRowApplyChangesMode(TMenuItem(Sender).MenuIndex);
  UpdateMenuValues;
end;

procedure TfrmMain.miApplyMultiSelectChangesClick(Sender: TObject);
begin
  TableView.Filtering.ColumnPopup.ApplyMultiSelectChanges :=
    TcxGridItemFilterPopupApplyChangesMode(TMenuItem(Sender).MenuIndex);
  UpdateMenuValues;  
end;

procedure TfrmMain.miColumnFilterPopupFilteredListClick(Sender: TObject);
begin
  with TableView.Filtering do
    ColumnFilteredItemsList := not ColumnFilteredItemsList;
  UpdateMenuValues;  
end;

procedure TfrmMain.miColumnFilterPopupMultiSelectClick(Sender: TObject);
begin
  with TableView.Filtering.ColumnPopup do
    MultiSelect := not MultiSelect;
  UpdateMenuValues;  
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miFilterRowClick(Sender: TObject);
begin
  with TableView.FilterRow do
    Visible := not Visible;
  UpdateMenuValues;
end;

procedure TfrmMain.miDateTimeFilterClick(Sender: TObject);
var
  AFilter: TcxGridDateTimeFilter;
begin
  AFilter := TcxGridDateTimeFilter(TMenuItem(Sender).MenuIndex);
  with TableView.DateTimeHandling do
    if AFilter in Filters then
      Filters := Filters - [AFilter]
    else
      Filters := Filters + [AFilter];
  UpdateMenuValues;    
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  GenerateData;
  UpdateMenuValues;

  TableViewProduct.DataBinding.AddToFilter(nil, foLike, 'Express*');
  TableViewOrderDate.DataBinding.AddToFilter(nil, foThisMonth, Null);
  TableView.DataController.Filter.Active := True;
end;

end.
