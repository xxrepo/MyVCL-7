program SummaryFooterDemo;

uses
  Forms,
  SummaryFooterDemoMain in 'SummaryFooterDemoMain.pas' {SummaryFooterDemoMainForm},
  SummaryFooterDemoEditSummary in 'SummaryFooterDemoEditSummary.pas' {SummaryFooterDemoEditSummaryForm},
  SummaryFooterDemoData in 'SummaryFooterDemoData.pas' {SummaryFooterDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid SummaryFooterDemo';
  Application.CreateForm(TSummaryFooterDemoDataDM, SummaryFooterDemoDataDM);
  Application.CreateForm(TSummaryFooterDemoMainForm, SummaryFooterDemoMainForm);
  Application.CreateForm(TSummaryFooterDemoEditSummaryForm, SummaryFooterDemoEditSummaryForm);
  Application.Run;
end.
