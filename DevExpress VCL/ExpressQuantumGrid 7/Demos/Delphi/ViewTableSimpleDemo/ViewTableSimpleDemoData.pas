unit ViewTableSimpleDemoData;

interface

uses
  {$IFDEF CLR}
  System.ComponentModel,
  {$ENDIF}
  SysUtils, Classes, DB, cxStyles, cxClasses, cxGridTableView,
  Forms, DBTables;

type
  TViewTableSimpleDemoMainDM = class(TDataModule)
    qreFilmsID: TIntegerField;
    qreFilmsCAPTION: TStringField;
    qreFilmsYEAR: TIntegerField;
    qreFilmsTAGLINE: TStringField;
    qreFilmsPLOTOUTLINE: TStringField;
    qreFilmsRUNTIME: TIntegerField;
    qreFilmsCOLOR: TStringField;
    qreFilmsPHOTO: TBlobField;
    qreFilmsICON: TBlobField;
    qreFilmsWEBSITE: TStringField;
    Database: TDatabase;
    UpdateSQL: TUpdateSQL;
    qreMaxFilmsID: TQuery;
    qreMaxFilmsIDMAXOFID: TIntegerField;
    procedure qreFilmsAfterDelete(DataSet: TDataSet);
    procedure qreFilmsBeforeDelete(DataSet: TDataSet);
    procedure qreFilmsAfterInsert(DataSet: TDataSet);
    procedure qreFilmsAfterPost(DataSet: TDataSet);
  private
    FUpdating: Boolean;
  published
    tlbGENRES: TTable;
    dsGENRES: TDataSource;
    qreFilms: TQuery;
    dsFilms: TDataSource;
    tlbGENRESID: TAutoIncField;
    tlbGENRESNAME: TStringField;
    tblFilms: TTable;
    tblFilmsGenres: TTable;
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
    tblFilmsGenresID: TAutoIncField;
    tblFilmsGenresFILMID: TIntegerField;
    tblFilmsGenresGENREID: TIntegerField;
  end;

var
  ViewTableSimpleDemoMainDM: TViewTableSimpleDemoMainDM;

implementation

{$R *.dfm}

{$IFDEF CLR}
uses
  Variants;
{$ENDIF}

procedure TViewTableSimpleDemoMainDM.qreFilmsAfterDelete(
  DataSet: TDataSet);
begin
  if ViewTableSimpleDemoMainDM.qreFilms.UpdatesPending then
    qreFilms.ApplyUpdates;
end;

procedure TViewTableSimpleDemoMainDM.qreFilmsBeforeDelete(
  DataSet: TDataSet);
begin
  if tblFilmsGenres.Locate('FILMID', tblFilmsID.Value, []) then
    tblFilmsGenres.Delete;
end;

procedure TViewTableSimpleDemoMainDM.qreFilmsAfterInsert(
  DataSet: TDataSet);
begin
  FUpdating := True;
end;

procedure TViewTableSimpleDemoMainDM.qreFilmsAfterPost(DataSet: TDataSet);
begin
  qreFilms.ApplyUpdates;
  if FUpdating then
  begin
    FUpdating := False;
    qreMaxFilmsID.Active := False;
    qreMaxFilmsID.Active := True;
    tblFilmsGenres.Insert;
    tblFilmsGenresFILMID.Value := qreMaxFilmsIDMAXOFID.Value;
    tblFilmsGenresGENREID.Value := tlbGENRESID.Value;
    tblFilmsGenres.Post;
  end;
end;

end.
