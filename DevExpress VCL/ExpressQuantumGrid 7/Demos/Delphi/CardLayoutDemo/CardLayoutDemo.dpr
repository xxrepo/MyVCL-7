program CardLayoutDemo;

uses
  Forms,
  CardLayoutDemoMain in 'CardLayoutDemoMain.pas' {frmMain},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid CardLayout Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
