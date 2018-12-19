program EditorsLookupDemo;

uses
  Forms,
  EditorsLookupDemoMain in 'EditorsLookupDemoMain.pas' {EditorsLookupDemoMainForm},
  EditorsLookupDemoData in 'EditorsLookupDemoData.pas' {EditorsLookupDemoDataDM: TDataModule},
  EditorsLookupDemoNewUser in 'EditorsLookupDemoNewUser.pas' {EditorsLookupDemoNewUserForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 EditorsLookupDemo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TEditorsLookupDemoDataDM, EditorsLookupDemoDataDM);
  Application.CreateForm(TEditorsLookupDemoMainForm, EditorsLookupDemoMainForm);
  Application.CreateForm(TEditorsLookupDemoNewUserForm, EditorsLookupDemoNewUserForm);
  Application.Run;
end.
