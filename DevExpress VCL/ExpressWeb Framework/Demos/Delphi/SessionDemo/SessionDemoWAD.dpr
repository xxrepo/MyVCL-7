program SessionDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  SessionMain in 'SessionMain.pas' {SessionMainForm},
  SessionData in 'SessionData.pas' {SessionDataMod: TcxWebHomeDataModule},
  SessionHome in 'SessionHome.pas' {SessionHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TSessionMainForm, SessionMainForm);
  Application.Run;
end.
