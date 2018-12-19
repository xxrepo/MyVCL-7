program MasterDetailDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  MasterDetailMain in 'MasterDetailMain.pas' {MasterDetailMainForm},
  MasterDetailData in 'MasterDetailData.pas' {MasterDetailDataMod: TcxWebHomeDataModule},
  MasterDetailHome in 'MasterDetailHome.pas' {MasterDetailHomePage: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TMasterDetailMainForm, MasterDetailMainForm);
  Application.Run;
end.
