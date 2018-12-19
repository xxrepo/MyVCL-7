unit HomeDM;

interface

uses SysUtils, Classes, HTTPApp, cxWebModule, cxWebAppSrv, DB, ADODB, UUser,
  cxWebClasses;


type
  TDM = class(TcxWebHomeDataModule)
    Connection: TADOConnection;
    StyleController: TcxWebStyleController;
    TableHeader: TcxWebStyleItem;
    TablePaging: TcxWebStyleItem;
    TablePagingHover: TcxWebStyleItem;
    TableHeaderHover: TcxWebStyleItem;
    TableAlter: TcxWebStyleItem;
    TableItems: TcxWebStyleItem;
    TextStyle: TcxWebStyleItem;
    TableItemsHover: TcxWebStyleItem;
    ButtonStyle: TcxWebStyleItem;
    ButtonStyleHover: TcxWebStyleItem;
    NavigatorStyle: TcxWebStyleItem;
    GridStyle: TcxWebStyleItem;
    NavigatorStyleHover: TcxWebStyleItem;
    EditStyle: TcxWebStyleItem;
    TablePagingSelect: TcxWebStyleItem;
    procedure cxWebHomeDataModuleActivate(Sender: TObject);
    procedure cxWebHomeDataModuleDeactivate(Sender: TObject);
    procedure cxWebHomeDataModuleBeforeDispatchPage(Sender: TObject;
      const APageName: String; var AHandled: Boolean);
  private
    function GetUserId: Integer;
    function GetNick: string;
    { Private declarations }
  public
    { Public declarations }
    User: TUser;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function RestoreUser: Boolean;
  published
    property UserId: Integer read GetUserId;
    property Nick: string read GetNick;
  end;

function DM: TDM;

implementation

{$R *.DFM}

uses
  ActiveX, WebReq, WebCntxt, cxWebModFact, Variants;

function DM: TDM;
begin
  Result := TDM(WebContext.FindModuleClass(TDM));
end;

procedure TDM.cxWebHomeDataModuleActivate(Sender: TObject);
begin
  User := TUser.Create;
  User.Connection := Connection;
end;

procedure TDM.cxWebHomeDataModuleDeactivate(Sender: TObject);
begin
  User.Free;
end;

function TDM.GetNick: string;
begin
  Result := User.Nick;
end;

function TDM.GetUserId: Integer;
begin
  Result := User.Id;
end;

function TDM.RestoreUser: Boolean;
begin
  Result :=  VarIsOrdinal(Session.Values['UserId']);
  if Result then
    Result := (User.RestoreById(Session.Values['UserId']) <> 0);
end;

procedure TDM.cxWebHomeDataModuleBeforeDispatchPage(Sender: TObject;
  const APageName: String; var AHandled: Boolean);
const
  AvailablePages: Array[0..2] of string = ('index', 'register', 'forgot');
var
  I: Integer;
begin
  for I := Low(AvailablePages) to High(AvailablePages) do
    if SameText(APageName, AvailablePages[I]) then
      exit;
  if not RestoreUser then
    RedirectToPage('Index', '')
end;

constructor TDM.Create(AOwner: TComponent);
begin
  OleInitialize(nil);
  inherited Create(AOwner);
end;

destructor TDM.Destroy;
begin
  inherited Destroy;
  OleUninitialize;
end;

initialization
  if WebRequestHandler <> nil then
    WebRequestHandler.AddWebModuleFactory(TcxWebHomeDataModuleFactory.Create(TDM,  caDestroy));

end.
