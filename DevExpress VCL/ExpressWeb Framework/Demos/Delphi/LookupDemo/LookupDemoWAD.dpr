program LookupDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  LookupMain in 'LookupMain.pas' {LookupMainForm},
  LookupData in 'LookupData.pas' {LookupDataMod: TcxWebHomeDataModule},
  LookupHome in 'LookupHome.pas' {LookupHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TLookupMainForm, LookupMainForm);
  Application.Run;
end.
