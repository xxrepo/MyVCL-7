unit TabControlTestData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TTabControlTestDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function TabControlTestDataMod: TTabControlTestDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function TabControlTestDataMod: TTabControlTestDataMod;
begin
  Result := TTabControlTestDataMod(WebContext.FindModuleClass(TTabControlTestDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TTabControlTestDataMod,  caDestroy));

end.
 
