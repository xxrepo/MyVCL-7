unit DragDropDemoData;

{$I ..\..\cxVer.inc}

interface

uses
{$IFDEF DELPHI6}
  Variants,
{$ELSE}
  Forms,
{$ENDIF}
  SysUtils, Classes, DB, DBTables, cxStyles, cxClasses,
  cxGridTableView, cxGridCardView, cxGridBandedTableView, DemoUtils;

type
  TDragDropDemoMainDM = class(TDataModule)
    dsFilms: TDataSource;
    dsFilmsPersons: TDataSource;
    dsPersonsLine: TDataSource;
    dsFilmsCompanies: TDataSource;
    dsFilmsScreens: TDataSource;
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
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
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
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    dsCountries: TDataSource;
    dsCompaniesType: TDataSource;
    qryFilms: TQuery;
    tblGenres: TTable;
    Database: TDatabase;
    qryFilmsCompanies: TQuery;
    tblGenresID: TAutoIncField;
    tblGenresNAME: TStringField;
    tblCompaniesType: TTable;
    qryFilmsPersons: TQuery;
    tblPersonsLine: TTable;
    tblPersonsLineID: TAutoIncField;
    tblPersonsLineNAME: TStringField;
    qryFilmsCompaniesID: TIntegerField;
    qryFilmsCompaniesFilmID: TIntegerField;
    qryFilmsCompaniesCompanyID: TIntegerField;
    qryFilmsCompaniesCompanyName: TStringField;
    tblFilmsCompaniesStaff: TTable;
    tblFilmsGenres: TTable;
    tblFilmsPersonsStaff: TTable;
    tlbCountries: TTable;
    qryFilmsPersonsID: TIntegerField;
    qryFilmsPersonsFilmID: TIntegerField;
    qryFilmsPersonsPersonID: TIntegerField;
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
    qryFilmsPersonsGender: TBooleanField;
    qryFilmsPersonsName: TStringField;
    tblFilmsGenresID: TAutoIncField;
    tblFilmsGenresFILMID: TIntegerField;
    tblFilmsGenresGENREID: TIntegerField;
    tblFilmsCompaniesStaffID: TAutoIncField;
    tblFilmsCompaniesStaffFILMID: TIntegerField;
    tblFilmsCompaniesStaffCOMPANYID: TIntegerField;
    tblFilmsCompaniesStaffDESCRIPTION: TStringField;
    tblFilmsPersonsStaffID: TAutoIncField;
    tblFilmsPersonsStaffFILMID: TIntegerField;
    tblFilmsPersonsStaffPERSONLINEID: TIntegerField;
    tblFilmsPersonsStaffPERSONID: TIntegerField;
    tblFilmsPersonsStaffDESCRIPTION: TStringField;
    usqFilmsCompanies: TUpdateSQL;
    usqFilmsPersons: TUpdateSQL;
    usqFilms: TUpdateSQL;
    tblFilmsScreens: TTable;
    qryFilmsFILMID: TIntegerField;
    qryFilmsID: TIntegerField;
    qryFilmsCAPTION: TStringField;
    qryFilmsYEAR: TIntegerField;
    qryFilmsTAGLINE: TStringField;
    qryFilmsPLOTOUTLINE: TStringField;
    qryFilmsRUNTIME: TIntegerField;
    qryFilmsCOLOR: TStringField;
    qryFilmsPHOTO: TBlobField;
    qryFilmsICON: TBlobField;
    qryFilmsWEBSITE: TStringField;
    qryFilmsGENREID: TIntegerField;
    qryFilmsPRIMED: TIntegerField;
    dsPersons: TDataSource;
    dsCompanies: TDataSource;
    tblPersons: TTable;
    tblCompanies: TTable;
    dsFilmsDict: TDataSource;
    tblFilmsDict: TTable;
    procedure qryFilmsPersonsCalcFields(DataSet: TDataSet);
    procedure qryFilmsBeforeDelete(DataSet: TDataSet);
    procedure qryFilmsCompaniesBeforeDelete(DataSet: TDataSet);
    procedure qryFilmsPersonsBeforeDelete(DataSet: TDataSet);
    procedure tblPersonsAfterUpdate(DataSet: TDataSet);
    procedure tblCompaniesAfterUpdate(DataSet: TDataSet);
    procedure tblFilmsDictAfterUpdate(DataSet: TDataSet);
    procedure tblFilmsDictBeforeUpdate(DataSet: TDataSet);
    procedure tblPersonsBeforeUpdate(DataSet: TDataSet);
    procedure tblCompaniesBeforeUpdate(DataSet: TDataSet);
    procedure qryFilmsPersonsAfterPost(DataSet: TDataSet);
  private
    FFilmID, FPersonID, FCompanyID: Integer;
    FOnNextRecord: TNotifyEvent;
  protected
    procedure DoNextRecord(Sender: TObject);
    function InsertRecord(ASource, ADestination: TDataSet;
      const AFields: string; AValues: Variant): Boolean;
  public
    function InsertCompany(AFilmID, ACompanyID: Integer): Boolean;
    function InsertFilm(AFilmID, AGenreID: Integer): Boolean;
    function InsertPerson(AFilmID, APersonID, APersonLineID: Integer): Boolean;
    property OnNextRecord: TNotifyEvent read FOnNextRecord write FOnNextRecord;
  end;

var
  DragDropDemoMainDM: TDragDropDemoMainDM;

implementation

{$IFDEF CLR}
uses
  Borland.Vcl.Contnrs;
{$ENDIF}
  
{$R *.dfm}

procedure ReopenDataset(ADataSet: TDataSet);
begin
  ADataSet.DisableControls;
  try
    ADataSet.Close;
    ADataSet.Open;
  finally
    ADataSet.EnableControls;
  end;
end;

function TDragDropDemoMainDM.InsertCompany(AFilmID,
  ACompanyID: Integer): Boolean;
begin
  Result := InsertRecord(tblFilmsCompaniesStaff, qryFilmsCompanies,
    'FILMID;COMPANYID', VarArrayOf([AFilmID, ACompanyID]));
end;

function TDragDropDemoMainDM.InsertFilm(AFilmID, AGenreID: Integer): Boolean;
begin
  Result := InsertRecord(tblFilmsGenres, qryFilms,
    'FILMID;GENREID', VarArrayOf([AFilmID, AGenreID]));
end;

function TDragDropDemoMainDM.InsertPerson(AFilmID, APersonID,
  APersonLineID: Integer): Boolean;
begin
  Result := InsertRecord(tblFilmsPersonsStaff, qryFilmsPersons,
    'FILMID;PERSONID;PERSONLINEID', VarArrayOf([AFilmID, APersonID, APersonLineID]));
end;

procedure TDragDropDemoMainDM.qryFilmsPersonsCalcFields(
  DataSet: TDataSet);
begin
  SetStringFieldValue(qryFilmsPersonsName,
    qryFilmsPersonsFIRSTNAME.Value + ' ' + qryFilmsPersonsSECONDNAME.Value);
end;

procedure TDragDropDemoMainDM.qryFilmsBeforeDelete(DataSet: TDataSet);
var
  KeyValues: Variant;
  FilmID: Integer;
begin
  KeyValues := VarArrayCreate([0,1], varInteger);
  KeyValues[0] := qryFilmsID.AsInteger;
  KeyValues[1] := VarAsType(qryFilms.Params[0].Value, varInteger);
  if tblFilmsGenres.Locate('FILMID;GENREID', KeyValues, []) then
  begin
    FilmID := -1;
    qryFilms.Next;
    if not qryFilms.Eof then
      FilmID := qryFilmsID.AsInteger;
    tblFilmsGenres.Delete;
    ReopenDataset(qryFilms);
    if not qryFilms.Locate('ID', FilmID, []) then
      qryFilms.Last;
  end;
  Abort;
end;

procedure TDragDropDemoMainDM.qryFilmsCompaniesBeforeDelete(
  DataSet: TDataSet);
var
  KeyValues: Variant;
begin
  KeyValues := VarArrayCreate([0,1], varInteger);
  KeyValues[0] := qryFilmsID.AsInteger;
  KeyValues[1] := qryFilmsCompaniesCompanyID.AsInteger;
  if tblFilmsCompaniesStaff.Locate('FILMID;COMPANYID', KeyValues, []) then
  begin
    DoNextRecord(Self);
    KeyValues[1] := -1;
    if not qryFilmsCompanies.Eof then
      KeyValues[1] := qryFilmsCompaniesCompanyID.AsInteger;

    tblFilmsCompaniesStaff.Delete;
    ReopenDataset(qryFilmsCompanies);

    qryFilmsCompanies.Locate('FILMID;COMPANYID', KeyValues, []);
  end;
  Abort;
end;

procedure TDragDropDemoMainDM.qryFilmsPersonsBeforeDelete(
  DataSet: TDataSet);
var
  KeyValues: Variant;
begin
  KeyValues := VarArrayCreate([0,2], varInteger);
  KeyValues[0] := qryFilmsID.AsInteger;
  KeyValues[1] := qryFilmsPersonsPersonID.AsInteger;
  KeyValues[2] := qryFilmsPersonsPersonLineID.AsInteger;
  if tblFilmsPersonsStaff.Locate('FILMID;PERSONID;PERSONLINEID', KeyValues, []) then
  begin
    tblFilmsPersonsStaff.Delete;
    KeyValues[1] := -1;
    KeyValues[2] := -1;
    DoNextRecord(Self);
    if not qryFilmsPersons.Eof then
    begin
      KeyValues[1] := qryFilmsPersonsPersonID.AsInteger;
      KeyValues[2] := qryFilmsPersonsPersonLineID.AsInteger;
    end;

    ReopenDataset(qryFilmsPersons);

    qryFilmsPersons.Locate('FILMID;PERSONID;PERSONLINEID', KeyValues, []);
  end;
  Abort;
end;

procedure TDragDropDemoMainDM.tblPersonsAfterUpdate(DataSet: TDataSet);
begin
  ReopenDataset(qryFilmsPersons);
  if not qryFilmsPersons.Locate('PersonID', FPersonID, []) then
    qryFilmsPersons.Last;
end;

procedure TDragDropDemoMainDM.tblCompaniesAfterUpdate(DataSet: TDataSet);
begin
  ReopenDataset(qryFilmsCompanies);
  if not qryFilmsCompanies.Locate('CompanyID', FCompanyID, []) then
    qryFilmsCompanies.Last;
end;

procedure TDragDropDemoMainDM.tblFilmsDictAfterUpdate(DataSet: TDataSet);
begin
  ReopenDataset(qryFilms);
  if not qryFilms.Locate('ID', FFilmID, []) then
    qryFilms.Last;
end;

procedure TDragDropDemoMainDM.tblFilmsDictBeforeUpdate(DataSet: TDataSet);
begin
  FFilmID := DataSet.FieldByName('ID').AsInteger;
  if FFilmID = qryFilmsID.AsInteger then
  begin
    qryFilms.Next;
    FFilmID := -1;
    if not qryFilms.Eof then
      FFilmID := qryFilmsID.AsInteger;
  end else
    FFilmID := qryFilmsID.AsInteger;
end;

procedure TDragDropDemoMainDM.tblPersonsBeforeUpdate(DataSet: TDataSet);
begin
  FPersonID := DataSet.FieldByName('ID').AsInteger;
  if FPersonID = qryFilmsPersonsPersonID.AsInteger then
  begin
    qryFilmsPersons.Next;
    FPersonID := -1;
    if not qryFilmsPersons.Eof then
      FPersonID := qryFilmsPersonsPersonID.AsInteger;
  end else
    FPersonID := qryFilmsPersonsPersonID.AsInteger;
end;

procedure TDragDropDemoMainDM.tblCompaniesBeforeUpdate(DataSet: TDataSet);
begin
  FCompanyID := DataSet.FieldByName('ID').AsInteger;
  if FCompanyID = qryFilmsCompaniesCompanyID.AsInteger then
  begin
    qryFilmsPersons.Next;
    FCompanyID := -1;
    if not qryFilmsPersons.Eof then
      FCompanyID := qryFilmsCompaniesCompanyID.AsInteger;
  end else
    FCompanyID := qryFilmsCompaniesCompanyID.AsInteger;
end;

procedure TDragDropDemoMainDM.DoNextRecord(Sender: TObject);
begin
  if Assigned(FOnNextRecord) then
    FOnNextRecord(Sender);
end;

function TDragDropDemoMainDM.InsertRecord(ASource, ADestination: TDataSet;
  const AFields: string; AValues: Variant): Boolean;
var
{$IFDEF CLR}
  AFieldsList: TObjectList;
{$ELSE}
  AFieldsList: TList;
{$ENDIF}
  I: Integer;
begin
  Result := False;
{$IFDEF CLR}
  AFieldsList := TObjectList.Create;
{$ELSE}
  AFieldsList := TList.Create;
{$ENDIF}
  try
    ASource.GetFieldList(AFieldsList, AFields);
    if not ASource.Locate(AFields, AValues, []) then
    begin
      ASource.Insert;
      for I := 0 to AFieldsList.Count - 1 do
        TField(AFieldsList[I]).Value := AValues[I];
      ASource.Post;
      ReopenDataset(ADestination);
      Result := True;
    end;
  finally
    AFieldsList.Free;
  end;
  ADestination.Locate(AFields, AValues, []);
end;

procedure TDragDropDemoMainDM.qryFilmsPersonsAfterPost(DataSet: TDataSet);
begin
  ReopenDataset(tblFilmsPersonsStaff);
end;

end.


