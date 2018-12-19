unit SummariesDemoData;

interface

uses
  SysUtils, Classes, DB, Forms, cxClasses, cxStyles, cxTL, ImgList,
  Controls, DBTables;

type
  TSummariesDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblOrders: TTable;
    dsOrders: TDataSource;
    tblOrdersID: TAutoIncField;
    tblOrdersCustomerID: TIntegerField;
    tblOrdersProductID: TIntegerField;
    tblOrdersPurchaseDate: TDateTimeField;
    tblOrdersTime: TDateTimeField;
    tblOrdersPaymentType: TStringField;
    tblOrdersPaymentAmount: TFloatField;
    tblOrdersQuantity: TIntegerField;
    tblCars: TTable;
    dsCars: TDataSource;
    tblCustomers: TTable;
    dsCustomers: TDataSource;
    tblCustomersID: TAutoIncField;
    tblCustomersFirstName: TStringField;
    tblCustomersLastName: TStringField;
    tblCustomersName: TStringField;
    tblCarsID: TAutoIncField;
    tblCarsTrademark: TStringField;
    tblCarsModel: TStringField;
    tblCarsPicture: TBlobField;
    tblCarsCarName: TStringField;
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
    stlGroupNode: TcxStyle;
    stlFixedBand: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    tblCarsDescription: TMemoField;
    tblCarsPrice: TFloatField;
    PaymentTypeImages: TImageList;
    qryOrdersSummary: TQuery;
    dsOrdersSummary: TDataSource;
    procedure tblCustomersCalcFields(DataSet: TDataSet);
    procedure tblCarsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SummariesDemoDataDM: TSummariesDemoDataDM;

implementation

{$R *.dfm}

procedure TSummariesDemoDataDM.tblCustomersCalcFields(DataSet: TDataSet);
begin
  tblCustomersName.Value := tblCustomersFirstName.AsString + ' ' +
    tblCustomersLastName.AsString;
end;

procedure TSummariesDemoDataDM.tblCarsCalcFields(DataSet: TDataSet);
begin
  tblCarsCarName.Value := tblCarsTrademark.AsString + ' ' +
    tblCarsModel.AsString;
end;

end.
