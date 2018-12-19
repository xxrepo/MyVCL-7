unit ServerScriptsData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TServerScriptsDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ServerScriptsDataMod: TServerScriptsDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function ServerScriptsDataMod: TServerScriptsDataMod;
begin
  Result := TServerScriptsDataMod(WebContext.FindModuleClass(TServerScriptsDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TServerScriptsDataMod,  caDestroy));

end.
 
