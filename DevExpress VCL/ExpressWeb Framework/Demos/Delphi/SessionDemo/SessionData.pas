unit SessionData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TSessionDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleSessionStart(ASender: TObject;
      ASession: TAbstractWebSession);
    procedure cxWebHomeDataModuleSessionEnd(ASender: TObject;
      ASession: TAbstractWebSession);
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    FLog: TStrings;
  public
    property Log: TStrings read FLog;
  end;

function SessionDataMod: TSessionDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants, SessionHome;

function SessionDataMod: TSessionDataMod;
begin
  Result := TSessionDataMod(WebContext.FindModuleClass(TSessionDataMod));
end;

procedure TSessionDataMod.cxWebHomeDataModuleSessionStart(
  ASender: TObject; ASession: TAbstractWebSession);
var
  S: string;
begin
  S := Format('Session with ID = %s started at %s.', [ASession.SessionID, TimeToStr(Now)]);
  FLog.Add(S);
end;

procedure TSessionDataMod.cxWebHomeDataModuleSessionEnd(
  ASender: TObject; ASession: TAbstractWebSession);
var
  S: string;
begin
  S := Format('Session with ID = %s terminated at %s.', [ASession.SessionID, TimeToStr(Now)]);
  FLog.Add(S);
  // For update controls values because session live to finish of content generation
  SessionHomePage.RedirectToPage('SessionHomePage', '')
end;

procedure TSessionDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  FLog := TStringList.Create;
end;

procedure TSessionDataMod.cxWebHomeDataModuleDestroy(
  Sender: TObject);
begin
  FLog.Free;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TSessionDataMod,  caCache));

end.
 
