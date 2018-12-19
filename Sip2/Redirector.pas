unit Redirector;

{$I sipcompilers.inc}

interface

uses SyncObjs, SipInts, Classes, SysUtils, Messages, Windows;

type
  TAudioRedirector = class (TInterfacedObject, ISipSpeaker)
  private
    FCall: ISipCall;
  protected
    procedure Play (Buffer: Pointer; Size: Integer);
    function BuffersAvailable: Boolean;
  public
    constructor Create(const Call:ISipCall);
  end;

implementation

Function TAudioRedirector.BuffersAvailable:Boolean;
Begin
  Result:=True;
end;

Constructor TAudioRedirector.Create(const Call:ISipCall);
Begin
  Inherited Create;
  FCall:=Call;
  FCall.Microphone:=Nil;
end;

procedure TAudioRedirector.Play (Buffer: Pointer; Size: Integer);
Begin
  FCall.OnMicrophone(Buffer);
end;

end.