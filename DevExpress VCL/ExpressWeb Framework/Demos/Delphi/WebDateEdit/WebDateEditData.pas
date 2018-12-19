unit WebDateEditData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TWebDateEditDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebDateEditDataMod: TWebDateEditDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function WebDateEditDataMod: TWebDateEditDataMod;
begin
  Result := TWebDateEditDataMod(WebContext.FindModuleClass(TWebDateEditDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TWebDateEditDataMod,  caDestroy));

end.
 
