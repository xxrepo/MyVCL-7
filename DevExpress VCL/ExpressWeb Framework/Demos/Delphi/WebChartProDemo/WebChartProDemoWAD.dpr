program WebChartProDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebChartProMain in 'WebChartProMain.pas' {WebChartProMainForm},
  WebChartProData in 'WebChartProData.pas' {WebChartProDataMod: TcxWebHomeDataModule},
  WebChartProHome in 'WebChartProHome.pas' {WebChartProHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TWebChartMainForm, WebChartMainForm);
  Application.Run;
end.
