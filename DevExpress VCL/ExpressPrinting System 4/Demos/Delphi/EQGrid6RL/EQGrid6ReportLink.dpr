program EQGrid6ReportLink;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  EQGrid6RLMain in 'EQGrid6RLMain.pas' {EQGrid6RLMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Report Link Demo - ExpressQuantumGrid';
  Application.CreateForm(TEQGrid6RLMainForm, EQGrid6RLMainForm);
  Application.Run;
end.
