unit LookupData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TLookupDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function LookupDataMod: TLookupDataMod;

implementation

{$R *.DFM} 

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function LookupDataMod: TLookupDataMod;
begin
  Result := TLookupDataMod(WebContext.FindModuleClass(TLookupDataMod));
end;

procedure TLookupDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TLookupDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TLookupDataMod,  caDestroy));

end.
 
