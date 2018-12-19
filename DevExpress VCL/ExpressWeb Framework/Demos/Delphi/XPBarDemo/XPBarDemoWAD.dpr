program XPBarDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  XPBarMain in 'XPBarMain.pas' {XPBarMainForm},
  XPBarData in 'XPBarData.pas' {XPBarDataMod: TcxWebHomeDataModule},
  XPBarHome in 'XPBarHome.pas' {XPBarHomePage: TcxWebFramesetModule} {*.html},
  Frame1 in 'Frame1.pas' {Frame1Page: TcxWebPageModule} {*.html},
  Frame2 in 'Frame2.pas' {Frame2Page: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TXPBarMainForm, XPBarMainForm);
  Application.Run;
end.
