program DBDemo;

uses
  Forms,
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in '..\DemoBasicMain.pas' {DemoBasicMainForm},
  DBDemoMainUnit in 'DBDemoMainUnit.pas' {DBDemoMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler DBDemo';
  Application.CreateForm(TDBDemoMainForm, DBDemoMainForm);
  Application.Run;
end.
