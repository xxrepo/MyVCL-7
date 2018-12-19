program StylesDemo;

uses
  Forms,
  StylesMainUnit in 'StylesMainUnit.pas' {StylesMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressScheduler StylesDemo';
  Application.CreateForm(TStylesMainForm, StylesMainForm);
  Application.Run;
end.
