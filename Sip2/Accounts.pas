unit Accounts;

interface

uses SipInts, Classes, SyncObjs;

type

  TSipAccounts = class(TList)
  private
    FCriticalSection: TCriticalSection;
  protected
    function GetAccount(Index: Integer): ISipAccount;
  public
    procedure Lock;
    procedure Unlock;
    procedure AddAccount(const Account: ISipAccount);
    procedure DelAccount(const Account: ISipAccount);
    procedure Clear; override;
    property Accounts[Index: Integer]: ISipAccount read GetAccount; default;
    function FindAccount(const CallID: String): ISipAccount;
    function FindAccountByUser(const User, Server: String): ISipAccount;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSipAccounts }

function TSipAccounts.FindAccountByUser(const User, Server: String): ISipAccount;
var
  i: Integer;
begin
  Result := nil;
  FCriticalSection.Enter;
  try
    for i := 0 to Count - 1 do
      if {(Accounts[i].User = User)
      and (Accounts[i].Server = Server)} True then
      begin
        Result := Accounts[i];
        break;
      end;
  finally
    FCriticalSection.Leave;
  end;
end;

function TSipAccounts.FindAccount(const CallID: String): ISipAccount;
var
  i: Integer;
begin
  Result := nil;
  Lock;
  try
    for i := 0 to Count - 1 do
      if (Accounts[i].CallID = CallID)
      or (copy(Accounts[i].CallID, Length(Accounts[i].CallID)-16,16) = CallID) then
      begin
        Result := Accounts[i];
        break;
      end;
  finally
    Unlock
  end;
end;

function TSipAccounts.GetAccount(Index: Integer): ISipAccount;
begin
  Lock;
  try
    Result := IInterface(Items[Index]) as ISipAccount;
  finally
    Unlock;
  end;
end;

procedure TSipAccounts.AddAccount(const Account: ISipAccount);
begin
  Lock;
  try
    Account._AddRef;
    Add(Pointer(Account));
  finally
    Unlock;
  end;
end;

procedure TSipAccounts.DelAccount(const Account: ISipAccount);
var
  Idx: Integer;
begin
  Lock;
  try
    Idx := IndexOf(Pointer(Account));
    if Idx >= 0 then
    begin
      Delete(Idx);
      Account._Release;
    end;
  finally
    Unlock;
  end;
end;

destructor TSipAccounts.Destroy;
begin
  Clear;
  FCriticalSection.Free;  
  inherited;
end;

procedure TSipAccounts.Clear;
begin
  while Count > 0 do
    DelAccount(IInterface(Items[0]) as ISipAccount);
  inherited;
end;

constructor TSipAccounts.Create;
begin
  inherited;
  FCriticalSection := TCriticalSection.Create;
end;

procedure TSipAccounts.Lock;
begin
  FCriticalSection.Enter;
end;

procedure TSipAccounts.Unlock;
begin
  FCriticalSection.Leave;
end;

end.