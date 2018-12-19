program EQGrid4ReportLink;

uses
  Forms,
  EQGrid4RLMain in 'EQGrid4RLMain.pas' {EQGrid4RLMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Express Printing System EQGrid4RL Demo';
  Application.CreateForm(TEQGrid4RLMainForm, EQGrid4RLMainForm);
  Application.Run;
end.
