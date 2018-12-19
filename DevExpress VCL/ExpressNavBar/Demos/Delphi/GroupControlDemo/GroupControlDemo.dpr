program GroupControlDemo;

uses
  Forms,
  GroupControlMain in 'GroupControlMain.pas' {fmGroupControlMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmGroupControlMain, fmGroupControlMain);
  Application.Run;
end.
