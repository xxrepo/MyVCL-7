unit EditorsMaskDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, Forms, DBTables;

type
  TEditorsMaskDemoDataDM = class(TDataModule)
    StyleRepository: TcxStyleRepository;
    stBlueDark: TcxStyle;
    stGold: TcxStyle;
    stBlueLight: TcxStyle;
    stBlueBright: TcxStyle;
    stYellowLight: TcxStyle;
    stGreyLight: TcxStyle;
    stBlueSky: TcxStyle;
    DataBase: TDataBase;
    ADOTableUSERS: TTable;
    DataSourceUSERS: TDataSource;
    ADOTableDEPARTMENTS: TTable;
    DataSourceDEPARTMENTS: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorsMaskDemoDataDM: TEditorsMaskDemoDataDM;

implementation

{$R *.dfm}

end.
