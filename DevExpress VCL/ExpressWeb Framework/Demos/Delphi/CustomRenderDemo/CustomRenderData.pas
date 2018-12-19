unit CustomRenderData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TCustomRenderDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CustomRenderDataMod: TCustomRenderDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function CustomRenderDataMod: TCustomRenderDataMod;
begin
  Result := TCustomRenderDataMod(WebContext.FindModuleClass(TCustomRenderDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TCustomRenderDataMod,  caDestroy));

end.
