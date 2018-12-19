unit pmFrames;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB,
  cxWebStdCtrls, cxWebClasses, cxWebControls;
  

type
  TFrames = class(TcxWebPageModule)
    Query: TADOQuery;
    procedure cxWebPageModuleActivate(Sender: TObject);
  private
    FUserId: Integer;
    { Private declarations }
  public
    { Public declarations }
  published
    property UserId: Integer read FUserId write FUserId;
  end;

function Frames: TFrames;

implementation

{$R *.DFM} {*.html}

uses
  WebReq, WebCntxt, cxWebModFact, Variants, HomeDM, ActiveX, ComObj;

function Frames: TFrames;
begin
  Result := TFrames(WebContext.FindModuleClass(TFrames));
end;

procedure TFrames.cxWebPageModuleActivate(Sender: TObject);
begin
  if DM.RestoreUser then
  begin
    Query.Parameters.ParamByName('USERID').Value := DM.User.Id;
    Query.ExecSQL;
  end
  else
    RedirectToPage('Index', '');
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebPageModuleFactory.Create(TFrames, TcxWebPageInfo.Create('*.html'),  caDestroy));

end.
