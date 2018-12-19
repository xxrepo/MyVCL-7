program CustomRenderDemo;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  CustomRenderMain in 'CustomRenderMain.pas' {CustomRenderMainForm},
  CustomRenderData in 'CustomRenderData.pas' {CustomRenderDataMod: TcxWebHomeDataModule},
  CustomRenderHome in 'CustomRenderHome.pas' {CustomRenderHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TCustomRenderMainForm, CustomRenderMainForm);
  Application.Run;
end.
