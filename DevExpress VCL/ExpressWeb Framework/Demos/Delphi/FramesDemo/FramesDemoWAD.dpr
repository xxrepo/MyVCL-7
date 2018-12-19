program FramesDemoWAD;

{$APPTYPE GUI}
uses
  Forms,
  ComApp,
  cxWebDebugRun,
  FramesMain in 'FramesMain.pas' {FramesMainForm},
  FramesData in 'FramesData.pas' {FramesDataMod: TcxWebHomeDataModule},
  FramesHome in 'FramesHome.pas' {FramesHomePage: TcxWebFramesetModule} {*.html},
  Frame1 in 'Frame1.pas' {Frame1Page: TcxWebPageModule} {*.html},
  Frame2 in 'Frame2.pas' {Frame2Page: TcxWebPageModule} {*.html};

{$R *.RES}

begin
  Application.Initialize;
  RunTestApplication(WebApplicationName);
  Application.CreateForm(TFramesMainForm, FramesMainForm);
  Application.Run;
end.
