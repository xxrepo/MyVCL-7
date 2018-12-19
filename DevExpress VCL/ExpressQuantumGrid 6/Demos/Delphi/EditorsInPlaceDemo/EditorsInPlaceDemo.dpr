program EditorsInPlaceDemo;

uses
  Forms,
  EditorsInPlaceDemoMain in 'EditorsInPlaceDemoMain.pas' {EditorsInPlaceDemoMainForm},
  EditorsInPlaceDemoData in 'EditorsInPlaceDemoData.pas' {EditorsInPlaceDemoDataDM: TDataModule},
  EditorsInPlaceDemoCities in 'EditorsInPlaceDemoCities.pas' {EditorsInPlaceDemoCitiesForm},
  EditorsInPlaceDemoCars in 'EditorsInPlaceDemoCars.pas' {EditorsInPlaceDemoCarsForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid EditorsInPlaceDemo';
  Application.CreateForm(TEditorsInPlaceDemoDataDM, EditorsInPlaceDemoDataDM);
  Application.CreateForm(TEditorsInPlaceDemoMainForm, EditorsInPlaceDemoMainForm);
  Application.CreateForm(TEditorsInPlaceDemoCitiesForm, EditorsInPlaceDemoCitiesForm);
  Application.CreateForm(TEditorsInPlaceDemoCarsForm, EditorsInPlaceDemoCarsForm);
  Application.Run;
end.
