unit XPBarHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TXPBarHomePage = class(TcxWebFramesetModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function XPBarHomePage: TXPBarHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function XPBarHomePage: TXPBarHomePage;
begin
  Result := TXPBarHomePage(WebContext.FindModuleClass(TXPBarHomePage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebFramesetModuleFactory.Create(TXPBarHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
