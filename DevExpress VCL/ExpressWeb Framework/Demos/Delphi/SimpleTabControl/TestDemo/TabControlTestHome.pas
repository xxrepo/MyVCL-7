unit TabControlTestHome;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebStdCtrls,
  cxWebClasses, cxWebControls, SimpleTabControl;
  

type
  TTabControlTestHomePage = class(TcxWebPageModule)
    SimpleTabControl: TcxWebSimpleTabControl;
    TabLabel: TcxWebLabel;
    StyleController: TcxWebStyleController;
    TabStyle: TcxWebStyleItem;
    TabHoverStyle: TcxWebStyleItem;
    InactiveTabStyle: TcxWebStyleItem;
    procedure SimpleTabControlTabClick(Sender: TObject;
      var ATabIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function TabControlTestHomePage: TTabControlTestHomePage;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants;

function TabControlTestHomePage: TTabControlTestHomePage;
begin
  Result := TTabControlTestHomePage(WebContext.FindModuleClass(TTabControlTestHomePage));
end;

procedure TTabControlTestHomePage.SimpleTabControlTabClick(Sender: TObject;
  var ATabIndex: Integer);
begin
  TabLabel.Caption := 'The current tab is:' + SimpleTabControl.Tabs[ATabIndex];
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TTabControlTestHomePage, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
