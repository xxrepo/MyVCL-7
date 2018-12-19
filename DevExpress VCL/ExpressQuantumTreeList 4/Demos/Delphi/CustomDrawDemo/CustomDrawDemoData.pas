unit CustomDrawDemoData;

{$I ..\cxVer.inc}

interface

uses
  SysUtils, cxClasses, cxStyles, cxTL, DB, Classes, 
  DBTables, Forms;

type
  TCustomDrawDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblDepartments: TTable;
    dsDepartments: TDataSource;
    tblDepartmentsID: TAutoIncField;
    tblDepartmentsPARENTID: TIntegerField;
    tblDepartmentsNAME: TStringField;
    tblDepartmentsBUDGET: TFloatField;
    tblDepartmentsPHONE: TStringField;
    tblDepartmentsFAX: TStringField;
    tblDepartmentsEMAIL: TStringField;
    tblDepartmentsVACANCY: TBooleanField;
    dsPersons: TDataSource;
    tblPersons: TTable;
    tblPersonsID: TIntegerField;
    tblPersonsName: TStringField;
    tblPersonsAddress: TStringField;
    tblPersonsPhone: TStringField;
    tblPersonsFax: TStringField;
    tblPersonsEMAIL: TStringField;
    tblDepartmentsMANAGERID: TIntegerField;
    StyleRepository: TcxStyleRepository;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    styNoVacancy: TcxStyle;
    styVacancy: TcxStyle;
  public
    { Public declarations }
    procedure SetParentValue(AValue: Variant);
  end;

var
  CustomDrawDemoDataDM: TCustomDrawDemoDataDM;

implementation

{$R *.dfm}

procedure TCustomDrawDemoDataDM.SetParentValue(AValue: Variant);
begin
  if tblDepartments.State in [dsEdit, dsInsert] then
    tblDepartments.FindField('ParentID').Value := AValue;
end;

end.
