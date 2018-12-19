program EditorsMaskDemo;

uses
  Forms,
  EditorsMaskDemoMain in 'EditorsMaskDemoMain.pas' {EditorsMaskDemoMainForm},
  EditorsMaskDemoData in 'EditorsMaskDemoData.pas' {EditorsMaskDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressVerticalGrid EditorsMask Demo';
  Application.CreateForm(TEditorsMaskDemoDataDM, EditorsMaskDemoDataDM);
  Application.CreateForm(TEditorsMaskDemoMainForm, EditorsMaskDemoMainForm);
  Application.Run;
end.
