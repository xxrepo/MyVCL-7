program ViewBandedDemo;

uses
  Forms,
  ViewBandedDemoMain in 'ViewBandedDemoMain.pas' {ViewBandedDemoMainForm},
  ViewBandedDemoData in 'ViewBandedDemoData.pas' {ViewBandedDemoDataDM: TDataModule},
  ViewBandeDemoBands in 'ViewBandeDemoBands.pas' {ViewBandeDemoBandsForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewBanded Demo';
  Application.CreateForm(TViewBandedDemoMainForm, ViewBandedDemoMainForm);
  Application.CreateForm(TViewBandedDemoDataDM, ViewBandedDemoDataDM);
  Application.Run;
end.
