
unit WebsnapAdaptersDataPageProducer;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp, WebModu, HTTPProd, ReqMulti,
  WebDisp, WebAdapt, WebComp;

type
  TWebsnapAdaptersPageProducerPage = class(TWebAppPageModule)
    PageProducer: TPageProducer;
    WebAppComponents: TWebAppComponents;
    ApplicationAdapter: TApplicationAdapter;
    PageDispatcher: TPageDispatcher;
    AdapterDispatcher: TAdapterDispatcher;
    procedure WebAppPageModuleCreate(Sender: TObject);
    procedure WebAppPageModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function WebsnapAdaptersPageProducerPage: TWebsnapAdaptersPageProducerPage;

implementation

{$R *.dfm}  {*.html}

uses ActiveX, WebReq, WebCntxt, WebFact, Variants;

function WebsnapAdaptersPageProducerPage: TWebsnapAdaptersPageProducerPage;
begin
  Result := TWebsnapAdaptersPageProducerPage(WebContext.FindModuleClass(TWebsnapAdaptersPageProducerPage));
end;

procedure TWebsnapAdaptersPageProducerPage.WebAppPageModuleCreate(
  Sender: TObject);
begin
  OleInitialize(nil);
end;

procedure TWebsnapAdaptersPageProducerPage.WebAppPageModuleDestroy(
  Sender: TObject);
begin
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebAppPageModuleFactory.Create(TWebsnapAdaptersPageProducerPage, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html'), caCache));

end.
