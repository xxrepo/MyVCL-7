program SchedulerLink;

uses
  Forms,
  SchedulerRLMain in 'SchedulerRLMain.pas' {SchedulerRLMainForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Title := 'Report Link Demo - ExpressScheduler';
  Application.Initialize;
  Application.CreateForm(TSchedulerRLMainForm, SchedulerRLMainForm);
  Application.Run;
end.
