program UnboundDemo;

uses
  Forms,
  DemoBasicMain in '..\DemoBasicMain.pas' {DemoBasicMainForm},
  UnboundDemoMain in 'UnboundDemoMain.pas' {UnboundDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler UnboundDemo';
  Application.CreateForm(TUnboundDemoMainForm, UnboundDemoMainForm);
  Application.Run;
end.
