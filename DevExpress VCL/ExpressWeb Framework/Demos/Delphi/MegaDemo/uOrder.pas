unit uorder;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,  
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule;

type
  TOrder = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Order: TOrder;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Order: TOrder;
begin
  Result := TOrder(WebContext.FindModuleClass(TOrder));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TOrder, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
