unit Speaker;

{$I sipcompilers.inc}

interface

uses Windows, Messages, SysUtils, Classes, MMSystem, SyncObjs, SipInts;


const
  MaxBuffersCount = 16;

type
  TPcmBuffer = array[$1..$500] of Smallint;

  TSpeakerThread = class (TThread)
  private
    FWnd: THandle ;
    FId: Integer;
    FCS: TCriticalSection;
    FHandle: THandle;
    FHeaders: array[0..MaxBuffersCount-1] of TWaveHdr;
    FBuffers: array[0..MaxBuffersCount-1] of TPcmBuffer;
    FWindowCreatedEvent: THandle;
    FFreeBuffers: Integer;
    procedure WndProc (var Message: TMessage);
    procedure HandleBufferDone (AWaveHdr: PWaveHdr);
    function LocateBuffer (var Index: Integer): Boolean;
  protected
    procedure Execute; override;
  public
    procedure Play (Buffer: Pointer; Size: Integer);
    function BuffersAvailable: Boolean;
    constructor Create (AID: Int64);
    destructor Destroy; override;
  end;

  TSpeaker = class (TInterfacedObject, ISipSpeaker)
  private
    FSpeakerThread: TSpeakerThread;
  protected
    procedure Play (Buffer: Pointer; Size: Integer);
    function BuffersAvailable: Boolean;
  public
    constructor Create (AID: Int64);
    destructor Destroy; override;
  end;

implementation

{ TSpeakerThread }

procedure TSpeakerThread.Execute;
var
  Msg: TMsg;

  procedure OpenAudio;
  var
    WF: TPCMWaveFormat;
    i: Integer;
  begin
    WF.wBitsPerSample:=16;
    WF.wf.wFormatTag:=WAVE_FORMAT_PCM;
    WF.wf.nChannels:=1;
    WF.wf.nSamplesPerSec:=8000;
    WF.wf.nAvgBytesPerSec:=8000 *2;
    WF.wf.nBlockAlign:=2;
    waveOutOpen(@FHandle,FId,@WF,FWnd,0,CALLBACK_WINDOW);
    for i:=0 to High(FHeaders) do
    Begin
      // WITH optimization is possible
      FHeaders[i].lpData:=@FBuffers[i][1];
      FHeaders[i].dwBufferLength:=SizeOf(TPcmBuffer);
      FHeaders[i].lpNext:=Nil;
      FHeaders[i].dwUser:=0;
      waveOutPrepareHeader(FHandle,@FHeaders[i],SizeOf(TWaveHdr));
    end;
    FFreeBuffers:=MaxBuffersCount;
  end;

  Procedure CloseAudio;
  var
    i:Integer;
  Begin
    waveOutReset(FHandle);
    for i:=0 to High(FHeaders) Do
      waveOutUnprepareHeader(FHandle,@FHeaders[i],SizeOf(TWaveHdr));
    waveOutClose(FHandle);
  end;

Begin
  FWnd:=AllocateHWnd(WndProc);
  SetEvent(FWindowCreatedEvent);
  try
    OpenAudio;
    try
      While Not Terminated Do
      Try
        GetMessage(Msg,FWnd,0,0);
        if not Terminated and (Msg.message=MM_WOM_DONE) then HandleBufferDone(PWaveHdr(Msg.lParam))
        else if not Terminated then DispatchMessage(Msg); // can be optimized for Terminated
      Except
      End;
    Finally
      CloseAudio;
    end;
  Finally
    DeallocateHWnd(Fwnd);
  End;
end;

function TSpeakerThread.LocateBuffer (var Index: Integer): Boolean;
var
  i: Integer;
begin
  Result:=False;
  for i:=0 to High(FHeaders) Do
    if FHeaders[i].dwUser=0 Then
    Begin
      Index:=i;
      Result:=True;
      Exit;
    end;
end;

procedure TSpeakerThread.Play (Buffer: Pointer; Size: Integer);
var
  idx: Integer;
begin
  If LocateBuffer(idx) Then
  Begin
    Dec(FFreeBuffers);
    FHeaders[idx].dwBufferLength:=Size;
    FHeaders[idx].dwUser:=1;
    Move(Buffer^,FBuffers[idx][1],FHeaders[idx].dwBufferLength); // Size can be reused
    waveOutWrite(FHandle,@FHeaders[idx],SizeOf(TWaveHdr));
  end;
end;

procedure TSpeakerThread.HandleBufferDone (AWaveHdr: PWaveHdr);
begin
  FCS.Enter;
  try
    Inc(FFreeBuffers);
    AWaveHdr.dwUser:=0;
    AWaveHdr.dwFlags:=AWaveHdr.dwFlags And not WHDR_DONE;
  Finally
    FCS.Leave;
  end;
end;

procedure TSpeakerThread.WndProc (var Message: TMessage);
begin
  DefWindowProc(FWnd,Message.Msg,Message.WParam,Message.LParam);
end;

constructor TSpeakerThread.Create (AID: Int64); // no need for 64 bits
begin
  Inherited Create(True);
  FFreeBuffers:=MaxBuffersCount;
  FWindowCreatedEvent:=CreateEvent(Nil,True,False,Nil);
  Priority:=tpTimeCritical;
  FCS:=TCriticalSection.Create;
  FreeOnTerminate:=False;
  FId:=AID;
  Resume;
  WaitForSingleObject(FWindowCreatedEvent,INFINITE);
end;

Destructor TSpeakerThread.Destroy;
Begin
  Terminate;
  PostMessage(FWnd,WM_USER,0,0);
  WaitFor;
  FCS.Free;
  CloseHandle(FWindowCreatedEvent);
  Inherited;
end;

function TSpeakerThread.BuffersAvailable: Boolean;
begin
  FCS.Enter;
  try
    Result:=FFreeBuffers>0;
  Finally
    FCS.Leave;
  end;
end;

{ TSpeaker }

function TSpeaker.BuffersAvailable: Boolean;
begin
  Result:=FSpeakerThread.BuffersAvailable;
end;

constructor TSpeaker.Create (AID: Int64); // no need for 64 bits
begin
  Inherited Create;
  FSpeakerThread:=TSpeakerThread.Create(AID);
end;

Destructor TSpeaker.Destroy;
Begin
  FSpeakerThread.Free;
  Inherited;
end;

procedure TSpeaker.Play (Buffer: Pointer; Size: Integer);
begin
  FSpeakerThread.Play(Buffer,Size);
end;
    
end.