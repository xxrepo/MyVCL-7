unit RTTIInspectorDemoData;

interface

uses
  SysUtils, Classes, ImgList, Controls, cxClasses, cxStyles, cxVGrid, DB, DBTables, Forms;

type
  TRTTIInspectorDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblCustomers: TTable;
    dsCustomers: TDataSource;
    dsCars: TDataSource;
    tblCars: TTable;
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
    tblCarsPrice: TFloatField;
    tblCarsCar: TStringField;
    tblOrders: TTable;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentAmount: TFloatField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    tblOrdersCustomerEmail: TStringField;
    dsOrders: TDataSource;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    PaymentTypeImages: TImageList;
    cxVerticalGridStyleSheetUserFormat3: TcxVerticalGridStyleSheet;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RTTIInspectorDemoMainDM: TRTTIInspectorDemoMainDM;

implementation

{$R *.dfm}

end.
