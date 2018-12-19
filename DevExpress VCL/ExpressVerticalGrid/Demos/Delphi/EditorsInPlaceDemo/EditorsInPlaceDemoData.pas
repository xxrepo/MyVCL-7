unit EditorsInPlaceDemoData;

interface

uses
  SysUtils, Classes, DB, Forms, cxClasses, cxStyles, ImgList,
  Controls, cxVGrid, DBTables;

type
  TEditorsInPlaceDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblOrders: TTable;
    dsOrders: TDataSource;
    StyleRepository: TcxStyleRepository;
    tblCustomers: TTable;
    dsCustomers: TDataSource;
    PaymentTypeImages: TImageList;
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
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TFloatField;
    tblOrdersDescription: TMemoField;
    tblOrdersQuantity: TIntegerField;
    styCaption: TcxStyle;
    tblOrdersCustomerEmail: TStringField;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    procedure tblCarsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorsInPlaceDemoDataDM: TEditorsInPlaceDemoDataDM;

implementation

{$R *.dfm}

procedure TEditorsInPlaceDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsCar.AsString := tblCarsTrademark.AsString + ' ' + tblCarsModel.AsString;
end;

end.
