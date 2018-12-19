unit CustomAttrHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebClasses,
  cxWebControls, cxWebStdCtrls;
  

type
  TCustomAttrHomePage = class(TcxWebPageModule)
    cxWebLabel2: TcxWebLabel;
    cxWebStyleController1: TcxWebStyleController;
    stLabel: TcxWebStyleItem;
    stButton: TcxWebStyleItem;
    cxWebButton3: TcxWebButton;
    cxWebButton2: TcxWebButton;
    cxWebLabel3: TcxWebLabel;
    cxWebButton4: TcxWebButton;
    procedure cxWebButton4Click(Sender: TObject);
  end;

function CustomAttrHomePage: TCustomAttrHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function CustomAttrHomePage: TCustomAttrHomePage;
begin
  Result := TCustomAttrHomePage(WebContext.FindModuleClass(TCustomAttrHomePage));
end;

procedure TCustomAttrHomePage.cxWebButton4Click(Sender: TObject);
begin
  TcxWebButton(Sender).Caption := 'Click';
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TCustomAttrHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
