program EditorsInPlaceDemo;

uses
  Forms,
  EditorsInPlaceDemoMain in 'EditorsInPlaceDemoMain.pas' {EditorsInPlaceDemoMainForm},
  EditorsInPlaceDemoData in 'EditorsInPlaceDemoData.pas' {EditorsInPlaceDemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  EditorsInPlaceDemoCarInfo in 'EditorsInPlaceDemoCarInfo.pas' {EditorsInPlaceDemoCarInfoForm},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressVerticalGrid EditorsInPlace Demo';
  Application.CreateForm(TEditorsInPlaceDemoDataDM, EditorsInPlaceDemoDataDM);
  Application.CreateForm(TEditorsInPlaceDemoMainForm, EditorsInPlaceDemoMainForm);
  Application.CreateForm(TEditorsInPlaceDemoCarInfoForm, EditorsInPlaceDemoCarInfoForm);
  Application.Run;
end.
