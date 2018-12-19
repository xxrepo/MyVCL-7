unit EditorsMaskDemoData;

interface

uses
  SysUtils, Classes, DB, cxStyles, Forms, DBTables;

type
  TEditorsMaskDemoMainDM = class(TDataModule)
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
  EditorsMaskDemoMainDM: TEditorsMaskDemoMainDM;

implementation

{$R *.dfm}

end.
