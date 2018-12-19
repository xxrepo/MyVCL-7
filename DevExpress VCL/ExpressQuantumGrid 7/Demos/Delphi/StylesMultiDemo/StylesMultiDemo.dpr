program StylesMultiDemo;

uses
  Forms,
  StylesMultiDemoMain in 'StylesMultiDemoMain.pas' {StylesMultiDemoMainForm},
  StylesMultiDemoData in 'StylesMultiDemoData.pas' {StylesMultiDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid StylesMulti Demo';
  Application.CreateForm(TStylesMultiDemoMainDM, StylesMultiDemoMainDM);
  Application.CreateForm(TStylesMultiDemoMainForm, StylesMultiDemoMainForm);
  Application.Run;
end.
