program WebDateEditDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebDateEditMain in 'WebDateEditMain.pas' {WebDateEditMainForm},
  WebDateEditData in 'WebDateEditData.pas' {WebDateEditDataMod: TcxWebHomeDataModule},
  WebDateEditHome in 'WebDateEditHome.pas' {WebDateEditHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TWebDateEditMainForm, WebDateEditMainForm);
  Application.Run;
end.
