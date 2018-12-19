program BandedDemo;

uses
  Forms,
  BandedDemoMain in 'BandedDemoMain.pas' {BandedDemoMainForm},
  BandedDemoData in 'BandedDemoData.pas' {BandedDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  BandedDemoBands in 'BandedDemoBands.pas' {BandedDemoBandsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 BandedDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TBandedDemoMainForm, BandedDemoMainForm);
  Application.CreateForm(TBandedDemoDataDM, BandedDemoDataDM);
  Application.Run;
end.
