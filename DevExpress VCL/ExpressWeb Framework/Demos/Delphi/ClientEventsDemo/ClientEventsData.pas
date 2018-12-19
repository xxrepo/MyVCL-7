unit ClientEventsData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TClientEventsDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ClientEventsDataMod: TClientEventsDataMod;

implementation

{$R *.DFM} 

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function ClientEventsDataMod: TClientEventsDataMod;
begin
  Result := TClientEventsDataMod(WebContext.FindModuleClass(TClientEventsDataMod));
end;

procedure TClientEventsDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TClientEventsDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TClientEventsDataMod,  caDestroy));

end.
 
