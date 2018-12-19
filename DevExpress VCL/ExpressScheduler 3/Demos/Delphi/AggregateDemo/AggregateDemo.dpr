program AggregateDemo;

uses
  Forms,
  AggregateDemoMainUnit in 'AggregateDemoMainUnit.pas' {AggregateDemoMainForm},
  SelectStorageUnit in 'SelectStorageUnit.pas' {SelectStorage},
  DemoUtils in '..\Common\DemoUtils.pas',
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler DBDemo';
  Application.CreateForm(TAggregateDemoMainForm, AggregateDemoMainForm);
  Application.Run;
end.
