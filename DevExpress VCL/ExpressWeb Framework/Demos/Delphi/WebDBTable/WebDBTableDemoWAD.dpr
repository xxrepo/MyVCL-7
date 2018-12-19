program WebDBTableDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebDBTableMain in 'WebDBTableMain.pas' {WebDBTableMainForm},
  WebDBTableData in 'WebDBTableData.pas' {WebDBTableDataMod: TcxWebHomeDataModule},
  WebDBTableHome in 'WebDBTableHome.pas' {WebDBTableHomePage: TcxWebPageModule} {*.html},
  WebDBTableOrders in 'WebDBTableOrders.pas' {WebDBTableOrdersPage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TWebDBTableMainForm, WebDBTableMainForm);
  Application.Run;
end.
