unit IncludeLogin;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebGlobalDispImp,
  cxWebDispImp, cxWebMenus, cxWebMainMenu, cxWebNavBar, cxWebStdCtrls, cxWebClasses,
  cxWebControls;
  

type
  TIncludeLoginPage = class(TcxWebPageModule)
    cxWebLabel1: TcxWebLabel;
    cxWebLabel2: TcxWebLabel;
    weLogin: TcxWebEdit;
    wePassword: TcxWebEdit;
    wbLogin: TcxWebButton;
    wlMessage: TcxWebLabel;
    cxWebStyleController1: TcxWebStyleController;
    stWarning: TcxWebStyleItem;
    procedure wbLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IncludeLoginPage: TIncludeLoginPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, IncludeData;

function IncludeLoginPage: TIncludeLoginPage;
begin
  Result := TIncludeLoginPage(WebContext.FindModuleClass(TIncludeLoginPage));
end;

procedure TIncludeLoginPage.wbLoginClick(Sender: TObject);
begin
  if (IncludeDataMod.Logins.IndexOfName(weLogin.Text) > -1) and
    (IncludeDataMod.Logins.Values[weLogin.Text] = wePassword.Text) then
  begin
    Session.Values['login'] := True;
    Session.Values['loginID'] := weLogin.Text;    
    RedirectToPage('IncludeWelcomePage', '');
  end
  else wlMessage.Visible := True;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIncludeLoginPage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
 
