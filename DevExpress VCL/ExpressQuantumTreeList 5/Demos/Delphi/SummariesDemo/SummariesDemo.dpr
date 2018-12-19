program SummariesDemo;

uses
  Forms,
  SummariesDemoMain in 'SummariesDemoMain.pas' {SummariesDemoMainForm},
  SummariesDemoData in 'SummariesDemoData.pas' {SummariesDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 SummariesDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TSummariesDemoDataDM, SummariesDemoDataDM);
  Application.CreateForm(TSummariesDemoMainForm, SummariesDemoMainForm);
  Application.Run;
end.
