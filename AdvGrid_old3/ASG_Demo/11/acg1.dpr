program acg1;

uses
  Forms,
  Uacg1 in 'Uacg1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
