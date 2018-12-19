program CustomAttrDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  CustomAttrMain in 'CustomAttrMain.pas' {CustomAttrMainForm},
  CustomAttrData in 'CustomAttrData.pas' {CustomAttrDataMod: TcxWebHomeDataModule},
  CustomAttrHome in 'CustomAttrHome.pas' {CustomAttrHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TCustomAttrMainForm, CustomAttrMainForm);
  Application.Run;
end.
