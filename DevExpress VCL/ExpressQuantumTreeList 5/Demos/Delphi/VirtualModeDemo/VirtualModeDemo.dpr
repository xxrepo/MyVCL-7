program VirtualModeDemo;

uses
  Forms,
  VirtualModeDemoMain in 'VirtualModeDemoMain.pas' {fmVirtualModeDemoMain},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 VirtualModeDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TfmVirtualModeDemoMain, fmVirtualModeDemoMain);
  Application.Run;
end.
