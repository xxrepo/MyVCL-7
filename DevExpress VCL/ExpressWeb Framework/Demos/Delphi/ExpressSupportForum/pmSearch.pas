unit pmSearch;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, cxWebControls,
  cxWebClasses, cxWebStdCtrls;
  

type
  TSearch = class(TcxWebPageModule)
    weSearch: TcxWebEdit;
    wiSearch: TcxWebImage;
    procedure wbSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function Search: TSearch;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function Search: TSearch;
begin
  Result := TSearch(WebContext.FindModuleClass(TSearch));
end;

procedure TSearch.wbSearchClick(Sender: TObject);
begin
  weSearch.Text := '';
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TSearch, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
