unit SimpleTabControlReg;

interface

procedure Register;

implementation
uses
  Classes, cxWebDsgnUtils, SimpleTabControl;

procedure Register;
begin
  cxRegisterWebComponents('Simple EWF Controls', [TcxWebSimpleTabControl]);
end;

end.
