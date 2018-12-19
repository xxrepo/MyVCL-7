program CustomDrawDemo;

uses
  Forms,
  DemoBasicMain in '..\DemoBasicMain.pas' {DemoBasicMainForm},
  CustomDrawDemoMain in 'CustomDrawDemoMain.pas' {CustomDrawDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler CustomDrawDemo';
  Application.CreateForm(TCustomDrawDemoMainForm, CustomDrawDemoMainForm);
  Application.Run;
end.
