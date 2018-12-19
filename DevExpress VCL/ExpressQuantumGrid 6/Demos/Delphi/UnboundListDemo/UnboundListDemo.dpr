program UnboundListDemo;

uses
  Forms,
  UnboundListDemoMain in 'UnboundListDemoMain.pas' {UnboundListDemoMainForm},
  UnboundListDemoClasses in 'UnboundListDemoClasses.pas',
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundList Demo';
  Application.CreateForm(TUnboundListDemoMainForm, UnboundListDemoMainForm);
  Application.Run;
end.
