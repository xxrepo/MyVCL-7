program ColumnsMultiEditorsDemo;

uses
  Forms,
  ColumnsMultiEditorsDemoMain in 'ColumnsMultiEditorsDemoMain.pas' {ColumnsMultiEditorsDemoMainForm},
  ColumnsMultiEditorsDemoData in 'ColumnsMultiEditorsDemoData.pas' {ColumnsMultiEditorsDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  ColumnsMultiEditorsDemoPopup in 'ColumnsMultiEditorsDemoPopup.pas' {ColumnsMultiEditorsDemoPopupForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 ColumnsMultiEditorsDemo ';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TColumnsMultiEditorsDemoDataDM, ColumnsMultiEditorsDemoDataDM);
  Application.CreateForm(TColumnsMultiEditorsDemoMainForm, ColumnsMultiEditorsDemoMainForm);
  Application.Run;
end.
