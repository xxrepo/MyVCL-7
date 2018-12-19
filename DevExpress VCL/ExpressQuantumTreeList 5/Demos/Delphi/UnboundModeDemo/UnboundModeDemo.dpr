program UnboundModeDemo;

uses
  Forms,
  UnboundModeDemoMain in 'UnboundModeDemoMain.pas' {UnboundModeDemoMainForm},
  UnboundModeDemoData in 'UnboundModeDemoData.pas' {UnboundModeDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 UnboundModeDemo ';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TUnboundModeDemoMainForm, UnboundModeDemoMainForm);
  Application.CreateForm(TUnboundModeDemoDataDM, UnboundModeDemoDataDM);
  Application.Run;
end.
