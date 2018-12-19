unit MasterDetailTableDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView,
  DBTables, DemoUtils;

type
  TMasterDetailTableDemoMainDM = class(TDataModule)
    dsFilms: TDataSource;
    dsFilmsPersonsStaff: TDataSource;
    dsPersons: TDataSource;
    dsPersonsLine: TDataSource;
    tblFilms: TTable;
    tblFilmsPersonsStaff: TTable;
    tblPersons: TTable;
    tblPersonsLine: TTable;
    DataBase: TDataBase;
    tblPersonsID: TAutoIncField;
    tblPersonsFIRSTNAME: TStringField;
    tblPersonsSECONDNAME: TStringField;
    tblPersonsGENDER: TBooleanField;
    tblPersonsDATEOFBIRTH: TDateTimeField;
    tblPersonsBIRTHCOUNTRY: TIntegerField;
    tblPersonsLOCATIONOFBIRTH: TStringField;
    tblPersonsBIOGRAPHY: TMemoField;
    tblPersonsNICKNAME: TStringField;
    cxStyleRepository: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    cxStyle14: TcxStyle;
    tblPersonsNAME: TStringField;
    procedure tblPersonsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MasterDetailTableDemoMainDM: TMasterDetailTableDemoMainDM;

implementation

{$R *.dfm}

procedure TMasterDetailTableDemoMainDM.tblPersonsCalcFields(
  DataSet: TDataSet);
begin
  SetStringFieldValue(tblPersonsNAME,
    tblPersonsFIRSTNAME.Value + ' ' + tblPersonsSECONDNAME.Value);
end;

end.
