unit MasterDetailData;

interface

uses ActiveX, SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TMasterDetailDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MasterDetailDataMod: TMasterDetailDataMod;

implementation

{$R *.DFM} 

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function MasterDetailDataMod: TMasterDetailDataMod;
begin
  Result := TMasterDetailDataMod(WebContext.FindModuleClass(TMasterDetailDataMod));
end;

procedure TMasterDetailDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TMasterDetailDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TMasterDetailDataMod,  caDestroy));

end.
 
