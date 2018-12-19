program UnboundModeDemo;

uses
  Forms,
  UnboundModeDemoIntMinerField in 'UnboundModeDemoIntMinerField.pas',
  UnboundModeDemoMain in 'UnboundModeDemoMain.pas' {UnboundModeDemoMainForm},
  UnboundModeDemoCustomField in 'UnboundModeDemoCustomField.pas' {UnboundModeDemoCustomFieldForm},
  UnboundModeDemoTypes in 'UnboundModeDemoTypes.pas',
  UnboundModeDemoFastestSweepers in 'UnboundModeDemoFastestSweepers.pas' {UnboundModeDemoFastestSweepersForm},
  UnboundModeDemoMinerCore in 'UnboundModeDemoMinerCore.pas',
  UnboundModeDemoMinerDataSource in 'UnboundModeDemoMinerDataSource.pas',
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundMode Demo';
  Application.CreateForm(TUnboundModeDemoMainForm, UnboundModeDemoMainForm);
  Application.Run;
end.
