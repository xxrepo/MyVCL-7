unit IncludeWelcome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;
  

type
  TIncludeWelcomePage = class(TcxWebPageModule)
    wlWelcome: TcxWebLabel;
    cxWebStyleController1: TcxWebStyleController;
    stWellcome: TcxWebStyleItem;
    wbLogout: TcxWebButton;
    wbView: TcxWebButton;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure wbLogoutClick(Sender: TObject);
    procedure wbViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IncludeWelcomePage: TIncludeWelcomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, IncludeData, IncludeLogin;

function IncludeWelcomePage: TIncludeWelcomePage;
begin
  Result := TIncludeWelcomePage(WebContext.FindModuleClass(TIncludeWelcomePage));
end;

procedure TIncludeWelcomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  wlWelcome.Caption := 'Hello ' + Session.Values['loginID'];
end;

procedure TIncludeWelcomePage.wbLogoutClick(Sender: TObject);
begin
  Session.Values['login'] := False;
  Session.Values['loginID'] := '';
  RedirectToPage('IncludeLoginPage', '');
end;

procedure TIncludeWelcomePage.wbViewClick(Sender: TObject);
begin
  RedirectToPage('IncludeGridPage', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIncludeWelcomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
