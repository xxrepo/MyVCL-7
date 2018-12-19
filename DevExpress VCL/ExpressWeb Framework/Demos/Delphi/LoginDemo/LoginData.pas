unit LoginData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TLoginDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
    procedure cxWebHomeDataModuleBeforeDispatchPage(Sender: TObject;
      const APageName: String; var AHandled: Boolean);
  private
    FLogins: TStrings;
  public
    property Logins: TStrings read FLogins;
  end;

function LoginDataMod: TLoginDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants, cxWebUtils;

function LoginDataMod: TLoginDataMod;
begin
  Result := TLoginDataMod(WebContext.FindModuleClass(TLoginDataMod));
end;

procedure TLoginDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  FLogins := TStringList.Create;
  FLogins.Add('Will=');
  FLogins.Add('Ellen=Ellen');
end;

procedure TLoginDataMod.cxWebHomeDataModuleDestroy(
  Sender: TObject);
begin
  FLogins.Clear;
  FLogins.Free;
end;

procedure TLoginDataMod.cxWebHomeDataModuleBeforeDispatchPage(
  Sender: TObject; const APageName: String; var AHandled: Boolean);
begin
  if not SameText(APageName, 'LoginHomePage') and
    (Session.Values['login'] <> True) then
    RedirectToPage('LoginHomePage', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TLoginDataMod,  caCache));

end.
