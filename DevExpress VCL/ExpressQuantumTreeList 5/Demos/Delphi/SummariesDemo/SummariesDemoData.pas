unit SummariesDemoData;

interface

uses
  SysUtils, Classes, DB, Forms, cxClasses, cxStyles, cxTL, ImgList,
  Controls, DBTables;

type
  TSummariesDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
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
    tblDepartments: TTable;
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
    dsDepartments: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SummariesDemoDataDM: TSummariesDemoDataDM;

implementation

{$R *.dfm}

end.
