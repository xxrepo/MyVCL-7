unit udemoorder;

interface

uses
  Windows, SysUtils, Classes, HTTPApp, WebModu, 
  cxWebModule, cxWebTypes, cxWebColors, cxWebClasses, cxWebControls,
  cxWebStdCtrls, WebAdapt, WebComp, WebForm, MidItems, HTTPProd, CompProd,
  PagItems, SiteProd;

type
  TOrderDemo = class(TcxWebPageModule)
    cxWebEdit1: TcxWebEdit;
    cxWebLabel2: TcxWebLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function OrderDemo: TOrderDemo;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, WebFact, Variants;

function OrderDemo: TOrderDemo;
begin
  Result := TOrderDemo(WebContext.FindModuleClass(TOrderDemo));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TWebPageModuleFactory.Create(TOrderDemo, TWebPageInfo.Create([wpPublished {, wpLoginRequired}], '.html', '', 'Order Form'), crOnDemand, caCache));

end.
