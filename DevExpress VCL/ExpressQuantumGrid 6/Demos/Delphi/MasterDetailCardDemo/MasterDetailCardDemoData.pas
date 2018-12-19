unit MasterDetailCardDemoData;

interface

uses
  Forms, SysUtils, Classes, DB, cxStyles, cxGridCardView, cxClasses,
  cxGridTableView, DBTables;

type
  TMasterDetailCardDemoDataDM = class(TDataModule)
    dsFilms: TDataSource;
    dsFilmsPersons: TDataSource;
    dsPersonsLine: TDataSource;
    tblFilms: TTable;
    tblPersonsLine: TTable;
    DataBase: TDataBase;
    qryFilmsPersons: TQuery;
    qryFilmsPersonsID: TAutoIncField;
    qryFilmsPersonsFilmID: TIntegerField;
    qryFilmsPersonsPersonID: TAutoIncField;
    qryFilmsPersonsPersonLineID: TIntegerField;
    qryFilmsPersonsBIOGRAPHY: TMemoField;
    qryFilmsPersonsBIRTHCOUNTRY: TIntegerField;
    qryFilmsPersonsBIRTHNAME: TStringField;
    qryFilmsPersonsDATEOFBIRTH: TDateTimeField;
    qryFilmsPersonsFIRSTNAME: TStringField;
    qryFilmsPersonsLOCATIONOFBIRTH: TStringField;
    qryFilmsPersonsNICKNAME: TStringField;
    qryFilmsPersonsSECONDNAME: TStringField;
    qryFilmsPersonsHOMEPAGE: TStringField;
    qryFilmsPersonsName: TStringField;
    cxStyleRepository: TcxStyleRepository;
    tblPersonsHelper: TTable;
    tblPersonsStaffHelper: TTable;
    tblPersonsHelperID: TAutoIncField;
    tblPersonsHelperFIRSTNAME: TStringField;
    tblPersonsHelperSECONDNAME: TStringField;
    tblPersonsHelperGENDER: TBooleanField;
    tblPersonsHelperBIRTHNAME: TStringField;
    tblPersonsHelperDATEOFBIRTH: TDateTimeField;
    tblPersonsHelperBIRTHCOUNTRY: TIntegerField;
    tblPersonsHelperLOCATIONOFBIRTH: TStringField;
    tblPersonsHelperBIOGRAPHY: TMemoField;
    tblPersonsHelperNICKNAME: TStringField;
    tblPersonsHelperHOMEPAGE: TStringField;
    tblPersonsStaffHelperID: TAutoIncField;
    tblPersonsStaffHelperFILMID: TIntegerField;
    tblPersonsStaffHelperPERSONLINEID: TIntegerField;
    tblPersonsStaffHelperPERSONID: TIntegerField;
    tblPersonsStaffHelperDESCRIPTION: TStringField;
    tblPersonsLineID: TAutoIncField;
    tblPersonsLineNAME: TStringField;
    qryFilmsPersonsGender: TBooleanField;
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
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    UpdateSQL: TUpdateSQL;
    tblFilmsID: TAutoIncField;
    tblFilmsCAPTION: TStringField;
    tblFilmsYEAR: TIntegerField;
    tblFilmsTAGLINE: TStringField;
    tblFilmsPLOTOUTLINE: TStringField;
    tblFilmsRUNTIME: TIntegerField;
    tblFilmsCOLOR: TStringField;
    tblFilmsPHOTO: TBlobField;
    tblFilmsICON: TBlobField;
    tblFilmsWEBSITE: TStringField;
    procedure qryFilmsPersonsCalcFields(DataSet: TDataSet);
    procedure qryFilmsPersonsAfterInsert(DataSet: TDataSet);
    procedure qryFilmsPersonsAfterPost(DataSet: TDataSet);
    procedure qryFilmsPersonsAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FIsInserting: Boolean;
  public
    { Public declarations }
  end;

var
  MasterDetailCardDemoDataDM: TMasterDetailCardDemoDataDM;

implementation

{$R *.dfm}

uses
  DemoUtils;

procedure TMasterDetailCardDemoDataDM.qryFilmsPersonsCalcFields(
  DataSet: TDataSet);
begin
  SetStringFieldValue(qryFilmsPersonsName, qryFilmsPersonsFIRSTNAME.AsString +
    ' ' + qryFilmsPersonsSECONDNAME.AsString);
end;

procedure TMasterDetailCardDemoDataDM.qryFilmsPersonsAfterInsert(
  DataSet: TDataSet);
begin
  FIsInserting := True;
end;

procedure TMasterDetailCardDemoDataDM.qryFilmsPersonsAfterPost(
  DataSet: TDataSet);
  procedure InsertNewPersonStaff;
  begin
    tblPersonsStaffHelper.Open;
    tblPersonsStaffHelper.Insert;
    tblPersonsStaffHelperFILMID.Value := tblFilmsID.Value;
    tblPersonsHelper.Open;
    tblPersonsHelper.Last;
    tblPersonsStaffHelperPERSONID.AsInteger := tblPersonsHelperID.AsInteger;
    tblPersonsHelper.Close;
    tblPersonsStaffHelperPERSONLINEID.AsInteger :=
      qryFilmsPersonsPersonLineID.AsInteger;
    tblPersonsStaffHelper.Post;
    tblPersonsStaffHelper.Close;
  end;
begin
  qryFilmsPersons.ApplyUpdates;
  if FIsInserting then
  begin
    InsertNewPersonStaff;
    FIsInserting := False;
  end;
end;

procedure TMasterDetailCardDemoDataDM.qryFilmsPersonsAfterDelete(
  DataSet: TDataSet);
begin
  qryFilmsPersons.ApplyUpdates;
end;

end.
