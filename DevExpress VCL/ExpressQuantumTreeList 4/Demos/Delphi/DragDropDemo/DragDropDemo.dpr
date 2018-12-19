program DragDropDemo;

uses
  Forms,
  DragDropDemoMain in 'DragDropDemoMain.pas' {DragDropDemoMainForm},
  DragDropDemoData in 'DragDropDemoData.pas' {DragDropDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  DragDropDemoDictionary in 'DragDropDemoDictionary.pas' {DragDropDemoDictionaryForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 DragDropDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TDragDropDemoMainForm, DragDropDemoMainForm);
  Application.CreateForm(TDragDropDemoDataDM, DragDropDemoDataDM);
  Application.CreateForm(TDragDropDemoDictionaryForm, DragDropDemoDictionaryForm);
  Application.Run;
end.
