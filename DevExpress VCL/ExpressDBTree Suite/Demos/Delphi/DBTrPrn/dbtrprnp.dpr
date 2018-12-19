program dbtrprnp;

uses
  Forms,
  main in 'main.pas' {FMain},
  dbtreeqr in 'dbtreeqr.pas' {QRListForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TQRListForm, QRListForm);
  Application.Run;
end.
