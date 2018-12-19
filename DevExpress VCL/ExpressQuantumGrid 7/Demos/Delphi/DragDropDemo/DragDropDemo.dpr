program DragDropDemo;

uses
  Forms,
  DragDropDemoMain in 'DragDropDemoMain.pas' {DragDropDemoMainForm},
  DragDropDemoData in 'DragDropDemoData.pas' {DragDropDemoMainDM: TDataModule},
  DragDropDemoDictionaries in 'DragDropDemoDictionaries.pas' {DragDropDemoDictionariesForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid DragDropDemo';
  Application.CreateForm(TDragDropDemoMainDM, DragDropDemoMainDM);
  Application.CreateForm(TDragDropDemoMainForm, DragDropDemoMainForm);
  Application.CreateForm(TDragDropDemoDictionariesForm, DragDropDemoDictionariesForm);
  Application.Run;
end.
