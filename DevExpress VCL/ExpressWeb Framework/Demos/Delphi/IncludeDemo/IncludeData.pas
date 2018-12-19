unit IncludeData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TIncludeDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
    procedure cxWebHomeDataModuleBeforeDispatchPage(Sender: TObject;
      const APageName: String; var AHandled: Boolean);
  private
    FLogins: TStrings;
  public
    property Logins: TStrings read FLogins;
  end;


function IncludeDataMod: TIncludeDataMod;

implementation

{$R *.DFM}

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function IncludeDataMod: TIncludeDataMod;
begin
  Result := TIncludeDataMod(WebContext.FindModuleClass(TIncludeDataMod));
end;

procedure TIncludeDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
  FLogins := TStringList.Create;
  FLogins.Add('Will=');
  FLogins.Add('Ellen=Ellen');
end;

procedure TIncludeDataMod.cxWebHomeDataModuleDestroy(
  Sender: TObject);
begin
  FLogins.Clear;
  FLogins.Free;
  OleUninitialize;
end;

procedure TIncludeDataMod.cxWebHomeDataModuleBeforeDispatchPage(
  Sender: TObject; const APageName: String; var AHandled: Boolean);
begin
  if not SameText(APageName, 'IncludeLoginPage') and (Session.Values['login'] <> True) then
  begin
    RedirectToPage('IncludeLoginPage', '');
    AHandled := True;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TIncludeDataMod,  caDestroy));

end.
