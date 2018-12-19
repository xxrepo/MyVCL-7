unit Codecs;

interface

uses SipInts;

type
  TCreateCodecFunction = function: IAudioCodec;

function CodecRegistered (ID: Integer): Boolean;
procedure RegisterCodec (Func: TCreateCodecFunction; ID: Integer);
function CreateAudioCodec(ID: Integer): IAudioCodec;

implementation

Uses Classes;

type
  PCodecRegistration = ^TCodecRegistration;
  TCodecRegistration = record
    ID: Integer;
    Func: TCreateCodecFunction;
  end;

var
  CodecRegistrations: TList;

function CodecRegistered (ID: Integer): Boolean;
var
  i: Integer;
Begin
  Result:=False;
  for i:=0 to CodecRegistrations.Count-1 do
    if PCodecRegistration(CodecRegistrations[i]).ID=ID Then
    Begin
      Result:=True;
      Exit;
    end;
end;

procedure RegisterCodec (Func: TCreateCodecFunction; ID: Integer);
var
  i: Integer;
  found: Boolean;
//  P:PCodecRegistration; -- optimization
Begin
  found:=False;
  for i:=0 to CodecRegistrations.Count-1 do
    if PCodecRegistration(CodecRegistrations[i]).ID=ID Then
    Begin
      found:=True;
      PCodecRegistration(CodecRegistrations[i]).Func:=Func;
      Break;
    end;
  if not found Then
  Begin
    { -- optimized version
    New(P);
    P.ID:=ID;
    P.Func:=Func;
    CodecRegistrations.Add(P);
    }
    // original version
    CodecRegistrations.Add(SysGetMem(SizeOf(TCodecRegistration))); // original uses @GetMem - but I could not make it
    PCodecRegistration(CodecRegistrations[CodecRegistrations.Count-1]).ID:=ID;
    PCodecRegistration(CodecRegistrations[CodecRegistrations.Count-1]).Func:=Func;
  end;
end;

function CreateAudioCodec(ID: Integer): IAudioCodec;
var
  i:Integer;
begin
  for i:=0 to CodecRegistrations.Count-1 do
    if PCodecRegistration(CodecRegistrations[i]).ID=ID Then
    Begin
      Result:=PCodecRegistration(CodecRegistrations[i]).Func;
      Exit;
    end;
end;

Initialization
  CodecRegistrations:=TList.Create;
  
Finalization
  While CodecRegistrations.Count>0 Do
  begin
    Dispose(PCodecRegistration(CodecRegistrations[0]));
    CodecRegistrations.Delete(0);
  end;
  CodecRegistrations.Free;

end.