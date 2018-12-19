program FilterDemo;

uses
  Forms,
  FilterDemoMain in 'FilterDemoMain.pas' {frmMain},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Filter Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
