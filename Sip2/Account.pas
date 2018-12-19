unit Account;

{$I sipcompilers.inc}

interface

uses SipInts, SysUtils, Windows, IPutils, SyncObjs;

type

  TAccount = class(TInterfacedObject, ISipAccount)
  private
    FCriticalSection: TCriticalSection;
    FServer: AnsiString;
    FProxy: AnsiString;
    FServerIP: AnsiString;
    FServerPort: Integer;
    FUser: AnsiString;
    FPassword: AnsiString;
    FCallID: AnsiString;
    FBranch: AnsiString;
    FState: TAccountState;
    FRegistrationTime: TDateTime;
    FRealm: AnsiString;
    FNonce: AnsiString;
    FCNonce: AnsiString;
    FOpaque: AnsiString;
    FQop: AnsiString;
    FRes: AnsiString;
    FTag: AnsiString;
    FRemoteTag: AnsiString;
    FLocalIP: AnsiString;
    FLocalPort: Integer;
    FMappedLocalIP: AnsiString;
    FSTUN: AnsiString;
    FSTUNIP: AnsiString;
    FRPort: AnsiString;
    FIMText: AnsiString;
    FExpires: Integer;
    FName: AnsiString;
    FLocalSeqNum: Integer;
  protected
    Function GetLocalSeqNum: Integer;
    Procedure SetLocalSeqNum(Value:Integer);
    Function GetServerPort:Integer;
    procedure SetServerPort(Value:Integer);
    procedure Lock;
    procedure Unlock;
    function GetRPort: AnsiString;
    procedure SetRPort(const Value: AnsiString);
    function GetSTUN: AnsiString;
    procedure SetSTUN(const Value: AnsiString);
    function GetSTUNIP: AnsiString;
    procedure SetSTUNIP(const Value: AnsiString);
    function GetLocalIP: AnsiString;
    procedure SetLocalIP(const Value: AnsiString);
    function GetLocalPort: Integer;
    procedure SetLocalPort(Value: Integer);
    function GetMappedLocalIP: AnsiString;
    procedure SetMappedLocalIP(const Value: AnsiString);
    function GetTag: AnsiString;
    procedure SetTag(const Value: AnsiString);
    function GetRemoteTag: AnsiString;
    procedure SetRemoteTag(const Value: AnsiString);
    function GetRes: AnsiString;
    procedure SetRes(const Value: AnsiString);
    function GetRealm: AnsiString;
    procedure SetRealm(const Value: AnsiString);
    function GetNonce: AnsiString;
    procedure SetNonce(const Value: AnsiString);
    function GetCNonce: AnsiString;
    procedure SetCNonce(const Value: AnsiString);
    function GetOpaque: AnsiString;
    procedure SetOpaque(const Value: AnsiString);
    function GetQop: AnsiString;
    procedure SetQop(const Value: AnsiString);
    procedure SetRegistrationTime(Value: TDateTime);
    function GetRegistrationTime: TDateTime;
    function GetState: TAccountState;
    procedure SetState(Value: TAccountState);
    function GetBranch: AnsiString;
    procedure SetBranch(const Value: AnsiString);
    function GetCallID: AnsiString;
    procedure SetCallID(const Value: AnsiString);
    function GetServer: AnsiString;
    procedure SetServer(const Value: AnsiString);
    Function GetProxy:AnsiString;
    procedure SetProxy(const Value: AnsiString);
    function GetServerIP: AnsiString;
    function GetUser: AnsiString;
    procedure SetUser(const Value: AnsiString);
    function GetPassword: AnsiString;
    procedure SetPassword(const Value: AnsiString);
    function GetExpires: Integer;
    procedure SetExpires(Value: Integer);
    property Server: AnsiString read GetServer write SetServer;
    Property Proxy: AnsiString read GetProxy write SetProxy;
    property User: AnsiString read GetUser write SetUser;
    property Password: AnsiString read GetPassword write SetPassword;
    property CallID: AnsiString read GetCallID write SetCallID;
    property ServerIP: AnsiString read GetServerIP;
    property State: TAccountState read GetState write SetState;
    function GetIMText: AnsiString;
    procedure SetIMText(Value: AnsiString);
    Function GetName:AnsiString;
    procedure SetName(const Value:AnsiString);
    Function GetFormattedName:AnsiString;
    Function GetLocalURI:AnsiString;
  public
    constructor Create(const AStun, AServer, AUser, APassword, AProxy: AnsiString);
    destructor Destroy; override;
  end;


implementation

uses guids;

{ TAccount}

constructor TAccount.Create(const AStun, AServer, AUser, APassword, AProxy: AnsiString);
begin
  inherited Create;
  FCriticalSection := TCriticalSection.Create;
  FRegistrationTime := Now;
  FState := rsDisconnected;
  FCallID:=NewStrGuid;
  FTag:=GenerateTag;
  FBranch:=GenerateBranch;
  FExpires := 3600;
  FServerPort:=5060;
  FLocalSeqNum:=1;
  FSTUN:=AStun;
  FServer := AServer;
  FUser := AUser;
  FPassword := APassword;
  FProxy:=AProxy;
  if Length(FProxy)>0 then FServerIP:=HostToIP(FProxy)
    else FServerIP:=HostToIP(FServer);
  FLocalIP:=GetBestLocalIP(FServerIP);
end;

destructor TAccount.Destroy;
begin
  FCriticalSection.Free;
  inherited;
end;

function TAccount.GetBranch: AnsiString;
begin
  Result := FBranch;
end;

function TAccount.GetCallID: AnsiString;
begin
  Result := FCallID;
end;

function TAccount.GetRegistrationTime: TDateTime;
begin
  Result := FRegistrationTime;
end;

function TAccount.GetNonce: AnsiString;
begin
  Result := FNonce;
end;

function TAccount.GetCNonce: AnsiString;
Begin
  Result:=FCNonce;
end;

function TAccount.GetOpaque: AnsiString;
begin
  Result := FOpaque;
end;

function TAccount.GetPassword: AnsiString;
begin
  Result := FPassword;
end;

function TAccount.GetQop: AnsiString;
begin
  Result := FQop;
end;

function TAccount.GetRealm: AnsiString;
begin
  Result := FRealm;
end;

function TAccount.GetRemoteTag: AnsiString;
begin
  Result := FRemoteTag;
end;

function TAccount.GetRes: AnsiString;
begin
  Result := FRes;
end;

function TAccount.GetServer: AnsiString;
begin
  Result := FServer;
end;

function TAccount.GetServerIP: AnsiString;
begin
  Result := FServerIP;
end;

function TAccount.GetSTUN: AnsiString;
begin
  Result := FSTUN;
end;

function TAccount.GetRPort: AnsiString;
begin
  Result := FRPort;
end;

function TAccount.GetSTUNIP: AnsiString;
begin
  Result := FSTUNIP;
end;

function TAccount.GetLocalIP: AnsiString;
begin
  Result := FLocalIP;
end;

function TAccount.GetMappedLocalIP: AnsiString;
begin
  if Length(FMappedLocalIP) = 0 then
    Result := FLocalIP
  else
    Result := FMappedLocalIP;
end;

function TAccount.GetState: TAccountState;
begin
  Result := FState;
end;

function TAccount.GetTag: AnsiString;
begin
  Result := FTag;
end;

function TAccount.GetUser: AnsiString;
begin
  Result := FUser;
end;

procedure TAccount.SetBranch(const Value: AnsiString);
begin
  FBranch := Value;
end;

procedure TAccount.SetCallID(const Value: AnsiString);
begin
  FCallID := Value;
end;

procedure TAccount.SetRegistrationTime(Value: TDateTime);
begin
  FRegistrationTime := Value;
end;

procedure TAccount.SetNonce(const Value: AnsiString);
begin
  FNonce := Value;
end;

procedure TAccount.SetCNonce(const Value: AnsiString);
begin
  FCNonce := Value;
end;

procedure TAccount.SetOpaque(const Value: AnsiString);
begin
  FOpaque := Value;
end;

procedure TAccount.SetPassword(const Value: AnsiString);
begin
  FPassword := Value;
end;

procedure TAccount.SetQop(const Value: AnsiString);
begin
  FQop := Value;
end;

procedure TAccount.SetRealm(const Value: AnsiString);
begin
  FRealm := Value; 
end;

procedure TAccount.SetRemoteTag(const Value: AnsiString);
begin
  FRemoteTag := Value;
end;

procedure TAccount.SetRes(const Value: AnsiString);
begin
  FRes := Value;
end;

procedure TAccount.SetLocalIP(const Value: AnsiString);
begin
  FLocalIP := Value;
end;

procedure TAccount.SetMappedLocalIP(const Value: AnsiString);
begin
  FMappedLocalIP := Value;
end;

procedure TAccount.SetServer(const Value: AnsiString);
begin
  FServer := Value;
end;

procedure TAccount.SetSTUN(const Value: AnsiString);
begin
  FSTUN := Value;
end;

procedure TAccount.SetRPort(const Value: AnsiString);
begin
  FRPort := Value;
end;

procedure TAccount.SetSTUNIP(const Value: AnsiString);
begin
  FSTUNIP := Value;
end;

procedure TAccount.SetState(Value: TAccountState);
begin
  FState := Value;
end;

procedure TAccount.SetTag(const Value: AnsiString);
begin
  FTag := Value;
end;

procedure TAccount.SetUser(const Value: AnsiString);
begin
  FUser := Value;
end;

function TAccount.GetLocalPort: Integer;
begin
  Result := FLocalPort;
end;

procedure TAccount.SetLocalPort(Value: Integer);
begin
  FLocalPort := Value;
end;

procedure TAccount.Lock;
begin
  FCriticalSection.Enter;
end;

procedure TAccount.Unlock;
begin
  FCriticalSection.Leave;
end;

function TAccount.GetIMText: AnsiString;
begin
  Result := FIMText;
end;

procedure TAccount.SetIMText(Value: AnsiString);
begin
  FIMText := Value;
end;

function TAccount.GetExpires: Integer;
begin
  Result := FExpires;
end;

procedure TAccount.SetExpires(Value: Integer);
begin
  FExpires := Value;
end;

Function TAccount.GetProxy:AnsiString;
Begin
  Result:=FProxy;
end;

procedure TAccount.SetProxy(const Value: AnsiString);
Begin
  FProxy:=Value;
end;

Function TAccount.GetName:AnsiString;
Begin
  Result:=FName;
end;

procedure TAccount.SetName(const Value:AnsiString);
Begin
  FName:=Value;
end;

Function TAccount.GetServerPort:Integer;
Begin
  Result:=FServerPort;
end;

procedure TAccount.SetServerPort(Value:Integer);
Begin
  FServerPort:=Value;
end;

Function TAccount.GetLocalSeqNum: Integer;
Begin
  Result:=FLocalSeqNum;
end;

Procedure TAccount.SetLocalSeqNum(Value:Integer);
Begin
  FLocalSeqNum:=Value;
end;

Function TAccount.GetFormattedName:AnsiString;
Begin
  If FName<>'' then Result:='"'+FName+'" '
    else Result:='';
end;

Function TAccount.GetLocalURI:AnsiString;
Begin
  Result:='sip:'+GetUser+'@'+GetMappedLocalIP+':'+IntToStr(FLocalPort);
end;

end.