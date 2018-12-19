unit Microphone;

{$I sipcompilers.inc}

interface

uses Windows, Messages, SysUtils, Classes, MMSystem, SipInts, SyncObjs, AudioBuf;

const
  BuffersCount = 4;

type
  TOnMicrophone = procedure(Buffer: Pointer) of object;

  TMicrophoneThread = class (TThread)
  private
    FId: Integer;
    FWnd: THandle;
    FHandle: THandle;
    FHeaders: array[0..BuffersCount-1] of TWaveHdr;
    FBuffers: array[0..BuffersCount-1] of TAudioData;
    FOnMicrophone: TOnMicrophone;
    procedure WndProc (var Message: TMessage);
  protected
    procedure Execute; override;
  public
    constructor Create (AID: Int64; AOnMicrophone: TOnMicrophone);
    destructor Destroy; override;
    property OnMicrophone:TOnMicrophone read FOnMicrophone  write FOnMicrophone;
  end;

  TMicrophone = class (TInterfacedObject, ISipMicrophone) 
  private
    FCS: TCriticalSection;
    FCall: ISipCall;
    FMicrophoneThread: TMicrophoneThread;
    procedure OnMicrophone (Buffer: Pointer);
  protected
    function GetCall: ISipCall;
    procedure SetCall (const Value: ISipCall);
  public
    constructor Create (AID: Int64);
    destructor Destroy; override;
  end;

implementation

{ TMicrophoneThread }

constructor TMicrophoneThread.Create (AID: Int64; AOnMicrophone: TOnMicrophone); // no need for 64 bits
Begin
  FOnMicrophone:=AOnMicrophone;
  Inherited Create(True);
  Priority:=tpTimeCritical;
  FreeOnTerminate:=False;
  FId:=AID;
  Resume;
end;

Destructor TMicrophoneThread.Destroy;
Begin
  Terminate;
  PostMessage(FWnd,WM_QUIT,0,0);
  WaitFor;
  Inherited;
end;

procedure TMicrophoneThread.Execute;
var
  Msg: TMsg;
  Event: THandle;

  procedure OpenAudio;
  var
    WF: TPCMWaveFormat;
    i: Integer;

    procedure CheckResult(Res:Integer);
    Begin
      Case Res Of
        MMSYSERR_ALLOCATED: Raise Exception.Create('Specified resource is already allocated.');
        MMSYSERR_BADDEVICEID: Raise Exception.Create('Specified device identifier is out of range.');
        MMSYSERR_NODRIVER: Raise Exception.Create('No device driver is present.');
        MMSYSERR_NOMEM: Raise Exception.Create('Unable to allocate or lock memory.');
        WAVERR_BADFORMAT: Raise Exception.Create('Attempted to open with an unsupported waveform-audio format.');
      end;
    end;

  begin
    WF.wBitsPerSample:=16;
    WF.wf.wFormatTag:=WAVE_FORMAT_PCM;
    WF.wf.nChannels:=1;
    WF.wf.nSamplesPerSec:=8000;
    WF.wf.nAvgBytesPerSec:=8000 *2;
    WF.wf.nBlockAlign:=2;
    CheckResult(waveInOpen(@FHandle,FId,@WF,FWnd,0,CALLBACK_WINDOW));
    for i:=0 to High(FHeaders) do
    Begin
      // WITH optimization is possible
      FHeaders[i].lpData:=@FBuffers[i][0];
      FHeaders[i].dwBufferLength:=SizeOf(TAudioData);
      FHeaders[i].lpNext:=Nil;
      FHeaders[i].dwUser:=0;
      waveInPrepareHeader(FHandle,@FHeaders[i],SizeOf(TWaveHdr));
    end;
    waveInStart(FHandle);
    for i:=0 to High(FHeaders) do
      waveInAddBuffer(FHandle,@FHeaders[i],SizeOf(TWaveHdr));
  end;

  Procedure CloseAudio;
  var
    i:Integer;
  Begin
    waveInReset(FHandle);
    waveInStop(FHandle);
    for i:=0 to High(FHeaders) Do
      waveInUnprepareHeader(FHandle,@FHeaders[i],SizeOf(TWaveHdr));
    waveInClose(FHandle);
    FHandle:=INVALID_HANDLE_VALUE;
  end;

Begin
  FWnd:=AllocateHWnd(WndProc);
  try
    OpenAudio;
    try
      Event:=CreateEvent(Nil,True,False,Nil);
      try
        While Not Terminated Do
        Try
          if GetMessage(Msg,FWnd,0,0) Then
          Try
            DispatchMessage(Msg);
          Except
          End;
        Except
        End;
      Finally
        CloseHandle(Event);
      End;
    Finally
      CloseAudio;
    end;
  Finally
    DeallocateHWnd(Fwnd);
  End;
end;

procedure TMicrophoneThread.WndProc (var Message: TMessage);
var
  Buffer:TAudioData;
Begin
  Try
    If Message.Msg = MM_WIM_DATA Then
    begin
      If PWaveHdr(Message.lParam).dwBufferLength = PWaveHdr(Message.lParam).dwBytesRecorded then
      Begin
        Move(PWaveHdr(Message.lParam).lpData^,Buffer[0],SizeOf(Buffer));
        PWaveHdr(Message.LParam).dwBytesRecorded:=0;
        if Assigned(FOnMicrophone) then FOnMicrophone(@Buffer[0]);
      end;
      waveInAddBuffer(FHandle,PWaveHdr(Message.lParam),SizeOf(TWaveHdr));
    end
    else DefWindowProc(FWnd,Message.Msg,Message.WParam,Message.LParam);
  Except
  End;
end;

{ TMicrophone }

constructor TMicrophone.Create (AID: Int64); // no need for 64 bits
Begin
  Inherited Create;
  FCS:=TCriticalSection.Create;
  FMicrophoneThread:=TMicrophoneThread.Create(AID,OnMicrophone);
end;

Destructor TMicrophone.Destroy;
Begin
  FMicrophoneThread.Free;
  FCall:=Nil;
  FCS.Free;
  Inherited;
end;

function TMicrophone.GetCall: ISipCall;
Begin
  FCS.Enter;
  try
    Result:=FCall;
  Finally
    FCS.Leave;
  end;
end;

procedure TMicrophone.OnMicrophone (Buffer: Pointer);
var
  C:ISipCall;
Begin
  C:=GetCall;
  if Assigned(C) Then C.OnMicrophone(Buffer);
end;

procedure TMicrophone.SetCall (const Value: ISipCall);
Begin
  FCS.Enter;
  try
    FCall:=Value;
  Finally
    FCS.Leave;
  end;
end;

end.