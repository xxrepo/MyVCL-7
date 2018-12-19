program MsgReader;

uses
  Forms,
  Main in 'Main.pas' {Form2},
  E_STGSTR in 'E_STGSTR.PAS';

{$R *.res}

begin
  Application.Initialize;
 
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
