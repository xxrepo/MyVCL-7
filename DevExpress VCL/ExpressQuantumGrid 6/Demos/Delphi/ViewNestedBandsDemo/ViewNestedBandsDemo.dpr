program ViewNestedBandsDemo;

uses
  Forms,
  ViewNestedBandsDemoMain in 'ViewNestedBandsDemoMain.pas' {ViewNestedBandsDemoMainForm},
  ViewNestedBandsDemoData in 'ViewNestedBandsDemoData.pas' {ViewNestedBandsDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewNestedBandsDemo';
  Application.CreateForm(TViewNestedBandsDemoDataDM, ViewNestedBandsDemoDataDM);
  Application.CreateForm(TViewNestedBandsDemoMainForm, ViewNestedBandsDemoMainForm);
  Application.Run;
end.
