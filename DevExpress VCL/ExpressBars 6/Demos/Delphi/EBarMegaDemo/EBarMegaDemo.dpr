program EBarMegaDemo;

uses
  Forms,
  EBarMegaDemoMain in 'EBarMegaDemoMain.pas' {EBarMegaDemoMainForm},
  EBarMegaDemoOptions in 'EBarMegaDemoOptions.pas' {EBarMegaDemoOptionsForm},
  EBarMegaDemoData in 'EBarMegaDemoData.pas' {EBarMegaDemoMainDM: TDataModule},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  EBarMegaDemoAbout in 'EBarMegaDemoAbout.pas' {EBarMegaDemoAboutForm},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars6 Mega Demo';
  Application.HelpFile := '';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TEBarMegaDemoMainDM, EBarMegaDemoMainDM);
  Application.CreateForm(TEBarMegaDemoMainForm, EBarMegaDemoMainForm);
  Application.CreateForm(TEBarMegaDemoOptionsForm, EBarMegaDemoOptionsForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
