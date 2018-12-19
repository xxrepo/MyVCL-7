unit pmBookmarks;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB,
  cxWebData, cxWebExtData, cxWebGrids, cxWebDataCtrls, cxWebClasses,
  cxWebControls, cxWebDataNavigator, cxWebDBGrid;


type
  TBookmarks = class(TcxWebPageModule)
    DataNavigator: TcxWebDBDataNavigator;
    Grid: TcxWebDBGrid;
    Name: TcxWebDBColumn;
    DataSource: TcxWebDBDataSource;
    Query: TADOQuery;
    SelectArtQuery: TADOQuery;
    QueryBOOKMARKID: TIntegerField;
    QueryUSERID: TIntegerField;
    QueryCATEGORYID: TIntegerField;
    QueryARTICLEID: TIntegerField;
    QueryNAME: TStringField;
    QueryCalcName: TStringField;
    DelBookQuery: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure QueryCalcFields(DataSet: TDataSet);
    procedure DataSourceStartEdit(Sender: TObject; ARowIndex: Integer;
      var AllowAction: Boolean);
    procedure DataSourceDeleting(Sender: TObject; ARowIndex: Integer;
      var AllowAction: Boolean);
  private
    { Private declarations }
    procedure FillGrid;
    function GetTotal: Integer;
  public
    { Public declarations }
  published
    property Total: Integer read GetTotal;
  end;

function Bookmarks: TBookmarks;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function Bookmarks: TBookmarks;
begin
  Result := TBookmarks(WebContext.FindModuleClass(TBookmarks));
end;

procedure TBookmarks.cxWebPageModuleActivate(Sender: TObject);
begin
  if not DM.RestoreUser then
    RedirectToPage('Index', '')
  else
    FillGrid;
end;

procedure TBookmarks.FillGrid;
begin
  Query.Parameters.ParamByName('uid').Value := DM.UserId;
  Query.Active := True;
end;

function TBookmarks.GetTotal: Integer;
begin
  Result := DataSource.RecordCount;
end;

procedure TBookmarks.QueryCalcFields(DataSet: TDataSet);
var
  ArtId: Integer;
begin
  ArtId := DataSet.FieldValues['ARTICLEID'];
  if ArtId = -1 then
    QueryCalcName.Value := Format('<a href="IntroList?cid=%s">%s</a>', [DataSet.FieldValues['CATEGORYID'], DataSet.FieldValues['NAME']])
  else
    QueryCalcName.Value := Format('<a href="View?aid=%d">%s</a>', [ArtId, DataSet.FieldValues['NAME']])
end;

procedure TBookmarks.DataSourceStartEdit(Sender: TObject;
  ARowIndex: Integer; var AllowAction: Boolean);
begin
  AllowAction := False;
end;

procedure TBookmarks.DataSourceDeleting(Sender: TObject;
  ARowIndex: Integer; var AllowAction: Boolean);
var
  AField: TcxCustomWebDataField;
  AValue: Integer;
begin
  AllowAction := False;
  AField := DataSource.FieldByName('BOOKMARKID');
  if AField <> nil then
  begin
    AValue := DataSource.Values[DataSource.GetRowRecord(ARowIndex), AField.Index];
    DelBookQuery.Parameters.ParamByName('BOOKMARKID').Value := AValue;
    DelBookQuery.ExecSQL;
    Query.Close;
    Query.Open;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TBookmarks, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
