unit pmForgot;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TForgot = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Forgot: TForgot;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX, ComObj;

function Forgot: TForgot;
begin
  Result := TForgot(WebContext.FindModuleClass(TForgot));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TForgot, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
