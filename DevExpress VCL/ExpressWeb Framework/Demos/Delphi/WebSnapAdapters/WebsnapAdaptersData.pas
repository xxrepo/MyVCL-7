
unit WebsnapAdaptersData;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, WebAdapt,
  WebComp, DBAdapt, DBTables, DB, ADODB;

type
  TWebsnapAdaptersDataMod = class(TWebDataModule)
    Session1: TSession;
    Adapter: TDataSetAdapter;
    Country: TADOTable;
    procedure WebDataModuleActivate(Sender: TObject);
    procedure WebDataModuleDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebsnapAdaptersDataMod: TWebsnapAdaptersDataMod;

implementation

{$R *.dfm} 

uses WebReq, WebCntxt, WebFact, Variants;

function WebsnapAdaptersDataMod: TWebsnapAdaptersDataMod;
begin
  Result := TWebsnapAdaptersDataMod(WebContext.FindModuleClass(TWebsnapAdaptersDataMod));
end;

procedure TWebsnapAdaptersDataMod.WebDataModuleActivate(Sender: TObject);
begin
  Country.ConnectionString := 'FILE NAME=' + DataLinkDir + '\DBDEMOS.UDL';
  Country.Open;
end;

procedure TWebsnapAdaptersDataMod.WebDataModuleDeactivate(Sender: TObject);
begin
  Country.Close;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebDataModuleFactory.Create(TWebsnapAdaptersDataMod, crOnDemand, caCache));

end.
