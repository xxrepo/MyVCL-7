program ServerScriptsDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  ServerScriptsMain in 'ServerScriptsMain.pas' {ServerScriptsMainForm},
  ServerScriptsData in 'ServerScriptsData.pas' {ServerScriptsDataMod: TcxWebHomeDataModule},
  ServerScriptsHome in 'ServerScriptsHome.pas' {ServerScriptsHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TServerScriptsMainForm, ServerScriptsMainForm);
  Application.Run;
end.
