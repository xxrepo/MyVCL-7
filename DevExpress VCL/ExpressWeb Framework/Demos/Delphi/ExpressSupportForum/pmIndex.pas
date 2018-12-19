unit pmIndex;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebStdCtrls,
  cxWebClasses, cxWebControls, UUser;
  

type
  TIndex = class(TcxWebPageModule)
    weLogin: TcxWebEdit;
    wePass: TcxWebEdit;
    wbLogin: TcxWebButton;
    wcbUseCookies: TcxWebCheckBox;
    procedure wbLoginClick(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    FIsLogin: Boolean;
    { Private declarations }
  public
    { Public declarations }
  published
    property IsLogin: Boolean read FIsLogin write FIsLogin;
  end;

function Index: TIndex;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function Index: TIndex;
begin
  Result := TIndex(WebContext.FindModuleClass(TIndex));
end;

procedure TIndex.wbLoginClick(Sender: TObject);
var
  UserId: Integer;
  Coockie: TCookie;
begin
  UserId := DM.User.RestoreUser(weLogin.Text, wePass.Text);
  if UserId = 0 then
    IsLogin := False
  else
  begin
    Session.Values['UserId'] := UserId;
    if wcbUseCookies.Checked then
    begin
      Coockie := Response.Cookies.Add;
      Coockie.Name := 'DXFORUM';
      Coockie.Value := IntToStr(UserId);
    end;
    RedirectToPage('Frames', '');
  end;
end;

procedure TIndex.cxWebPageModuleActivate(Sender: TObject);
var
  S: string;
begin
  S := Request.CookieFields.Values['DXFORUM'];
  if S <> '' then
  begin
    DM.User.RestoreById(StrToInt(S));
    if DM.UserId > 0 then
    begin
      Session.Values['UserId'] := DM.UserId;
      RedirectToPage('Frames', '');
    end;
  end;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TIndex, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
