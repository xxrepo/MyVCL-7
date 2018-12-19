unit DragDropDemoData;

interface

uses
  SysUtils, cxClasses, cxStyles, cxTL, DB, Classes, DBTables, Forms;

type
  TDragDropDemoDataDM = class(TDataModule)
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
    tblPersons: TTable;
    dsPersons: TDataSource;
    tblPersonsID: TAutoIncField;
    tblPersonsName: TStringField;
    tblPersonsCountry: TStringField;
    tblPersonsPostalCode: TStringField;
    tblPersonsCity: TStringField;
    tblPersonsAddress: TStringField;
    tblPersonsPhone: TStringField;
    tblPersonsFax: TStringField;
    tblPersonsEMAIL: TStringField;
    tblPersonsHOMEPAGE: TStringField;
    tblPersonsDepartmentID: TIntegerField;
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
    stlGroupNode: TcxStyle;
    stlFixedBand: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    tblDeptDict: TTable;
    dsDeptDict: TDataSource;
    dsPersDict: TDataSource;
    tblPersDict: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetParentValue(AValue: Variant);
  end;

var
  DragDropDemoDataDM: TDragDropDemoDataDM;

implementation

{$R *.dfm}

procedure TDragDropDemoDataDM.SetParentValue(AValue: Variant);
begin
  if tblDepartments.State in [dsEdit, dsInsert] then
    tblDepartments.FindField('ParentID').Value := AValue;
end;

end.
