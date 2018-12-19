unit CustomRenderHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebStdCtrls,
  cxWebClasses, cxWebControls, cxWebLabelCustomRender;
  

type
  TCustomRenderHomePage = class(TcxWebPageModule)
    cxWebLabel1: TcxWebLabel;
    cxWebURLLabel1: TcxWebURLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CustomRenderHomePage: TCustomRenderHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function CustomRenderHomePage: TCustomRenderHomePage;
begin
  Result := TCustomRenderHomePage(WebContext.FindModuleClass(TCustomRenderHomePage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TCustomRenderHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
