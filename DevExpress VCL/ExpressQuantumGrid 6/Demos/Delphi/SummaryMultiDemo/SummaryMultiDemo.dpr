program SummaryMultiDemo;

uses
  Forms,
  SummaryMultiDemoMain in 'SummaryMultiDemoMain.pas' {SummaryMultiDemoMainForm},
  SummaryMultiDemoData in 'SummaryMultiDemoData.pas' {SummaryMultiDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid SummaryMultiDemo';
  Application.CreateForm(TSummaryMultiDemoDataDM, SummaryMultiDemoDataDM);
  Application.CreateForm(TSummaryMultiDemoMainForm, SummaryMultiDemoMainForm);
  Application.Run;
end.
