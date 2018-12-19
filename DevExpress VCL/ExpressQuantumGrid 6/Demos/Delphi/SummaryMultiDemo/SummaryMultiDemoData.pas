unit SummaryMultiDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList, Controls, DBTables, DemoUtils;

type
  TSummaryMultiDemoDataDM = class(TDataModule)
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
    styleGold: TcxStyle;
    styleBlueLight: TcxStyle;
    styleYellowLight: TcxStyle;
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
    styleBlue: TcxStyle;
    styleRed: TcxStyle;
    styleNormal: TcxStyle;
    styleSortedSummary: TcxStyle;
    procedure tblCarsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }     
  end;

var
  SummaryMultiDemoDataDM: TSummaryMultiDemoDataDM;

implementation

{$R *.dfm}

procedure TSummaryMultiDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  SetStringFieldValue(tblCarsCarName,
    tblCarsTrademark.Value + ' ' + tblCarsModel.Value);
end;

end.
