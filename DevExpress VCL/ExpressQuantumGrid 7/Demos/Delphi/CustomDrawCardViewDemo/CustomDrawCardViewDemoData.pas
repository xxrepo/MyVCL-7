unit CustomDrawCardViewDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView, Forms, DBTables;

type
  TCustomDrawCardViewDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblCountries: TTable;
    dsCountries: TDataSource;
    tlbPERSONSLINE: TTable;
    dsPERSONSLINE: TDataSource;
    qrePersons: TQuery;
    dsPresons: TDataSource;
    StyleRepository: TcxStyleRepository;
    stBlueDark: TcxStyle;
    stGold: TcxStyle;
    stBlueLight: TcxStyle;
    stBlueBright: TcxStyle;
    stYellowLight: TcxStyle;
    stGreyLight: TcxStyle;
    stBlueSky: TcxStyle;
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
    stDefault: TcxStyle;
  end;

var
  CustomDrawCardViewDemoMainDM: TCustomDrawCardViewDemoMainDM;

implementation

{$R *.dfm}

end.
