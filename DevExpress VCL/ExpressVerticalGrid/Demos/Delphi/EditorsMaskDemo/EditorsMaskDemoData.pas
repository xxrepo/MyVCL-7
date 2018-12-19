unit EditorsMaskDemoData;

{$I ..\cxVer.inc}

interface

uses
  SysUtils, Classes, DB, cxStyles{$IFNDEF DELPHI6}, Forms{$ENDIF}, DBTables;

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
    tblUSERS: TTable;
    dsUSERS: TDataSource;
    tblDEPARTMENTS: TTable;
    dsDEPARTMENTS: TDataSource;
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
