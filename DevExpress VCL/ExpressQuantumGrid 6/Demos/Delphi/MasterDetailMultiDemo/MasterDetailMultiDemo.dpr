program MasterDetailMultiDemo;

uses
  Forms,
  MasterDetailMultiDemoMain in 'MasterDetailMultiDemoMain.pas' {MasterDetailMultiDemoMainForm},
  MasterDetailMultiDemoData in 'MasterDetailMultiDemoData.pas' {MasterDetailMultiDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid MasterDetailMulti Demo';
  Application.CreateForm(TMasterDetailMultiDemoMainDM, MasterDetailMultiDemoMainDM);
  Application.CreateForm(TMasterDetailMultiDemoMainForm, MasterDetailMultiDemoMainForm);
  Application.Run;
end.
