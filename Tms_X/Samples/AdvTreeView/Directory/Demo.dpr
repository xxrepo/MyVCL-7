program Demo;

uses
  Vcl.Forms,
  UDemo in 'UDemo.pas' {Form98};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm98, Form98);
  Application.Run;
end.
