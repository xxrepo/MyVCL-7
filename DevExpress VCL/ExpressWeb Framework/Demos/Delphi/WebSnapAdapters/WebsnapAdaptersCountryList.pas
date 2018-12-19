unit WebsnapAdaptersCountryList;

interface

uses SysUtils, Classes, HTTPApp, cxWebSnapModule, WebForm, WebComp,
  MidItems, HTTPProd, CompProd, PagItems, SiteProd, cxWebClasses,
  cxWebControls, cxWebSnapAdapter, WebAdapt, DBAdapt, DBTables, DB;
  

type
  TWebsnapAdaptersCountryListPage = class(TcxWebSnapPageModule)
    cxWebSnapControlAdapter1: TcxWebSnapControlAdapter;
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterErrorList1: TAdapterErrorList;
    AdapterGrid1: TAdapterGrid;
    ColName: TAdapterDisplayColumn;
    ColCapital: TAdapterDisplayColumn;
    ColContinent: TAdapterDisplayColumn;
    ColArea: TAdapterDisplayColumn;
    ColPopulation: TAdapterDisplayColumn;
    AdapterCommandColumn1: TAdapterCommandColumn;
    NewRow: TAdapterActionButton;
    EditRow: TAdapterActionButton;
    DeleteRow: TAdapterActionButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebsnapAdaptersCountryListPage: TWebsnapAdaptersCountryListPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, WebFact, Variants, WebSnapAdaptersData;

function WebsnapAdaptersCountryListPage: TWebsnapAdaptersCountryListPage;
begin
  Result := TWebsnapAdaptersCountryListPage(WebContext.FindModuleClass(TWebsnapAdaptersCountryListPage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TWebsnapAdaptersCountryListPage, TWebPageInfo.Create([wpPublished],'.html'), crOnDemand, caCache));

end.
