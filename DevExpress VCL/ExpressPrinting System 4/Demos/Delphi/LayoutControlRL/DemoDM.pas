unit DemoDM;

interface

uses
  SysUtils, Classes, DBTables, DB, dxLayoutLookAndFeels, cxLookAndFeels;

type
  TdmDemo = class(TDataModule)
    Database: TDatabase;
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
    queOrdersCustomers_ID: TIntegerField;
    queOrdersOrders_ID: TIntegerField;
    queOrdersCars_ID: TIntegerField;
    dsOrders: TDataSource;
    updOrders: TUpdateSQL;
    updCustomers: TUpdateSQL;
    updCars: TUpdateSQL;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDemo: TdmDemo;

implementation

{$R *.dfm}

end.
