program ProviderModeDemo;

uses
  Forms,
  ProviderModeDemoMain in 'ProviderModeDemoMain.pas' {ProviderModeDemoMainForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  ProviderModeDemoClasses in 'ProviderModeDemoClasses.pas',
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 ProviderModeDemo ';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TProviderModeDemoMainForm, ProviderModeDemoMainForm);
  Application.Run;
end.
