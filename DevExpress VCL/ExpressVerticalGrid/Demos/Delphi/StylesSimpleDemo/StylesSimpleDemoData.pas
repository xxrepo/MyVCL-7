unit StylesSimpleDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList, Controls,
  cxClasses, cxVGrid, DBTables;

type
  TStylesSimpleDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    queOrders: TQuery;
    queOrdersPurchaseDate: TDateTimeField;
    queOrdersTime: TDateTimeField;
    queOrdersPaymentType: TStringField;
    queOrdersPaymentAmount: TFloatField;
    queOrdersQuantity: TIntegerField;
    queOrdersFirstName: TStringField;
    queOrdersLastName: TStringField;
    queOrdersCompany: TStringField;
    queOrdersPrefix: TStringField;
    queOrdersTitle: TStringField;
    queOrdersAddress: TStringField;
    queOrdersCity: TStringField;
    queOrdersState: TStringField;
    queOrdersZipCode: TStringField;
    queOrdersSource: TStringField;
    queOrdersCustomer: TStringField;
    queOrdersHomePhone: TStringField;
    queOrdersFaxPhone: TStringField;
    queOrdersSpouse: TStringField;
    queOrdersOccupation: TStringField;
    queOrdersEmail: TStringField;
    queOrdersTrademark: TStringField;
    queOrdersModel: TStringField;
    queOrdersHP: TSmallintField;
    queOrdersLiter: TFloatField;
    queOrdersCyl: TSmallintField;
    queOrdersTransmissSpeedCount: TSmallintField;
    queOrdersTransmissAutomatic: TStringField;
    queOrdersMPG_City: TSmallintField;
    queOrdersMPG_Highway: TSmallintField;
    queOrdersCategory: TStringField;
    queOrdersCars_Description: TMemoField;
    queOrdersHyperlink: TStringField;
    queOrdersPicture: TBlobField;
    queOrdersPrice: TFloatField;
    dsOrders: TDataSource;
    StyleRepository: TcxStyleRepository;
    Sunny: TcxStyle;
    Dark: TcxStyle;
    Golden: TcxStyle;
    Summer: TcxStyle;
    Autumn: TcxStyle;
    Bright: TcxStyle;
    Cold: TcxStyle;
    Spring: TcxStyle;
    Light: TcxStyle;
    Winter: TcxStyle;
    Depth: TcxStyle;
    UserStyleSheet: TcxVerticalGridStyleSheet;
    updOrders: TUpdateSQL;
    updCustomers: TUpdateSQL;
    updCars: TUpdateSQL;
    procedure queOrdersUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure queOrdersAfterPost(DataSet: TDataSet);
    procedure queOrdersAfterCancel(DataSet: TDataSet);
    procedure StylesSimpleDemoDataDMCreate(Sender: TObject);
  end;

var
  StylesSimpleDemoDataDM: TStylesSimpleDemoDataDM;

implementation

{$R *.dfm}

procedure TStylesSimpleDemoDataDM.queOrdersUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  updOrders.Apply(UpdateKind);
  updCustomers.Apply(UpdateKind);
  updCars.Apply(UpdateKind);
  UpdateAction := uaApplied;
end;

procedure TStylesSimpleDemoDataDM.queOrdersAfterPost(DataSet: TDataSet);
begin
  queOrders.ApplyUpdates;
end;

procedure TStylesSimpleDemoDataDM.queOrdersAfterCancel(DataSet: TDataSet);
begin
  queOrders.CancelUpdates;
end;

procedure TStylesSimpleDemoDataDM.StylesSimpleDemoDataDMCreate(
  Sender: TObject);
begin
  updOrders.DataSet := queOrders;
  updCustomers.DataSet := queOrders;
  updCars.DataSet := queOrders;
end;

end.

