program EditorsMaskDemo;

uses
  Forms,
  EditorsMaskDemoMain in 'EditorsMaskDemoMain.pas' {EditorsMaskDemoMainForm},
  EditorsMaskDemoData in 'EditorsMaskDemoData.pas' {EditorsMaskDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 EditorsMask Demo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TEditorsMaskDemoMainForm, EditorsMaskDemoMainForm);
  Application.CreateForm(TEditorsMaskDemoDataDM, EditorsMaskDemoDataDM);
  Application.Run;
end.
