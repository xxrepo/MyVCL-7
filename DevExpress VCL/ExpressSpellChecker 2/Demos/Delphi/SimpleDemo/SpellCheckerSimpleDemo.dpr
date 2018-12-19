program SpellCheckerSimpleDemo;

uses
  Forms,
  SimpleDemoMain in 'SimpleDemoMain.pas' {fmCV},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmCV, fmCV);
  Application.Run;
end.
