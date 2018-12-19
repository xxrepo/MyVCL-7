unit Frame1;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebStdCtrls,
  cxWebClasses, cxWebControls;
  

type
  TFrame1Page = class(TcxWebPageModule)
    cxWebButton2: TcxWebButton;
    cxWebButton3: TcxWebButton;
    cxWebButton4: TcxWebButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Frame1Page: TFrame1Page;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, Frame2;

function Frame1Page: TFrame1Page;
begin
  Result := TFrame1Page(WebContext.FindModuleClass(TFrame1Page));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TFrame1Page, TcxWebPageInfo.Create('*.html'),  caCache));

end.
