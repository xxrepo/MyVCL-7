program FilterByCodeDemo;

uses
  Forms,
  FilterByCodeDemoMain in 'FilterByCodeDemoMain.pas' {FilterByCodeDemoMainForm},
  FilterByCodeDemoData in 'FilterByCodeDemoData.pas' {FilterByCodeDemoMainDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid FilterByCode Demo';
  Application.CreateForm(TFilterByCodeDemoMainForm, FilterByCodeDemoMainForm);
  Application.CreateForm(TFilterByCodeDemoMainDM, FilterByCodeDemoMainDM);
  Application.Run;
end.
