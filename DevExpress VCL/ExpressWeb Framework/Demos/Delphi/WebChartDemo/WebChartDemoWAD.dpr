program WebChartDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebChartMain in 'WebChartMain.pas' {WebChartMainForm},
  WebChartData in 'WebChartData.pas' {WebChartDataMod: TcxWebHomeDataModule},
  WebChartHome in 'WebChartHome.pas' {WebChartHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TWebChartMainForm, WebChartMainForm);
  Application.Run;
end.
