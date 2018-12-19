unit EditorsInPlaceDemoData;

interface

uses
  SysUtils, Classes, DB, Forms, cxClasses, cxStyles, cxTL, ImgList,
  Controls, DBTables;

type
  TEditorsInPlaceDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblOrders: TTable;
    dsOrders: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    procedure tblCarsCalcFields(DataSet: TDataSet);
    procedure tblOrdersCalcFields(DataSet: TDataSet);
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

procedure TEditorsInPlaceDemoDataDM.tblOrdersCalcFields(DataSet: TDataSet);
begin
  tblOrdersCustomerEmail.AsString := tblCustomers.Lookup('ID',
    tblOrdersCustomerID.Value, 'email');
end;

end.
