program CheckGroupsDemo;

uses
  Forms,
  CheckGroupsDemoMain in 'CheckGroupsDemoMain.pas' {fmGheckGroupsDemo},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 CheckGroupsDemo ';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TfmGheckGroupsDemo, fmGheckGroupsDemo);
  Application.Run;
end.
