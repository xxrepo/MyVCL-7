program SimpleTreeDemo;

uses
  Forms,
  SimpleTreeDemoMain in 'SimpleTreeDemoMain.pas' {SimpleTreeDemoMainForm},
  SimpleTreeDemoData in 'SimpleTreeDemoData.pas' {SimpleTreeDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 SimpleTreeDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TSimpleTreeDemoMainForm, SimpleTreeDemoMainForm);
  Application.CreateForm(TSimpleTreeDemoDataDM, SimpleTreeDemoDataDM);
  Application.Run;
end.
