program UnboundExternalDemo;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  UnboundExternalMain in 'UnboundExternalMain.pas' {frmUnboundExternal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmUnboundExternal, frmUnboundExternal);
  Application.Run;
end.
