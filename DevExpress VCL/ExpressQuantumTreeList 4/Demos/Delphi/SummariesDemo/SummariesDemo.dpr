program SummariesDemo;

uses
  Forms,
  SummariesDemoMain in 'SummariesDemoMain.pas' {SummariesDemoMainForm},
  SummariesDemoData in 'SummariesDemoData.pas' {SummariesDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  SummariesDemoEditSummary in 'SummariesDemoEditSummary.pas' {SummariesDemoEditSummaryForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 SummariesDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TSummariesDemoDataDM, SummariesDemoDataDM);
  Application.CreateForm(TSummariesDemoMainForm, SummariesDemoMainForm);
  Application.Run;
end.
