unit WebServiceData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;


type
  TWebServiceDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebServiceDataMod: TWebServiceDataMod;

implementation

{$R *.DFM}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, ActiveX;

function WebServiceDataMod: TWebServiceDataMod;
begin
  Result := TWebServiceDataMod(WebContext.FindModuleClass(TWebServiceDataMod));
end;

procedure TWebServiceDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TWebServiceDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TWebServiceDataMod,  caDestroy));

end.
 
