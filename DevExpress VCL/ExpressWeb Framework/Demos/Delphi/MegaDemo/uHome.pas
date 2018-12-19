unit uHome;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,  
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule,
  cxWebControls;

type
  THome = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Home: THome;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Home: THome;
begin
  Result := THome(WebContext.FindModuleClass(THome));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(THome, TcxWebPageInfo.Create('*.html'), caDestroy));
         
end.
