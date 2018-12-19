program BackgroundDemo;

uses
  Forms,
  BackgroundDemoMain in 'BackgroundDemoMain.pas' {BackgroundDemoMainForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  BackgroundDemoAbout in 'BackgroundDemoAbout.pas' {BackgroundDemoAboutForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars6 Background Demo';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TBackgroundDemoMainForm, BackgroundDemoMainForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
