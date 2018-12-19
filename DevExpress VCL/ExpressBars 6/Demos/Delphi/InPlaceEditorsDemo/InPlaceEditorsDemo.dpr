program InPlaceEditorsDemo;

uses
  Forms,
  InPlaceEditorsDemoMain in 'InPlaceEditorsDemoMain.pas' {frmMain},
  InPlaceEditorsDemoComboBoxes in 'InPlaceEditorsDemoComboBoxes.pas' {frmComboBoxes},
  InPlaceEditorsDemoImage in 'InPlaceEditorsDemoImage.pas' {frmImageEditors},
  InPlaceEditorsDemoText in 'InPlaceEditorsDemoText.pas' {frmTextEditors},
  InPlaceEditorsDemoMultiLineText in 'InPlaceEditorsDemoMultiLineText.pas' {frmMultiLineTextEditors},
  InPlaceEditorsDemoValue in 'InPlaceEditorsDemoValue.pas' {frmValueEditors},
  InPlaceEditorsDemoCheckBoxes in 'InPlaceEditorsDemoCheckBoxes.pas' {frmCheckBoxes},
  InPlaceEditorsDemoSplash in 'InPlaceEditorsDemoSplash.pas' {frmLoading},
  InPlaceEditorsDemoAbout in 'InPlaceEditorsDemoAbout.pas' {frmAbout},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  InPlaceEditorsDemoFrameManager in 'InPlaceEditorsDemoFrameManager.pas' {EditorDemoBaseFrame};

{$R *.res}

begin
  Application.Title := 'ExpressBars6 InPlaceEditorsDemo';
  Application.Initialize;
  frmLoading := TfrmLoading.Create(nil);
  frmLoading.Show;
  frmLoading.Update;
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TfrmMain, frmMain);
  frmLoading.Free;
  Application.Run;
end.
