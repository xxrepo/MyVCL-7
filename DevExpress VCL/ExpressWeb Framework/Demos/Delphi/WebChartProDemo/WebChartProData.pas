unit WebChartProData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TWebChartProDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebChartProDataMod: TWebChartProDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function WebChartProDataMod: TWebChartProDataMod;
begin
  Result := TWebChartProDataMod(WebContext.FindModuleClass(TWebChartProDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TWebChartProDataMod,  caDestroy));

end.
 
