program SimpleTreeDemo;

uses
  Forms,
  SimpleTreeDemoMain in 'SimpleTreeDemoMain.pas' {SimpleTreeDemoMainForm},
  SimpleTreeDemoData in 'SimpleTreeDemoData.pas' {SimpleTreeDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 SimpleTreeDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TSimpleTreeDemoMainForm, SimpleTreeDemoMainForm);
  Application.CreateForm(TSimpleTreeDemoDataDM, SimpleTreeDemoDataDM);
  Application.Run;
end.
