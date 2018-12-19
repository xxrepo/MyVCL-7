unit SimpleTreeDemoData;

interface

uses
  SysUtils, cxClasses, cxStyles, cxTL, DB, Classes, DBTables, Forms;

type
  TSimpleTreeDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblDepartments: TTable;
    dsDepartments: TDataSource;
    StyleRepository: TcxStyleRepository;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    tblDepartmentsID: TAutoIncField;
    tblDepartmentsPARENTID: TIntegerField;
    tblDepartmentsNAME: TStringField;
    tblDepartmentsBUDGET: TFloatField;
    tblDepartmentsPHONE: TStringField;
    tblDepartmentsFAX: TStringField;
    tblDepartmentsEMAIL: TStringField;
    tblDepartmentsVACANCY: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetParentValue(AValue: Variant);
  end;

var
  SimpleTreeDemoDataDM: TSimpleTreeDemoDataDM;

implementation

{$R *.dfm}

procedure TSimpleTreeDemoDataDM.SetParentValue(AValue: Variant);
begin
  if tblDepartments.State in [dsEdit, dsInsert] then
    tblDepartments.FindField('ParentID').Value := AValue;
end;

end.
