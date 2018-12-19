program UnboundModeDemo;

uses
  Forms,
  UnboundModeDemoMain in 'UnboundModeDemoMain.pas' {UnboundModeDemoMainForm},
  UnboundModeDemoData in 'UnboundModeDemoData.pas' {UnboundModeDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 UnboundModeDemo ';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TUnboundModeDemoMainForm, UnboundModeDemoMainForm);
  Application.CreateForm(TUnboundModeDemoDataDM, UnboundModeDemoDataDM);
  Application.Run;
end.
