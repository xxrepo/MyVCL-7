unit CustomAttrData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TCustomAttrDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function CustomAttrDataMod: TCustomAttrDataMod;

implementation

{$R *.DFM}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function CustomAttrDataMod: TCustomAttrDataMod;
begin
  Result := TCustomAttrDataMod(WebContext.FindModuleClass(TCustomAttrDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TCustomAttrDataMod,  caDestroy));

end.
 
