unit pmViewReject;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, HomeDM, DB,
  ADODB;
  

type
  TViewReject = class(TcxWebPageModule)
    Query: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    FQuestionId: Integer;
    { Private declarations }
    procedure Fill;
    function GetEMail: string;
    function GetFName: string;
    function GetLName: string;
    function GetMName: string;
    function GetReason: string;
    function GetSubject: string;
  public
    { Public declarations }
  published
    property QuestionId: Integer read FQuestionId;
    property Subject: string read GetSubject;
    property EMail: string read GetEMail;
    property FName: string read GetFName;
    property MName: string read GetMName;
    property LName: string read GetLName;
    property Reason: string read GetReason;
  end;

function ViewReject: TViewReject;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX, ComObj;

function ViewReject: TViewReject;
begin
  Result := TViewReject(WebContext.FindModuleClass(TViewReject));
end;

procedure TViewReject.cxWebPageModuleActivate(Sender: TObject);
begin
  Fill;
end;

procedure TViewReject.Fill;
begin
  if IsFirstRequest then
    FQuestionId := StrToInt(Request.QueryFields.Values['qid']);
  Query.Parameters.ParamByName('qid').Value := QuestionId;
  Query.Active := True;
end;

function TViewReject.GetEMail: string;
begin
  Result := Query.FieldValues['EMAIL'];
end;

function TViewReject.GetFName: string;
begin
  Result := Query.FieldValues['FIRSTNAME'];
end;

function TViewReject.GetLName: string;
begin
  Result := Query.FieldValues['LASTNAME'];
end;

function TViewReject.GetMName: string;
begin
  Result := Query.FieldValues['MIDNAME'];
end;

function TViewReject.GetReason: string;
begin
  Result := Query.FieldValues['REASON'];
end;

function TViewReject.GetSubject: string;
begin
  Result := Query.FieldValues['SUBJECT'];
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TViewReject, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
