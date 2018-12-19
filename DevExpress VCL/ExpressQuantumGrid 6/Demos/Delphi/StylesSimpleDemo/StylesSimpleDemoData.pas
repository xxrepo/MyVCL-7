unit StylesSimpleDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList, Controls,
  cxGridTableView, cxClasses, DBTables;

type
  TStylesSimpleDemoMainDM = class(TDataModule)
    DataBase: TDataBase;
    tblPersons: TTable;
    dsPersons: TDataSource;
    tblPersonsID: TAutoIncField;
    tblPersonsFIRSTNAME: TStringField;
    tblPersonsSECONDNAME: TStringField;
    tblPersonsBIRTHNAME: TStringField;
    tblPersonsDATEOFBIRTH: TDateTimeField;
    tblPersonsBIRTHCOUNTRY: TIntegerField;
    tblPersonsLOCATIONOFBIRTH: TStringField;
    tblPersonsBIOGRAPHY: TMemoField;
    tblPersonsNICKNAME: TStringField;
    tblCountries: TTable;
    dsCountries: TDataSource;
    tblCountriesID: TAutoIncField;
    tblCountriesName: TStringField;
    StyleRepository: TcxStyleRepository;
    Sunny: TcxStyle;
    Dark: TcxStyle;
    Golden: TcxStyle;
    Summer: TcxStyle;
    Autumn: TcxStyle;
    Bright: TcxStyle;
    Cold: TcxStyle;
    Spring: TcxStyle;
    Light: TcxStyle;
    Winter: TcxStyle;
    Depth: TcxStyle;
    UserStyleSheet: TcxGridTableViewStyleSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StylesSimpleDemoMainDM: TStylesSimpleDemoMainDM;

implementation

{$R *.dfm}

end.

