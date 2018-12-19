program SpellCheckerSimpleDemo;

uses
  Forms,
  SimpleDemoMain in 'SimpleDemoMain.pas' {fmCV};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmCV, fmCV);
  Application.Run;
end.
