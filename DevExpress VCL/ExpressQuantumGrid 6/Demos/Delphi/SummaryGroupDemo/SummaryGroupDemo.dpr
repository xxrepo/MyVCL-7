program SummaryGroupDemo;

uses
  Forms,
  SummaryGroupDemoMain in 'SummaryGroupDemoMain.pas' {SummaryGroupDemoMainForm},
  SummaryGroupDemoData in 'SummaryGroupDemoData.pas' {SummaryGroupDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid SummaryGroupDemo';
  Application.CreateForm(TSummaryGroupDemoDataDM, SummaryGroupDemoDataDM);
  Application.CreateForm(TSummaryGroupDemoMainForm, SummaryGroupDemoMainForm);
  Application.Run;
end.
