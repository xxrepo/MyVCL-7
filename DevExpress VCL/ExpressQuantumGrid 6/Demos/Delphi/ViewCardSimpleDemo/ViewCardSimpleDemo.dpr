program ViewCardSimpleDemo;

uses
  Forms,
  ViewCardSimpleDemoMain in 'ViewCardSimpleDemoMain.pas' {ViewCardSimpleDemoMainForm},
  ViewCardSimpleDemoData in 'ViewCardSimpleDemoData.pas' {ViewCardSimpleDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewCardSimple Demo';
  Application.CreateForm(TViewCardSimpleDemoMainForm, ViewCardSimpleDemoMainForm);
  Application.CreateForm(TViewCardSimpleDemoMainDM, ViewCardSimpleDemoMainDM);
  Application.Run;
end.
