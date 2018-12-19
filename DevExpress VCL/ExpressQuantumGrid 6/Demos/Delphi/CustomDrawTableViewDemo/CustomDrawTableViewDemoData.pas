unit CustomDrawTableViewDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView, Forms, DBTables;

type
  TCustomDrawTableViewDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    StyleRepository: TcxStyleRepository;
    tlbCars: TTable;
    dsCars: TDataSource;
    tlbCustomers: TTable;
    dsCustomers: TDataSource;
    tlbOrders: TTable;
    dsOrders: TDataSource;
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
  end;

var
  CustomDrawTableViewDemoMainDM: TCustomDrawTableViewDemoMainDM;

implementation

{$R *.dfm}

end.
