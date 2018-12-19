program SimpleVerticalGridDemo;

uses
  Forms,
  SimpleVerticalGridDemoMain in 'SimpleVerticalGridDemoMain.pas' {SimpleVerticalGridDemoMainForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  SimpleVerticalGridDemoData in 'SimpleVerticalGridDemoData.pas' {SimpleVerticalGridDemoMainDM: TDataModule},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressVerticalGrid SimpleVerticalGrid Demo';
  Application.CreateForm(TSimpleVerticalGridDemoMainDM, SimpleVerticalGridDemoMainDM);
  Application.CreateForm(TSimpleVerticalGridDemoMainForm, SimpleVerticalGridDemoMainForm);
  Application.Run;
end.
