library PrintCapabilities;

uses
  ComServ,
  Main in 'Main.pas',
  PrintCapabilities_TLB in 'PrintCapabilities_TLB.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
