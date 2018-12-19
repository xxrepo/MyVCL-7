unit FramesData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TFramesDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FramesDataMod: TFramesDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function FramesDataMod: TFramesDataMod;
begin
  Result := TFramesDataMod(WebContext.FindModuleClass(TFramesDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TFramesDataMod,  caDestroy));

end.
 
