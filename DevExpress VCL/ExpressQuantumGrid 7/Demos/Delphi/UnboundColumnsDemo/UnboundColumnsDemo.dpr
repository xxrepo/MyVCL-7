program UnboundColumnsDemo;

uses
  Forms,
  UnboundColumnsDemoMain in 'UnboundColumnsDemoMain.pas' {UnboundColumnsDemoMainForm},
  UnboundColumnsDemoData in 'UnboundColumnsDemoData.pas' {UnboundColumnsDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid UnboundColumns Demo';
  Application.CreateForm(TUnboundColumnsDemoDataDM, UnboundColumnsDemoDataDM);
  Application.CreateForm(TUnboundColumnsDemoMainForm, UnboundColumnsDemoMainForm);
  Application.Run;
end.
