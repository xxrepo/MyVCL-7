program SpellCheckerMegaDemo;

uses
  Forms,
  MegaDemoMain in 'MegaDemoMain.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
