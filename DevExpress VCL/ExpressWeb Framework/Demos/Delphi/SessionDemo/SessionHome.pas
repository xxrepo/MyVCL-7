unit SessionHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;


type
  TSessionHomePage = class(TcxWebPageModule)
    cxWebLabel2: TcxWebLabel;
    wlSessionID: TcxWebLabel;
    cxWebLabel3: TcxWebLabel;
    weSessionValue: TcxWebEdit;
    wbUpdate: TcxWebButton;
    wlSessionValue: TcxWebLabel;
    wbTerminate: TcxWebButton;
    wmSessionLog: TcxWebMemo;
    cxWebLabel4: TcxWebLabel;
    wbClear: TcxWebButton;
    procedure wbUpdateClick(Sender: TObject);
    procedure wbTerminateClick(Sender: TObject);
    procedure wbClearClick(Sender: TObject);
    procedure cxWebPageModuleBeforeRender(Sender: TObject);
  private
    { Private declarations }
  public
    procedure UpdateLog(ALine: string);
  end;

function SessionHomePage: TSessionHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, SessionData;

function SessionHomePage: TSessionHomePage;
begin
  Result := TSessionHomePage(WebContext.FindModuleClass(TSessionHomePage));
end;

procedure TSessionHomePage.wbUpdateClick(Sender: TObject);
begin
  Session.Values['Value'] := weSessionValue.Text;
end;

procedure TSessionHomePage.wbTerminateClick(Sender: TObject);
begin
  Session.Terminate;
end;

procedure TSessionHomePage.wbClearClick(Sender: TObject);
begin
  SessionDataMod.Log.Clear;
end;

procedure TSessionHomePage.UpdateLog(ALine: string);
begin
  wmSessionLog.Lines.Add(ALine);
end;

procedure TSessionHomePage.cxWebPageModuleBeforeRender(Sender: TObject);
var
  SessionValue: Variant;
begin
  wlSessionID.Caption := Session.SessionID;
  SessionValue := Session.Values['Value'];
  if not VarIsNull(SessionValue) then
    wlSessionValue.Caption := SessionValue;
  if wlSessionValue.Caption = '' then
    wlSessionValue.Caption := 'null';
  weSessionValue.Text := '';
  wmSessionLog.Lines.Assign(SessionDataMod.Log);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TSessionHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
