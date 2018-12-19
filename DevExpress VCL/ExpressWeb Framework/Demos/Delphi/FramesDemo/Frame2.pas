unit Frame2;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;
  

type
  TFrame2Page = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Frame2Page: TFrame2Page;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Frame2Page: TFrame2Page;
begin
  Result := TFrame2Page(WebContext.FindModuleClass(TFrame2Page));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TFrame2Page, TcxWebPageInfo.Create('*.html'),  caCache));

end.
