program LayoutViewDemo;

uses
  Forms,
  LayoutViewDemoMain in 'LayoutViewDemoMain.pas' {frmMain},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid LayoutView Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
