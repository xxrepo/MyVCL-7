program UnboundSimpleDemo;

uses
  Forms,
  UnboundSimpleDemoMain in 'UnboundSimpleDemoMain.pas' {UnboundSimpleDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundSimple Demo';
  Application.CreateForm(TUnboundSimpleDemoMainForm, UnboundSimpleDemoMainForm);
  Application.Run;
end.
