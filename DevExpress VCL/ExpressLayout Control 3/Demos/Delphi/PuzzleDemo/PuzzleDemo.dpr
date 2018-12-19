program PuzzleDemo;

uses
  Forms,
  DemoDM in '..\common\DemoDM.pas' {dmDemo: TDataModule},  
  BasicDemoMain in '..\common\BasicDemoMain.pas' {frmBasicDemoMain},
  AboutDemoForm in '..\common\AboutDemoForm.pas' {frmAboutDemo},
  Puzzle in 'Puzzle.pas' {frmPuzzle};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPuzzle, frmPuzzle);
  Application.Run;
end.
