unit ucontact;

interface

uses
  Windows, Messages, SysUtils, Classes, HTTPApp,
  cxWebTypes, cxWebColors, cxWebClasses, cxWebModule;

type
  TContact = class(TcxWebPageModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Contact: TContact;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function Contact: TContact;
begin
  Result := TContact(WebContext.FindModuleClass(TContact));
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TContact, TcxWebPageInfo.Create('*.html'), caDestroy));

end.
