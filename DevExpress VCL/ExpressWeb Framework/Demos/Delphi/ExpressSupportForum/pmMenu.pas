unit pmMenu;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebMenus,
  cxWebClasses, cxWebControls, cxWebMainMenu;
  

type
  TMenu = class(TcxWebPageModule)
    cxWebMainMenu1: TcxWebMainMenu;
    miQuestions: TcxWebMenuItem;
    miNewQuestion: TcxWebMenuItem;
    miMyQuestions: TcxWebMenuItem;
    miBookmarks: TcxWebMenuItem;
    miAddBookmark: TcxWebMenuItem;
    StyleController: TcxWebStyleController;
    Menu: TcxWebStyleItem;
    MenuHover: TcxWebStyleItem;
    miLogOut: TcxWebMenuItem;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Menu: TMenu;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function Menu: TMenu;
begin
  Result := TMenu(WebContext.FindModuleClass(TMenu));
end;

procedure TMenu.cxWebPageModuleActivate(Sender: TObject);
begin


  if not DM.RestoreUser then
    RedirectToPage('Index', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TMenu, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
