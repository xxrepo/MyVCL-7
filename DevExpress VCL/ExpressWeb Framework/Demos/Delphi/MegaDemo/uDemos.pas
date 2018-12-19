unit udemos;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,  
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule, cxWebStdCtrls,
  cxWebControls, cxWebMenus, cxWebTV;

type
  TDemos = class(TcxWebPageModule)
  public
    { Public declarations }
  end;

function Demos: TDemos;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Demos: TDemos;
begin
  Result := TDemos(WebContext.FindModuleClass(TDemos));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TDemos, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
