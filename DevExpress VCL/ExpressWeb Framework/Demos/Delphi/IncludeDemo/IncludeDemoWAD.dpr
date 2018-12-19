program IncludeDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  IncludeMain in 'IncludeMain.pas' {IncludeMainForm},
  IncludeData in 'IncludeData.pas' {IncludeDataMod: TcxWebHomeDataModule},
  IncludeLogin in 'IncludeLogin.pas' {IncludeLoginPage: TcxWebPageModule} {*.html},
  IncludeWelcome in 'IncludeWelcome.pas' {IncludeWelcomePage: TcxWebPageModule} {*.html},
  IncludeGrid in 'IncludeGrid.pas' {IncludeGridPage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TIncludeMainForm, IncludeMainForm);
  Application.Run;
end.
