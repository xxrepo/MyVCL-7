program CustomDrawTableViewDemo;

{$R 'CustomDrawTableViewDemoImages.res' 'CustomDrawTableViewDemoImages.rc'}

uses
  Forms,
  CustomDrawTableViewDemoMain in 'CustomDrawTableViewDemoMain.pas' {CustomDrawTableViewDemoMainForm},
  CustomDrawTableViewDemoData in 'CustomDrawTableViewDemoData.pas' {CustomDrawTableViewDemoMainDM: TDataModule},
  CustomDrawTableViewDemoStylesEditor in 'CustomDrawTableViewDemoStylesEditor.pas' {CustomDrawTableViewDemoStylesEditorForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid CustomDrawTableView Demo';
  Application.CreateForm(TCustomDrawTableViewDemoMainDM, CustomDrawTableViewDemoMainDM);
  Application.CreateForm(TCustomDrawTableViewDemoMainForm, CustomDrawTableViewDemoMainForm);
  Application.CreateForm(TCustomDrawTableViewDemoStylesEditorForm, CustomDrawTableViewDemoStylesEditorForm);
  Application.Run;
end.
