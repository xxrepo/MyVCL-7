unit SimpleVerticalGridDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxVGrid, DBTables, Forms;

type
  TSimpleVerticalGridDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblCars: TTable;
    dsCars: TDataSource;
    cxStyleRepository: TcxStyleRepository;
    cxVerticalGridStyleSheetDevExpress: TcxVerticalGridStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimpleVerticalGridDemoMainDM: TSimpleVerticalGridDemoMainDM;

implementation

{$R *.dfm}

end.
