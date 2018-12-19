unit DemoBasicDM;

{$I ..\cxVer.inc}

interface

uses
  Forms, SysUtils, Classes, DB, DBTables, ImgList, Controls, cxStyles;

type
  TdmOrders = class(TDataModule)
    dbOrders: TDatabase;
    dsCustomers: TDataSource;
    dsOrders: TDataSource;
    tblCustomers: TTable;
    tblCustomersID: TIntegerField;
    tblCustomersCompany: TStringField;
    tblOrders: TTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersCarName: TStringField;
    tblOrdersUnitPrice: TCurrencyField;
    tblOrdersCompanyName: TStringField;
    tblCars: TTable;
    tblCarsID: TAutoIncField;
    tblCarsTrademark: TStringField;
    tblCarsModel: TStringField;
    tblCarsPrice: TFloatField;
    tblCarsCarName: TStringField;
    dsCars: TDataSource;
    tblOrdersPaymentAmount: TCurrencyField;
    PaymentTypeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    stBoldBlueFont: TcxStyle;
    stBoldRedFont: TcxStyle;
    stBoldBlackFont: TcxStyle;
    procedure tblCarsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOrders: TdmOrders;

implementation

{$R *.dfm}

procedure TdmOrders.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsCarName.Value := tblCarsTrademark.Value + ': ' + tblCarsModel.Value;
end;

procedure TdmOrders.tblOrdersCalcFields(DataSet: TDataSet);
begin
  tblOrdersPaymentAmount.Value := tblOrdersQuantity.Value * tblOrdersUnitPrice.Value;
end;

end.
