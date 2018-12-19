unit MasterDetailChartDemoMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, DBTables, cxLookAndFeels, Menus,
  cxGridChartView, cxGridDBChartView, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter;

type
  TfrmMain = class(TForm)
    dbMain: TDatabase;
    mmMain: TMainMenu;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miAbout: TMenuItem;
    LookAndFeelController: TcxLookAndFeelController;
    dsOrders: TDataSource;
    tblOrders: TTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblProducts: TTable;
    tblCustomers: TTable;
    Label1: TLabel;
    tvCustomers: TcxGridDBTableView;
    grMainLevel1: TcxGridLevel;
    grMain: TcxGrid;
    grMainLevel2: TcxGridLevel;
    chvOrders: TcxGridDBChartView;
    dsCustomers: TDataSource;
    tvCustomersID: TcxGridDBColumn;
    tvCustomersFirstName: TcxGridDBColumn;
    tvCustomersLastName: TcxGridDBColumn;
    tvCustomersCompany: TcxGridDBColumn;
    tvCustomersAddress: TcxGridDBColumn;
    tvCustomersCity: TcxGridDBColumn;
    tvCustomersState: TcxGridDBColumn;
    tvCustomersZipCode: TcxGridDBColumn;
    tvCustomersEmail: TcxGridDBColumn;
    chvOrdersPaymentAmountSeries: TcxGridDBChartSeries;
    chvOrdersProductIDSeries: TcxGridDBChartSeries;
    chvOrdersQuantitySeries: TcxGridDBChartSeries;
    qryProducts: TQuery;
    grMainLevel3: TcxGridLevel;
    chvProducts: TcxGridDBChartView;
    dsProducts: TDataSource;
    chvProductsCopiesSeries: TcxGridDBChartSeries;
    procedure miExitClick(Sender: TObject);
    procedure miAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chvOrdersGetValueHint(Sender: TcxGridChartView;
      ASeries: TcxGridChartSeries; AValueIndex: Integer;
      var AHint: String);
    procedure chvOrdersCategoriesGetValueDisplayText(Sender: TObject;
      const AValue: Variant; var ADisplayText: string);
  protected
    function GetProductName(AID: Integer): string;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AboutDemoForm;

function TfrmMain.GetProductName(AID: Integer): string;
begin
  if tblProducts.FindKey([AID]) then
    Result := {$IFDEF CLR}string{$ENDIF}(tblProducts.FieldValues['Name'])
  else
    Result := '';
end;

procedure TfrmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.miAboutClick(Sender: TObject);
begin
  ShowAboutDemoForm;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  tvCustomers.ViewData.Rows[0].Expanded := True;
  tvCustomers.ViewData.Rows[1].Expanded := True;
  (tvCustomers.ViewData.Rows[1] as TcxGridMasterDataRow).ActiveDetailIndex := 1;
end;

procedure TfrmMain.chvOrdersCategoriesGetValueDisplayText(Sender: TObject;
  const AValue: Variant; var ADisplayText: string);
begin
  ADisplayText := '#' + ADisplayText;
end;

procedure TfrmMain.chvOrdersGetValueHint(Sender: TcxGridChartView;
  ASeries: TcxGridChartSeries; AValueIndex: Integer; var AHint: String);
begin
  AHint := Format('Order %s (%d copies of %s) for %s',
    [Sender.Categories.VisibleDisplayTexts[AValueIndex],
     Integer(Sender.FindSeriesByID(chvOrdersQuantitySeries.ID).VisibleValues[AValueIndex]),
     GetProductName(Integer(Sender.FindSeriesByID(chvOrdersProductIDSeries.ID).VisibleValues[AValueIndex])),
     ASeries.VisibleDisplayTexts[AValueIndex]]);
end;

end.
