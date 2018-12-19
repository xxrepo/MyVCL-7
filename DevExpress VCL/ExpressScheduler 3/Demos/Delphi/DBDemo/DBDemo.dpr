program DBDemo;

uses
  Forms,
  DBDemoMainUnit in 'DBDemoMainUnit.pas' {DBDemoMainForm},
  DemoUtils in '..\Common\DemoUtils.pas',
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler DBDemo';
  Application.CreateForm(TDBDemoMainForm, DBDemoMainForm);
  Application.Run;
end.
