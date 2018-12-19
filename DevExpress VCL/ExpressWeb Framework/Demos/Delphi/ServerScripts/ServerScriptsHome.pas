unit ServerScriptsHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, DBTables;
  

type
  TServerScriptsHomePage = class(TcxWebPageModule)
    Table: TTable;
    procedure cxWebPageModuleDeactivate(Sender: TObject);
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    function GetCurrentImageSrc: string;
  public
    { Public declarations }
  published
    property CurrentImageSrc: string read GetCurrentImageSrc;
  end;

function ServerScriptsHomePage: TServerScriptsHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants,
  cxScriptDBImpl, cxWebDataUtils;

function ServerScriptsHomePage: TServerScriptsHomePage;
begin
  Result := TServerScriptsHomePage(WebContext.FindModuleClass(TServerScriptsHomePage));
end;

function TServerScriptsHomePage.GetCurrentImageSrc: string;
var
  AWidth, AHeight: Integer;
begin
  LoadImage(Table.FindField('Event_Photo').Value, nil, Result, AWidth, AHeight);
end;

procedure TServerScriptsHomePage.cxWebPageModuleActivate(Sender: TObject);
begin
  Table.Open;
end;

procedure TServerScriptsHomePage.cxWebPageModuleDeactivate(Sender: TObject);
begin
  Table.Close;
end;


initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TServerScriptsHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
