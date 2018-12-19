program CustomDrawDemo;

{$R 'CustomDrawDemoImages.res' 'CustomDrawDemoImages.rc'}

uses
  Forms,
  CustomDrawDemoMain in 'CustomDrawDemoMain.pas' {CustomDrawDemoMainForm},
  CustomDrawDemoData in 'CustomDrawDemoData.pas' {CustomDrawDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  CustomDrawDemoEditor in 'CustomDrawDemoEditor.pas' {CustomDrawDemoEditorForm},
  CustomDrawDemoConsts in 'CustomDrawDemoConsts.pas',
  AboutDemoForm in '..\Common\AboutDemoForm.pas',
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 CustomDrawDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TCustomDrawDemoMainForm, CustomDrawDemoMainForm);
  Application.CreateForm(TCustomDrawDemoDataDM, CustomDrawDemoDataDM);
  Application.CreateForm(TCustomDrawDemoEditorForm, CustomDrawDemoEditorForm);
  Application.Run;
end.
