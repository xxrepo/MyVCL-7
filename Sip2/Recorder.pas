unit Recorder;

interface

uses WavFiles, SysUtils, Windows, SyncObjs, SipInts, Classes, AudioBuf;

type
  TSipRecorder = class (TInterfacedObject, ISipRecorder)
  protected
    FCS: TCriticalSection;
    FInBuffer: TAudioBuffer;
    FOutBuffer: TAudioBuffer;
    FAudioStream: TMemoryStream;
    procedure PutToStream;
    procedure OnSend (Buffer: Pointer);
    procedure OnRecv (Buffer: Pointer);
    procedure Clear;
    procedure SaveToStream (const Stream: TStream);
    procedure SaveToFile (const FileName: AnsiString);
  public
    constructor Create;
    destructor Destroy; Override;
  end;

implementation

procedure TSipRecorder.Clear;
Begin
  FAudioStream.Clear;
end;

Constructor TSipRecorder.Create;
Begin
  Inherited;
  FInBuffer:=TAudioBuffer.Create;
  FOutBuffer:=TAudioBuffer.Create;
  FAudioStream:=TMemoryStream.Create;
  FCS:=TCriticalSection.Create;
end;

Destructor TSipRecorder.Destroy;
Begin
  FAudioStream.Free;
  FInBuffer.Free;
  FOutBuffer.Free;
  FCS.Free;
  Inherited;
end;

Procedure TSipRecorder.OnRecv (Buffer: Pointer);
Begin
  FCS.Enter;
  try
    FInBuffer.PutBuffer(Buffer);
  Finally
    FCS.Leave;
  end;
end;

procedure TSipRecorder.PutToStream;
Var
  B:TAudioData;
  M:Array[0..High(TAudioData)+1] of Integer;
  i:Integer;
begin
  while (FOutBuffer.Count>3)or(FInBuffer.Count>3) do
  Begin
    FillChar(M[0],SizeOf(M),0);
    FillChar(B[0],SizeOf(B),0);
    if FOutBuffer.GetBuffer(@B[0]) Then
      for i:=0 to High(B) do
        M[i]:=B[i]; // can be optimized with MOVE
    if FInBuffer.GetBuffer(@B[0]) Then
      for i:=0 to High(B) do
        M[i]:=(M[i]+B[i]) div 2;
    for i:=0 to High(B) Do
      B[i]:=M[i]; // can be optimized with MOVE
    FAudioStream.Write(B[0],SizeOf(B));
  end;
end;

procedure TSipRecorder.OnSend (Buffer: Pointer);
Begin
  FCS.Enter;
  try
    FOutBuffer.PutBuffer(Buffer);
    PutToStream;
  Finally
    FCS.Leave;
  end;
end;

procedure TSipRecorder.SaveToFile(const FileName: AnsiString);
var
  ms:TMemoryStream;
Begin
  FCS.Enter;
  try
    ms:=TMemoryStream.Create;
    Try
      FAudioStream.Position:=0;
      SaveToStream(ms);
      ms.SaveToFile(FileName);
    Finally
      ms.Free;
    end;
    FAudioStream.Clear;
  Finally
    FCS.Leave;
  End;
end;

procedure TSipRecorder.SaveToStream(const Stream: TStream);
var
  ms:TMemoryStream;
Begin
  FCS.Enter;
  Try
    ms:=TMemoryStream.Create;
    try
      FAudioStream.Position:=0;
      PcmToGsm(FAudioStream,ms);
      FAudioStream.Clear;
      ms.Position:=0;
      GsmToWav(ms,FAudioStream);
      FAudioStream.SaveToStream(Stream);
    Finally
      ms.Free;
    end;
    FAudioStream.Clear;
  Finally
    FCS.Leave;
  end;
end;

end.
