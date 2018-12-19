unit WebChartData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TWebChartDataMod = class(TcxWebHomeDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebChartDataMod: TWebChartDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function WebChartDataMod: TWebChartDataMod;
begin
  Result := TWebChartDataMod(WebContext.FindModuleClass(TWebChartDataMod));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TWebChartDataMod,  caDestroy));

end.
 
