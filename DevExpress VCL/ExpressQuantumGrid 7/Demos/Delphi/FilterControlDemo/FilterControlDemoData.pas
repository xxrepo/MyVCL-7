unit FilterControlDemoData;

interface

{$I ..\..\cxVer.inc}

uses
  {$IFNDEF DELPHI6}
  Forms,
  {$ENDIF}
  SysUtils, Classes, DB, cxStyles, ImgList, Controls, cxClasses,
  cxGridTableView, DBTables;

type
  TFilterControlDemoDataDM = class(TDataModule)
    dsCars: TDataSource;
    dsOrders: TDataSource;
    dsCustomers: TDataSource;
    StyleRepository: TcxStyleRepository;
    PaymentTypeImages: TImageList;
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
    dsOrdersStd: TDataSource;
    tblCars: TTable;
    tblOrders: TTable;
    tblCustomers: TTable;
    tblOrdersStd: TTable;
    Database: TDatabase;
    tblCarsID: TAutoIncField;
    tblCarsTrademark: TStringField;
    tblCarsModel: TStringField;
    tblCarsHP: TSmallintField;
    tblCarsLiter: TFloatField;
    tblCarsCyl: TSmallintField;
    tblCarsTransmissSpeedCount: TSmallintField;
    tblCarsTransmissAutomatic: TStringField;
    tblCarsMPG_City: TSmallintField;
    tblCarsMPG_Highway: TSmallintField;
    tblCarsCategory: TStringField;
    tblCarsDescription: TMemoField;
    tblCarsHyperlink: TStringField;
    tblCarsPicture: TBlobField;
    tblCarsPrice: TCurrencyField;
    tblCarsName: TStringField;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TCurrencyField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersStdCustomerID: TIntegerField;
    tblOrdersStdProductID: TIntegerField;
    tblOrdersStdPurchaseDate: TDateTimeField;
    tblOrdersStdTime: TDateTimeField;
    tblOrdersStdPaymentType: TStringField;
    tblOrdersStdPaymentAmount: TCurrencyField;
    tblOrdersStdDescription: TMemoField;
    tblOrdersStdQuantity: TIntegerField;
    tblCustomersID: TAutoIncField;
    tblCustomersFirstName: TStringField;
    tblCustomersLastName: TStringField;
    tblCustomersCompany: TStringField;
    tblCustomersPrefix: TStringField;
    tblCustomersTitle: TStringField;
    tblCustomersAddress: TStringField;
    tblCustomersCity: TStringField;
    tblCustomersState: TStringField;
    tblCustomersZipCode: TStringField;
    tblCustomersSource: TStringField;
    tblCustomersCustomer: TStringField;
    tblCustomersHomePhone: TStringField;
    tblCustomersFaxPhone: TStringField;
    tblCustomersSpouse: TStringField;
    tblCustomersOccupation: TStringField;
    tblCustomersDescription: TMemoField;
    tblCustomersName: TStringField;
    tblOrdersStdCompany: TStringField;
    tblOrdersStdCar: TStringField;
    procedure tblCustomersCalcFields(DataSet: TDataSet);
    procedure tblCarsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FilterControlDemoDataDM: TFilterControlDemoDataDM;

implementation

{$R *.dfm}

procedure TFilterControlDemoDataDM.tblCustomersCalcFields(
  DataSet: TDataSet);
begin
  tblCustomersName.AsString := tblCustomersFirstName.AsString + ' ' +
    tblCustomersLastName.AsString;
end;

procedure TFilterControlDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsName.AsString := tblCarsTrademark.AsString + ' ' +
    tblCarsModel.AsString; 
end;

end.
