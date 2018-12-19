unit WebsnapAdaptersOrders;

interface

uses SysUtils, Classes, HTTPApp, cxWebSnapModule, MidItems, WebForm,
  WebComp, HTTPProd, CompProd, PagItems, SiteProd, cxWebClasses,
  cxWebControls, cxWebSnapAdapter;
  

type
  TWebsnapAdaptersCountryItemPage = class(TcxWebSnapPageModule)
    AdapterPageProducer: TAdapterPageProducer;
    AdapterForm1: TAdapterForm;
    AdapterErrorList1: TAdapterErrorList;
    AdapterFieldGroup1: TAdapterFieldGroup;
    AdapterButtonGroup1: TAdapterCommandGroup;
    BtnApply: TAdapterActionButton;
    BtnRefreshRow: TAdapterActionButton;
    BtnCancel: TAdapterActionButton;
    cxWebSnapControlAdapter1: TcxWebSnapControlAdapter;
    cxWebSnapControlAdapter2: TcxWebSnapControlAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function WebsnapAdaptersCountryItemPage: TWebsnapAdaptersCountryItemPage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, WebFact, Variants, WebSnapAdaptersData;

function WebsnapAdaptersCountryItemPage: TWebsnapAdaptersCountryItemPage;
begin
  Result := TWebsnapAdaptersCountryItemPage(WebContext.FindModuleClass(TWebsnapAdaptersCountryItemPage));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TWebsnapAdaptersCountryItemPage, TWebPageInfo.Create([wpPublished],'.html'), crOnDemand, caDestroy));

end.
