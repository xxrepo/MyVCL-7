program TabControlTest;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  SimpleTabControl in '..\SimpleTabControl.pas',
  TabControlTestMain in 'TabControlTestMain.pas' {TabControlTestMainForm},
  TabControlTestData in 'TabControlTestData.pas' {TabControlTestDataMod: TcxWebHomeDataModule},
  TabControlTestHome in 'TabControlTestHome.pas' {TabControlTestHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TTabControlTestMainForm, TabControlTestMainForm);
  Application.Run;
end.
