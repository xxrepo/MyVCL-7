program StylesDemo;

uses
  Forms,
  DemoBasicMain in '..\DemoBasicMain.pas' {DemoBasicMainForm},
  StylesMainUnit in 'StylesMainUnit.pas' {StylesMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler StylesDemo';
  Application.CreateForm(TStylesMainForm, StylesMainForm);
  Application.Run;
end.
