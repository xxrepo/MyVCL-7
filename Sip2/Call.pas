unit Call;

interface

uses SipInts, Classes, Windows, SyncObjs, MMSystem, GUIDs, SysUtils,
  DTMF, SipMessage, Microphone, Calls, UDP, Codecs;

type
  TRTPHeader = packed record
    Byte80: Byte;
    PayloadType: Byte;
    SeqNo: WORD;
    TimeStamp: DWORD;
    SSRC: DWORD;
  end;

  TRTP = packed record
    H: TRTPHeader;
    Payload: packed array[0..$3FF] of Byte;
  end;

  TPcmBuffer = array[1..$200] of Smallint;

  PPcm = ^TPcm;
  TPcm = record
    SeqNo: Integer;
    Size: Integer;
    Buffer: TPcmBuffer;
  end;

  TJitterBuffer = class (TObject)
  private
    FSize: Integer;
    FLastSeqNo: Integer;
    function GetCount: Integer;
    function GetMin: Integer;
    function GetIndex (SeqNo: Integer): Integer;
  public
    FPackets: array[0..3] of TPcm;
    procedure PutBuffer (Buffer: Pointer; Size: Integer; SeqNo: Integer);
    function GetBuffer (Buffer: Pointer; var Size: Integer): Boolean;
    constructor Create;
  end;

  TCall = class;

  TCall = class(TInterfacedObject, ISipCall)
  private
    FRtpPacketToSend: TRTP;
    FRtpPacketPayloadSize: Integer;
    FRtpSeqNo: Integer;
    FTimeStamp: DWORD;
    FDtmfCode: AnsiString;
    FDtmfCounter: Integer;
    FSilenceTimeout: DWORD;
    FSilenceThreshold: Integer;
    FSilenceSec: DWORD;
    FDTMFMSec: Cardinal;
    FLocalRtpPort: Integer;
    FRemoteRtpPort: Integer;
    FAccount: ISipAccount;
    FRemoteURI: AnsiString;
    FLocalURI: AnsiString;
    FRes: AnsiString;
    FCallID: AnsiString;
    FSSRC: DWORD;
    FCriticalSection: TCriticalSection;
    FConfLock: TCriticalSection;
    FRecLock: TCriticalSection;
    FSocketLock: TCriticalSection;
    FWavLock: TCriticalSection;
    FSpeakerLock: TCriticalSection;
    FMicrophoneLock: TCriticalSection;
    FUserInputLock: TCriticalSection;
    FState: TCallState;
    FLocalTag: AnsiString;
    FRemoteTag: AnsiString;
    FVia: AnsiString;
    FCallType: TCallType;
    FContact: AnsiString;
    FCSeq: AnsiString;
    FRemoteRtpAddress: AnsiString;
    FActive: Boolean;
    FAudioOutDeviceID: Integer;
    FAudioInDeviceID: Integer;
    FEnableAudioOut: Integer;
    FEnableAudioIn: Integer;
    FAudioCodec: IAudioCodec;
    FCallTime: TDateTime;
    FPrev101: Boolean;
    FSendRecv: AnsiString;
    FOpaque: AnsiString;
    FQop: AnsiString;
    FNonce: AnsiString;
    FCNonce: AnsiString;
    FRealm: AnsiString;
    FOnHold: Boolean;
    FSessionNo: Integer;
    FSessionID: Integer;
    FContactServerIP: AnsiString;
    FContactPort: AnsiString;
    FBranch: AnsiString;
    FMicrophone: ISipMicrophone;
    FSpeaker: ISipSpeaker;
    FRecorder: ISipRecorder;
    FServer: AnsiString;
    FUdpSocket: TUdpSocket;
    FWavFile: IWavFile;
    FViaAddress: AnsiString;
    FViaPort: AnsiString;
    FFromAddr: AnsiString;
    FToAddr: AnsiString;
    FRouteSet: TStringList;
    FAutLine: AnsiString;
    FRemoteUser: AnsiString;
    FRemoteTarget: AnsiString;
    FLocalSeqNum: Integer;
    FRemoteSeqNum: Integer;
    FConference: ISipConference;
    FNumberToTransfer: AnsiString;
    FTag: Integer;
    Fline_ref: Integer;
    FLastStatus: Integer;
    FReason: AnsiString;
    FDtmf: AnsiString;
    FEventHandler: ISipEventHandler;
    FInBuffer: TJitterBuffer;
    FRingBackEvent: THandle;
    FSilenceEvent: THandle;
    FDtmfEvent: THandle;
    FConnectEvent: THandle;
    FDisconnectEvent: THandle;
    FStopPlayingEvent: THandle;
    FUserInput: AnsiString;
    procedure OnReceiveAudio (const IP: AnsiString; Port: Integer;
      Buffer: Pointer; Size: Integer);
    procedure ProcessAudioRtpPacket (RTP: TRTP; Size: Integer);
  protected
    function GetUserInput: AnsiString;
    procedure SetUserInput(const Value: AnsiString);
    function GetRingBackEvent: THandle;
    function GetSilenceEvent: THandle;
    function GetDtmfEvent: THandle;
    function GetConnectEvent: THandle;
    function GetDisconnectEvent: THandle;
    function GetStopPlayingEvent: THandle;
    function GetReason: AnsiString;
    procedure SetReason(Const Value: AnsiString);
    function GetLine_Ref: Integer;
    procedure SetLine_Ref(Value: Integer);
    function GetLastStatus: Integer;
    procedure SetLastStatus(Value: Integer);
    function GetTag: Integer;
    procedure SetTag(Value: Integer);
    function GetRemoteSeqNum: Integer;
    procedure SetRemoteSeqNum(Value: Integer);
    function GetLocalSeqNum: Integer;
    procedure SetLocalSeqNum(Value: Integer);
    function GetRemoteTarget: AnsiString;
    procedure SetRemoteTarget(const Value: AnsiString);
    function GetRemoteUser: AnsiString;
    procedure SetRemoteUser(const Value: AnsiString);
    procedure AssignRouteSet(const M: TSipMessage);
    function GetAutLine: AnsiString;
    procedure SetAutLine(const Value: AnsiString);
    function GetRouteSetCount: Integer;
    function GetFromAddr: AnsiString;
    procedure SetFromAddr(const Value: AnsiString);
    function GetToAddr: AnsiString;
    procedure SetToAddr(const Value: AnsiString);
    function GetViaAddress: AnsiString;
    procedure SetViaAddress(const Value: AnsiString);
    function GetViaPort: AnsiString;
    procedure SetViaPort(const Value: AnsiString);
    function GetSilenceTimeout: Integer;
    procedure SetSilenceTimeout(Value: Integer);
    function GetSilenceThreshold: Integer;
    procedure SetSilenceThreshold(Value: Integer);
    function GetSilenceSec: Integer;
    procedure SetSilenceSec(Value: Integer);
    procedure SetSendRecv(const Value: AnsiString);
    function GetAutResult: AnsiString;
    procedure SetAutResult(Const Value: AnsiString);
    procedure HandleDTMF(const code: AnsiString);
    procedure HandleSilence;
    procedure OnDtmf(const Code: AnsiString);
    function GetBranch: AnsiString;
    procedure SetBranch(const Value: AnsiString);
    function GetContactServerIP: AnsiString;
    procedure SetContactServerIP(const Value: AnsiString);
    function GetWavFile: IWavFile;
    procedure SetWavFile(const Value: IWavFile);
    function GetSpeaker: ISipSpeaker;
    procedure SetSpeaker(Const Value: ISipSpeaker);
    function GetMicrophone: ISipMicrophone;
    procedure SetMicrophone(const Value: ISipMicrophone);
    function GetSessionNo: Integer;
    procedure SetSessionNo(Value: Integer);
    function GetSessionID: Integer;
    procedure SetSessionID(Value: Integer);
    function GetOnHold: Boolean;
    function GetCallTime: TDateTime;
    function GetAudioCodec: IAudioCodec;
    procedure SetAudioCodec(const Value: IAudioCodec);
    function GetEnableAudioOut: Boolean;
    procedure SetEnableAudioOut(Value: Boolean);
    function GetEnableAudioIn: Boolean;
    procedure SetEnableAudioIn(Value: Boolean);
    function GetAudioOutDeviceID: Integer;
    procedure SetAudioOutDeviceID(Value: Integer);
    function GetAudioInDeviceID: Integer;
    procedure SetAudioInDeviceID(Value: Integer);
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    function GetRemoteRtpAddress: AnsiString;
    procedure SetRemoteRtpAddress(const Value: AnsiString);
    function GetCSeq: AnsiString;
    procedure SetCSeq(const Value: AnsiString);
    function GetContact: AnsiString;
    procedure SetContact(const Value: AnsiString);
    function GetRecordRoute: AnsiString;
    function GetRouteRecord: AnsiString;
    function GetVia: AnsiString;
    procedure SetVia(const Value: AnsiString);
    function GetLocalTag: AnsiString;
    procedure SetLocalTag(const Value: AnsiString);
    function GetRemoteTag: AnsiString;
    procedure SetRemoteTag(const Value: AnsiString);
    function GetState: TCallState;
    procedure SetState(Value: TCallState);
    procedure Lock;
    procedure Unlock;
    function GetLocalRtpPort: Integer;
    procedure SetLocalRtpPort(Value: Integer);
    function GetRemoteRtpPort: Integer;
    procedure SetRemoteRtpPort(Value: Integer);
    function GetAccount: ISipAccount;
    procedure SetAccount(const Value: ISipAccount);
    property Account:ISipAccount read GetAccount write SetAccount; // properties should be at the end
    function GetRemoteURI: AnsiString;
    procedure SetRemoteURI(const Value: AnsiString);
    function GetLocalURI: AnsiString;
    procedure SetLocalURI(const Value: AnsiString);
    function GetServer: AnsiString;
    procedure SetServer(const Value: AnsiString);
    function GetCallID: AnsiString;
    procedure SetCallID(const Value: AnsiString);
    function GetCallType: TCallType;
    procedure SetCallType(Value: TCallType);
    property Active:Boolean read GetActive write SetActive;
    function GetPrev101: Boolean;
    procedure SetPrev101(Value: Boolean);
    function AutResult: AnsiString;
    function GetQop: AnsiString;
    procedure SetQop(const Value: AnsiString);
    function GetOpaque: AnsiString;
    procedure SetOpaque(const Value: AnsiString);
    function GetNonce: AnsiString;
    procedure SetNonce(const Value: AnsiString);
    function GetCNonce: AnsiString;
    procedure SetCNonce(const Value: AnsiString);
    function GetRealm: AnsiString;
    procedure SetRealm(const Value: AnsiString);
    function GetSendRecv: AnsiString;
    function GetContactPort: AnsiString;
    procedure SetContactPort(const Value: AnsiString);
    procedure SetOnHold(Value: Boolean);
    procedure PlayWavFile(const Value: IWavFile);
    procedure SetDtmfCode(const Value: AnsiString);
    function GetRoute: AnsiString;
    procedure SetConference(const Value: ISipConference);
    procedure SetRecorder(const Value: ISipRecorder);
    function GetRecorder: ISipRecorder;
    procedure OnMicrophone(Buffer: Pointer);
    procedure SendUdp(var Buf; Size: Integer);
    procedure BeforeEncode(Buffer: Pointer);
    procedure BeforePlay(Buffer: Pointer);
    function GetNumberToTransfer: AnsiString;
    procedure SetNumberToTransfer(const Value: AnsiString);
  public
    constructor Create(const AAccount: ISipAccount; const ACallID: AnsiString; const AEventHandler: ISipEventHandler);
    destructor Destroy; override;
  end;

implementation

Uses AudioBuf;

{ TCall }

constructor TCall.Create(const AAccount: ISipAccount; const ACallID: AnsiString; const AEventHandler: ISipEventHandler);
begin
  inherited Create;
  FEventHandler:=AEventHandler;
  FPrev101:=False;
  FillChar(FRtpPacketToSend,SizeOf(FRtpPacketToSend),0);
  FRouteSet:=TStringList.Create;
  FSSRC:=DWORD(timeGetTime)+DWORD(Random(5000));
  FDTMFMSec:=0;
  FTimeStamp:=0;
  FSessionNo:=0;
  FDtmfCounter:=0;
  FSessionID:=Random(55000) + 1234;
  FOnHold:=False;
  FSendRecv:='sendrecv';
  FBranch:=GenerateBranch;
  FCallTime:=Now;
  FAudioCodec:=Nil;
  FAudioOutDeviceID:=Integer(WAVE_MAPPER);
  FAudioInDeviceID:=Integer(WAVE_MAPPER);
  FEnableAudioOut:=1;
  FEnableAudioIn:=1;
  FState:=csInactive;
  FCriticalSection:=TCriticalSection.Create;
  FConfLock:=TCriticalSection.Create;
  FRecLock:=TCriticalSection.Create;
  FSocketLock:=TCriticalSection.Create;
  FWavLock:=TCriticalSection.Create;
  FSpeakerLock:=TCriticalSection.Create;
  FMicrophoneLock:=TCriticalSection.Create;
  FUserInputLock:=TCriticalSection.Create;
  FAccount:=AAccount;
  If ACallID<>'' then FCallID:=ACallID
    Else FCallID:=NewStrGuid;
  FLocalTag:=GenerateTag;
  FInBuffer:=TJitterBuffer.Create;
  FRingBackEvent:=CreateEvent(Nil,False,False,Nil);
  FSilenceEvent:=CreateEvent(Nil,False,False,Nil);
  FDtmfEvent:=CreateEvent(Nil,False,False,Nil);
  FConnectEvent:=CreateEvent(Nil,False,False,Nil);
  FDisconnectEvent:=CreateEvent(Nil,False,False,Nil);
  FStopPlayingEvent:=CreateEvent(Nil,False,False,Nil);
end;

destructor TCall.Destroy;
begin
  if FActive Then Active:=False;
  FCriticalSection.Free;
  FConfLock.Free;
  FRecLock.Free;
  FSocketLock.Free;
  FRouteSet.Free;
  FWavLock.Free;
  FSpeakerLock.Free;
  FMicrophoneLock.Free;
  FUserInputLock.Free;
  FInBuffer.Free;
  CloseHandle(FRingBackEvent);
  CloseHandle(FSilenceEvent);
  CloseHandle(FDtmfEvent);
  CloseHandle(FConnectEvent);
  CloseHandle(FDisconnectEvent);
  CloseHandle(FStopPlayingEvent);
  inherited;
end;

Function TCall.GetActive:Boolean;
Begin
  Result:=FActive;
end;

function TCall.GetAudioCodec: IAudioCodec;
begin
  Result := FAudioCodec;
end;


function TCall.GetAudioInDeviceID: Integer;
begin
  Result := FAudioInDeviceID;
end;

function TCall.GetAudioOutDeviceID: Integer;
begin
  Result := FAudioOutDeviceID;
end;

function TCall.GetCallID: AnsiString;
begin
  Result := FCallID;
end;

function TCall.GetCallTime: TDateTime;
begin
  Result := FCallTime;
end;

function TCall.GetCallType: TCallType;
begin
  Result := FCallType;
end;

procedure TCall.SetContactServerIP(const Value: AnsiString);
begin
  FContactServerIP := Value;
end;

function TCall.GetSpeaker:ISipSpeaker;
Begin
  FSpeakerLock.Enter;
  try
    Result:=FSpeaker;
  Finally
    FSpeakerLock.Leave;
  End;
end;

function TCall.GetWavFile: IWavFile;
begin
  FWavLock.Enter;
  try
    Result := FWavFile;
  Finally
    FWavLock.Leave;
  End;
end;

procedure TCall.SetWavFile(const Value: IWavFile);
begin
  FWavLock.Enter;
  try
    FWavFile := Value;
  Finally
    FWavLock.Leave;
  End;
end;

function TCall.GetBranch: AnsiString;
begin
  Result := FBranch;
end;

function TCall.GetContactServerIP: AnsiString;
begin
  Result := FContactServerIP;
end;

function TCall.GetContact: AnsiString;
begin
  Result := FContact;
end;

function TCall.GetCSeq: AnsiString;
begin
  Result := FCSeq;
end;

function TCall.GetEnableAudioIn: Boolean;
begin
  Result:=Boolean(InterlockedExchange(FEnableAudioIn,FEnableAudioIn));
end;

function TCall.GetEnableAudioOut: Boolean;
begin
  Result:=Boolean(InterlockedExchange(FEnableAudioOut,FEnableAudioOut));
end;

function TCall.GetLocalRtpPort: Integer;
begin
  Result := FLocalRtpPort;
end;

function TCall.GetLocalTag: AnsiString;
begin
  Result := FLocalTag;
end;

function TCall.GetPrev101: Boolean;
begin
  Result := FPrev101;
end;

function TCall.GetAccount: ISipAccount;
begin
  Result := FAccount;
end;

function TCall.GetRemoteRtpAddress: AnsiString;
begin
  Result := FRemoteRtpAddress;
end;

function TCall.GetRemoteRtpPort: Integer;
begin
  Result := FRemoteRtpPort;
end;

function TCall.GetRemoteTag: AnsiString;
begin
  Result := FRemoteTag;
end;

function TCall.GetRoute: AnsiString;
Var
  i:Integer;
begin
  If FRouteSet.Count>0 then
  begin
    Result:='Route: ';
    for i:=0 to FRouteSet.Count-1 Do
    Begin
      Result:=Result+FRouteSet[i];
      if FRouteSet.Count-1 > i Then Result:=Result+',';
    end;
    Result:=Result+#13#10;
  End
  Else Result:='';
end;

Function TCall.GetRecordRoute:AnsiString;
var
  i:Integer;
Begin
  Result:='';
  If FRouteSet.Count>0 Then
    for i:=FRouteSet.Count-1 Downto 0 do
      Result:=Result+'Record-Route: '+FRouteSet[i]+#13#10;
end;

Function TCall.GetRouteRecord:AnsiString;
var
  i:Integer;
Begin
  Result:='';
  if FRouteSet.Count>0 Then
    for i:=FRouteSet.Count-1 Downto 0 do
      Result:=Result+'Route: '+FRouteSet[i]+#13#10;
end;

function TCall.GetState: TCallState;
begin
  Result := FState;
end;

Function TCall.GetRemoteURI:AnsiString;
Begin
  Result:=FRemoteURI;
end;

function TCall.GetVia: AnsiString;
begin
  Result := FVia;
end;

procedure TCall.Lock;
begin
  FCriticalSection.Enter;
end;

Procedure TCall.OnDtmf(const Code:AnsiString);
var
  s:AnsiString;
Begin
  s:=Code;
  if Length(Code)>0 then
  Begin
    if Assigned(FEventHandler) then FEventHandler.OnDtmf(Self,s[1]);
    if s[1] in ['#','*','0'..'9'] then
    Begin
      FUserInput:=FUserInput+s[1];
      PulseEvent(FDtmfEvent);
    end;
  end;
end;

procedure TCall.HandleSilence;
begin
  If Assigned(FEventHandler) then FEventHandler.OnSilence(Self);
  PulseEvent(FSilenceEvent);
end;

procedure TCall.HandleDTMF(const code: AnsiString);
begin
  if (timeGetTime - FDTMFMSec) < 120 then
  begin
    FDTMFMSec := timeGetTime;
    Exit;
  end;
  if Length(code) > 0 then OnDtmf(code);
  FDTMFMSec := timeGetTime;
end;

procedure TCall.SetActive(Value: Boolean);
begin
  if Value then
  begin
    if Assigned(FEventHandler) then FEventHandler.OnAudioOpen(Self);
    FSocketLock.Enter;
    try
      FUdpSocket:=TUdpSocket.Create(FLocalRtpPort,OnReceiveAudio);
    Finally
      FSocketLock.Leave;
    end;
    FActive := True;
  end
  else
  begin
    FActive:=False;
    FSocketLock.Enter;
    try
      FreeAndNil(FUdpSocket);
    Finally
      FSocketLock.Leave;
    end;
    if Assigned(FEventHandler) then FEventHandler.OnAudioClose(Self);
  end;
end;

procedure TCall.SetAudioCodec(const Value: IAudioCodec);
begin
  FAudioCodec := Value;
end;

procedure TCall.SetAudioInDeviceID(Value: Integer);
begin
  FAudioInDeviceID := Value;
end;

procedure TCall.SetAudioOutDeviceID(Value: Integer);
begin
  FAudioOutDeviceID := Value;
end;

procedure TCall.SetCallID(const Value: AnsiString);
begin
  FCallID := Value;
end;

procedure TCall.SetCallType(Value: TCallType);
begin
  FCallType := Value;
end;

procedure TCall.SetContact(const Value: AnsiString);
begin
  FContact := Value;
end;

procedure TCall.SetCSeq(const Value: AnsiString);
begin
  FCSeq := Value;
end;

procedure TCall.SetEnableAudioIn(Value: Boolean);
begin
  InterlockedExchange(FEnableAudioIn,Ord(Value));
end;

procedure TCall.SetEnableAudioOut(Value: Boolean);
begin
  InterlockedExchange(FEnableAudioOut,Ord(Value));
end;

procedure TCall.SetLocalRtpPort(Value: Integer);
begin
  FLocalRtpPort := Value;
end;

procedure TCall.SetLocalTag(const Value: AnsiString);
begin
  FLocalTag := Value;
end;

function TCall.GetQop: AnsiString;
begin
  Result := FQop;
end;

function TCall.GetOpaque: AnsiString;
begin
  Result := FOpaque;
end;

function TCall.GetNonce: AnsiString;
begin
  Result := FNonce;
end;

function TCall.GetCNonce: AnsiString;
Begin
  Result:=FCNonce;
end;

function TCall.GetSendRecv: AnsiString;
begin
  Result := FSendRecv;
end;

function TCall.GetRealm: AnsiString;
begin
  Result := FRealm;
end;

function TCall.AutResult: AnsiString;
begin
  Result := FRes;
end;

procedure TCall.SetPrev101(Value: Boolean);
begin
  FPrev101 := Value;
end;

procedure TCall.SetAccount(const Value: ISipAccount);
begin
  FAccount := Value;
end;

procedure TCall.SetRemoteRtpAddress(const Value: AnsiString);
begin
  FRemoteRtpAddress := Value;
end;

procedure TCall.SetRemoteRtpPort(Value: Integer);
begin
  FRemoteRtpPort := Value;
end;

procedure TCall.SetRemoteTag(const Value: AnsiString);
begin
  FRemoteTag := Value;
end;

procedure TCall.SetState(Value: TCallState);
begin
  if FState <> Value then
  begin
    FState := Value;
    If Assigned(FEventHandler) then
      if FState=csInactive then FEventHandler.OnDisconnect(Self);
  end;
  if FState=csInactive then SetEvent(FDisconnectEvent);
end;

procedure TCall.SetRemoteURI(const Value: AnsiString);
Begin
  FRemoteURI:=Value;
end;

procedure TCall.SetVia(const Value: AnsiString);
begin
  FVia := Value;
end;

procedure TCall.Unlock;
begin
//  FLockInfo := '';
  FCriticalSection.Leave;
end;

function TCall.GetOnHold: Boolean;
begin
  Result := FOnHold;
end;

function TCall.GetSessionNo: Integer;
begin
  Result := InterlockedExchange(FSessionNo, FSessionNo);
end;

function TCall.GetSessionID: Integer;
begin
  Result := InterlockedExchange(FSessionID, FSessionID);
end;

procedure TCall.SetSessionNo(Value: Integer);
begin
  InterlockedExchange(FSessionNo, Value);
end;

procedure TCall.SetSessionID(Value: Integer);
begin
  InterlockedExchange(FSessionID, Value);
end;

procedure TCall.SetRecorder(const Value: ISipRecorder);
Begin
  FRecLock.Enter;
  Try
    FRecorder:=Value;
  Finally
    FRecLock.Leave;
  end;
end;

function TCall.GetAutResult: AnsiString;
Begin
  Result:=FRes;
end;

procedure TCall.SetAutResult(const Value:AnsiString);
Begin
  FRes:=Value;
end;

procedure TCall.SetSendRecv(const Value: AnsiString);
begin
  FSendRecv := Value;
end;

procedure TCall.SetQop(const Value: AnsiString);
begin
  FQop := Value;
end;

procedure TCall.SetOpaque(const Value: AnsiString);
begin
  FOpaque := Value;
end;

procedure TCall.SetNonce(const Value: AnsiString);
begin
  FNonce := Value;
end;

procedure TCall.SetCNonce(const Value: AnsiString);
begin
  FCNonce := Value;
end;

procedure TCall.SetRealm(const Value: AnsiString);
begin
  FRealm := Value;
end;

procedure TCall.SetBranch(const Value: AnsiString);
begin
  FBranch := Value;
end;

function TCall.GetContactPort: AnsiString;
begin
  Result := FContactPort;
end;

procedure TCall.SetContactPort(const Value: AnsiString);
begin
  FContactPort := Value;
end;

function TCall.GetSilenceTimeout: Integer;
begin
  Result := FSilenceTimeout;
end;

procedure TCall.SetSilenceTimeout(Value: Integer);
begin
  FSilenceTimeout := Value;
end;

function TCall.GetSilenceThreshold: Integer;
begin
  Result := FSilenceThreshold;
end;

procedure TCall.SetSilenceThreshold(Value: Integer);
begin
  FSilenceThreshold := Value;
end;

procedure TCall.SetOnHold(Value: Boolean);
begin
  FOnHold := Value;
end;

function TCall.GetServer: AnsiString;
begin
  Result := FServer;
end;

procedure TCall.SetServer(const Value: AnsiString);
begin
  FServer := Value;
end;

procedure TCall.SetDtmfCode(const Value:AnsiString);
Begin
  Lock;
  try
    FDtmfCode:=FDtmfCode+Value; // BUG - why concatenation instead of assignment ?!?
  Finally
    Unlock;
  end;
end;

procedure TCall.PlayWavFile(const Value: IWavFile);
begin
  ResetEvent(FStopPlayingEvent);
  SetWavFile(Value);
end;

Function TCall.GetViaAddress:AnsiString;
Begin
  Result:=FViaAddress;
end;

procedure TCall.SetViaAddress(const Value: AnsiString);
Begin
  FViaAddress:=Value;
end;

function TCall.GetViaPort: AnsiString;
Begin
  Result:=FViaPort;
end;

procedure TCall.SetViaPort(const Value: AnsiString);
Begin
  FViaPort:=Value;
end;

function TCall.GetFromAddr: AnsiString;
Begin
  Result:=FFromAddr;
end;

procedure TCall.SetFromAddr(const Value: AnsiString);
Begin
  FFromAddr:=Value;
end;

function TCall.GetToAddr: AnsiString;
Begin
  Result:=FToAddr;
end;

procedure TCall.SetToAddr(const Value: AnsiString);
Begin
  FToAddr:=Value;
end;

function TCall.GetRouteSetCount: Integer;
Begin
  Result:=FRouteSet.Count;
end;

procedure TCall.AssignRouteSet(const M: TSipMessage);
var
  i:Integer;
Begin
  FRouteSet.Clear;
  for i:=M.RouteSetCount-1 Downto 0 do
    FRouteSet.Add(M.GetRouteSet(i));
end;

function TCall.GetAutLine: AnsiString;
Begin
  Result:=FAutLine;
end;

procedure TCall.SetAutLine(const Value:AnsiString);
Begin
  FAutLine:=Value;
end;

function TCall.GetRemoteUser: AnsiString;
Begin
  Result:=FRemoteUser;
end;

procedure TCall.SetRemoteUser(const Value: AnsiString);
Begin
  FRemoteUser:=Value;
end;

function TCall.GetLocalURI: AnsiString;
Begin
  Result:=FLocalURI;
end;

procedure TCall.SetLocalURI(const Value: AnsiString);
Begin
  FLocalURI:=Value;
end;

function TCall.GetRemoteTarget: AnsiString;
Begin
  Result:=FRemoteTarget;
end;

procedure TCall.SetRemoteTarget(const Value: AnsiString);
Begin
  FRemoteTarget:=Value;
end;

function TCall.GetLocalSeqNum: Integer;
Begin
  Result:=FLocalSeqNum;
end;

procedure TCall.SetLocalSeqNum(Value: Integer);
Begin
  FLocalSeqNum:=Value;
end;

function TCall.GetRemoteSeqNum: Integer;
Begin
  Result:=FRemoteSeqNum;
end;

procedure TCall.SetRemoteSeqNum(Value: Integer);
Begin
  FRemoteSeqNum:=Value;
end;

procedure TCall.SetConference(const Value: ISipConference);
Begin
  FConfLock.Enter;
  try
    FConference:=Value;
  Finally
    FConfLock.Leave;
  End;
end;

function TCall.GetRecorder: ISipRecorder;
Begin
  FRecLock.Enter;
  Try
    Result:=FRecorder;
  Finally
    FRecLock.Leave;
  end;
end;

procedure TCall.OnMicrophone(Buffer: Pointer);
var
  c: Byte;
  w: Word;
  Wav: IWavFile;
const
  CNG: TAudioData =
    (-8, -16,  0, -8,  -8, -8, -8,  0, -8,  0, -8, -8,  0,  0,  0,  0,
      0,   0,  0, -8, -16,  0, -8, -8, -8, -8,  0, -8,  0,  0, -8, -8,
     -8,   0,  0, -8,  -8, -8, -8,  0,  0, -8, -8,  0,  0, -8,  0,  0,
      0,   0, -8,  0,   0,  0,  0,  0,  0, -8,  0,  0,  0,  0,  0,  0,
      0,   0,  0,  0,   0,  0,  0,  0,  0,  0,  0,  0,  0, -8, -8, -8,
      8,   0,  0,  0,  -8,  0, -8,  0,  0, -8,  0, -8, -8,  0,  0,  0,
      0,   0,  0,  8,   0,  0,  0,  0,  0,  0,  0,  0,  8,  0,  0,  0,
      0,   0,  0,  0,   0,  0,  0,  0,  0,  8,  0,  0,  8,  0,  8,  8,
      0,   0,  8,  0,   8,  0,  0,  0, -8, -8,  8,  0,  0,  0, -8,  0,
      0,   0, -8,  0,   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0);

  function WordWrap (w: Word): Word;
  Begin
    // convert to network byte order (Big Endian)
    Result:=(w Shr 8) or (w shl 8 AND $FF00);
  end;

  function DWordWrap (w: DWord): DWord;
  Begin
    // convert to network byte order (Big Endian)
    Result:=(w Shr 24) or (w shr 8 AND $FF00) or (w shl 8 and $FF0000) or (w shl 24 and $FF000000);
  end;

  Procedure PrepareRTP;
  Begin
    // WITH optimization is possible
    FRtpPacketToSend.H.Byte80 := $80;
    FRtpPacketToSend.H.PayloadType := FAudioCodec.GetId;
    FRtpPacketToSend.H.SSRC := FSSRC;
    FRtpPacketToSend.H.SeqNo := WordWrap(FRtpSeqNo);
    FRtpPacketToSend.H.TimeStamp := DWordWrap(FTimeStamp);
  end;

Begin
  if FRtpPacketToSend.H.Byte80 <> 0 then
  Begin
    if Length(FDtmfCode)>0 Then
    Begin
      c:=DtmfIndex(FDtmfCode[1]);
      if c<>100 Then
      Begin
        FRtpPacketToSend.Payload[0]:=c;
        FRtpPacketToSend.H.PayloadType:=101;
        w:=(FDtmfCounter+1)*Length(CNG);
        FRtpPacketToSend.Payload[2]:=Hi(w);
        FRtpPacketToSend.Payload[3]:=Lo(w);
        Inc(FDtmfCounter);
        case FDtmfCounter of
          1..8: FRtpPacketToSend.Payload[1]:=10;
          9: FRtpPacketToSend.Payload[1]:=138;
        end;
        SendUdp(FRtpPacketToSend.H,SizeOf(TRTPHeader)+4);
        if FDtmfCounter=9 Then
        Begin
          Inc(FRtpSeqNo);
          FRtpPacketToSend.H.SeqNo:=WordWrap(FRtpSeqNo-1);
          SendUdp(FRtpPacketToSend.H,SizeOf(TRTPHeader)+4);
          Inc(FRtpSeqNo);
          FRtpPacketToSend.H.SeqNo:=WordWrap(FRtpSeqNo-1);
          SendUdp(FRtpPacketToSend.H,SizeOf(TRTPHeader)+4); // why sending packet twice ?!?!
          FDtmfCounter:=0;
          FDtmfCode:=Copy(FDtmfCode,2,Length(FDtmfCode)-1);
        end;
      end
      else
      Begin
        FDtmfCode:=Copy(FDtmfCode,2,Length(FDtmfCode)-1);
        SendUdp(FRtpPacketToSend.H,SizeOf(TRTPHeader)+FRtpPacketPayloadSize);
      end;
    end
    else SendUdp(FRtpPacketToSend.H,SizeOf(TRTPHeader)+FRtpPacketPayloadSize);
  end;
  PrepareRTP;
  Wav:=GetWavFile;
  if Assigned(Wav) Then
  begin
    if Wav.Position+FAudioCodec.SampleCount*2 <= Wav.Size then
      Wav.GetBuffer(Buffer,FAudioCodec.SampleCount*2)
    Else
    Begin
      if Assigned(FEventHandler) then FEventHandler.OnStopPlaying(Self);
      SetEvent(FStopPlayingEvent);
    end;
  end;
  FillChar(FRtpPacketToSend.Payload,SizeOf(FRtpPacketToSend.Payload),0);
  If not GetEnableAudioIn And not Assigned(Wav) then Move(CNG,Buffer^,SizeOf(CNG));
  BeforeEncode(Buffer);
  FRtpPacketPayloadSize:=FAudioCodec.Encode(Buffer,@FRtpPacketToSend.Payload[0]);
  Inc(FRtpSeqNo);
  Inc(FTimeStamp,FAudioCodec.SampleCount);
  if FOnHold then FRtpPacketToSend.H.Byte80:=0;
end;

procedure TCall.BeforeEncode(Buffer: Pointer);
Begin
  FConfLock.Enter;
  try
    if Assigned(FConference) then FConference.OnSend(Self,Buffer);
  Finally
    FConfLock.Leave;
  end;
  FRecLock.Enter;
  try
    if Assigned(FRecorder) then FRecorder.OnSend(Buffer);
  Finally
    FRecLock.Leave;
  End;
end;

procedure TCall.BeforePlay(Buffer: Pointer);
Begin
  FConfLock.Enter;
  try
    if Assigned(FConference) then FConference.OnRecv(Self,Buffer);
  Finally
    FConfLock.Leave;
  end;
  FRecLock.Enter;
  Try
    if Assigned(FRecorder) then FRecorder.OnRecv(Buffer);
  Finally
    FRecLock.Leave;
  end;
end;

procedure TCall.SendUdp(var Buf; Size: Integer);
Begin
  FSocketLock.Enter;
  Try
    If Assigned(FUdpSocket) then FUdpSocket.Send(FRemoteRtpAddress,FRemoteRtpPort,@Buf,Size);
  Finally
    FSocketLock.Leave;
  end;
end;

function TCall.GetNumberToTransfer: AnsiString;
Begin
  Result:=FNumberToTransfer;
end;

procedure TCall.SetNumberToTransfer(const Value: AnsiString);
Begin
  FNumberToTransfer:=Value;
end;

function TCall.GetTag: Integer;
Begin
  Result:=FTag;
end;

procedure TCall.SetTag(Value: Integer);
Begin
  FTag:=Value;
end;

function TCall.GetSilenceSec: Integer;
Begin
  Result:=FSilenceSec;
end;

procedure TCall.SetSilenceSec(Value: Integer);
Begin
  FSilenceSec:=Value;
end;

function TCall.GetLastStatus: Integer;
Begin
  Result:=FLastStatus;
end;

function TCall.GetLine_Ref: Integer;
Begin
  Result:=Fline_ref;
end;

procedure TCall.SetLastStatus(Value: Integer);
Begin
  FLastStatus:=Value;
end;

procedure TCall.SetLine_Ref(Value: Integer);
Begin
  Fline_ref:=Value;
end;

function TCall.GetReason: AnsiString;
Begin
  Result:=FReason;
end;

procedure TCall.SetReason(Const Value: AnsiString);
Begin
  FReason:=Value;
end;

procedure TCall.OnReceiveAudio (const IP: AnsiString; Port: Integer; Buffer: Pointer; Size: Integer);
var
  RTP:TRTP;
Begin
  if Size>0 Then
  Begin
    if Size>SizeOf(RTP) then Size:=SizeOf(RTP);
    FillChar(RTP,SizeOf(RTP),0);
    Move(Buffer^,RTP,Size);
    if (RTP.H.PayloadType and Not $80)=101 Then
    Begin
      if not FPrev101 and (RTP.Payload[1] and $80 = 0) then HandleDTMF(dtran[RTP.Payload[0]]);
      FPrev101:=(RTP.Payload[1] and $80)=0;
    end
    else ProcessAudioRtpPacket(RTP,Size);
  end;
end;

procedure TCall.ProcessAudioRtpPacket (RTP: TRTP; Size: Integer);
var
  PayloadSize: Integer;
  Audio: TPcmBuffer;
  AudioSize: Integer;
  PCM: array[0..159] of Byte;
  i: Integer;
  s: AnsiString;
  CodecID: Integer;
  TmpSpeaker: ISipSpeaker;
  currTime: Cardinal;

  function WordWrap (w: Word): Word;
  Begin
    // convert to network byte order (Big Endian)
    Result:=(w Shr 8) or (w shl 8 AND $FF00);
  end;

Begin
  CodecID:=RTP.H.PayloadType and Not $80;
  if CodecID in [0,3,8] Then
    If FAudioCodec.GetId <> CodecID Then FAudioCodec:=CreateAudioCodec(CodecID);
  if Assigned(FAudioCodec) and (FAudioCodec.GetId = CodecID) then
  Begin
    PayloadSize:=Size-SizeOf(TRTPHeader);
    If (RTP.H.Byte80 and $20)<>0 then Dec(PayloadSize,Byte(RTP.Payload[PayloadSize-1]));
    AudioSize:=FAudioCodec.Decode(@RTP.Payload[0],@Audio[1],PayloadSize);
    FInBuffer.PutBuffer(@Audio[1],AudioSize,WordWrap(RTP.H.SeqNo));
    if AudioSize >= SizeOf(PCM) then
    Begin
      for i:=Low(PCM) to High(PCM) Do
        PCM[i]:=Audio[i] shr 9;
      s:=DetectDtmf(@Audio[1]);
      if s<>'' Then
      Begin
        currTime:=timeGetTime;
        if (FDtmf<>'')and(Copy(FDtmf,Length(FDtmf),1)<>s) then FDtmf:='';
        FDtmf:=FDtmf+s;
        if Length(FDtmf)>4 then
        Begin
          If Abs(currTime - FDTMFMSec) < 250 then
          Begin
            FDtmf:='';
            FDTMFMSec:=currTime;
          End
          Else
          Begin
            HandleDTMF(s);
            FDTMFMSec:=currTime;
            FDtmf:='';
          end;
        end;
      end
      Else
      Begin
        FDtmf:='';
        if decode_silence(@PCM[0],FSilenceThreshold) then
        Begin
          if timeGetTime - FSilenceSec >= FSilenceTimeout Then
          Begin
            If GetState = csActive then HandleSilence;
            FSilenceSec:=timeGetTime;
          end;
        end
        Else FSilenceSec:=timeGetTime;
      end;
    end;
    TmpSpeaker:=GetSpeaker;
    if not Assigned(TmpSpeaker) then Exit;
    while TmpSpeaker.BuffersAvailable do
    begin
      if not FInBuffer.GetBuffer(@Audio[1],AudioSize) then Break;
      if not GetEnableAudioOut then FillChar(Audio,SizeOf(Audio),0);
      BeforePlay(@Audio[1]);
      TmpSpeaker.Play(@Audio[1],AudioSize);
    end;
  end;
end;

{ TJitterBuffer }

procedure TJitterBuffer.PutBuffer (Buffer: Pointer; Size: Integer; SeqNo: Integer);
var
  MinSeqNo: Integer;
  Count: Integer;
  Index: Integer;
  MinVal: Integer;
  i: Integer;
  duplicate: Boolean;
Begin
  FSize:=Size;
  if (SeqNo < FLastSeqNo)and(FLastSeqNo-SeqNo > 10) then
  Begin
    FLastSeqNo:=0;
    FillChar(FPackets,SizeOf(FPackets),0);
    FPackets[0].Size:=Size;
    FPackets[0].SeqNo:=SeqNo;
    Move(Buffer^,FPackets[0].Buffer,Size);
  end
  else if SeqNo > FLastSeqNo then
  Begin
    Count:=GetCount;
    if FLastSeqNo=0 then FLastSeqNo:=SeqNo-1;
    if Count>0 then
    Begin
      MinSeqNo:=GetMin;
      MinVal:=SeqNo-3;
      for i:=Low(FPackets) to High(FPackets) Do
        if FPackets[i].SeqNo < MinVal then
        Begin
          FPackets[i].Size:=0;
          FPackets[i].SeqNo:=0;
        end;
      If MinVal-1 > FLastSeqNo then FLastSeqNo:=MinVal-1;
      Count:=GetCount;
      if Count=Length(FPackets) then
      Begin
        duplicate:=False;
        for i:=Low(FPackets) to High(FPackets) do
          if FPackets[i].SeqNo = SeqNo then
          Begin
            duplicate:=True;
            Break;
          end;
        if not duplicate Then
        Begin
          Index:=GetIndex(MinSeqNo);
          FPackets[Index].Size:=Size;
          FPackets[Index].SeqNo:=SeqNo;
          Move(Buffer^,FPackets[Index].Buffer,Size);
        end;
      end
      else
      Begin
        duplicate:=False;
        for i:=Low(FPackets) to High(FPackets) do
          if FPackets[i].SeqNo = SeqNo then
          Begin
            duplicate:=True;
            Break;
          end;
        if not duplicate Then
          For i:=Low(FPackets) to High(FPackets) do
            If FPackets[i].Size<>0 then
            Begin
              FPackets[i].Size:=Size;
              FPackets[i].SeqNo:=SeqNo;
              Move(Buffer^,FPackets[i].Buffer,Size);
              Break;
            end;
      end;
    end
    else
    Begin
      FPackets[0].Size:=Size;
      FPackets[0].SeqNo:=SeqNo;
      Move(Buffer^,FPackets[0].Buffer,Size);
      if SeqNo-4 > FLastSeqNo then FLastSeqNo:=SeqNo-4;
    end;
  end;
end;

function TJitterBuffer.GetBuffer (Buffer: Pointer; var Size: Integer): Boolean;
var
  MinSeqNo, Index, Count: Integer;
Begin
  Count:=GetCount;
  if Count>0 Then
  Begin
    MinSeqNo:=GetMin;
    if (Count = Length(FPackets)) or (FLastSeqNo=0) or (FLastSeqNo+1 = MinSeqNo) then
    Begin
      Index:=GetIndex(MinSeqNo);
      Size:=FPackets[Index].Size;
      Move(FPackets[Index].Buffer,Buffer^,Size);
      FPackets[Index].Size:=0;
      FLastSeqNo:=MinSeqNo;
      Result:=True;
    end
    Else Result:=False;
  end
  else Result:=False;
end;

function TJitterBuffer.GetIndex (SeqNo: Integer): Integer;
Begin
  if FPackets[0].SeqNo=SeqNo then Result:=0
  Else if FPackets[1].SeqNo=SeqNo then Result:=1
  else if FPackets[2].SeqNo=SeqNo then Result:=2
  else Result:=3;
end;

Function TJitterBuffer.GetCount:Integer;
var
  i:Integer;
Begin
  Result:=0;
  for i:=Low(FPackets) to High(FPackets) do
    if FPackets[i].Size<>0 then Inc(Result);
end;

Function TJitterBuffer.GetMin:Integer;
var
  i:Integer;
Begin
  Result:=0;
  for i:=Low(FPackets) to High(FPackets) do
    if FPackets[i].Size<>0 Then
      if (FPackets[i].SeqNo < Result) or (Result=0) then
        Result:=FPackets[i].SeqNo;
end;

constructor TJitterBuffer.Create;
Begin
  Inherited;
  FLastSeqNo:=0;
  FillChar(FPackets,SizeOf(FPackets),0); // needless
end;

{ TCall }

procedure TCall.SetSpeaker(Const Value: ISipSpeaker);
Begin
  FSpeakerLock.Enter;
  try
    FSpeaker:=Value;
  Finally
    FSpeakerLock.Leave;
  End;
end;

function TCall.GetMicrophone: ISipMicrophone;
Begin
  FMicrophoneLock.Enter;
  try
    Result:=FMicrophone;
  Finally
    FMicrophoneLock.Leave;
  end;
end;

procedure TCall.SetMicrophone(const Value: ISipMicrophone);
Begin
  FMicrophoneLock.Enter;
  Try
    FMicrophone:=Value;
  Finally
    FMicrophoneLock.Leave;
  end;
end;

function TCall.GetConnectEvent: THandle;
Begin
  Result:=FConnectEvent;
end;

function TCall.GetDisconnectEvent: THandle;
Begin
  Result:=FDisconnectEvent;
end;

function TCall.GetDtmfEvent: THandle;
Begin
  Result:=FDtmfEvent;
end;

Function TCall.GetRingBackEvent:THandle;
Begin
  Result:=FRingBackEvent;
end;

Function TCall.GetSilenceEvent:THandle;
Begin
  Result:=FSilenceEvent;
end;

function TCall.GetStopPlayingEvent: THandle;
Begin
  Result:=FStopPlayingEvent;
end;

Function TCall.GetUserInput:AnsiString;
Begin
  FUserInputLock.Enter;
  Try
    Result:=FUserInput;
  Finally
    FUserInputLock.Leave;
  end;
end;

Procedure TCall.SetUserInput(Const Value:AnsiString);
Begin
  FUserInputLock.Enter;
  Try
    FUserInput:=Value;
  Finally
    FUserInputLock.Leave;
  end;
end;

end.
