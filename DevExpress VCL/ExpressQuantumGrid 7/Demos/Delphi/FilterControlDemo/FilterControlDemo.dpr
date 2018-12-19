program FilterControlDemo;

uses
  Forms,
  FilterControlDemoMain in 'FilterControlDemoMain.pas' {FilterControlDemoMainForm},
  FilterControlDemoData in 'FilterControlDemoData.pas' {FilterControlDemoDataDM: TDataModule},
  FilterControlDemoFilterDialog in 'FilterControlDemoFilterDialog.pas' {FilterControlDemoFilterDialogForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid FilterControlDemo';
  Application.CreateForm(TFilterControlDemoDataDM, FilterControlDemoDataDM);
  Application.CreateForm(TFilterControlDemoMainForm, FilterControlDemoMainForm);
  Application.CreateForm(TFilterControlDemoFilterDialogForm, FilterControlDemoFilterDialogForm);
  Application.Run;
end.
