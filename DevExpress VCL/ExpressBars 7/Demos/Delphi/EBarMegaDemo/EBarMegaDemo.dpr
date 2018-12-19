program EBarMegaDemo;

uses
  Forms,
  EBarMegaDemoMain in 'EBarMegaDemoMain.pas' {EBarMegaDemoMainForm},
  EBarMegaDemoOptions in 'EBarMegaDemoOptions.pas' {EBarMegaDemoOptionsForm},
  EBarMegaDemoData in 'EBarMegaDemoData.pas' {EBarMegaDemoMainDM: TDataModule},
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressBars Mega Demo';
  Application.HelpFile := '';
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TEBarMegaDemoMainDM, EBarMegaDemoMainDM);
  Application.CreateForm(TEBarMegaDemoMainForm, EBarMegaDemoMainForm);
  Application.CreateForm(TEBarMegaDemoOptionsForm, EBarMegaDemoOptionsForm);
  Application.CreateForm(TEBarsDemoRatingForm, EBarsDemoRatingForm);
  Application.Run;
end.
