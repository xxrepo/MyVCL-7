unit LoginTarget;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;
  

type
  TLoginTargetPage = class(TcxWebPageModule)
    wlGreeting: TcxWebLabel;
    cxWebButton1: TcxWebButton;
    cxWebButton2: TcxWebButton;
    cxWebStyleController1: TcxWebStyleController;
    stGreeting: TcxWebStyleItem;
    procedure cxWebPageModuleActivate(Sender: TObject);
    procedure cxWebButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function LoginTargetPage: TLoginTargetPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function LoginTargetPage: TLoginTargetPage;
begin
  Result := TLoginTargetPage(WebContext.FindModuleClass(TLoginTargetPage));
end;

procedure TLoginTargetPage.cxWebPageModuleActivate(Sender: TObject);
begin
  wlGreeting.Caption := 'Hello ' + Request.QueryFields.Text;
end;

procedure TLoginTargetPage.cxWebButton1Click(Sender: TObject);
begin
  RedirectToPage('LoginHomePage', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TLoginTargetPage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
