program ESBarDemo;

uses
  Forms,
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  ESBarDemoMain in 'ESBarDemoMain.pas' {ESBarDemoMainForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars SideBar Demo';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TESBarDemoMainForm, ESBarDemoMainForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
