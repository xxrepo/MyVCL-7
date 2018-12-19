unit ConvertTreeList3DemoData;

interface

uses
  SysUtils, cxClasses, cxStyles, cxTL, DB, Classes, DBTables, Forms;

type
  TConvertTreeList3DemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblDepartments: TTable;
    dsDepartments: TDataSource;
    tblDepartmentsID: TAutoIncField;
    tblDepartmentsPARENTID: TIntegerField;
    tblDepartmentsMANAGERID: TIntegerField;
    tblDepartmentsNAME: TStringField;
    tblDepartmentsBUDGET: TFloatField;
    tblDepartmentsLOCATION: TStringField;
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
  ConvertTreeList3DemoDataDM: TConvertTreeList3DemoDataDM;

implementation

{$R *.dfm}

procedure TConvertTreeList3DemoDataDM.SetParentValue(AValue: Variant);
begin
  if tblDepartments.State in [dsEdit, dsInsert] then
    tblDepartments.FindField('ParentID').Value := AValue;
end;

end.
