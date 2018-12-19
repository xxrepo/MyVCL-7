unit XPBarData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TXPBarDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function XPBarDataMod: TXPBarDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function XPBarDataMod: TXPBarDataMod;
begin
  Result := TXPBarDataMod(WebContext.FindModuleClass(TXPBarDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TXPBarDataMod,  caDestroy));

end.
 
