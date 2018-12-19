program GridModeDemo;

uses
  Forms,
  GridModeDemoMain in 'GridModeDemoMain.pas' {GridModeDemoMainForm},
  GridModeDemoData in 'GridModeDemoData.pas' {GridModeDemoDataDM: TDataModule},
  GridModeDemoTerminate in 'GridModeDemoTerminate.pas' {GridModeDemoTerminateForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid GridModeDemo';
  Application.CreateForm(TGridModeDemoDataDM, GridModeDemoDataDM);
  Application.CreateForm(TGridModeDemoMainForm, GridModeDemoMainForm);
  Application.Run;
end.
