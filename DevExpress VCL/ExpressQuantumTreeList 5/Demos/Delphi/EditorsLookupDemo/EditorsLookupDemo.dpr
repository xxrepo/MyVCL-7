program EditorsLookupDemo;

uses
  Forms,
  EditorsLookupDemoMain in 'EditorsLookupDemoMain.pas' {EditorsLookupDemoMainForm},
  EditorsLookupDemoData in 'EditorsLookupDemoData.pas' {EditorsLookupDemoDataDM: TDataModule},
  EditorsLookupDemoNewUser in 'EditorsLookupDemoNewUser.pas' {EditorsLookupDemoNewUserForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList5 EditorsLookupDemo';
  Application.HelpFile := '..\..\Help\ExpressQuantumTreeList5.hlp';
  Application.CreateForm(TEditorsLookupDemoDataDM, EditorsLookupDemoDataDM);
  Application.CreateForm(TEditorsLookupDemoMainForm, EditorsLookupDemoMainForm);
  Application.CreateForm(TEditorsLookupDemoNewUserForm, EditorsLookupDemoNewUserForm);
  Application.Run;
end.
