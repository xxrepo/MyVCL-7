program DockingMegaDemo;

uses
  Forms,
  DockingMegaDemoMain in 'DockingMegaDemoMain.pas' {DockingMegaDemoMainForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  DockingMegaDemoAbout in 'DockingMegaDemoAbout.pas' {DockingMegaDemoAboutForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars6 DockingMega Demo';
  Application.CreateForm(TdmCommonData, dmCommonData);  
  Application.CreateForm(TDockingMegaDemoMainForm, DockingMegaDemoMainForm);
  Application.CreateForm(TDockingMegaDemoAboutForm, DockingMegaDemoAboutForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
