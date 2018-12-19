program EBar2000Demo;

uses
  Forms,
  EBar2000DemoMain in 'EBar2000DemoMain.pas' {EBar2000DemoMainForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  EBar2000DemoAbout in 'EBar2000DemoAbout.pas' {EBar2000DemoAboutForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBar Demo (Enchanced Style)';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TEBar2000DemoMainForm, EBar2000DemoMainForm);
  Application.Run;
end.
