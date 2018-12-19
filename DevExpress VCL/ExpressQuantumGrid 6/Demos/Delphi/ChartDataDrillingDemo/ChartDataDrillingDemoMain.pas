unit ChartDataDrillingDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Menus, StdCtrls, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridChartView, cxGridDBChartView, cxTextEdit;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    dbMain: TDatabase;
    dsOrders: TDataSource;
    tblOrders: TTable;
    GridLevelChart: TcxGridLevel;
    Grid: TcxGrid;
    tblCustomers: TTable;
    tblProducts: TTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersCustomer: TStringField;
    tblOrdersProduct: TStringField;
    ChartView: TcxGridDBChartView;
    ChartViewSeriesPaymentAmount: TcxGridDBChartSeries;
    ChartViewDataGroupProduct: TcxGridDBChartDataGroup;
    GridLevelTable: TcxGridLevel;
    TableView: TcxGridDBTableView;
    ChartViewDataGroupPaymentType: TcxGridDBChartDataGroup;
    ChartViewDataGroupCustomer: TcxGridDBChartDataGroup;
    ChartViewDataGroupPurchaseDate: TcxGridDBChartDataGroup;
    ChartViewSeriesQuantity: TcxGridDBChartSeries;
    ChartViewSeriesCount: TcxGridDBChartSeries;
    TableViewPurchaseDate: TcxGridDBColumn;
    TableViewPaymentType: TcxGridDBColumn;
    TableViewPaymentAmount: TcxGridDBColumn;
    TableViewQuantity: TcxGridDBColumn;
    TableViewCustomer: TcxGridDBColumn;
    TableViewProduct: TcxGridDBColumn;
    TableViewOrderCount: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
    styleActiveGroup: TcxStyle;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure GridActiveTabChanged(Sender: TcxCustomGrid; ALevel: TcxGridLevel);
    procedure TableViewStylesGetGroupStyle(Sender: TcxGridTableView;
      ARecord: TcxCustomGridRecord; ALevel: Integer; out AStyle: TcxStyle);
  protected
    ActiveDataGroups: array of Integer;
    function GetColumnByChartItem(AChartItem: TcxGridChartItem): TcxGridDBColumn;
    procedure ShowTableActiveGroup;
    procedure SynchronizeTableWithChart;
    procedure UpdateTableGroupingAndColumnVisibility;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

function TfrmMain.GetColumnByChartItem(AChartItem: TcxGridChartItem): TcxGridDBColumn;
begin
  Result := TableView.GetColumnByFieldName(TcxGridDBChartItemDataBinding(AChartItem.DataBinding).FieldName);
end;

procedure TfrmMain.ShowTableActiveGroup;
var
  I, ADataGroupIndex, AGroupRowIndex: Integer;
  ARow: TcxCustomGridRow;
begin
  // expand group rows so that the group with the active chart data is made visible
  SetLength(ActiveDataGroups, ChartView.ActiveDataLevel);
  TableView.BeginUpdate;
  try
    TableView.DataController.Groups.FullCollapse;
    ADataGroupIndex := -1;
    for I := 0 to ChartView.ActiveDataLevel - 1 do
    begin
      ADataGroupIndex := TableView.DataController.Groups.GetDataGroupIndexByGroupValue(
        ADataGroupIndex, ChartView.VisibleDataGroups[I].ActiveValue);
      ActiveDataGroups[I] := ADataGroupIndex;
        
      AGroupRowIndex := TableView.DataController.DataControllerInfo.DataGroups[ADataGroupIndex].RowIndex;
      TableView.DataController.Groups.ChangeExpanding(AGroupRowIndex, True, False);
      TableView.Controller.FocusedRowIndex := AGroupRowIndex;
    end;
  finally
    TableView.EndUpdate;
  end;
  // select rows with the data used for the active chart
  TableView.BeginUpdate;
  try
    if ADataGroupIndex = -1 then
      TableView.Controller.SelectAll
    else
    begin
      TableView.Controller.ClearSelection;
      for I := TableView.Controller.FocusedRowIndex + 1 to TableView.ViewData.RowCount - 1 do
      begin
        ARow := TableView.ViewData.Rows[I];
        if ARow.Level = ChartView.ActiveDataLevel then
        begin
          ARow.Focused := True;
          ARow.Selected := True;
        end
        else
          Break;
      end;
    end;
  finally
    TableView.EndUpdate;
  end;
end;

procedure TfrmMain.SynchronizeTableWithChart;
begin
  UpdateTableGroupingAndColumnVisibility;
  ShowTableActiveGroup;
end;

procedure TfrmMain.TableViewStylesGetGroupStyle(Sender: TcxGridTableView;
  ARecord: TcxCustomGridRecord; ALevel: Integer; out AStyle: TcxStyle);
var
  ADataGroupIndex, I: Integer;
begin
  if ARecord = nil then Exit;
  ADataGroupIndex := TableView.DataController.Groups.DataGroupIndexByRowIndex[ARecord.Index];
  for I := 0 to Length(ActiveDataGroups) - 1 do
    if ADataGroupIndex = ActiveDataGroups[I] then
    begin
      AStyle := styleActiveGroup;
      Break;
    end;
end;

procedure TfrmMain.UpdateTableGroupingAndColumnVisibility;
var
  I: Integer;
begin
  TableView.BeginUpdate;
  try
    TableView.Controller.ClearGrouping;
    for I := 0 to ChartView.VisibleDataGroupCount - 1 do
      GetColumnByChartItem(ChartView.VisibleDataGroups[I]).GroupIndex := I;

    for I := 0 to ChartView.DataGroupCount - 1 do
      GetColumnByChartItem(ChartView.DataGroups[I]).Visible := ChartView.DataGroups[I].Visible;
    for I := 0 to ChartView.SeriesCount - 1 do
      GetColumnByChartItem(ChartView.Series[I]).Visible := ChartView.Series[I].Visible;
  finally
    TableView.EndUpdate;
  end;
end;

procedure TfrmMain.GridActiveTabChanged(Sender: TcxCustomGrid;
  ALevel: TcxGridLevel);
begin
  if ALevel = GridLevelTable then
    SynchronizeTableWithChart;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

end.
