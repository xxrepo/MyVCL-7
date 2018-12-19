unit pmSearchRes;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB,
  cxWebClasses, cxWebControls, cxWebTable, cxWebDBTable, cxWebData,
  cxWebExtData;
  

type
  TSearchres = class(TcxWebPageModule)
    Query: TADOQuery;
    DataSource: TcxWebDBDataSource;
    cxWebDBTable1: TcxWebDBTable;
    Queryarticleid: TIntegerField;
    Querysubject: TStringField;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebDBTable1GetTitleHTML(Sender: TObject;
      AColumn: TcxCustomWebTableColumn; const AHRef: String;
      var AHTML: String);
    procedure cxWebDBTable1GetHrefValue(Sender: TObject;
      AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
      const AKeyValue: String; AURL: TcxURL);
  private
    FReqStr: string;
    { Private declarations }
    function PrepStrings: TStrings;
    function GetWords(AStrings: TStrings): string;
    procedure BuildQuery(APS: string);
    function GetTotal: Integer;
  public
    { Public declarations }
  published
    property ReqStr: string read FReqStr write FReqStr;
    property Total: Integer read GetTotal;
  end;

function Searchres: TSearchres;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, StrUtils, HomeDM, UUtil,
  ActiveX, ComObj;

function Searchres: TSearchres;
begin
  Result := TSearchres(WebContext.FindModuleClass(TSearchres));
end;

procedure TSearchres.BuildQuery(APS: string);
begin
  Query.SQL.Text := Query.SQL.Text + APS + ')))';
end;

procedure TSearchres.cxWebPageModuleActivate(Sender: TObject);
var
  Strings: TStrings;
begin
  if not IsFirstRequest then exit;

  try
    ReqStr := Request.QueryFields.Values['cont'];
  except
    ReqStr := '';
  end;
  if ReqStr = '' then
    ReqStr := 'fffff';
  Strings := PrepStrings;
  BuildQuery(GetWords(Strings));
  Query.Active := True;
  Strings.Free;
end;

function TSearchres.GetTotal: Integer;
begin
  Result := DataSource.RecordCount;
end;

function TSearchres.GetWords(AStrings: TStrings): string;
var
  I: Integer;
begin
  for I := 0 to AStrings.Count - 1 do
    Result := Result + '''' + AnsiReplaceText(AStrings.Strings[I], '''', '''''') + ''',';
  Result := Chop(Result, 1);
end;

function TSearchres.PrepStrings: TStrings;
begin
  Result := TStringList.Create;
  Result.Delimiter := ' ';
  Result.DelimitedText := ReqStr;
end;

procedure TSearchres.cxWebDBTable1GetTitleHTML(Sender: TObject;
  AColumn: TcxCustomWebTableColumn; const AHRef: String;
  var AHTML: String);
begin
  if TcxWebDBTableColumn(AColumn).SortOrder = wsoAscending then
    AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/up.gif" vspace="2">'
  else
    if TcxWebDBTableColumn(AColumn).SortOrder = wsoDescending then
      AHTML := AHTML + ' <img hspace="10" src="/dxforum/images/down.gif" vspace="2">';
end;



procedure TSearchres.cxWebDBTable1GetHrefValue(Sender: TObject;
  AColumn: TcxWebDBTableColumn; ARecIndex: Integer;
  const AKeyValue: String; AURL: TcxURL);
begin
  if SameText(AColumn.DataBinding.FieldName, 'subject') then
    AURL.Href := 'View?aid=' + AKeyValue;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TSearchres, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
