unit pmViewQuest;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB;


type
  TViewquest = class(TcxWebPageModule)
    Query: TADOQuery;
    ArtQuery: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    { Private declarations }
    procedure FillQuery;
    function GetSubject: string;
    function GetVersion: string;
    function GetEmail: string;
    function GetNick: string;
    function GetPlatforms: string;
    function GetStatus: string;
    function GetBody: string;
  public
    { Public declarations }
  published
    property Subject: string read GetSubject;
    property Version: string read GetVersion;
    property Email: string read GetEmail;
    property Nick: string read GetNick;
    property Platforms: string read GetPlatforms;
    property Status: string read GetStatus;
    property Body: string read GetBody;
  end;

function Viewquest: TViewquest;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, UQuestion, UUtil,
  ActiveX, ComObj;

function Viewquest: TViewquest;
begin
  Result := TViewquest(WebContext.FindModuleClass(TViewquest));
end;

procedure TViewquest.cxWebPageModuleActivate(Sender: TObject);
begin
  FillQuery;
end;

procedure TViewquest.FillQuery;
var
  qid: Integer;
begin
  qid := StrToInt(Request.QueryFields.Values['qid']);
  Query.Parameters.ParamByName('qid').Value := qid;
  Query.Active := True;
  ArtQuery.Parameters.ParamByName('qid').Value := qid;
  ArtQuery.Active := True;
end;

function TViewquest.GetBody: string;
begin
  Result := Query.FieldValues['body_q'];
end;

function TViewquest.GetEmail: string;
begin
  Result := Query.FieldValues['email'];
end;

function TViewquest.GetNick: string;
begin
  Result := Query.FieldValues['nickname'];
end;

function TViewquest.GetPlatforms: string;
begin
  Result := DecodePlatform(Query.FieldValues['platform']);
end;

function TViewquest.GetStatus: string;
var
  AQuestionStatus: TQuestionStatus;
begin
  AQuestionStatus := IntToQuestionStatus(Query.FieldValues['status']);
  if AQuestionStatus = qsAnswered then
  begin
    Result := Format('<a href="View?aid=%s">%s</a>', [ArtQuery.FieldValues['ARTICLEID'], QuestionStatusToString(AQuestionStatus)]);
  end
  else
    Result := Format('%s', [QuestionStatusToString(AQuestionStatus)]);
end;

function TViewquest.GetSubject: string;
begin
  Result := Query.FieldValues['subject'];
end;

function TViewquest.GetVersion: string;
begin
  Result := DecodeVersion(Query.FieldValues['products']);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TViewquest, TcxWebPageInfo.Create('*.html'),  caDestroy));
end.
