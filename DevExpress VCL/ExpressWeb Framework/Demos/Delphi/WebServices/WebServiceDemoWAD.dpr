program WebServiceDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebServiceMain in 'WebServiceMain.pas' {WebServiceMainForm},
  WebServiceData in 'WebServiceData.pas' {WebServiceDataMod: TcxWebHomeDataModule},
  WebServiceHome in 'WebServiceHome.pas' {WebServiceHomePage: TcxWebPageModule} {*.html},
  GoogleSearch in 'GoogleSearch.pas';

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TWebServiceMainForm, WebServiceMainForm);
  Application.Run;
end.
