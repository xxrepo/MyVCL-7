program StylesSimpleDemo;

uses
  Forms,
  StylesSimpleDemoMain in 'StylesSimpleDemoMain.pas' {StylesSimpleDemoMainForm},
  StylesSimpleDemoEdit in 'StylesSimpleDemoEdit.pas' {StylesSimpleDemoEditForm},
  StylesSimpleDemoAssign in 'StylesSimpleDemoAssign.pas' {StylesSimpleDemoAssignForm},
  StylesSimpleDemoData in 'StylesSimpleDemoData.pas' {StylesSimpleDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid StylesSimple Demo';
  Application.CreateForm(TStylesSimpleDemoMainDM, StylesSimpleDemoMainDM);
  Application.CreateForm(TStylesSimpleDemoMainForm, StylesSimpleDemoMainForm);
  Application.Run;
end.
