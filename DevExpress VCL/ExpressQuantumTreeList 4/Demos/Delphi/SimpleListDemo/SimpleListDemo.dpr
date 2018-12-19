program SimpleListDemo;

uses
  Forms,
  SimpleListDemoMain in 'SimpleListDemoMain.pas' {SimpleListDemoMainForm},
  SimpleListDemoData in 'SimpleListDemoData.pas' {SimpleListDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 SimpleList Demo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TSimpleListDemoMainForm, SimpleListDemoMainForm);
  Application.CreateForm(TSimpleListDemoDataDM, SimpleListDemoDataDM);
  Application.Run;
end.
