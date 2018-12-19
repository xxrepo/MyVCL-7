unit ViewBandedFixedMainData;

interface

uses
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridBandedTableView, Forms, DBTables;

type
  TViewBandedFixedDemoDMMain = class(TDataModule)
    tblSCHEDULER: TTable;
    dsSCHEDULER: TDataSource;
    dsUSERS: TDataSource;
    tblUSERS: TTable;
    tblPROJECTS: TTable;
    dsPROJECTS: TDataSource;
    RowSum: TFloatField;
    RowAvg: TFloatField;
    tblSCHEDULERID: TAutoIncField;
    PROJECTID: TIntegerField;
    USERID: TIntegerField;
    SUNDAY: TSmallintField;
    MONDAY: TSmallintField;
    TUESDAY: TSmallintField;
    THURSDAY: TSmallintField;
    WEDNESDAY: TSmallintField;
    FRIDAY: TSmallintField;
    SATURDAY: TSmallintField;
    UserName: TStringField;
    FirstName: TStringField;
    MiddleName: TStringField;
    LastName: TStringField;
    tblPROJECTSID: TAutoIncField;
    tblPROJECTSNAME: TStringField;
    tblPROJECTSMANAGERID: TIntegerField;
    tblUSERSID: TAutoIncField;
    tblUSERSFNAME: TStringField;
    tblUSERSMNAME: TStringField;
    tblUSERSLNAME: TStringField;
    tblUSERSEMAIL: TStringField;
    tblUSERSPHONE: TStringField;
    tblUSERSDEPARTMENTID: TIntegerField;
    DataBase: TDataBase;
    procedure tblSCHEDULERCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewBandedFixedDemoDMMain: TViewBandedFixedDemoDMMain;

implementation


{$R *.dfm}

procedure TViewBandedFixedDemoDMMain.tblSCHEDULERCalcFields(
  DataSet: TDataSet);
var
  Val: String;
begin
  RowSum.AsFloat := SUNDAY.AsFloat +  MONDAY.AsFloat +  TUESDAY.AsFloat +   WEDNESDAY.AsFloat +
  THURSDAY.AsFloat +  FRIDAY.AsFloat +  SATURDAY.AsFloat;
  RowAvg.AsString := FormatFloat('0.0', RowSum.AsFloat / 7);
  if MiddleName.Value <> '' then
    Val := Format('%s %s %s', [FirstName.Value, MiddleName.Value, LastName.Value])
  else
    Val := Format('%s %s', [FirstName.Value, LastName.Value]);
  UserName.Value := Val;
end;

end.
