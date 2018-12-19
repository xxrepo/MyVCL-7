program WebSnapAdaptersDemoWAD;

{$APPTYPE GUI}

uses
  Forms,
  ComApp,
  cxWebDebugRun,
  WebsnapAdaptersMain in 'WebsnapAdaptersMain.pas' {WebsnapAdaptersMainForm},
  WebsnapAdaptersDataPageProducer in 'WebsnapAdaptersDataPageProducer.pas' {WebsnapAdaptersPageProducerPage: TWebAppPageModule} {*.html},
  WebsnapAdaptersCountryList in 'WebsnapAdaptersCountryList.pas' {WebsnapAdaptersCountryListPage: TcxWebSnapPageModule} {*.html},
  WebsnapAdaptersData in 'WebsnapAdaptersData.pas' {WebsnapAdaptersDataMod: TWebDataModule},
  WebsnapAdaptersOrders in 'WebsnapAdaptersOrders.pas' {WebsnapAdaptersCountryItemPage: TcxWebSnapPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);  
  Application.CreateForm(TWebsnapAdaptersMainForm, WebsnapAdaptersMainForm);
  Application.Run;
end.
