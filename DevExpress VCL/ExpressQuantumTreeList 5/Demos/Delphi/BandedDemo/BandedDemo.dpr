program BandedDemo;

uses
  Forms,
  BandedDemoMain in 'BandedDemoMain.pas' {BandedDemoMainForm},
  BandedDemoData in 'BandedDemoData.pas' {BandedDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  BandedDemoBands in 'BandedDemoBands.pas' {BandedDemoBandsForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 BandedDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TBandedDemoMainForm, BandedDemoMainForm);
  Application.CreateForm(TBandedDemoDataDM, BandedDemoDataDM);
  Application.Run;
end.
