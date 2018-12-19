unit GridMenuViewsDemoData;

interface

uses
  
  Forms,
  
  SysUtils, Classes, DB, cxStyles, ImgList, Controls, cxClasses,
  cxGridTableView, DBTables;

type
  TGridMenuViewsDemoDataDM = class(TDataModule)
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    procedure tblCarsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GridMenuViewsDemoDataDM: TGridMenuViewsDemoDataDM;

implementation

{$R *.dfm}

procedure TGridMenuViewsDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsCarName.AsString := tblCarsTrademark.AsString + ' ' +
    tblCarsModel.AsString;
end;

procedure TGridMenuViewsDemoDataDM.tblOrdersCalcFields(DataSet: TDataSet);
var
  s: string;
begin
  DateTimeToString(s, 'mmmm', tblOrdersPurchaseDate.AsDateTime);
  tblOrdersPurchaseMonth.AsString := s;
end;

end.
