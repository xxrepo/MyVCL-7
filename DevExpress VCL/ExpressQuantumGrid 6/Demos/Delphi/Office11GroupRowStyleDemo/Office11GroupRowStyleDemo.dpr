program Office11GroupRowStyleDemo;

uses
  Forms,
  Office11GroupRowStyleDemoMain in 'Office11GroupRowStyleDemoMain.pas' {Office11GroupRowStyleDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Office11GroupRowStyle Demo';
  Application.CreateForm(TOffice11GroupRowStyleDemoMainForm, Office11GroupRowStyleDemoMainForm);
  Application.Run;
end.
