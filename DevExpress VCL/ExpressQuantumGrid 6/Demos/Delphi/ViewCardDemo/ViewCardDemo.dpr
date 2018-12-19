program ViewCardDemo;

uses
  Forms,
  ViewCardDemoMain in 'ViewCardDemoMain.pas' {ViewCardDemoMainForm},
  ViewCardDemoData in 'ViewCardDemoData.pas' {ViewCardDemoDataDM: TDataModule},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ViewCard Demo';
  Application.CreateForm(TViewCardDemoMainForm, ViewCardDemoMainForm);
  Application.CreateForm(TViewCardDemoDataDM, ViewCardDemoDataDM);
  Application.Run;
end.
