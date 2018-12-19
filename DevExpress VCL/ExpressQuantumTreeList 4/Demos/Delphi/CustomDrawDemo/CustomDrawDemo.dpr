program CustomDrawDemo;

{$R 'CustomDrawDemoImages.res' 'CustomDrawDemoImages.rc'}

uses
  Forms,
  CustomDrawDemoMain in 'CustomDrawDemoMain.pas' {CustomDrawDemoMainForm},
  CustomDrawDemoData in 'CustomDrawDemoData.pas' {CustomDrawDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  CustomDrawDemoEditor in 'CustomDrawDemoEditor.pas' {CustomDrawDemoEditorForm},
  CustomDrawDemoConsts in 'CustomDrawDemoConsts.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 CustomDrawDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TCustomDrawDemoMainForm, CustomDrawDemoMainForm);
  Application.CreateForm(TCustomDrawDemoDataDM, CustomDrawDemoDataDM);
  Application.CreateForm(TCustomDrawDemoEditorForm, CustomDrawDemoEditorForm);
  Application.Run;
end.
