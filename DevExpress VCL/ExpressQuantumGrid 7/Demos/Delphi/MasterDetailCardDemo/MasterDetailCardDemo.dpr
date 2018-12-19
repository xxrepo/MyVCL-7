program MasterDetailCardDemo;

uses
  Forms,
  MasterDetailCardDemoMain in 'MasterDetailCardDemoMain.pas' {MasterDetailCardDemoMainForm},
  MasterDetailCardDemoData in 'MasterDetailCardDemoData.pas' {MasterDetailCardDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Master Detail Card Demo';
  Application.CreateForm(TMasterDetailCardDemoDataDM, MasterDetailCardDemoDataDM);
  Application.CreateForm(TMasterDetailCardDemoMainForm, MasterDetailCardDemoMainForm);
  Application.Run;
end.
