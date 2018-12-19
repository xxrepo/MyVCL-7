unit VBScriptData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TVBScriptDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function VBScriptDataMod: TVBScriptDataMod;

implementation

{$R *.DFM} 

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function VBScriptDataMod: TVBScriptDataMod;
begin
  Result := TVBScriptDataMod(WebContext.FindModuleClass(TVBScriptDataMod));
end;

procedure TVBScriptDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TVBScriptDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TVBScriptDataMod,  caDestroy));

end.
 
