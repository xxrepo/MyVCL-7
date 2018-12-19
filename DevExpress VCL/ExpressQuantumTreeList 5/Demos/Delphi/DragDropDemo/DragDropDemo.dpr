program DragDropDemo;

uses
  Forms,
  DragDropDemoMain in 'DragDropDemoMain.pas' {DragDropDemoMainForm},
  DragDropDemoData in 'DragDropDemoData.pas' {DragDropDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  DragDropDemoDictionary in 'DragDropDemoDictionary.pas' {DragDropDemoDictionaryForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas',
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 DragDropDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TDragDropDemoMainForm, DragDropDemoMainForm);
  Application.CreateForm(TDragDropDemoDataDM, DragDropDemoDataDM);
  Application.CreateForm(TDragDropDemoDictionaryForm, DragDropDemoDictionaryForm);
  Application.Run;
end.
