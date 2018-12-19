unit CustomDrawDemoData;

interface

uses
  SysUtils, cxClasses, cxStyles, DB, Classes, cxVGrid, DBTables, Forms;

type
  TCustomDrawDemoDataDM = class(TDataModule)
    StyleRepository: TcxStyleRepository;
    stCustomer: TcxStyle;
    stNoCustomer: TcxStyle;
    DataBase: TDataBase;
    queOrders: TQuery;
    queOrdersPurchaseDate: TDateTimeField;
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
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    updOrders: TUpdateSQL;
    updCustomers: TUpdateSQL;
    updCars: TUpdateSQL;
    queOrdersCustomers_ID: TIntegerField;
    queOrdersCustomerID: TIntegerField;
    queOrdersOrders_ID: TIntegerField;
    queOrdersProductID: TIntegerField;
    queOrdersCars_ID: TIntegerField;
    queOrdersOrders_Time: TDateTimeField;
    procedure queOrdersUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure queOrdersAfterPost(DataSet: TDataSet);
    procedure CustomDrawDemoDataDMCreate(Sender: TObject);
    procedure queOrdersAfterCancel(DataSet: TDataSet);
  end;

var
  CustomDrawDemoDataDM: TCustomDrawDemoDataDM;

implementation

{$R *.dfm}

procedure TCustomDrawDemoDataDM.queOrdersUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  updOrders.Apply(UpdateKind);
  updCustomers.Apply(UpdateKind);
  updCars.Apply(UpdateKind);
  UpdateAction := uaApplied;
end;

procedure TCustomDrawDemoDataDM.queOrdersAfterPost(DataSet: TDataSet);
begin
  queOrders.ApplyUpdates;
end;

procedure TCustomDrawDemoDataDM.CustomDrawDemoDataDMCreate(
  Sender: TObject);
begin
  updOrders.DataSet := queOrders;
  updCustomers.DataSet := queOrders;
  updCars.DataSet := queOrders;
end;

procedure TCustomDrawDemoDataDM.queOrdersAfterCancel(DataSet: TDataSet);
begin
  queOrders.CancelUpdates;
end;

end.
