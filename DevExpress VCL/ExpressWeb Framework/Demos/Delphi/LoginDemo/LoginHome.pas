unit LoginHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;
  

type
  TLoginHomePage = class(TcxWebPageModule)
    cxWebLabel1: TcxWebLabel;
    cxWebLabel3: TcxWebLabel;
    weLogin: TcxWebEdit;
    wePassword: TcxWebEdit;
    wlMessage: TcxWebLabel;
    cxWebStyleController1: TcxWebStyleController;
    stIncorrectMsg: TcxWebStyleItem;
    cxWebButton2: TcxWebButton;
    cxWebButton3: TcxWebButton;
    procedure cxWebButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function LoginHomePage: TLoginHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, LoginData;

function LoginHomePage: TLoginHomePage;
begin
  Result := TLoginHomePage(WebContext.FindModuleClass(TLoginHomePage));
end;

procedure TLoginHomePage.cxWebButton2Click(Sender: TObject);
begin
  if (LoginDataMod.Logins.IndexOfName(weLogin.Text) > -1) and
    (LoginDataMod.Logins.Values[weLogin.Text] = wePassword.Text) then
  begin
    Session.Values['login'] := True;
    RedirectToPage('LoginTargetPage', weLogin.Text);
  end
  else wlMessage.Visible := True;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TLoginHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
