program ViewBandedFixedDemo;

uses
  Forms,
  ViewBandedFixedMain in 'ViewBandedFixedMain.pas' {ViewBandedFixedDemoMainForm},
  ViewBandedFixedMainData in 'ViewBandedFixedMainData.pas' {ViewBandedFixedDemoDMMain: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewBandedFixed Demo';
  Application.CreateForm(TViewBandedFixedDemoMainForm, ViewBandedFixedDemoMainForm);
  Application.CreateForm(TViewBandedFixedDemoDMMain, ViewBandedFixedDemoDMMain);
  Application.Run;
end.
