program BandedFixedDemo;

uses
  Forms,
  BandedFixedDemoMain in 'BandedFixedDemoMain.pas' {BandedFixedDemoMainForm},
  BandedFixedDemoData in 'BandedFixedDemoData.pas' {BandedFixedDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 BandedFixedDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TBandedFixedDemoMainForm, BandedFixedDemoMainForm);
  Application.CreateForm(TBandedFixedDemoDataDM, BandedFixedDemoDataDM);
  Application.Run;
end.
