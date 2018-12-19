program MasterDetailTableDemo;

uses
  Forms,
  MasterDetailTableDemoData in 'MasterDetailTableDemoData.pas' {MasterDetailTableDemoMainDM: TDataModule},
  MasterDetailTableDemoMain in 'MasterDetailTableDemoMain.pas' {MasterDetailTableDemoMainForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Master Detail Table Demo';
  Application.CreateForm(TMasterDetailTableDemoMainDM, MasterDetailTableDemoMainDM);
  Application.CreateForm(TMasterDetailTableDemoMainForm, MasterDetailTableDemoMainForm);
  Application.Run;
end.
