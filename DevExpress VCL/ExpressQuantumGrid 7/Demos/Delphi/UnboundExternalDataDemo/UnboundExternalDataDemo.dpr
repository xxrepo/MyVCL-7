program UnboundExternalDataDemo;

uses
  Forms,
  UnboundExternalDataDemoMain in 'UnboundExternalDataDemoMain.pas' {UnboundExternalDataDemoMainForm},
  UnboundExternalDataDemoClasses in 'UnboundExternalDataDemoClasses.pas',
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundExternalData Demo';
  Application.CreateForm(TUnboundExternalDataDemoMainForm, UnboundExternalDataDemoMainForm);
  Application.Run;
end.
