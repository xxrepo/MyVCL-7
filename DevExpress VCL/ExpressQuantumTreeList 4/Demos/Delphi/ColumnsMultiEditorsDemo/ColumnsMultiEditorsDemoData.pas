unit ColumnsMultiEditorsDemoData;

interface

uses
  SysUtils, Classes, DB, Forms, cxClasses, cxStyles, cxTL, DBTables;

type
  TColumnsMultiEditorsDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblPersons: TTable;
    dsPersons: TDataSource;
    tblPersonsID: TAutoIncField;
    tblPersonsName: TStringField;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ColumnsMultiEditorsDemoDataDM: TColumnsMultiEditorsDemoDataDM;

implementation

{$R *.dfm}

end.
