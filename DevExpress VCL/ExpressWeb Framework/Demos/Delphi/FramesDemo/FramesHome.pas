unit FramesHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TFramesHomePage = class(TcxWebFramesetModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FramesHomePage: TFramesHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function FramesHomePage: TFramesHomePage;
begin
  Result := TFramesHomePage(WebContext.FindModuleClass(TFramesHomePage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebFramesetModuleFactory.Create(TFramesHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
