program ESBarDemo;

uses
  Forms,
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  ESBarDemoAbout in 'ESBarDemoAbout.pas' {ESBarDemoAboutForm},
  ESBarDemoMain in 'ESBarDemoMain.pas' {ESBarDemoMainForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars6 SideBar Demo';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TESBarDemoMainForm, ESBarDemoMainForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
