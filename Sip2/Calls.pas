unit Calls;

interface

uses SipInts, Classes, SyncObjs;

type

  TSipCalls = class(TList)
  private
    FCriticalSection: TCriticalSection; 
  protected
    function GetCall(Index: Integer): ISipCall;
  public
    procedure Lock;
    procedure Unlock;
    procedure AddCall(const Call: ISipCall);
    procedure DelCall(const Call: ISipCall);
    procedure Clear; override;
    property Calls[Index: Integer]: ISipCall read GetCall; default;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSipCalls }

function TSipCalls.GetCall(Index: Integer): ISipCall;
begin
  Result := IInterface(Items[Index]) as ISipCall;
end;

procedure TSipCalls.AddCall(const Call: ISipCall);
begin
  Lock;
  try
    Call._AddRef;
    Add(Pointer(Call));
  finally
    Unlock;
  end;
end;

procedure TSipCalls.DelCall(const Call: ISipCall);
var
  Idx: Integer;
begin
  Lock;
  try
    Idx := IndexOf(Pointer(Call));
    if Idx >= 0 then
    begin
      Delete(Idx);
      Call._Release;
    end;
  finally
    Unlock;
  end;
end;

destructor TSipCalls.Destroy;
begin
  Clear;
  FCriticalSection.Free;
  inherited;
end;

procedure TSipCalls.Clear;
begin
  while Count > 0 do
    DelCall(IInterface(Items[0]) as ISipCall);
  inherited;
end;

constructor TSipCalls.Create;
begin
  inherited;
  FCriticalSection := TCriticalSection.Create;
end;

procedure TSipCalls.Lock;
begin
  FCriticalSection.Enter;
end;

procedure TSipCalls.Unlock;
begin
  FCriticalSection.Leave;
end;

end.
