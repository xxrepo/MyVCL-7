program SpellCheckDemo;

uses
  Forms,
  Uspellcheckdemo in 'Uspellcheckdemo.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
