program LoginDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  LoginMain in 'LoginMain.pas' {LoginMainForm},
  LoginData in 'LoginData.pas' {LoginDataMod: TcxWebHomeDataModule},
  LoginHome in 'LoginHome.pas' {LoginHomePage: TcxWebPageModule} {*.html},
  LoginTarget in 'LoginTarget.pas' {LoginTargetPage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TLoginMainForm, LoginMainForm);
  Application.Run;
end.
