unit SipInts;

interface

uses Windows, Classes, Messages, SipMessage;

type
  IInterface = IUnknown;

  TAccountState = (rsDisconnected, rsStunRequest, rsConnecting, rsAutConnecting,
                rsConnected, rsDisconnecting, rsAutDisconnecting);

  TCallState = (csInactive, csConnecting, csAutConnecting, csRinging, csActive,
                csDisconnecting, csAutDisconnecting, csHold, csTransferring,
                csAutTransferring);
  TCallType = (ctOutgoing, ctIncoming);

  ISipSpeaker = interface (IUnknown)
   ['{31DF5C0B-A734-4AC5-85EC-9E500B36976C}']
    procedure Play(Buffer: Pointer; Size: Integer);
    function BuffersAvailable: Boolean;
  end;

  ISipCall = interface;
  ISipMicrophone = interface (IUnknown)
   ['{598957E9-DE7B-4A25-BAD7-23811C5BBB96}']
    function GetCall: ISipCall;
    procedure SetCall(const Value: ISipCall);
    property Call:ISipCall read GetCall write SetCall;
  end;

  ISipConference = interface (IUnknown)
   ['{476B855C-8CF5-4C58-9469-21FEE19F3AD1}']
    procedure OnSend(const Call: ISipCall; Buffer: Pointer);
    procedure OnRecv(const Call: ISipCall; Buffer: Pointer);
  end;

  ISipRecorder = interface (IUnknown)
   ['{4DAED341-B93A-410E-A501-F2A6877E5BCA}']
    procedure OnSend(Buffer: Pointer);
    procedure OnRecv(Buffer: Pointer);
    procedure Clear;
    procedure SaveToStream(const Stream: TStream);
    procedure SaveToFile(const FileName: AnsiString);
  end;

  ISipAccount = interface (IUnknown)
   ['{A5EAB9F5-51F8-4114-BB3B-FE250FDC43DE}']
    function GetLocalURI: AnsiString;
    function GetLocalSeqNum: Integer;
    procedure SetLocalSeqNum(Value: Integer);
    function GetName: AnsiString;
    procedure SetName(const Value: AnsiString);
    function GetFormattedName: AnsiString;
    procedure Lock;
    procedure Unlock;
    function GetState: TAccountState;
    procedure SetState(Value: TAccountState);
    function GetServer: AnsiString;
    procedure SetServer(const Value: AnsiString);
    function GetProxy: AnsiString;
    procedure SetProxy(const Value: AnsiString);
    function GetSTUN: AnsiString;
    procedure SetSTUN(const Value: AnsiString);
    function GetUser: AnsiString;
    procedure SetUser(const Value: AnsiString);
    function GetPassword: AnsiString;
    procedure SetPassword(const Value: AnsiString);
    property STUN:AnsiString read GetSTUN write SetSTUN;
    property Server:AnsiString read GetServer write SetServer;
    property User:AnsiString read GetUser write SetUser;
    property Password:AnsiString read GetPassword write SetPassword;
    property State:TAccountState read GetState write SetState;
    function GetRPort: AnsiString;
    procedure SetRPort(const Value: AnsiString);
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
    function GetServerPort: Integer;
    procedure SetServerPort(Value: Integer);
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
    function GetIMText: AnsiString;
    procedure SetIMText(Value: AnsiString);
    procedure SetRegistrationTime(Value: TDateTime);
    function GetRegistrationTime: TDateTime;
    function GetBranch: AnsiString;
    procedure SetBranch(const Value: AnsiString);
    function GetCallID: AnsiString;
    procedure SetCallID(const Value: AnsiString);
    function GetServerIP: AnsiString;
    function GetExpires: Integer;
    procedure SetExpires(Value: Integer);
    property CallID:AnsiString read GetCallID write SetCallID;
    property ServerIP:AnsiString read GetServerIP;
    property ServerPort:Integer read GetServerPort write SetServerPort;
    property Branch:AnsiString read GetBranch write SetBranch;
    property RegistrationTime:TDateTime read GetRegistrationTime write SetRegistrationTime;
    property Realm:AnsiString read GetRealm write SetRealm;
    property Nonce:AnsiString read GetNonce write SetNonce;
    property CNonce:AnsiString read GetCNonce write SetCNonce;
    property Opaque:AnsiString read GetOpaque write SetOpaque;
    property Qop:AnsiString read GetQop write SetQop;
    property Res:AnsiString read GetRes write SetRes;
    property Tag:AnsiString read GetTag write SetTag;
    property RemoteTag:AnsiString read GetRemoteTag write SetRemoteTag;
    property LocalIP:AnsiString read GetLocalIP write SetLocalIP;
    property LocalPort:Integer read GetLocalPort write SetLocalPort;
    property STUNIP:AnsiString read GetSTUNIP write SetSTUNIP;
    property MappedLocalIP:AnsiString read GetMappedLocalIP write SetMappedLocalIP;
    property RPort:AnsiString read GetRPort write SetRPort;
    property IMText:AnsiString read GetIMText write SetIMText;
    property Expires:Integer read GetExpires write SetExpires;
    property Proxy:AnsiString read GetProxy write SetProxy;
    property Name:AnsiString read GetName write SetName;
    property FormattedName:AnsiString read GetFormattedName;
    property LocalSeqNum:Integer read GetLocalSeqNum write SetLocalSeqNum;
    property LocalURI:AnsiString read GetLocalURI;
  end;

  IAudioCodec = interface (IUnknown)
   ['{AC56E44F-AA24-4193-AC95-21C676B186A5}']
    function GetSampleCount: Integer;
    function GetId: Integer;
    function Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
    function Encode(const InBuf,OutBuf: Pointer): Integer;
    property SampleCount:Integer read GetSampleCount;
  end;

  IWavFile = interface (IUnknown)
   ['{20E97B52-F2E2-4704-B943-9D1419CECA64}']
    procedure SaveToFile(const FileName: AnsiString);
    function GetPosition: Integer;
    function GetSize: Integer;
    procedure SetPosition(Value: Integer);
    function GetBuffer(Buffer: PAnsiChar; BufLen: Integer): Integer;
    property Position:Integer read GetPosition write SetPosition;
    property Size:Integer read GetSize;
  end;

  ISipCall = interface (IUnknown)
   ['{D261C227-B7A8-4D38-A5C0-6EC371285AC6}']
    function GetUserInput: AnsiString;
    procedure SetUserInput(const Value: AnsiString);
    function GetRingBackEvent: THandle;
    function GetSilenceEvent: THandle;
    function GetDtmfEvent: THandle;
    function GetConnectEvent: THandle;
    function GetDisconnectEvent: THandle;
    function GetStopPlayingEvent: THandle;
    procedure OnMicrophone(Buffer: Pointer);
    function GetSpeaker: ISipSpeaker;
    procedure SetSpeaker(const Value: ISipSpeaker);
    function GetMicrophone: ISipMicrophone;
    procedure SetMicrophone(const Value: ISipMicrophone);
    function GetReason: AnsiString;
    procedure SetReason(const Value: AnsiString);
    function GetLastStatus: Integer;
    procedure SetLastStatus(Value: Integer);
    function GetLine_Ref: Integer;
    procedure SetLine_Ref(Value: Integer);
    function GetTag: Integer;
    procedure SetTag(Value: Integer);
    function GetNumberToTransfer: AnsiString;
    procedure SetNumberToTransfer(const Value: AnsiString);
    procedure BeforePlay(Buffer: Pointer);
    procedure HandleDTMF(const code: AnsiString);
    procedure HandleSilence;
    procedure SetConference(const Value: ISipConference);
    procedure SetRecorder(const Value: ISipRecorder);
    function GetRecorder: ISipRecorder;
    function GetRouteSetCount: Integer;
    function GetRemoteSeqNum: Integer;
    procedure SetRemoteSeqNum(Value: Integer);
    function GetLocalSeqNum: Integer;
    procedure SetLocalSeqNum(Value: Integer);
    function GetRemoteTarget: AnsiString;
    procedure SetRemoteTarget(const Value: AnsiString);
    function GetRemoteUser: AnsiString;
    procedure SetRemoteUser(const Value: AnsiString);
    function GetAutLine: AnsiString;
    procedure SetAutLine(const Value: AnsiString);
    function GetRoute: AnsiString;
    procedure AssignRouteSet(const M: TSipMessage);
    function GetFromAddr: AnsiString;
    procedure SetFromAddr(const Value: AnsiString);
    function GetToAddr: AnsiString;
    procedure SetToAddr(const Value: AnsiString);
    function GetSilenceTimeout: Integer;
    procedure SetSilenceTimeout(Value: Integer);
    function GetSilenceThreshold: Integer;
    procedure SetSilenceThreshold(Value: Integer);
    function GetSilenceSec: Integer;
    procedure SetSilenceSec(Value: Integer);
    function GetContactPort: AnsiString;
    procedure SetContactPort(const Value: AnsiString);
    function GetSendRecv: AnsiString;
    procedure SetSendRecv(const Value: AnsiString);
    function GetContactServerIP: AnsiString;
    procedure SetContactServerIP(const Value: AnsiString);
    function GetWavFile: IWavFile;
    procedure SetWavFile(const Value: IWavFile);
    procedure SetDtmfCode(const Value: AnsiString);
    function GetSessionNo: Integer;
    procedure SetSessionNo(Value: Integer);
    function GetSessionID: Integer;
    procedure SetSessionID(Value: Integer);
    function GetPrev101: Boolean;
    procedure SetPrev101(Value: Boolean);
    function GetCallTime: TDateTime;
    function GetAudioCodec: IAudioCodec;
    procedure SetAudioCodec(const Value: IAudioCodec);
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    function GetRecordRoute: AnsiString;
    function GetRouteRecord: AnsiString;
    function GetCallType: TCallType;
    procedure SetCallType(Value: TCallType);
    procedure Lock;
    procedure Unlock;
    function GetBranch: AnsiString;
    function GetVia: AnsiString;
    procedure SetVia(const Value: AnsiString);
    function GetViaAddress: AnsiString;
    procedure SetViaAddress(const Value: AnsiString);
    function GetViaPort: AnsiString;
    procedure SetViaPort(const Value: AnsiString);
    function GetAutResult: AnsiString;
    procedure SetAutResult(const Value: AnsiString);
    function GetLocalRtpPort: Integer;
    procedure SetLocalRtpPort(Value: Integer);
    function GetRemoteRtpPort: Integer;
    procedure SetRemoteRtpPort(Value: Integer);
    function GetRemoteRtpAddress: AnsiString;
    procedure SetRemoteRtpAddress(const Value: AnsiString);
    function GetCallID: AnsiString;
    function GetLocalTag: AnsiString;
    procedure SetLocalTag(const Value: AnsiString);
    function GetRemoteTag: AnsiString;
    procedure SetRemoteTag(const Value: AnsiString);
    procedure SetCallID(const Value: AnsiString);
    procedure SetBranch(const Value: AnsiString);
    function GetOnHold: Boolean;
    procedure SetOnHold(Value: Boolean);
    function GetState: TCallState;
    procedure SetState(Value: TCallState);
    function GetRemoteURI: AnsiString;
    procedure SetRemoteURI(const Value: AnsiString);
    function GetLocalURI: AnsiString;
    procedure SetLocalURI(const Value: AnsiString);
    function GetServer: AnsiString;
    procedure SetServer(const Value: AnsiString);
    function GetEnableAudioOut: Boolean;
    procedure SetEnableAudioOut(Value: Boolean);
    function GetAudioOutDeviceID: Integer;
    procedure SetAudioOutDeviceID(Value: Integer);
    function GetAudioInDeviceID: Integer;
    procedure SetAudioInDeviceID(Value: Integer);
    function GetEnableAudioIn: Boolean;
    procedure SetEnableAudioIn(Value: Boolean);
    function GetAccount: ISipAccount;
    procedure SetAccount(const Value: ISipAccount);
    function GetQop: AnsiString;
    procedure SetQop(const Value: AnsiString);
    function GetOpaque: AnsiString;
    procedure SetOpaque(const Value: AnsiString);
    function GetNonce: AnsiString;
    procedure SetNonce(const Value: AnsiString);
    function GetCNonce: AnsiString;
    procedure SetCNonce(const Value: AnsiString);
    function GetRealm: AnsiString;
    procedure PlayWavFile(const Value: IWavFile);
    procedure SetRealm(const Value: AnsiString);
    property Branch:AnsiString read GetBranch write SetBranch;
    property CallID:AnsiString read GetCallID write SetCallID;
    property LocalTag:AnsiString read GetLocalTag write SetLocalTag;
    property RemoteTag:AnsiString read GetRemoteTag write SetRemoteTag;
    property LocalRtpPort:Integer read GetLocalRtpPort write SetLocalRtpPort;
    property RemoteRtpPort:Integer read GetRemoteRtpPort write SetRemoteRtpPort;
    property RemoteRtpAddress:AnsiString read GetRemoteRtpAddress write SetRemoteRtpAddress;
    property Via:AnsiString read GetVia write SetVia;
    property ViaAddress:AnsiString read GetViaAddress write SetViaAddress;
    property ViaPort:AnsiString read GetViaPort write SetViaPort;
    property CallType:TCallType read GetCallType write SetCallType;
    property RecordRoute:AnsiString read GetRecordRoute;
    property RouteRecord:AnsiString read GetRouteRecord;
    property Active:Boolean read GetActive write SetActive;
    property AudioCodec:IAudioCodec read GetAudioCodec write SetAudioCodec;
    property CallTime:TDateTime read GetCallTime;
    property Prev101:Boolean read GetPrev101 write SetPrev101;
    property SessionNo:Integer read GetSessionNo write SetSessionNo;
    property SessionID:Integer read GetSessionID write SetSessionID;
    property WavFile:IWavFile read GetWavFile write SetWavFile;
    property ContactServerIP:AnsiString read GetContactServerIP write SetContactServerIP;
    property RemoteURI:AnsiString read GetRemoteURI write SetRemoteURI;
    property LocalURI:AnsiString read GetLocalURI write SetLocalURI;
    property Account:ISipAccount read GetAccount write SetAccount;
    property AudioOutDeviceID:Integer read GetAudioOutDeviceID write SetAudioOutDeviceID;
    property AudioInDeviceID:Integer read GetAudioInDeviceID write SetAudioInDeviceID;
    property EnableAudioOut:Boolean read GetEnableAudioOut write SetEnableAudioOut;
    property EnableAudioIn:Boolean read GetEnableAudioIn write SetEnableAudioIn;
    property State:TCallState read GetState write SetState;
    property OnHold:Boolean read GetOnHold write SetOnHold;
    property AutResult:AnsiString read GetAutResult write SetAutResult;
    property Qop:AnsiString read GetQop write SetQop;
    property Opaque:AnsiString read GetOpaque write SetOpaque;
    property Nonce:AnsiString read GetNonce write SetNonce;
    property CNonce:AnsiString read GetCNonce write SetCNonce;
    property Realm:AnsiString read GetRealm write SetRealm;
    property SendRecv:AnsiString read GetSendRecv write SetSendRecv;
    property ContactPort:AnsiString read GetContactPort write SetContactPort;
    property SilenceTimeout:Integer read GetSilenceTimeout write SetSilenceTimeout;
    property SilenceThreshold:Integer read GetSilenceThreshold write SetSilenceThreshold;
    property Server:AnsiString read GetServer write SetServer;
    property FromAddr:AnsiString read GetFromAddr write SetFromAddr;
    property ToAddr:AnsiString read GetToAddr write SetToAddr;
    property Route:AnsiString read GetRoute;
    property AutLine:AnsiString read GetAutLine write SetAutLine;
    property RemoteUser:AnsiString read GetRemoteUser write SetRemoteUser;
    property RemoteTarget:AnsiString read GetRemoteTarget write SetRemoteTarget;
    property LocalSeqNum:Integer read GetLocalSeqNum write SetLocalSeqNum;
    property RemoteSeqNum:Integer read GetRemoteSeqNum write SetRemoteSeqNum;
    property RouteSetCount:Integer read GetRouteSetCount;
    property Conference:ISipConference write SetConference;
    property Recorder:ISipRecorder read GetRecorder write SetRecorder;
    property NumberToTransfer:AnsiString read GetNumberToTransfer write SetNumberToTransfer;
    property Tag:Integer read GetTag write SetTag;
    property SilenceSec:Integer read GetSilenceSec write SetSilenceSec;
    property Line_Ref:Integer read GetLine_Ref write SetLine_Ref;
    property LastStatus:Integer read GetLastStatus write SetLastStatus;
    property Reason:AnsiString read GetReason write SetReason;
    property Speaker:ISipSpeaker read GetSpeaker write SetSpeaker;
    property Microphone:ISipMicrophone read GetMicrophone write SetMicrophone;
    property RingBackEvent:THandle read GetRingBackEvent;
    property SilenceEvent:THandle read GetSilenceEvent;
    property DtmfEvent:THandle read GetDtmfEvent;
    property ConnectEvent:THandle read GetConnectEvent;
    property DisconnectEvent:THandle read GetDisconnectEvent;
    property StopPlayingEvent:THandle read GetStopPlayingEvent;
    property UserInput:AnsiString read GetUserInput write SetUserInput;
  end;

  ISipEventHandler = Interface;
  ISipEngine = interface (IUnknown)
   ['{F91A4FC8-F998-4F37-83FD-F9C8E61A2B13}']
    function GetEventHandler: ISipEventHandler;
    procedure SetEventHandler(const Value: ISipEventHandler);
    procedure SetCodecs(const Codecs: array of Integer);
    function GetNextSeqNo: Integer;
    procedure SendDtmfInfo(const Call: ISipCall;const Digit: AnsiString);
    function GetSilenceThreshold: Integer;
    procedure SetSilenceThreshold(Value: Integer);
    function GetSilenceTimeout: Integer;
    procedure SetSilenceTimeout(Value: Integer);
    function GetCodecsCount: Integer;
    function GetCodecId(Index: Integer): Integer;
    procedure RemoveCall(const Call: ISipCall);
    function GetRtpPortMin: Integer;
    procedure SetRtpPortMin(Value: Integer);
    function GetRtpPortMax: Integer;
    procedure SetRtpPortMax(Value: Integer);
    function GetCodecs: AnsiString;
    procedure PlayWavFile(const Call: ISipCall; FileName: AnsiString);
    procedure PlayText(const Call: ISipCall; const Text: AnsiString; VoiceIndex: Integer);
    procedure SetDtmfCode(const Call: ISipCall; DtmfCode: AnsiString);
    procedure ConnectAccount(const Account: ISipAccount);
    procedure RegisterAccount(const Account: ISipAccount);
    procedure Disconnect(const Account: ISipAccount);
    procedure Answer(const Call: ISipCall);
    procedure SendBusy(const Call: ISipCall);
    procedure HangUp(const Call: ISipCall);
    procedure Hold(const Call: ISipCall);
    procedure UnHold(const Call: ISipCall);
    procedure TransferCall(const Call: ISipCall; const PhoneNumber: AnsiString);
    function GetLocalPort: Integer;
    procedure SetLocalPort(Value: Integer);
    function GetActive: Boolean;
    procedure SetActive(Value: Boolean);
    function AddAccount(const Stun,Server,User,Password,Proxy: AnsiString ): ISipAccount;
    function MakeCall(const Account: ISipAccount; const AUser: AnsiString;
      AWaveInDevice: Cardinal;
      AWaveOutDevice: Cardinal ): ISipCall;
    procedure SendBuf(var Buf; Size: Integer; IP: AnsiString; Port: Integer);
    function FindAccount(const CallID: AnsiString): ISipAccount;
    procedure SendTextMessage(const Account: ISipAccount; const PhoneNumber, Text: AnsiString);
    procedure CheckRegistrations;
    property SilenceThreshold:Integer read GetSilenceThreshold write SetSilenceThreshold;
    property SilenceTimeout:Integer read GetSilenceTimeout write SetSilenceTimeout;
    property LocalPort:Integer read GetLocalPort write SetLocalPort;
    property Active:Boolean read GetActive write SetActive;
    property RtpPortMin:Integer read GetRtpPortMin write SetRtpPortMin;
    property RtpPortMax:Integer read GetRtpPortMax write SetRtpPortMax;
    property EventHandler:ISipEventHandler read GetEventHandler write SetEventHandler;
  end;

  ISipEventHandler = interface (IUnknown)
   ['{9193C32F-FB98-4D57-AA81-9BB430673228}']
    procedure OnInvite(const Call: ISipCall);
    procedure OnRingBack(const Call: ISipCall);
    procedure OnSilence(const Call: ISipCall);
    procedure OnDtmf(const Call: ISipCall; const Code: AnsiChar);
    procedure OnConnect(const Call: ISipCall);
    procedure OnDisconnect(const Call: ISipCall);
    procedure OnStopPlaying(const Call: ISipCall);
    procedure OnAccountRegistered(const Account: ISipAccount);
    procedure OnAccountUnregistered(const Account: ISipAccount);
    procedure OnLog(const Text: AnsiString);
    procedure OnAudioOpen(const Call: ISipCall);
    procedure OnAudioClose(const Call: ISipCall);
  end;

implementation

end.
