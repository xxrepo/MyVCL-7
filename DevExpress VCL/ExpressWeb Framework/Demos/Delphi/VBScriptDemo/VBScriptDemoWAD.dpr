program VBScriptDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  VBScriptMain in 'VBScriptMain.pas' {VBScriptMainForm},
  VBScriptData in 'VBScriptData.pas' {VBScriptDataMod: TcxWebHomeDataModule},
  VBScriptHome in 'VBScriptHome.pas' {VBScriptHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TVBScriptMainForm, VBScriptMainForm);
  Application.Run;
end.
