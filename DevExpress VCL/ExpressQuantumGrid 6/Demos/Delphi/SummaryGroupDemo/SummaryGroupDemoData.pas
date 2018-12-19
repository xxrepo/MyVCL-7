unit SummaryGroupDemoData;

interface

uses
  Forms,
  SysUtils, Classes, DB, cxStyles, ImgList, Controls, DBTables, DemoUtils;

type
  TSummaryGroupDemoDataDM = class(TDataModule)
    dsCars: TDataSource;
    dsOrders: TDataSource;
    dsCustomers: TDataSource;
    DataBase: TDataBase;
    tblCars: TTable;
    tblOrders: TTable;
    tblCustomers: TTable;
    tblCustomersID: TIntegerField;
    tblCustomersFirstName: TStringField;
    tblCustomersLastName: TStringField;
    tblCustomersCompany: TStringField;
    StyleRepository: TcxStyleRepository;
    stBlueLight: TcxStyle;
    stGreyLight: TcxStyle;
    stBlueSky: TcxStyle;
    PaymentTypeImages: TImageList;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblCarsID: TAutoIncField;
    tblCarsTrademark: TStringField;
    tblCarsModel: TStringField;
    tblCarshp: TSmallintField;
    tblCarsliter: TFloatField;
    tblCarscyl: TSmallintField;
    tblCarsTransmissSpeedCount: TSmallintField;
    tblCarsTransmissAutomatic: TStringField;
    tblCarsMPG_City: TSmallintField;
    tblCarsMPG_Highway: TSmallintField;
    tblCarsCategory: TStringField;
    tblCarsDescription: TMemoField;
    tblCarsHyperlink: TStringField;
    tblCarsPicture: TBlobField;
    tblCarsPrice: TFloatField;
    tblCarsCarName: TStringField;
    tblOrdersPurchaseMonth: TStringField;
    stClear: TcxStyle;
    stRed: TcxStyle;
    procedure tblCarsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SummaryGroupDemoDataDM: TSummaryGroupDemoDataDM;

implementation

{$R *.dfm}

procedure TSummaryGroupDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  SetStringFieldValue(tblCarsCarName,
    tblCarsTrademark.Value + ' ' +  tblCarsModel.Value);
end;

procedure TSummaryGroupDemoDataDM.tblOrdersCalcFields(DataSet: TDataSet);
var
  s: string;
begin
  DateTimeToString(s, 'mmmm', tblOrdersPurchaseDate.AsDateTime);
  SetStringFieldValue(tblOrdersPurchaseMonth, s);
end;

end.
