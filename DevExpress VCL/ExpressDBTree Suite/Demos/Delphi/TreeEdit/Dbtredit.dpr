program dbtredit;

uses
  Forms,
  main in 'main.pas' {FMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
