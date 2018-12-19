program ClientEventsDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  ClientEventsMain in 'ClientEventsMain.pas' {ClientEventsMainForm},
  ClientEventsData in 'ClientEventsData.pas' {ClientEventsDataMod: TcxWebHomeDataModule},
  ClientEventsHome in 'ClientEventsHome.pas' {ClientEventsHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TClientEventsMainForm, ClientEventsMainForm);
  Application.Run;
end.
