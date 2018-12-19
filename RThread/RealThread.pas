unit RealThread;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

  const WM_ThreadProcExcMSG = WM_USER + 1567;
  const WM_ThreadFinishedMSG = WM_USER + 1568;

type
  TRealThreadPriorityClass= (pL1_IDLE, pL2_LOWEST, pL3_BELOW_NORMAL,
                             pL4_NORMAL,
                             pL5_ABOVE_NORMAL, pL6_HIGHEST, pL7_TIME_CRITICAL);
  TRealThreadState = (rtsNotUse, rtsRun, rtsExcepted, rtsFinished, rtsWaitForEnd, rtsPause, rtsTerminated, rtsTerminating);
  TRealThreadStates = set of TRealThreadState;
  TRealThreadProcEnd = procedure (Sender: TObject; ErrorInThreadProc : boolean) of object;
  TRealThreadThreadProcException = procedure (Sender: TObject; AMessage : String) of object;

  TRealThread = class(TComponent)
  private
    FHandleForMsg : HWND;
    FThreadProcedure : TNotifyEvent;
    FOnStart : TNotifyEvent;
    FOnEnd : TRealThreadProcEnd;
    FOnTerminate : TNotifyEvent;
    FOnPause : TNotifyEvent;
    FOnContinue : TNotifyEvent;
    FOnThreadProcException : TRealThreadThreadProcException;
    FHandle : THandle;
    FThreadID : THandle;
    FRealThreadState : TRealThreadStates;
    FPriorityClass: TRealThreadPriorityClass;

    function GetInUse: boolean;
    procedure NewWindowProc (var Msg: TMessage);
    procedure SetPriorityClass(const Value: TRealThreadPriorityClass);
  protected
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InUse : boolean read GetInUse;
    property Handle: THandle read FHandle;
    property ThreadID: THandle read FThreadID;

    procedure WaitForEnd;
    function Run : boolean;
    function Terminate : boolean;
    function Pause : boolean;
    function Continue : boolean;
    property RealThreadState : TRealThreadStates read FRealThreadState;
  published
    property PriorityClass : TRealThreadPriorityClass read FPriorityClass write FPriorityClass;
    property DoInThread : TNotifyEvent read FThreadProcedure write FThreadProcedure;
    property OnStart : TNotifyEvent read FOnStart write FOnStart;
    property OnEnd : TRealThreadProcEnd read FOnEnd write FOnEnd;
    property OnTerminate : TNotifyEvent read FOnTerminate write FOnTerminate;
    property OnPause : TNotifyEvent read FOnPause write FOnPause;
    property OnContinue : TNotifyEvent read FOnContinue write FOnContinue;
    property OnThreadProcException: TRealThreadThreadProcException read FOnThreadProcException write FOnThreadProcException;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Karaim compz', [TRealThread]);
end;

{ TRealThread }

function TRealThread.Continue : boolean;
begin
  Result := false;
  if not (rtsPause in FRealThreadState) then Exit;
  if Assigned(FOnContinue) then
    FOnContinue(Self);
  try
    ResumeThread(FHandle);
  except
    Exit;
  end;
  FRealThreadState := [rtsRun];
  Result := true;
end;

constructor TRealThread.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FRealThreadState := [rtsNotUse];
  FHandle := 0;
  FThreadID := 0;
  FPriorityClass := pL4_NORMAL;
  FHandleForMsg := AllocateHWnd(NewWindowProc);
end;

destructor TRealThread.Destroy;
begin
//  Terminate;
  CloseHandle(FHandle);
  DeallocateHWnd(FHandleForMsg);
  FHandle := 0;
  FThreadID := 0;
  inherited Destroy;
end;

function TRealThread.GetInUse: boolean;
begin
  if not (rtsNotUse in FRealThreadState) {WaitForSingleObject(FHandle, 1) = WAIT_TIMEOUT} then
    Result := true
  else
    Result := false;
end;

procedure TRealThread.NewWindowProc(var Msg: TMessage);
var Component : TRealThread;
begin
  if (Msg.Msg <> WM_ThreadProcExcMSG) and (Msg.Msg <> WM_ThreadFinishedMSG) then
  begin
    if Owner is TWinControl then
      DefWindowProc((Owner as TWinControl).Handle, Msg.Msg, Msg.wParam, Msg.lParam);
  end
  else
  begin
    Component := TRealThread(Msg.WParam);
    if Msg.Msg = WM_ThreadProcExcMSG then
    begin
      if Assigned(Component.OnThreadProcException) then
        Component.OnThreadProcException(Component as TObject, PChar(Msg.LParam));
    end
    else
    if Msg.Msg = WM_ThreadFinishedMSG then
    begin
      if Assigned(Component.OnEnd) then
        Component.OnEnd(Component as TObject, boolean(Msg.LParam));
    end;
  end;
end;

function TRealThread.Pause : boolean;
begin
  Result := false;
  if not ((rtsRun in FRealThreadState) or (rtsWaitForEnd in FRealThreadState)) then Exit;
  try
    SuspendThread(FHandle);
  except
    Exit;
  end;
  if Assigned(FOnPause) then
    FOnPause(Self);
  FRealThreadState := FRealThreadState + [rtsPause];
  Result := true;
end;

function TRealThread.Run : boolean;
  procedure ThreadPr (Param: Pointer); stdcall;
  var Component : TRealThread;
      MSG : TMessage;
      ErrorFlag : boolean;
  begin
    Component := TRealThread(Param);
    ErrorFlag := false;
    try
      if Assigned(Component.FThreadProcedure) then
        Component.FThreadProcedure(Component as TObject);
    except
      on E : Exception do
      begin
        Msg.Msg := WM_ThreadProcExcMSG;
        Msg.WParam := Integer(Param);
        Msg.LParam := Integer(PChar(E.Message));
        SendMessage(Component.FHandleForMsg, Msg.Msg, Msg.WParam, Msg.LParam);
        Component.FRealThreadState := [rtsExcepted];
        ErrorFlag := true;
      end;
    end;
    if not (rtsExcepted in Component.FRealThreadState) then
      Component.FRealThreadState := [rtsFinished] + [rtsNotUse]
    else
      Component.FRealThreadState := Component.FRealThreadState + [rtsFinished];
    Msg.Msg := WM_ThreadFinishedMSG;
    Msg.WParam := Integer(Param);
    Msg.LParam := Integer(ErrorFlag);
    SendMessage(Component.FHandleForMsg, Msg.Msg, Msg.WParam, Msg.LParam);
    CloseHandle(Component.FHandle);
    Component.FHandle := 0;
  end;
begin
  Result := false;
  if GetInUse then
    Exit;
  if Assigned(FThreadProcedure) then
  begin
    if Assigned(FOnStart) then
      FOnStart(Self);
      FHandle := CreateThread(nil, 0, @ThreadPr, Pointer(Self), 0, FThreadID);
      SetPriorityClass(PriorityClass);
  end;
  if (FHandle <> 0) and (FThreadID <> 0) then
  begin
    Result := true;
    FRealThreadState := [rtsRun];
  end;
end;

procedure TRealThread.SetPriorityClass(
  const Value: TRealThreadPriorityClass);
var PrKlass : integer;
begin
  FPriorityClass := Value;

  case FPriorityClass of
    pL1_IDLE : PrKlass := THREAD_PRIORITY_IDLE;
    pL2_LOWEST : PrKlass := THREAD_PRIORITY_LOWEST;
    pL3_BELOW_NORMAL : PrKlass := THREAD_PRIORITY_BELOW_NORMAL;
    pL4_NORMAL : PrKlass := THREAD_PRIORITY_NORMAL;
    pL5_ABOVE_NORMAL : PrKlass := THREAD_PRIORITY_ABOVE_NORMAL;
    pL6_HIGHEST : PrKlass := THREAD_PRIORITY_HIGHEST;
    pL7_TIME_CRITICAL : PrKlass := THREAD_PRIORITY_TIME_CRITICAL;
  end;
  SetThreadPriority(FHandle, PrKlass);
end;

function TRealThread.Terminate : boolean;
var t : bool;
begin
  Result := false;
  if not GetInUse then Exit;
  FRealThreadState := FRealThreadState + [rtsTerminating];
  t := TerminateThread(FHandle, 0);
  if not t then
    Exit;
  WaitForEnd;
 // while WaitForSingleObject(FHandle, 1) = WAIT_TIMEOUT do
 //   Application.ProcessMessages;
  if Assigned(FOnTerminate) then
    FOnTerminate(Self);

  CloseHandle(FHandle);
  FHandle := 0;
  FThreadID := 0;
  FRealThreadState := [rtsNotUse] + [rtsTerminated];
  if Assigned(FOnEnd) then
    FOnEnd(Self, false);
  Result := true;
end;

procedure TRealThread.WaitForEnd;
begin
  FRealThreadState := FRealThreadState + [rtsWaitForEnd];
  while WaitForSingleObject(FHandle, 1) = WAIT_TIMEOUT do
  begin
    Application.ProcessMessages;
  end;
  FRealThreadState := FRealThreadState + [rtsNotUse];
end;

end.

