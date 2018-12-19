program GanttViewDemo;

uses
  Forms,
  GanttViewDemoMain in 'GanttViewDemoMain.pas' {GanttViewDemoMainForm},
  DemoUtils in '..\Common\DemoUtils.pas',
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler GanttViewDemo';
  Application.CreateForm(TGanttViewDemoMainForm, GanttViewDemoMainForm);
  Application.Run;
end.
