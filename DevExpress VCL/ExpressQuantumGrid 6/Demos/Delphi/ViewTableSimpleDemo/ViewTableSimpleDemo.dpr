program ViewTableSimpleDemo;

uses
  Forms,
  ViewTableSimpleDemoMain in 'ViewTableSimpleDemoMain.pas' {ViewTableSimpleDemoMainForm},
  ViewTableSimpleDemoData in 'ViewTableSimpleDemoData.pas' {ViewTableSimpleDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewTableSimple Demo';
  Application.CreateForm(TViewTableSimpleDemoMainForm, ViewTableSimpleDemoMainForm);
  Application.CreateForm(TViewTableSimpleDemoMainDM, ViewTableSimpleDemoMainDM);
  Application.Run;
end.
