unit UDP;

interface

uses Windows, Forms, Messages, SysUtils, Classes, SyncObjs, IPutils;

type
  TOnReceive = procedure (const IP: AnsiString; Port: Integer; Buffer: Pointer; Size: Integer) of object;
  TOnKeepAliveTimer = procedure of object;

  TUdpSocket = class (TThread)
  private
    FWnd: THandle;
    FSocket: TSocket;
    FOnReceive: TOnReceive;
    FOnKeepAliveTimer: TOnKeepAliveTimer;
    procedure WndProc(var Msg: TMessage);
  protected
    procedure Execute; override;
  public
    constructor Create (ALocalPort: Integer;
      AOnReceive: TOnReceive;
      AOnKeepAliveTimer: TOnKeepAliveTimer = Nil);
    destructor Destroy; override;
    procedure Send(const IP: AnsiString; Port: Integer; Buffer: Pointer; Size: Integer);
  end;

implementation

const
  WM_UDP = WM_USER + 1;
  WM_KEEP_ALIVE = WM_USER + 2;

procedure TUdpSocket.Execute;
var
  Msg: TMsg;
  Buf: array[0..4095] of Byte;
  Size: Integer;
  IP: AnsiString;
  Port: Integer;
  Event: THandle;
  KeepTimer: Integer;
begin
  FWnd:=AllocateHWnd(WndProc);
  KeepTimer:=0;
  Event:=CreateEvent(Nil,True,False,Nil);
  if Assigned(FOnKeepAliveTimer) then KeepTimer:=SetTimer(FWnd,KeepTimer,10000,Nil);
  Try
    if WSAAsyncSelect(FSocket,FWnd,WM_UDP,1)=-1 then
      Raise Exception.Create('WSAAsyncSelect failed');
    while not Terminated do
    try
      MsgWaitForMultipleObjects(1,Event,False,100,255);
      If Not Terminated and PeekMessage(Msg,FWnd,0,0,PM_REMOVE) then
      begin
        if Msg.message = WM_UDP then
        Begin
          Size:=0;
          RecvUdpBuf(FSocket,Buf,SizeOf(Buf),IP,Port,Size);
          if (Size>0) and Assigned(FOnReceive) then FOnReceive(IP,Port,@Buf[0],Size);
        end
        else if Msg.message = WM_TIMER then
        Begin
          if Assigned(FOnKeepaliveTimer) then FOnKeepAliveTimer;
        end
      End
      else if not Terminated then // can be optimized - with PeekMessage in internal IF
        DispatchMessage(Msg);
    Except
    end;
  Finally
    if Assigned(FOnKeepAliveTimer) then KillTimer(FWnd,KeepTimer);
    DeallocateHWnd(FWnd);
    CloseHandle(Event);
  End;
end;

procedure TUdpSocket.WndProc (var Msg: TMessage);
Begin
  DefWindowProc(FWnd,Msg.Msg,Msg.WParam,Msg.LParam);
end;

constructor TUdpSocket.Create (ALocalPort: Integer;
  AOnReceive: TOnReceive;
  AOnKeepAliveTimer: TOnKeepAliveTimer = Nil);
Begin
  Inherited Create(True);
  FOnReceive:=AOnReceive;
  Priority:=tpTimeCritical;
  FreeOnTerminate:=False;
  FOnKeepAliveTimer:=AOnKeepAliveTimer;
  FSocket:=CreateSocket(ALocalPort);
  Resume;
end;

Destructor TUdpSocket.Destroy;
Begin
  Terminate;
  PostMessage(FWnd,WM_USER,0,0);
  WaitFor;
  closesocket(FSocket);
  Inherited;
end;

procedure TUdpSocket.Send (const IP: AnsiString; Port: Integer; Buffer: Pointer; Size: Integer);
Begin
  SendUdpBuf(FSocket,Buffer^,Size,IP,Port);
end;

var
  WSAData: TWSAData;

Initialization
  WSAStartup(MakeWord(2,2),WSAData);
    
end.