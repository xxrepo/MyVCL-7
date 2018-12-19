program ProviderModeDemo;

uses
  Forms,
  ProviderModeDemoMain in 'ProviderModeDemoMain.pas' {ProviderModeDemoMainForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  ProviderModeDemoClasses in 'ProviderModeDemoClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 ProviderModeDemo ';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TProviderModeDemoMainForm, ProviderModeDemoMainForm);
  Application.Run;
end.
