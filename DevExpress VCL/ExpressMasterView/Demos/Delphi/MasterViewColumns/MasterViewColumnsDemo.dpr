program MasterViewColumnsDemo;

uses
  Forms,
  main in 'main.pas' {fmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressMasterView - ColumnsDemo';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
