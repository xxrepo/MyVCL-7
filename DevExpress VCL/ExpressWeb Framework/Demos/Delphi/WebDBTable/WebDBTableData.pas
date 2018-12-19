unit WebDBTableData;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv;
  

type
  TWebDBTableDataMod = class(TcxWebHomeDataModule)
    procedure cxWebHomeDataModuleDestroy(Sender: TObject);
    procedure cxWebHomeDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebDBTableDataMod: TWebDBTableDataMod;

implementation

{$R *.DFM}

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function WebDBTableDataMod: TWebDBTableDataMod;
begin
  Result := TWebDBTableDataMod(WebContext.FindModuleClass(TWebDBTableDataMod));
end;

procedure TWebDBTableDataMod.cxWebHomeDataModuleDestroy(Sender: TObject);
begin
  OleUninitialize;
end;

procedure TWebDBTableDataMod.cxWebHomeDataModuleCreate(Sender: TObject);
begin
  OleInitialize(nil);
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TWebDBTableDataMod,  caDestroy));

end.
