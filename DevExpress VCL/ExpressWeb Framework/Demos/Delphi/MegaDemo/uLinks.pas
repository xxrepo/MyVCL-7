unit ulinks;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,  
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule;

type
  TLinks = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Links: TLinks;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Links: TLinks;
begin
  Result := TLinks(WebContext.FindModuleClass(TLinks));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TLinks, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
