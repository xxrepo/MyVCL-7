unit BandedFixedDemoData;

{$I ..\cxVer.inc}

interface

uses
  SysUtils, cxClasses, cxStyles, cxTL, DB, Classes
  {$IFDEF DELPHI6}, Variants{$ENDIF}, DBTables
  {$IFNDEF DELPHI6}, Forms{$ENDIF};

type
  TBandedFixedDemoDataDM = class(TDataModule)
    DataBase: TDataBase;
    tblSheduler: TTable;
    dsSheduler: TDataSource;
    dsPersons: TDataSource;
    tblPersons: TTable;
    tblPersonsID: TIntegerField;
    tblPersonsName: TStringField;
    tblPersonsAddress: TStringField;
    tblPersonsPhone: TStringField;
    tblPersonsFax: TStringField;
    tblPersonsEMAIL: TStringField;
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
    tblShedulerID: TAutoIncField;
    tblShedulerPROJECTID: TIntegerField;
    tblShedulerUSERID: TIntegerField;
    tblShedulerSUNDAY: TSmallintField;
    tblShedulerMONDAY: TSmallintField;
    tblShedulerTUESDAY: TSmallintField;
    tblShedulerWEDNESDAY: TSmallintField;
    tblShedulerTHURSDAY: TSmallintField;
    tblShedulerFRIDAY: TSmallintField;
    tblShedulerSATURDAY: TSmallintField;
    dsProjects: TDataSource;
    tblProjects: TTable;
    tblProjectsID: TAutoIncField;
    tblProjectsNAME: TStringField;
    tblProjectsMANAGERID: TIntegerField;
    tblShedulerProjectManagerID: TIntegerField;
    stlGroupNode: TcxStyle;
    tblShedulerWeekSum: TIntegerField;
    tblShedulerWeekAVG: TFloatField;
    stlFixedBand: TcxStyle;
    procedure tblShedulerCalcFields(DataSet: TDataSet);
  public
    { Public declarations }
    function GetProjectNameByID(AProjectID: Integer): string;
    function GetPersonNameByID(APersonID: Integer): string;
  end;

var
  BandedFixedDemoDataDM: TBandedFixedDemoDataDM;

implementation

{$R *.dfm}

{ TBandedFixedDemoDataDM }

function TBandedFixedDemoDataDM.GetPersonNameByID(APersonID: Integer): string;
begin
  Result := tblPersons.Lookup('ID', APersonID, 'Name');
end;

function TBandedFixedDemoDataDM.GetProjectNameByID(AProjectID: Integer): string;
begin
  Result := tblProjects.Lookup('ID', AProjectID, 'Name');
end;

procedure TBandedFixedDemoDataDM.tblShedulerCalcFields(DataSet: TDataSet);
begin
  tblShedulerWeekSum.Value := tblShedulerSUNDAY.Value + tblShedulerMONDAY.Value +
    tblShedulerTUESDAY.Value + tblShedulerWEDNESDAY.Value + tblShedulerTHURSDAY.Value +
    tblShedulerFRIDAY.Value + tblShedulerSATURDAY.Value;
  tblShedulerWeekAVG.Value := tblShedulerWeekSum.Value/7;
end;

end.
