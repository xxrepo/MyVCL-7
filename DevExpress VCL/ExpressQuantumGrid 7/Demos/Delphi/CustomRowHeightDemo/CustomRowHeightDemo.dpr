program CustomRowHeightDemo;

uses
  Forms,
  CustomRowHeightDemoMain in 'CustomRowHeightDemoMain.pas' {CustomRowHeightDemoMainForm},
  CustomRowHeightDemoData in 'CustomRowHeightDemoData.pas' {CustomRowHeightDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid CustomRowHeight Demo';
  Application.CreateForm(TCustomRowHeightDemoMainForm, CustomRowHeightDemoMainForm);
  Application.CreateForm(TCustomRowHeightDemoDataDM, CustomRowHeightDemoDataDM);
  Application.Run;
end.
