program MasterDetailDemo;

uses
  Forms,
  MasterDetailDemoMain in 'MasterDetailDemoMain.pas' {MasterDetailDemoMainForm},
  MasterDetailDemoData in 'MasterDetailDemoData.pas' {MasterDetailDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Master Detail Demo';
  Application.CreateForm(TMasterDetailDemoDataDM, MasterDetailDemoDataDM);
  Application.CreateForm(TMasterDetailDemoMainForm, MasterDetailDemoMainForm);
  Application.Run;
end.
