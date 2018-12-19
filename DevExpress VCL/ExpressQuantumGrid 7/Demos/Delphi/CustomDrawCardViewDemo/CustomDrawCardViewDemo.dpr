program CustomDrawCardViewDemo;

{$R 'CustomDrawCardViewDemoImages.res' 'CustomDrawCardViewDemoImages.rc'}

uses
  Forms,
  CustomDrawCardViewDemoMain in 'CustomDrawCardViewDemoMain.pas' {CustomDrawCardViewDemoMainForm},
  CustomDrawCardViewDemoData in 'CustomDrawCardViewDemoData.pas' {CustomDrawCardViewDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid CustomDrawCardView Demo';
  Application.CreateForm(TCustomDrawCardViewDemoMainDM, CustomDrawCardViewDemoMainDM);
  Application.CreateForm(TCustomDrawCardViewDemoMainForm, CustomDrawCardViewDemoMainForm);
  Application.Run;
end.
