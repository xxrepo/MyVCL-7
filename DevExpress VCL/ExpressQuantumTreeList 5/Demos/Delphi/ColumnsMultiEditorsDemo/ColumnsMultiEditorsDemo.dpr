program ColumnsMultiEditorsDemo;

uses
  Forms,
  ColumnsMultiEditorsDemoMain in 'ColumnsMultiEditorsDemoMain.pas' {ColumnsMultiEditorsDemoMainForm},
  ColumnsMultiEditorsDemoData in 'ColumnsMultiEditorsDemoData.pas' {ColumnsMultiEditorsDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  ColumnsMultiEditorsDemoPopup in 'ColumnsMultiEditorsDemoPopup.pas' {ColumnsMultiEditorsDemoPopupForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas',
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 ColumnsMultiEditorsDemo ';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TColumnsMultiEditorsDemoDataDM, ColumnsMultiEditorsDemoDataDM);
  Application.CreateForm(TColumnsMultiEditorsDemoMainForm, ColumnsMultiEditorsDemoMainForm);
  Application.Run;
end.
