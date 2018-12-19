unit pmView;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, HomeDM, DB,
  ADODB;


type
  TView = class(TcxWebPageModule)
    Query: TADOQuery;
    Queryexpertid: TIntegerField;
    Querysubject: TStringField;
    Querysource: TStringField;
    Queryplatform: TIntegerField;
    Queryproducts: TIntegerField;
    Querybody: TMemoField;
    ExpertQuery: TADOQuery;
    ExpertQueryEXPERTID: TIntegerField;
    ExpertQueryLOGIN: TStringField;
    ExpertQueryPASSWD: TStringField;
    ExpertQueryFIRSTNAME: TStringField;
    ExpertQueryLASTNAME: TStringField;
    ExpertQueryMIDNAME: TStringField;
    ExpertQueryCOMPANYNAME: TStringField;
    ExpertQueryEMAIL: TStringField;
    ExpertQueryWWW: TStringField;
    ExpertQueryRATING: TSmallintField;
    ExpertQueryISEDITOR: TStringField;
    ExpertQueryIS_DISABLED: TStringField;
    ExpertQueryDATE: TDateTimeField;
    AttachQuery: TADOQuery;
    AttachQuerydisplayname: TStringField;
    AttachQueryfilename: TStringField;
    Queryarticleid: TIntegerField;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    FArticleId: Integer;
    { Private declarations }
    procedure FillQuery;
    function GetSubject: string;
    function GetExpertId: Integer;
    function GetSource: string;
    function GetExpertEmail: string;
    function GetExpertFName: string;
    function GetExpertLName: string;
    function GetExpertMName: string;
    function GetVersion: string;
    function GetCompanyName: string;
    function GetPlatforms: string;
    function GetExpertWWW: string;
    function GetBody: string;
    function GetAttCount: Integer;
    function GetAttDisplayName: string;
    function GetAttFileName: string;
    function GetMoveNextAttach: string;
  public
    { Public declarations }
  published
    property AttCount: Integer read GetAttCount;
    property AttFileName: string read GetAttFileName;
    property AttDisplayName: string read GetAttDisplayName;
    property ArticleId: Integer read FArticleId;
    property Subject: string read GetSubject;
    property Source: string read GetSource;
    property ExpertId: Integer read GetExpertId;
    property ExpertEmail: string read GetExpertEmail;
    property ExpertFName: string read GetExpertFName;
    property ExpertMName: string read GetExpertMName;
    property ExpertLName: string read GetExpertLName;
    property ExpertWWW: string read GetExpertWWW;
    property Versions: string read GetVersion;
    property ComanyName: string read GetCompanyName;
    property Platforms: string read GetPlatforms;
    property Body: string read GetBody;
    property MoveNextAttach: string read GetMoveNextAttach;
  end;

function View: TView;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, UUtil, ActiveX, ComObj;

function View: TView;
begin
  Result := TView(WebContext.FindModuleClass(TView));
end;

procedure TView.cxWebPageModuleActivate(Sender: TObject);
begin
  if IsFirstRequest then
    FillQuery;
end;

procedure TView.FillQuery;
begin
  if IsFirstRequest then
    FArticleId := StrToInt(Request.QueryFields.Values['aid']);
  Query.Parameters.ParamByName('aid').Value := ArticleId;
  Query.Active := True;
  ExpertQuery.Parameters.ParamByName('eid').Value := ExpertId;
  ExpertQuery.Active := True;
  AttachQuery.Parameters.ParamByName('aid').Value := ArticleId;
  AttachQuery.Active := True;
end;

function TView.GetBody: string;
begin
  Result := Query.FieldValues['body'];
end;

function TView.GetCompanyName: string;
begin
  Result := ExpertQuery.FieldValues['COMPANYNAME'];
end;

function TView.GetExpertEmail: string;
begin
  Result := ExpertQuery.FieldValues['EMAIL'];
end;

function TView.GetExpertFName: string;
begin
  Result := ExpertQuery.FieldValues['FIRSTNAME'];
end;

function TView.GetExpertId: Integer;
begin
  if Query.FindField('expertid').IsNull then
    Result := 1
  else Result := Query.FieldValues['expertid'];
end;

function TView.GetExpertLName: string;
begin
  Result := ExpertQuery.FieldValues['LASTNAME'];
end;

function TView.GetExpertMName: string;
begin
  Result := ExpertQuery.FieldValues['midname'];
end;

function TView.GetExpertWWW: string;
begin
  Result := ExpertQuery.FieldValues['www'];
end;

function TView.GetPlatforms: string;
var
  APlatform: Integer;
begin
  if not Query.FindField('platform').IsNull then
    APlatform := Query.FieldValues['platform']
  else
    APlatform := 0;
  Result := DecodePlatform(APlatform);  
end;

function TView.GetSource: string;
begin
  Result := Query.FieldValues['source'];
end;

function TView.GetSubject: string;
begin
  Result := Query.FieldValues['subject'];
end;

function TView.GetVersion: string;
begin
  if not Query.FindField('products').IsNull then
    Result := DecodeVersion(Query.FieldValues['products'])
  else
    Result := '';
end;

function TView.GetAttCount: Integer;
begin
  Result := AttachQuery.RecordCount;
end;

function TView.GetAttDisplayName: string;
begin
  Result := AttachQuery.FieldValues['displayname'];
end;

function TView.GetAttFileName: string;
begin
  Result := AttachQuery.FieldValues['filename'];
end;

function TView.GetMoveNextAttach: string;
begin
  AttachQuery.Next;
  Result := '';
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TView, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
