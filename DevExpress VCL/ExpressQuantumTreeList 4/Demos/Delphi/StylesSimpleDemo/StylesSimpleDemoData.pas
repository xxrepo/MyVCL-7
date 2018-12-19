unit StylesSimpleDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, ImgList, Controls,
  cxClasses, cxTL, DBTables;

type
  TStylesSimpleDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblDEPARTMENTS: TTable;
    dsDEPARTMENTS: TDataSource;
    tblPERSONS: TTable;
    dsPERSONS: TDataSource;
    tblPERSONSID: TAutoIncField;
    tblPERSONSName: TStringField;
    tblPERSONSCountry: TStringField;
    tblPERSONSPostalCode: TStringField;
    tblPERSONSCity: TStringField;
    tblPERSONSAddress: TStringField;
    tblPERSONSPhone: TStringField;
    tblPERSONSFax: TStringField;
    tblPERSONSEMAIL: TStringField;
    tblPERSONSHOMEPAGE: TStringField;
    tblPERSONSDepartmentID: TIntegerField;
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
    UserStyleSheet: TcxTreeListStyleSheet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetParentValue(AValue: Variant);
  end;

var
  StylesSimpleDemoDataDM: TStylesSimpleDemoDataDM;

implementation

{$R *.dfm}

procedure TStylesSimpleDemoDataDM.SetParentValue(AValue: Variant);
begin
  if tblDepartments.State in [dsEdit, dsInsert] then
    tblDepartments.FindField('ParentID').Value := AValue;
end;

end.

