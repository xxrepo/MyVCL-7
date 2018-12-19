program AdvMemoSpellCheckDemo;

uses
  Forms,
  UAdvMemoSpellCheckDemo in 'UAdvMemoSpellCheckDemo.pas' {Form5};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
