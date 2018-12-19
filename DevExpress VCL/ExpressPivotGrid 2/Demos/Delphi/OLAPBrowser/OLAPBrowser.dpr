program OLAPBrowser;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  OLAPBrowserMain in 'OLAPBrowserMain.pas' {frmOlapBrowser},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmOlapBrowser, frmOlapBrowser);
  Application.Run;
end.
