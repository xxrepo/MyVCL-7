unit SIP;

{$I sipcompilers.inc}

interface

uses Windows, SipInts;

const
  BASE_RTP_PORT: Integer = 22000;

function CreateSipEngine(LocalPort: Integer): ISipEngine;

implementation

uses Messages, SysUtils, Classes, WavFiles, IPutils, Codecs, DTMF, DateUtils, MMSystem,
  Call, SipMessage, SipRequests, Account, Calls, Accounts, GUIDs, Conference, UDP, SyncObjs;

type

  TSipEngine = class(TInterfacedObject, ISipEngine)
  private
    FCodecs: TList;
    FUdpSocket: TUdpSocket;
    FActive: Boolean;
    FLocalPort: Integer;
    FFreeSipEvent: THandle;
    FAccounts: TSipAccounts;
    FCalls: TSipCalls;
    FRegSeqNo: Integer;
    FUsedPorts: TList;
    FUsedPortsLock: TCriticalSection;
    FEventHandlerLock: TCriticalSection;
    FRtpPortMin: Integer;
    FRtpPortMax: Integer;
    FSilenceThreshold: Integer;
    FSilenceTimeout: Integer;
    FEventHandler: ISipEventHandler;
    function GetLocalPort: Integer;
    function GetRtpPortMin: Integer;
    procedure SetRtpPortMin(Value: Integer);
    function GetRtpPortMax: Integer;
    procedure SetRtpPortMax(Value: Integer);
    procedure SetLocalPort(Value: Integer);
    Procedure OnReceive(const IP:AnsiString; Port:Integer; Buffer:Pointer; Size:Integer);
    procedure OnKeepAlive;
  protected
    Function GetEventHandler: ISipEventHandler;
    procedure SetEventHandler(const Value: ISipEventHandler);
    procedure SetCodecs(const codecs:Array of Integer);
    procedure CheckRegistrations;
    procedure PlayText(const Call: ISipCall; const Text: AnsiString; VoiceIndex:Integer);
    function GetSilenceThreshold: Integer;
    procedure SetSilenceThreshold(Value: Integer);
    function GetSilenceTimeout: Integer;
    procedure SetSilenceTimeout(Value: Integer);
    procedure HangUp(const Call: ISipCall);
    procedure Hold(const Call: ISipCall);
    procedure UnHold(const Call: ISipCall);
    procedure TransferCall(const Call: ISipCall; const PhoneNumber: AnsiString);
    procedure AutTransferCall(const Call: ISipCall; const PhoneNumber: AnsiString);
    procedure Answer(const Call: ISipCall);
    procedure SendBusy(const Call: ISipCall);
    procedure SendByeMessage(const Call: ISipCall);
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    procedure SendBuf(var Buf; Size: Integer; IP: Ansistring; Port: Integer);
    procedure SendString(Text, IP: AnsiString; Port: Integer);
    function AddAccount(const Stun, Server, User, Password, Proxy: AnsiString): ISipAccount;
    procedure ConnectAccount(const Account: ISipAccount);
    procedure SendTextMessage(const Account: ISipAccount; const PhoneNumber,Text: AnsiString);
    procedure SendAutTextMessage(const M: TSipMessage; const Account: ISipAccount; const PhoneNumber: AnsiString);
    procedure RegisterAccount(const Account: ISipAccount);
    procedure Disconnect(const Account: ISipAccount);
    function FindAccountByUser(const User, Server: AnsiString): ISipAccount;
    function FindCall(const CallID: AnsiString): ISipCall;
    procedure RemoveCall(const Call: ISipCall);
    function FindAccount(const CallID: AnsiString): ISipAccount;
    function MakeCall(const AAccount: ISipAccount; const AUser: AnsiString; AWaveInDevice, AWaveOutDevice: Cardinal): ISipCall;
    procedure AutInvite(const Call: ISipCall);
    procedure Invite(const Call: ISipCall);
    procedure SendRinging(const Call: ISipCall; M:TSipMessage);
    procedure SendTrying(const Call: ISipCall; M:TSipMessage);
    procedure SendByeOk(const Call: ISipCall; M:TSipMessage);
    procedure SendDtmfInfo(const Call: ISipCall; const Digit:AnsiString);
    procedure SendLogMessage(Text:AnsiString);
    procedure HandleMessage(const M: TSipMessage);
    procedure PlayWavFile(const Call: ISipCall; FileName: AnsiString); overload;
    procedure SetDtmfCode(const Call: ISipCall; DtmfCode: AnsiString);
    function GetNextSeqNo: Integer;
    function GetCodecsCount: Integer;
    function GetCodecId(Index:Integer):Integer;
    procedure HandleCallMessage(const Call:ISipCall; const M: TSipMessage);
    function GetCodecs: AnsiString;
    function GetNextRtpPort:Integer;
  public
    constructor Create(ALocalPort: Integer);
    destructor Destroy; override;
    procedure AutRegister(const Account: ISipAccount; Expires: Integer);
    property Active: Boolean read GetActive write SetActive;
    property LocalPort: Integer read GetLocalPort write SetLocalPort;
  end;

Procedure TSipEngine.CheckRegistrations;
var
  i: Integer;
  A: ISipAccount;
  C: ISipCall;
  D,N,R: TDateTime;
  Handler: ISipEventHandler;
Begin
  FAccounts.Lock;
  Try
    for i:=0 To FAccounts.Count-1 Do
    Begin
      A:=FAccounts[i];
      if Assigned(A) then
      begin
        A.Lock;
        try
          case A.State of
          rsConnected:
            begin
              if IncSecond(A.RegistrationTime, 600) < Now then
                ConnectAccount(A);
            end;
          rsStunRequest:
            begin
              if IncSecond(A.RegistrationTime, 3) > Now then
                ConnectAccount(A);
            end;
          rsConnecting, rsAutConnecting:
            begin
              R := A.RegistrationTime;
              N := Now;
              D := IncSecond(R, 20);
              if D < N then
              Begin
                A.State := rsDisconnected;
                Handler:=GetEventHandler;
                if Assigned(Handler) then Handler.OnAccountUnregistered(A);
              End;
            end;
          rsDisconnecting:
            begin
              R:=A.RegistrationTime;
              N := Now;
              D := IncSecond(R, 20);
              if D < N then
              Begin
                A.State := rsDisconnected;
                Handler:=GetEventHandler;
                if Assigned(Handler) then Handler.OnAccountUnregistered(A);
              End;
            end;
          end;
        finally
          A.Unlock;
        end;
      end;
    end;
  finally
    FAccounts.Unlock;
  end;
  FCalls.Lock;
  try
    for i := 0 to FCalls.Count - 1 do
    begin
      C := FCalls[i];
      if C.State in [csConnecting, csAutConnecting, csRinging] then
        if IncSecond(C.CallTime, 120) < Now then
        begin
          C.State := csInactive;
          C.Reason:='408';
          RemoveCall(C);
        end;
    end;
  finally
    FCalls.Unlock;
  end;
end;

procedure TSipEngine.SetCodecs(const codecs:Array of Integer);
var
  i:Integer;
Begin
  FCodecs.Clear;
  for i:=0 to Length(Codecs)-1 Do // High() should be used
    if CodecRegistered(Codecs[i]) then FCodecs.Add(Pointer(Codecs[i]));
end;

constructor TSipEngine.Create(ALocalPort: Integer);
begin
  inherited Create;
  FUsedPorts:=TList.Create;
  FUsedPortsLock:=TCriticalSection.Create;
  FEventHandlerLock:=TCriticalSection.Create;
  FSilenceThreshold:=800;
  FSilenceTimeout := 5000;

  FCodecs := TList.Create;
  // 0 = PCM u-Law / 8000
  // 8 = PCM a-Law / 8000
  // 3 = GSM / 8000
  // 110 = Speex
  SetCodecs([0,8,3,110]);

  FRtpPortMin := BASE_RTP_PORT;
  FRtpPortMax := BASE_RTP_PORT + 2000;
  FRegSeqNo := 0;
  FFreeSipEvent := CreateEvent(nil, True, True, nil);
  FAccounts := TSipAccounts.Create;

  FCalls := TSipCalls.Create;
  FLocalPort := ALocalPort;
  FActive := False;
  FUdpSocket:= Nil;
end;

function TSipEngine.GetSilenceThreshold: Integer;
begin
  Result := InterlockedExchange(FSilenceThreshold, FSilenceThreshold);
end;

procedure TSipEngine.SetSilenceThreshold(Value: Integer);
begin
  InterlockedExchange(FSilenceThreshold, Value);
end;

function TSipEngine.GetNextRtpPort: Integer;
Var
  current, up, down: Integer;
  found: Boolean;
begin
  found:=True;
  Result:=Random((FRtpPortMax-FRtpPortMin) div 2 -1)*2 + FRtpPortMin;
  FUsedPortsLock.Enter;
  Try
    If FUsedPorts.IndexOf(Pointer(Result))<>-1 then
    Begin
      found:=False;
      up:=FRtpPortMax-Result;
      down:=Result-FRtpPortMin;
      if up > down then
      Begin
        current:=Result;
        While FRtpPortMax >= Result do
        Begin
          Inc(Result,2);
          If FUsedPorts.IndexOf(Pointer(Result))=-1 Then
          Begin
            found:=True;
            Break;
          end;
        end;
        if not found then
        Begin
          Result:=current;
          while FRtpPortMin <= Result Do
          Begin
            Dec(Result,2);
            If FUsedPorts.IndexOf(Pointer(Result))=-1 then
            Begin
              found:=True;
              Break;
            end;
          end;
        end;
      end;
    end;
    if found then FUsedPorts.Add(Pointer(Result))
      else Raise Exception.Create('No local UDP port numbers available.');
  Finally
    FUsedPortsLock.Leave;
  end;
end;

destructor TSipEngine.Destroy;
begin
  Active:=False;
  CloseHandle(FFreeSipEvent);
  FUsedPortsLock.Free;
  FEventHandlerLock.Free;
  FUsedPorts.Free;
  FCalls.Free;
  FAccounts.Free;
  FCodecs.Free;
  inherited;
end;

procedure TSipEngine.RemoveCall(const Call: ISipCall);
var
  Flag: Boolean;
  idx: Integer;
begin
  Call.Lock;
  try
    Flag:= Call.Active and (Call.State <> csInactive);
  Finally
    Call.Unlock;
  end;
  if Flag then
  begin
    HangUp(Call);
    Sleep(100);
  end;
  Call.Lock;
  try
    if Call.Active Then
    Begin
      if Call.Active Then Call.Active:=False; // can be optimized
      if Call.State <> csInactive then Call.State := csInactive;
    end;
  Finally
    Call.Unlock;
  end;
  FCalls.DelCall(Call);
  FUsedPortsLock.Enter;
  try
    idx:=FUsedPorts.IndexOf(Pointer(Call.LocalRtpPort));
    if idx>=0 then FUsedPorts.Delete(idx);
  Finally
    FUsedPortsLock.Leave;
  end;
end;

function TSipEngine.FindCall(const CallID: AnsiString): ISipCall;
var
  i: Integer;
begin
  Result := nil;
  FCalls.Lock;
  try
    for i := 0 to FCalls.Count - 1 do
      if FCalls[i].CallID = CallID  then
      begin
        Result := FCalls[i];
        break;
      end;
  finally
    FCalls.Unlock;
  end;
end;

function TSipEngine.GetActive: Boolean;
begin
  Result := FActive;
end;

function TSipEngine.GetLocalPort: Integer;
begin
  Result := FLocalPort;
end;

procedure TSipEngine.SetLocalPort(Value: Integer);
begin
  FLocalPort := Value;
end;

function TSipEngine.GetRtpPortMin: Integer;
begin
  Result := FRtpPortMin;
end;

procedure TSipEngine.SetRtpPortMin(Value: Integer);
begin
  FRtpPortMin := Value;
{  if FNextRtpPort < FRtpPortMin then
    FNextRtpPort := FRtpPortMin;}
end;

function TSipEngine.GetRtpPortMax: Integer;
begin
  Result := FRtpPortMax;
end;

procedure TSipEngine.SetRtpPortMax(Value: Integer);
begin
  FRtpPortMax := Value;
{  if FNextRtpPort > FRtpPortMax then
    FNextRtpPort := FRtpPortMin;}
end;

procedure TSipEngine.SetActive(Value: Boolean);
var
  i: Integer;
begin
  if Value then
  begin
    if FActive then raise Exception.Create('Already active');
    FActive := Value;
    FUdpSocket:=TUdpSocket.Create(FLocalPort,OnReceive,OnKeepAlive);
  end
  else
  begin
    FCalls.Lock;
    try
      for i := 0 to FCalls.Count - 1 do
        if FCalls[i].State = csActive then
        begin
          HangUp(FCalls[i]);
          Sleep(100);
        end;
    finally
      FCalls.Unlock;
    end;

    FAccounts.Lock;
    try
      for i := 0 to FAccounts.Count - 1 do
      begin
        if FAccounts[i].State = rsConnected then
        begin
          Disconnect(FAccounts[i]);
          Sleep(100);
        end;
      end;
      FAccounts.Clear;
    finally
      FAccounts.Unlock;
    end;
    FCalls.Clear;
    FActive := Value;
    FreeAndNil(FUdpSocket);
  end;
end;

procedure TSipEngine.SendBuf(var Buf; Size: Integer; IP: Ansistring; Port: Integer);
begin
  if Assigned(FUdpSocket) then FUdpSocket.Send(IP,Port,@Buf,Size);
end;

procedure TSipEngine.SendString(Text, IP: AnsiString; Port: Integer);
begin
  SendBuf(Text[1],Length(Text),IP,Port);
end;

function TSipEngine.MakeCall(const AAccount: ISipAccount;
  const AUser: AnsiString; AWaveInDevice, AWaveOutDevice: Cardinal): ISipCall;
var
  s: AnsiString;
begin
  Result := TCall.Create(AAccount, '', GetEventHandler);
  Result.AudioInDeviceID := AWaveInDevice;
  Result.AudioOutDeviceID := AWaveOutDevice;
  Result.ContactServerIP := AAccount.ServerIP;
  Result.CallType := ctOutgoing;
  Result.SilenceTimeout := FSilenceTimeout;
  Result.SilenceThreshold := FSilenceThreshold;
  Result.LocalRtpPort := GetNextRtpPort;
  Result.RemoteUser:=AUser;
  Result.LocalSeqNum:=GetNextSeqNo;
  if pos('@',AUser)=0 then Result.RemoteURI:='sip:'+AUser+'@'+AAccount.Server
    else Result.RemoteURI:='sip:'+AUser;
  Result.LocalURI:='sip:'+AAccount.User+'@'+AAccount.Server;
  FCalls.AddCall(Result);
  Result.Lock;
  try
    s:=GetInviteRequest(Result,GetCodecs);
    Result.State := csConnecting;
    SendString(s, Result.Account.ServerIP, Result.Account.ServerPort);
  finally
    Result.Unlock;
  end;
end;

procedure TSipEngine.AutInvite(const Call: ISipCall);
var
  s: AnsiString;
begin
  if not FActive then raise Exception.Create('not active');
  Call.LocalSeqNum:=GetNextSeqNo;
  s := GetAutInviteRequest(Call,GetCodecs);
  SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);
end;

procedure TSipEngine.Invite(const Call: ISipCall);
var
  s:AnsiString;
Begin
  if not FActive then raise Exception.Create('not active');
  Call.LocalSeqNum:=GetNextSeqNo;
  s := GetInviteRequest(Call,GetCodecs);
  SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);
end;

procedure TSipEngine.TransferCall(const Call: ISipCall; const PhoneNumber: AnsiString);
var
  s: AnsiString;
begin
  Call.Lock;
  try
    If (Call.CallType = ctIncoming) And (Call.State = csRinging) then
    begin
      SendString(GetRedirectResponse(Call,PhoneNumber), Call.Account.ServerIP, Call.Account.ServerPort);
      Call.State:=csInactive;
    end
    else
    Begin
      if not FActive then raise Exception.Create('not active');
      Call.NumberToTransfer := PhoneNumber;
      Call.State := csTransferring;
      Call.LocalSeqNum:=GetNextSeqNo;
      s := GetTransferRequest(Call, PhoneNumber);
      SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);
    End;
  finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.AutTransferCall(const Call: ISipCall; const PhoneNumber: AnsiString);
var
  s:AnsiString;
Begin
  Call.Lock;
  Try
    Call.State:=csAutTransferring;
    if not FActive then raise Exception.Create('not active');
    Call.LocalSeqNum:=GetNextSeqNo;
    s := GetAutTransferRequest(Call, PhoneNumber);
    SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);
  Finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.SendByeMessage(const Call: ISipCall);
var
  s: AnsiString;
begin
  SetEvent(Call.DisconnectEvent);
  if not (Call.State in [csActive, csHold]) then
  begin
    if Call.CallType = ctOutgoing then
    begin
      s := GetCancelRequest(Call);
      SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);
      Call.Active := False;
    end;
  end
  else
  begin
    Call.Branch:=GenerateBranch;
    Call.LocalSeqNum:=GetNextSeqNo;
    s := GetByeRequest(Call);
    SendString(s, Call.Account.ServerIP, Call.Account.ServerPort);    
  end;
end;

function TSipEngine.FindAccountByUser(const User, Server: String): ISipAccount;
begin
  Result := FAccounts.FindAccountByUser(User, Server);
end;
  
procedure TSipEngine.SendRinging(const Call: ISipCall; M:TSipMessage);
var
  ViaAddress: AnsiString;
  ViaPort: Integer;
begin
  ViaAddress:=M.ViaAddress;
  if Length(ViaAddress)=0 then ViaAddress:=Call.Account.ServerIP;
  ViaPort:=StrToIntDef(M.ViaPort,Call.Account.ServerPort);
  Call.FromAddr:=M.FromAddr;
  Call.ToAddr:=M.ToAddr;
  SendString(GetStatusResponse(M,'180 Ringing'), ViaAddress, ViaPort);
end;

procedure TSipEngine.SendBusy(const Call: ISipCall);
begin
  SendString(GetInviteErrorResponse(Call,'486 Busy here'),
    Call.Account.ServerIP, Call.Account.ServerPort);
end;

procedure TSipEngine.SendByeOk(const Call: ISipCall; M:TSipMessage);
var
  s: AnsiString;
  ViaAddress: AnsiString;
  ViaPort: Integer;
begin
  SetEvent(Call.DisconnectEvent);
  s:=GetStatusResponse(M,'200 OK');
  ViaAddress:=M.ViaAddress;
  if Length(ViaAddress)=0 then ViaAddress:=Call.Account.ServerIP;
  ViaPort:=StrToIntDef(M.ViaPort,Call.Account.ServerPort);
  SendString(s, ViaAddress, ViaPort);
end;

procedure TSipEngine.PlayWavFile(const Call: ISipCall; FileName: AnsiString);
var
  W: IWavFile;
begin
  W := TWavFile.Create(FileName);
  Call.Lock;
  try
    Call.PlayWavFile(W);
  finally
    Call.Unlock;
  end;
end;

function TSipEngine.GetCodecsCount: Integer;
begin
  Result := FCodecs.Count;
end;

function TSipEngine.GetNextSeqNo: Integer;
begin
  Result := InterlockedIncrement(FRegSeqNo);
end;

procedure TSipEngine.Answer(const Call: ISipCall);
begin
  Call.Lock;
  try
    SendString(GetInviteOkResponse(Call),Call.Account.ServerIP,Call.Account.ServerPort);
    Call.State :=csActive;
    Call.Active:=True;
  finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.HangUp(const Call: ISipCall);
begin
  Call.Lock;
  try
    SendByeMessage(Call);
  finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.Hold(const Call: ISipCall);
begin
  Call.Lock;
  try
    Call.OnHold := True;
    Call.SendRecv := 'sendonly';
    Call.SessionNo := Call.SessionNo + 1;
    Call.Branch := GenerateBranch;
    Call.State := csHold;
    If Call.AutResult<>'' Then AutInvite(Call)
      else Invite(Call);
  finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.UnHold(const Call: ISipCall);
begin
  Call.Lock;
  try
    Call.OnHold := False;
    Call.SendRecv := 'sendrecv';
    Call.SessionNo := Call.SessionNo + 1;
    Call.Branch := GenerateBranch;
    If Call.AutResult<>'' then AutInvite(Call)
      else Invite(Call);
    Call.State := csActive;
  finally
    Call.Unlock;
  end;
end;

procedure TSipEngine.HandleCallMessage(const Call: ISipCall; const M: TSipMessage);
var
  codec, i, j: Integer;
  Handler: ISipEventHandler;
begin
  Call.LastStatus:=StrToIntDef(M.Res,0);
  if (M.Res = '401') or
     (M.Res = '403') or
     (M.Res = '407') then // optimization - local Integer can be used
  begin
    SendString(GetAckResponse(M), Call.Account.ServerIP, Call.Account.ServerPort);
    if IntToStr(Call.LocalSeqNum) = M.CSeq then Call.AssignRouteSet(M);
    if (Call.State in [csHold, csConnecting]) and (M.Res <> '403')
      and (M.CSeq = IntToStr(Call.LocalSeqNum)) then // Integers should be preferred over Strings
    begin
      Call.AutResult := M.Res;
      Call.Opaque := M.Opaque;
      Call.State := csAutConnecting;
      Call.Qop := M.Qop;
      Call.Nonce := M.Nonce;
      Call.Realm := M.Realm;
      Call.Branch := GenerateBranch;
      AutInvite(Call);
    end
    else
    begin
      if M.CSeq = IntToStr(Call.LocalSeqNum) then
      begin
        SendString(GetAckResponse(M),Call.Account.ServerIP,Call.Account.ServerPort);
        if Call.Active then Call.Active := False;
        Call.SetState(csInactive);
        SetEvent(Call.DisconnectEvent);
        Call.Reason:=M.Res;
        RemoveCall(Call);
      end;
    end;
  end
  else If (M.Res='') Then
  Begin
    if Call.State in [csActive] Then
    Begin
      Call.Via:=M.Via;
      Call.AssignRouteSet(M);
      Call.RemoteTarget:=M.Contact;
      Call.LocalSeqNum:=StrToIntDef(M.CSeq,0);
      Call.RemoteSeqNum:=StrToIntDef(M.CSeq,0);
      Call.FromAddr:=M.FromAddr;
      Call.ToAddr:='To: <'+M.ToURI+'>';
      Call.RemoteRtpPort:=StrToIntDef(M.RtpPort,0);
      Call.RemoteRtpAddress:=M.RtpAddress;
      if M.GetRtpMapCount>0 Then
      Begin
        codec:=-1;
        for i:=0 to FCodecs.Count-1 Do
        Begin
          for j:=0 to M.GetRtpMapCount-1 Do
            If Integer(FCodecs[i]) = M.GetRtpMap(j) then
            Begin
              Codec:=Integer(FCodecs[i]);
              Break;
            end;
          if codec>=0 then Break;
        end;
        if not Assigned(Call.AudioCodec) or (Call.AudioCodec.GetId<>codec) Then
          Call.AudioCodec:=CreateAudioCodec(codec);
      end;
      if (Call.RemoteRtpPort<>0) and not Call.Active then Call.Active:=True;
      Call.SessionNo:=Call.SessionNo + 1;
      SendString(GetInviteOkResponse(Call),Call.Account.ServerIP,Call.Account.ServerPort);
    end;
  end
  else if (M.Res = '100') then
  begin
    if Call.State in [csConnecting, csAutConnecting] then
    begin
      Call.Via := M.Via;
    end;
  end
  else if (M.Res = '183') or (M.Res = '180') or (M.Res = '100') then
  begin
    if Call.State in [csConnecting, csAutConnecting, csRinging] then
    begin
      Call.State := csRinging;
      Call.Via := M.Via;
      Call.AssignRouteSet(M);
      Call.RemoteTarget:=M.Contact;
      Call.LocalSeqNum:=StrToIntDef(M.CSeq,1);
      Call.RemoteSeqNum:=0;
      Call.RemoteTag:=M.ToTag;
      Call.RemoteURI:=M.ToURI;
      Call.RemoteRtpPort:=StrToIntDef(M.RtpPort,0);
      Call.RemoteRtpAddress:=M.RtpAddress;
      if M.GetRtpMapCount>0 Then
      Begin
        codec:=-1;
        for i:=0 to FCodecs.Count-1 Do
        Begin
          for j:=0 to M.GetRtpMapCount-1 Do
            If Integer(FCodecs[i]) = M.GetRtpMap(j) then
            Begin
              Codec:=Integer(FCodecs[i]);
              Break;
            end;
          if codec>=0 then Break;
        end;
        if not Assigned(Call.AudioCodec) or (Call.AudioCodec.GetId<>codec) Then
          Call.AudioCodec:=CreateAudioCodec(codec);
      End;
      if Call.RemoteRtpPort <> 0 then
        if not Call.Active then Call.Active := True;
      if M.Res='180' Then
      Begin
        Handler:=GetEventHandler;
        if Assigned(Handler) Then Handler.OnRingBack(Call);
        PulseEvent(Call.RingBackEvent);
      end;
    end;
  end
  else if (M.Res = '200') then
  begin
    if Call.State in [csRinging, csConnecting, csAutConnecting, csActive, csHold] then
    begin
      if M.GetRtpMapCount>0 Then
      Begin
        codec:=-1;
        for i:=0 to FCodecs.Count-1 Do
        Begin
          for j:=0 to M.GetRtpMapCount-1 Do
            If Integer(FCodecs[i]) = M.GetRtpMap(j) then
            Begin
              Codec:=Integer(FCodecs[i]);
              Break;
            end;
          if codec>=0 then Break;
        end;
        if not Assigned(Call.AudioCodec) or (Call.AudioCodec.GetId<>codec) Then
          Call.AudioCodec:=CreateAudioCodec(codec);
      End;
      if (Length(Call.RemoteTag)=0) Then
        if Call.CallType=ctOutgoing Then Call.RemoteTag:=M.ToTag
          else Call.RemoteTag:=M.FromTag;
      if Call.State <> csHold then Call.State := csActive;
      Call.Via := M.Via;
      if Length(M.RecordRoute) > 0 then Call.AssignRouteSet(M);
      Call.ViaAddress:=M.ViaAddress;
      Call.ViaPort:=M.ViaPort;
      Call.RemoteTarget := M.Contact;
      if (M.ContactServer <> Call.Account.Server) and
        (M.ContactServer <> Call.Account.ServerIP) then
      begin
        Call.ContactServerIP := HostToIP1(M.ContactServer);
        if Length(Call.ContactServerIP) = 0 then
          Call.ContactServerIP := Call.Account.ServerIP
        else
          Call.ContactPort := M.ContactPort;
      end;
      if (Call.RemoteRtpPort <> StrToIntDef(M.RtpPort, 0))
        or (Call.RemoteRtpAddress <> M.RtpAddress) then
        if (Call.RemoteRtpAddress <> '0.0.0.0') and (M.RtpAddress <> '0.0.0.0')
          and (M.RtpAddress <> '') then
        begin
          if StrToIntDef(M.RtpPort, 0) <> 0 then
          begin
            if Call.Active then
            begin
              Call.Active := False;
              Call.RemoteRtpPort := StrToIntDef(M.RtpPort, 0);
              Call.RemoteRtpAddress := M.RtpAddress;
              Call.Active := True;
            end
            else
            begin
              Call.RemoteRtpPort := StrToIntDef(M.RtpPort, 0);
              Call.RemoteRtpAddress := M.RtpAddress;
              Call.Active := True;
            end;
            //AssignOutDevice(Call);
          end;
        end;
      SendString(GetInviteOkAckResponse(Call,M),Call.Account.ServerIP,Call.Account.ServerPort);
      Handler:=GetEventHandler;
      if Assigned(Handler) then Handler.OnConnect(Call);
      SetEvent(Call.ConnectEvent);
    end;
  end
  else
  if (Length(M.Res) = 3) and (StrToIntDef(copy(M.Res,1,1),5) > 2) and not (Call.State = csActive) then
  begin
    SendString(GetAckResponse(M), Call.Account.ServerIP, Call.Account.ServerPort);
    if Call.Active then Call.Active := False;
    Call.SetState(csInactive);
    Call.Reason:=M.Res;
    RemoveCall(Call);
  end
  else if copy(M.Res,1,1) <> '1' then
  begin
    if M.Res <> '' then SendString(GetAckResponse(M),Call.Account.ServerIP,Call.Account.ServerPort);
  end;
end;

function TSipEngine.AddAccount(const Stun, Server, User, Password, Proxy: AnsiString): ISipAccount;
var
  S:AnsiString;
  P:Integer;
begin
  S:=Server;
  P:=5060;
  if pos(':',Server)>0 Then
  Begin
    S:=Copy(Server,1,Pos(':',Server)-1);
    P:=StrToIntDef(Copy(Server,Pos(':',Server)+1,10),5060);
  end;
  Result := TAccount.Create(Stun,S,User,Password,Proxy);
  Result.ServerPort:=P;
  Result.LocalPort:=FLocalPort;
  FAccounts.AddAccount(Result);
end;

procedure TSipEngine.AutRegister(const Account: ISipAccount; Expires: Integer);
var
  s: String;
begin
  if not FActive then Exit;
  Account.Lock;
  try
    Account.Branch := GenerateBranch;
    Account.LocalSeqNum:=GetNextSeqNo;
    if Expires = 0 then
      s := GetAutUnRegisterRequest(Account)
    else
      s := GetAutRegisterRequest(Account);

    SendString(s, Account.ServerIP, Account.ServerPort);
  finally
    Account.Unlock;
  end;
end;

procedure TSipEngine.RegisterAccount(const Account: ISipAccount);
var
  s, id: AnsiString;
Begin
  Account.Lock;
  Try
    if Account.STUNIP = '' then
      if Account.STUN <> '' then
        Account.STUNIP := HostToIP1(Account.STUN);
    Account.LocalPort:=FLocalPort;
    If Account.STUNIP<>'' then
    Begin
      Account.RegistrationTime:=Now;
      Account.State:=rsStunRequest;
      id:=Account.CallID;
      id:=Copy(id,Length(id)-16,16);
      s:=#0#1#0#8 + id + #0#3#0#4#0#0#0#0;
      SendString(s,Account.STUNIP,3478);
    end
    Else ConnectAccount(Account);
  Finally
    Account.Unlock;
  end;
end;

procedure TSipEngine.ConnectAccount(const Account: ISipAccount);
var
  s: AnsiString;
begin
  If not FActive Then Raise Exception.Create('not active');
  Account.Lock;
  try
    Account.Branch:=GenerateBranch;
    Account.LocalSeqNum:=GetNextSeqNo;
    s:=GetRegisterRequest(Account);
    Account.RegistrationTime:=Now;
    Account.State:=rsConnecting;
    SendString(s,Account.ServerIP,Account.ServerPort);
  finally
    Account.Unlock;
  end;
end;

procedure TSipEngine.Disconnect(const Account: ISipAccount);
var
  s: AnsiString;
begin
  Account.Lock;
  try
    Account.Branch:=GenerateBranch;
    If not FActive Then Raise Exception.Create('not active'); // should be outside TRY-FINALLY
    Account.LocalSeqNum:=GetNextSeqNo;

    s := GetUnRegisterRequest( Account);

    Account.RegistrationTime := Now;
    Account.State := rsDisconnecting;
    SendString(s, Account.ServerIP, Account.ServerPort);
  finally
    Account.Unlock;
  end;
end;

function TSipEngine.GetSilenceTimeout: Integer;
begin
  Result := InterlockedExchange(FSilenceTimeout, FSilenceTimeout);
end;

procedure TSipEngine.SetSilenceTimeout(Value: Integer);
begin
  InterlockedExchange(FSilenceTimeout, Value);
end;

procedure TSipEngine.PlayText(const Call: ISipCall; const Text: AnsiString; VoiceIndex:Integer);
var
  W: IWavFile;
begin
  W := TWavStream.Create(Text,VoiceIndex);
  Call.PlayWavFile(W);
end;

function TSipEngine.FindAccount(const CallID: String): ISipAccount;
begin
  Result := FAccounts.FindAccount(CallID);
end;

procedure TSipEngine.SendTrying(const Call: ISipCall; M:TSipMessage);
var
  s: AnsiString;
  ViaAddress: AnsiString;
  ViaPort: Integer;
begin
  s:=GetStatusResponse(M,'100 Trying');
  ViaAddress:=M.ViaAddress;
  If Length(ViaAddress)=0 then ViaAddress:=Call.Account.ServerIP;
  ViaPort:=StrToIntDef(M.ViaPort,Call.Account.ServerPort);
  SendString(s, ViaAddress, ViaPort);
end;

procedure TSipEngine.SendTextMessage(const Account: ISipAccount; const PhoneNumber, Text: AnsiString);
var
  s: AnsiString;
begin
  if not FActive then raise Exception.Create('not active');
  Account.Lock;
  try
    Account.LocalSeqNum:=GetNextSeqNo;
    s := GetTextMessageRequest(Account, PhoneNumber, Text);
    Account.IMText := Text;
    SendString(s, Account.ServerIP, Account.ServerPort);
  finally
    Account.Unlock;
  end;
end;

procedure TSipEngine.SendAutTextMessage(const M: TSipMessage; const Account: ISipAccount; const PhoneNumber: AnsiString);
var
  s: AnsiString;
begin
  if not FActive then raise Exception.Create('not active');
  Account.Lock;
  try
    Account.LocalSeqNum:=GetNextSeqNo;

    s := GetAutTextMessageRequest(M, Account, PhoneNumber);
    Account.IMText := '';

    SendString(s, Account.ServerIP, Account.ServerPort);
  finally
    Account.Unlock;
  end;
end;

procedure TSipEngine.SendDtmfInfo(const Call: ISipCall; const Digit:AnsiString);
Begin
  Call.LocalSeqNum:=GetNextSeqNo;
  SendString(GetDtmfInfo(Call,Digit),Call.Account.ServerIP,Call.Account.ServerPort);
end;

procedure TSipEngine.SendLogMessage(Text:AnsiString);
var
  Handler: ISipEventHandler;
Begin
  Handler:=GetEventHandler;
  if Assigned(Handler) then Handler.OnLog(Text);
end;

procedure TSipEngine.HandleMessage(const M: TSipMessage);
var
  A: ISipAccount;
  C: ISipCall;
  spos: Integer;
  id, stundata, sgn: AnsiString;
  i, j, codec: Integer;
  Handler: ISipEventHandler;
Begin
  if M.Method = '' then
  begin
    stundata := M.Text;
    if copy(stundata,1,2) = #01#01 then
    begin
      id := copy(stundata,5,16);
      A := FindAccount(id);
      if Assigned(A) and (A.State = rsStunRequest) then
      begin
        spos := 21;
    //    while (spos+11) <= Length(stundata) do
        begin
          if copy(stundata, spos, 2) = #00#01 then
          begin
            A.MappedLocalIP := Format('%d.%d.%d.%d',[Byte(stundata[spos+8]),
                                               Byte(stundata[spos+9]),
                                               Byte(stundata[spos+10]),
                                               Byte(stundata[spos+11])]);
          end;
        end;
        ConnectAccount(A);
      end;
    end;
  end
  else if M.Method = 'CANCEL' then
  begin
    C := FindCall(M.CallID);
    if M.Res = '487' then
      SendString(GetAckResponse(M),c.Account.ServerIP,C.Account.ServerPort);
    if Assigned(C) Then // should be before SendString
    begin
      if M.Res = '200' then
      begin
        C.Lock;
        try
          C.SetState(csInactive);
        finally
          C.Unlock;
        end;
      end
      else if (M.Res = '')or(M.Res = '487') then
      begin
        C.Lock;
        try
          c.State:=csInactive;
          c.Reason:=M.Res;
          RemoveCall(C);
        Finally
          c.Unlock;
        end;
        if c.Active then c.Active:=False;
        SendString(GetStatusResponse(M,'200 OK'),c.Account.ServerIP,c.Account.ServerPort);
        SendString(GetInviteErrorResponse(C,'487 Request terminated'),c.Account.ServerIP,c.Account.ServerPort);
      end;
    end;
  end
  else if M.Method = 'REFER' Then
  Begin
    C:=FindCall(M.CallID);
    If Assigned(C) Then
    Begin
      if (M.Res='401')or(M.Res='403')or(M.Res='407') Then
      Begin
        SendString(GetAckResponse(M),c.Account.ServerIP,c.Account.ServerPort);
        if IntToStr(c.LocalSeqNum) = M.CSeq then c.AssignRouteSet(M);
        if c.State in [csTransferring] Then
        Begin
          c.AutResult:=M.Res;
          c.Opaque:=M.Opaque;
          c.State:=csAutConnecting;
          c.Qop:=M.Qop;
          c.Nonce:=M.Nonce;
          c.Realm:=M.Realm;
          c.Branch:=GenerateBranch;
          AutTransferCall(C,C.NumberToTransfer);
        end
        Else c.State:=csActive;
      end;
    end;
  end
  else if M.Method = 'INVITE' then
  begin
    FCalls.Lock;
    try
      C:=FindCall(M.CallID);
      If Assigned(C) And (M.Res = '487') then
          SendString(GetAckResponse(M),c.Account.ServerIP,C.Account.ServerPort);
      If Assigned(c) and (c.State in [csConnecting, csAutConnecting, csRinging, csActive, csHold]) Then
        HandleCallMessage(C,M)
      else if not Assigned(C) then
      begin
        A := FindAccountByUser(M.ToUser, M.FromServerName);
        if not Assigned(A) then
          A := FindAccountByUser(M.InviteUser, M.FromServerName);
        if Assigned(A) and (M.InviteUser <> '') then
        begin
          codec:=-1;
          for i:=0 to FCodecs.Count-1 Do
          Begin
            for j:=0 to M.GetRtpMapCount-1 Do
              If Integer(FCodecs[i]) = M.GetRtpMap(j) then
              Begin
                Codec:=Integer(FCodecs[i]);
                Break;
              end;
            if codec>=0 then Break;
          end;
          if (codec=-1)and(M.GetRtpMapCount=0) then codec:=Integer(FCodecs[0]);
          if codec=-1 then SendString(GetNotAcceptableResponse(M),a.ServerIP,a.ServerPort)
          Else
          Begin
            C := TCall.Create(A, M.CallID, GetEventHandler);
            C.Lock;
            try
              C.LocalRtpPort := GetNextRtpPort;
              C.ContactServerIP := A.ServerIP;
              C.RemoteRtpAddress := M.RtpAddress;
              C.RemoteRtpPort := StrToIntDef(M.RtpPort,0);
              C.SilenceTimeout := FSilenceTimeout;
              C.SilenceThreshold := FSilenceThreshold;
              c.FromAddr:=M.FromAddr;
              c.ToAddr:=M.ToAddr;
              c.LocalURI:=M.ToURI;
              c.RemoteURI:=M.FromURI;
              c.RemoteTag:=M.FromTag;
              c.AudioCodec:=CreateAudioCodec(codec);
              C.EnableAudioOut := True;
              C.EnableAudioIn := True;
              C.CallType := ctIncoming;
              C.Via := M.Via;
              c.ViaAddress:=M.ViaAddress;
              c.ViaPort:=M.ViaPort;
              C.RemoteSeqNum := StrToIntDef(M.CSeq,0);
              c.LocalSeqNum:=GetNextSeqNo;
              c.AssignRouteSet(M);
              C.RemoteTarget := M.Contact;
              c.RemoteTag:=M.FromTag;
              c.RemoteUser:=M.FromUser;
              C.Server := M.ToServer;
              C.ContactServerIP := HostToIP(M.ContactServer);
              C.ContactPort := M.ContactPort;
              FCalls.AddCall(C);
              SendTrying(C,M);
              SendRinging(C,M);
              Handler:=GetEventHandler;
              If Assigned(Handler) Then Handler.OnInvite(C)
                else SendBusy(C);
            finally
              C.Unlock;
            end;
          end;
        end;
      end;
    finally
      FCalls.Unlock;
    end;
  end
  else if M.Method = 'BYE' then
  begin
    C := FindCall(M.CallID);
    if Assigned(C) then
    begin
      C.Lock;
      try
        C.RemoteSeqNum := StrToIntDef(M.CSeq,0);
        if Length(M.Via) > 0 then C.Via := M.Via;
        C.SetState(csInactive);
        if M.Res = '' then SendByeOk(C,M);
      finally
        C.Unlock;
      end;
      c.Reason:=M.Res;
      RemoveCall(C);
    end;
  end
  else if M.Method = 'INFO' then
  begin
    C := FindCall(M.CallID);
    if Assigned(C) and (C.Account.State = rsConnected) then
    begin
      C.Lock;
      try
        C.RemoteSeqNum := StrToIntDef(M.CSeq,0);
        SendString(GetOkResponse(M),c.Account.ServerIP,c.Account.ServerPort);
        sgn := M.Signal;
        Case StrToIntDef(sgn,-1) Of
          0..9:; // needless
          10: sgn:='*';
          11: sgn:='#';
          12: sgn:='A';
          13: sgn:='B';
          14: sgn:='C';
          15: sgn:='D';
        end;
        if Length(sgn) = 1 then
        begin
          Handler:=GetEventHandler;
          If Assigned(Handler) then Handler.OnDtmf(C,sgn[1]);
          If sgn[1] in ['#','*','0'..'9'] then
          Begin
            c.UserInput:=c.UserInput+sgn[1];
            PulseEvent(c.DtmfEvent);
          End;
        end;
      finally
        C.Unlock;
      end;
    end;
  end
  else if M.Method = 'OPTIONS' then
  begin
    A := FindAccountByUser(M.ToUser, M.FromServerName);
    if Assigned(A) then
      SendString(GetOptionsOkResponse(M),a.ServerIP,a.ServerPort);
  end
  else if M.Method = 'MESSAGE' then
  begin
    if M.InviteUser <> '' then
    begin
      A := FindAccountByUser(M.InviteUser, M.FromServerName);
      if Assigned(A) then
        SendString(GetOkResponse(M),a.ServerIP,a.ServerPort);
    end
    else
    begin
      A := FindAccountByUser(M.ToUser, M.FromServerName);
      if Assigned(A) and (M.Res = '401') or (M.Res = '407') then
      begin
        if A.IMText <> '' then
          SendAutTextMessage(M, A, M.ToUser);
      end
      else
      begin
        A.Lock;
        try
          A.IMText := '';
        finally
          A.Unlock;
        end;
      end;
    end;
  end
  else if M.Method = 'NOTIFY' then
  begin
    A := FindAccountByUser(M.ToUser, M.ToServerName);
    if Assigned(A) then
    begin
      C := FindCall(M.CallID);
      if Assigned(C) and (C.State in [csTransferring,csAutTransferring]) then
      begin
        SendString(GetStatusResponse(M,'200 OK'),a.ServerIP,a.ServerPort);
        C.State := csActive;
        HangUp(C);
        C.SetState(csInactive);
        c.Reason:=M.Res;
        RemoveCall(C);
      end
      else
      begin
        A := FindAccountByUser(M.ToUser, M.ToServerName);
        if Assigned(A) then
          SendString(GetStatusResponse(M,'200 OK'),a.ServerIP,a.ServerPort);
      end;
    end;
  end
  else if M.Method = 'REGISTER' then
  begin
    A := FindAccount(M.CallID);
    if Assigned(A) then
    begin
      A.Lock;
      try
        case A.State of
          rsConnecting:
            begin
              if M.Res = '200' then
              begin
                Handler:=GetEventHandler;
                If Assigned(Handler) Then Handler.OnAccountRegistered(A);
                A.State := rsConnected;
                A.RemoteTag := M.ToTag;
              end
              else if (M.Res = '401') or (M.Res = '407') then
              begin
                A.State := rsAutConnecting;
                A.Res := M.Res;
                A.Opaque := M.Opaque;
                A.Qop := M.Qop;
                A.Nonce := M.Nonce;
                A.Realm := M.Realm;
                A.RPort := M.RPort;
                A.Tag := GenerateTag;
                AutRegister(A, A.Expires);
              end
              else if StrToIntDef(copy(M.Res,1,1),4) > 2 then
              begin
                A.State := rsDisconnected;
                Handler:=GetEventHandler;
                If Assigned(Handler) then Handler.OnAccountUnregistered(A);
              end;
            end;
          rsAutConnecting:
            begin
              if M.Res = '200' then
              begin
                A.State := rsConnected;
                Handler:=GetEventHandler;
                If Assigned(Handler) Then Handler.OnAccountRegistered(A);
                A.RemoteTag := M.ToTag;
              end
              else if StrToIntDef(copy(M.Res,1,1),3) > 2 then
                A.State := rsDisconnected;
            end;
          rsDisconnecting:
            begin
              if M.Res = '200' then
              begin
                //A.State := rsDisconnected;
                Handler:=GetEventHandler;
                if Assigned(Handler) then Handler.OnAccountUnregistered(A);
              end
              else if (M.Res = '401') or (M.Res = '407') then
              begin
                A.Res := M.Res;
                A.Opaque := M.Opaque;
                A.Qop := M.Qop;
                A.Nonce := M.Nonce;
                A.Realm := M.Realm;
                A.RPort := M.RPort;
                A.Tag := GenerateTag;
                A.State := rsAutDisconnecting;
                AutRegister(A, 0);
              end
              else if StrToIntDef(copy(M.Res,1,1),4) > 2 then
                A.State := rsDisconnected;
            end;
          rsAutDisconnecting:
            begin
              if M.Res = '200' then
                A.State := rsDisconnected
              else if StrToIntDef(copy(M.Res,1,1),3) > 2 then
                A.State := rsDisconnected;
              Handler:=GetEventHandler;
              if Assigned(Handler) then Handler.OnAccountUnregistered(A);
            end;
        end;
      finally
        A.Unlock;
      end;
    end;
  end;
end;

procedure TSipEngine.OnKeepAlive;
var
  i:Integer;
  s:AnsiString;
Begin
  s:=#13#10#13#10;
  FAccounts.Lock;
  try
    For i:=0 to FAccounts.Count-1 Do
      FUdpSocket.Send(FAccounts[i].ServerIP,FAccounts[i].ServerPort,@s[1],4);
  Finally
    FAccounts.Unlock;
  end;
end;

Procedure TSipEngine.OnReceive(const IP:AnsiString; Port:Integer; Buffer:Pointer; Size:Integer);
var
  M: TSipMessage;
  Packet: AnsiString;
Begin
  SetLength(Packet,Size);
  Move(Buffer^,Packet[1],Size);
  M:=TSipMessage.Create(Packet);
  try
    HandleMessage(M);
    SendLogMessage(M.Text);
  Finally
    M.Free;
  end;
end;

function CreateSipEngine(LocalPort: Integer): ISipEngine;
begin
  Result := TSipEngine.Create(LocalPort);
end;

procedure TSipEngine.SetDtmfCode(const Call: ISipCall; DtmfCode: AnsiString);
Begin
  Call.Lock;
  Try
    Call.SetDtmfCode(DtmfCode);
  Finally
    Call.Unlock;
  end;
end;

function TSipEngine.GetCodecId(Index:Integer):Integer;
Begin
  Result:=Integer(FCodecs[Index]);
end;

function TSipEngine.GetCodecs: AnsiString;
var
  i:Integer;
Begin
  Result:='';
  for i:=0 to FCodecs.Count-1 Do
    Result:=Result+IntToStr(GetCodecId(i))+' ';
  Result:=Trim(Result);
end;

Function TSipEngine.GetEventHandler: ISipEventHandler;
Begin
  FEventHandlerLock.Enter;
  Try
    Result:=FEventHandler;
  Finally
    FEventHandlerLock.Leave;
  End;
end;

procedure TSipEngine.SetEventHandler(const Value: ISipEventHandler);
Begin
  FEventHandlerLock.Enter;
  Try
    FEventHandler:=Value;
  Finally
    FEventHandlerLock.Leave;
  end;
end;

end.
