unit IPutils;

interface

uses Windows, SysUtils;

const
  MAX_INTERFACE_NAME_LEN = 256; // MPRAPI.H
  IPRTRMGR_PID = 10000;
  ANY_SIZE = 1;

  MAX_ADAPTER_DESCRIPTION_LENGTH = 128;
  MAX_ADAPTER_NAME_LENGTH        = 256;
  MAX_ADAPTER_ADDRESS_LENGTH     = 8;
  DEFAULT_MINIMUM_ENTITIES       = 32;
  MAX_HOSTNAME_LEN               = 128;
  MAX_DOMAIN_NAME_LEN            = 128;
  MAX_SCOPE_ID_LEN               = 256;
  MAX_ADAPTER_NAME               = 128;

  AF_INET = 2;
  SOCK_DGRAM = 2;
  WSA_FLAG_OVERLAPPED = 1;

  SOL_SOCKET    = $FFFF;
  SO_SNDBUF     = $1001;
  SO_REUSEADDR  = $04;
  SO_RCVBUF     = $1002;

  INADDR_ANY  = $00;
  INADDR_NONE = $FFFFFFFF;

  SOCKET_ERROR = -1;
  INVALID_SOCKET = $FFFFFFFF;

  FD_READ  = 1;
  FD_WRITE = 2;

  WSADESCRIPTION_LEN = 256;
  WSASYS_STATUS_LEN  = 128;
  WSAEWOULDBLOCK     = 10035;

  MAX_PROTOCOL_CHAIN = 7;
  WSAPROTOCOL_LEN    = 255;
  WINSOCK2_DLL = 'WS2_32.DLL';
  IPHLP_DLL = 'iphlpapi.dll';

type

  IP_ADDRESS_STRING = packed record
    S: array [0..15] of AnsiChar;
  end;
  IP_MASK_STRING = IP_ADDRESS_STRING;

  time_t = Longint;

  MIB_IPADDRROW = packed record
    dwAddr: DWORD;
    dwIndex: DWORD;
    dwMask: DWORD;
    dwBCastAddr: DWORD;
    dwReasmSize: DWORD;
    unused1: Word;
    unused2: Word;
  end;

  PMIB_IPADDRTABLE = ^MIB_IPADDRTABLE;
  MIB_IPADDRTABLE = record
    dwNumEntries: DWORD;
    table: array [0..ANY_SIZE - 1] of MIB_IPADDRROW;
  end;

  TSocket = LongWord;
  GROUP = DWORD;

  SunB = packed record
    s_b1: Byte;
    s_b2: Byte;
    s_b3: Byte;
    s_b4: Byte;
  end;

  SunW = packed record
    s_w1: Word;
    s_w2: Word;
  end;

  PInAddr = ^TInAddr;
  TInAddr = record
    case Integer of
     0: (S_un_b: SunB);
     1: (S_un_w: SunW);
     2: (S_addr: DWORD)
  end;

  PSockAddr = ^TSockAddr;
  TSockAddr = record
    case Integer of
     0: (sin_family: Word;
       sin_port: Word;
       sin_addr: TInAddr;
       sin_zero: array[0..7] of AnsiChar);
     1: (sa_family: Word;
       sa_data: array[0..13] of AnsiChar)
  end;

  TWSAData = record
    wVersion: Word;
    wHighVersion: Word;
    szDescription: array[0..256] of AnsiChar;
    szSystemStatus: array[0..128] of AnsiChar;
    iMaxSockets: Word;
    iMaxUdpDg: Word;
    lpVendorInfo: PAnsiChar;
  end;

  PPInAddr = ^PInAddr;

  PHostEnt = ^THostEnt;
  THostEnt = record
    h_name: PAnsiChar;
    h_aliases: ^PAnsiChar;
    h_addrtype: Smallint;
    h_length: Smallint;
    case Integer of
     0: (h_address_list: PPInAddr);
     1: (h_addr: PPInAddr)
  end;


function GetIpAddrTable(pIpAddrTable: PMIB_IPADDRTABLE; var pdwSize: ULONG; bOrder: BOOL): DWORD; stdcall; external IPHLP_DLL;
function GetNumberOfInterfaces(var pdwNumIf: DWORD): DWORD; stdcall; external IPHLP_DLL;
function GetBestInterface(dwDestAddr: Cardinal; var pdwBestIfIndex: DWORD): DWORD; stdcall; external IPHLP_DLL;

function WSASocketA( af, iType, protocol : Integer; lpProtocolInfo : Pointer; g : GROUP; dwFlags : DWORD ): TSocket; Stdcall; external WINSOCK2_DLL;
function setsockopt( const s: TSocket; const level, optname: Integer; optval: PAnsiChar; const optlen: Integer ): Integer; Stdcall; external WINSOCK2_DLL;
function htons(hostshort: Word): Word; Stdcall; external WINSOCK2_DLL;
function htonl(hostlong: DWORD): DWORD; Stdcall; external WINSOCK2_DLL;
function bind( const s: TSocket; const name: PSockAddr; const namelen: Integer ): Integer; Stdcall; external WINSOCK2_DLL;
function closesocket( const s: TSocket ): Integer; Stdcall; external WINSOCK2_DLL;
function sendto( const s: TSocket; var Buf; const len, flags: Integer; const addrto: PSockAddr; const tolen: Integer): Integer; Stdcall; external WINSOCK2_DLL;
function inet_addr(cp: PAnsiChar): DWORD; Stdcall; external WINSOCK2_DLL;
function recvfrom( const s: TSocket; var Buf; len, flags: Integer; from: PSockAddr; fromlen: PInteger ): Integer; Stdcall; external WINSOCK2_DLL;
function WSAStartup( const wVersionRequired: word; var WSData: TWSAData ): Integer; Stdcall; external WINSOCK2_DLL;
function gethostname( name: PAnsiChar; len: Integer ): Integer; Stdcall; external WINSOCK2_DLL;
function gethostbyname( name: PAnsiChar ): PHostEnt; Stdcall; external WINSOCK2_DLL;
function inet_ntoa(inaddr: TInAddr): PChar; Stdcall; external WINSOCK2_DLL;
function WSAAsyncSelect( const s: TSocket; HWindow: HWND; wMsg: DWORD; lEvent: Longint ): Integer; Stdcall; external WINSOCK2_DLL;

function CreateSocket(const ALocalPort: Integer): TSocket;
function RecvUdpBuf(const Socket: TSocket; var Buf; Size: Integer; var IP: Ansistring; var Port: Integer; var BufSize: Integer): Boolean;
function SendUdpBuf(const Socket: TSocket; var Buf; Size: Integer; IP: Ansistring; Port: Integer): Boolean;
function GetDefaultLocalIP: AnsiString;
function GetBestLocalIP (Const ServerIP: AnsiString): AnsiString;
function HostToIP(Name: Ansistring): AnsiString;
function HostToIP1(Name: Ansistring): AnsiString;

implementation

function CreateSocket(const ALocalPort: Integer): TSocket;
const
  Reuse: Boolean = True;
  BufSize: Integer = 4096;
var
  service: TSockAddr;
begin
  Result := WSASocketA(AF_INET, SOCK_DGRAM, 0, nil, 0, WSA_FLAG_OVERLAPPED);
  if Result = INVALID_SOCKET then
    raise Exception.Create('WSASocket failed');
  if setsockopt(Result, SOL_SOCKET, SO_REUSEADDR, @Reuse, SizeOf(Reuse)) <> 0 then
    raise Exception.Create('setsockopt failed');
  if setsockopt(Result, SOL_SOCKET, SO_RCVBUF, @BufSize, sizeof(BufSize)) <> 0 then
    raise Exception.Create('setsockopt failed');
  if setsockopt(Result, SOL_SOCKET, SO_SNDBUF, @BufSize, sizeof(BufSize)) <> 0 then
    raise Exception.Create('setsockopt failed');
  service.sin_family := AF_INET;
  service.sin_port := htons(ALocalPort);
  service.sin_addr.s_addr := htonl(INADDR_ANY);
  if bind(Result, @service, SizeOf(service)) = SOCKET_ERROR then
  begin
    closesocket(Result);
    raise Exception.Create('bind failed');
  end;
end;

function RecvUdpBuf(const Socket: TSocket; var Buf; Size: Integer; var IP: string; var Port: Integer; var BufSize: Integer): Boolean;
var
  Remote: TSockAddr;
  ret, fromlen: Integer;
  ErrorCode: Integer;
begin
  Result:= False;
  BufSize := 0;
  Remote.sin_family := AF_INET;
  Remote.sin_addr.S_addr := htonl(INADDR_ANY);
  Remote.sin_port := htons(INADDR_ANY);
  fromlen := SizeOf(Remote);

  ret := recvfrom(Socket, Buf, Size, 0, @Remote, @fromlen);

  if ret > 0 then BufSize := ret;
  if ret = SOCKET_ERROR then
  begin
    ErrorCode := GetLastError;
    if ErrorCode <> WSAEWOULDBLOCK then
    begin
      if ErrorCode <> 0 then
        raise Exception.Create('Socket error.');
    end;
  end
  else Result:= True;
end;

function SendUdpBuf(const Socket: TSocket; var Buf; Size: Integer; IP: Ansistring; Port: Integer): Boolean;
var
  ret, ErrorCode: Integer;
  Remote: TSockAddr;
begin
  Result := False;
  if (IP = '0.0.0.0')or(IP='') then Exit;
  if Socket = INVALID_SOCKET then Exit;

  Remote.sin_family := AF_INET;
  Remote.sin_port := htons(Port);
  Remote.sin_addr.S_addr := inet_addr(PChar(IP));

  if Remote.sin_addr.S_addr = INADDR_NONE then
    raise Exception.Create('IP address is incorrect');

  ret := sendto(Socket, Buf, Size, 0, @Remote, SizeOf(Remote));
  if ret = SOCKET_ERROR then
  begin
    ErrorCode := GetLastError;
    if ErrorCode <> WSAEWOULDBLOCK then
    begin
      if ErrorCode <> 0 then
        raise Exception.Create('Socket error.');
    end;
  end
  else Result:= True;
end;

function GetDefaultLocalIP: AnsiString;
var
  Host_p: PHostEnt;
  IPv4_pc: PAnsiChar;
  Pos_p: PPInAddr;
  Host_ac: array[0..255] of AnsiChar;
begin
  gethostname(Host_ac,SizeOf(Host_ac));
  Host_p:=gethostbyname(Host_ac);
  Pos_p:=Host_p.h_address_list;
  while Assigned(Pos_p^) Do
  Begin
    IPv4_pc := inet_ntoa(Pos_p^^);
    Result:=AnsiString(string(IPv4_pc));
    if Result<>'127.0.0.1' then Break;
    Inc(Pos_p);
  end;
end;

Function GetBestLocalIP(const ServerIP: AnsiString):AnsiString;
var
  num: DWORD;
  idx: DWORD;
  BufLen: DWORD;
  Buf: AnsiString;
  P: PMIB_IPADDRTABLE;
  i: Integer;
  addr: PInAddr;
  iaddr: Cardinal;
  saddr: AnsiString;
Begin
  num:=0;
  BufLen:=0;
  if (GetNumberOfInterfaces(num)=0)and(num>1) then
  Begin
    saddr:=ServerIP;
    iaddr:=inet_addr(PAnsiChar(saddr));
    if GetBestInterface(iaddr,idx)=0 then
      if GetIpAddrTable(Nil,BufLen,False)=ERROR_INSUFFICIENT_BUFFER then
      Begin
        SetLength(Buf,BufLen);
        P:=@Buf[1];
        If GetIpAddrTable(P,BufLen,False)=0 Then
          for i:=0 to P.dwNumEntries-1 do
            if P.table[i].dwIndex = idx then
            Begin
              addr:=@P.table[i].dwAddr;
              Result:=Format('%d.%d.%d.%d',[addr.S_un_b.s_b1, addr.S_un_b.s_b2, addr.S_un_b.s_b3, addr.S_un_b.s_b4]);
              Break;
            end;
      end;
  end;
  if (Length(Result)=0)or(Result='127.0.0.1') then
    Result:=string(GetDefaultLocalIP); // needless conversion
end;

function HostToIP(Name: Ansistring): AnsiString;
var
  wsdata : TWSAData;
  hostName : array [0..255] of AnsiChar;
  hostEnt : PHostEnt;
  addr : PInAddr;
begin
  Result := Name;
  WSAStartup ($0101, wsdata);
  gethostname(hostName, sizeof (hostName));
  StrPCopy(hostName, Name);
  hostEnt := gethostbyname (hostName);
  if Assigned (hostEnt) then
    if Assigned (hostEnt^.h_address_list) then
    begin
      addr := hostEnt^.h_addr^;
      if Assigned(addr) then
        Result := Format ('%d.%d.%d.%d', [addr.S_un_b.s_b1, addr.S_un_b.s_b2, addr.S_un_b.s_b3, addr.S_un_b.s_b4]);
    end;
end;

function HostToIP1(Name: Ansistring): AnsiString;
var
  wsdata : TWSAData;
  hostName : array [0..255] of AnsiChar;
  hostEnt : PHostEnt;
  addr : PInAddr;
begin
  Result := '';
  WSAStartup ($0101, wsdata);
  gethostname(hostName, sizeof (hostName));
  StrPCopy(hostName, Name);
  hostEnt := gethostbyname (hostName);
  if Assigned (hostEnt) then
    if Assigned (hostEnt^.h_address_list) then
    begin
      addr := hostEnt^.h_addr^;
      if Assigned(addr) then
        Result := Format ('%d.%d.%d.%d', [addr.S_un_b.s_b1, addr.S_un_b.s_b2, addr.S_un_b.s_b3, addr.S_un_b.s_b4]);
    end;
end;

end.
