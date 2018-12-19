unit uMainPage;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, HTTPProd, 
  cxWebModule, cxWebClasses;

type
  TMainModule = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function MainModule: TMainModule;

implementation

{$R *.DFM} 

uses ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function MainModule: TMainModule;
begin
  Result := TMainModule(WebContext.FindModuleClass(TMainModule));
end;

procedure TMainModule.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TMainModule.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TMainModule, caDestroy));

end.
