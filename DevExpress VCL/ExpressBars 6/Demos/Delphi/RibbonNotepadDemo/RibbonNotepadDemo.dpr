program RibbonNotepadDemo;
uses
  Forms,
  EBarsDemoRating in '..\Common\EBarsDemoRating.pas' {EBarsDemoRatingForm},
  EBarsAbout in '..\Common\EBarsAbout.pas' {EBarsAboutForm},
  RibbonDemoAbout in 'RibbonDemoAbout.pas' {RibbonDemoAboutForm},
  EBarsUtils in '..\Common\EBarsUtils.pas' {dmCommonData: TDataModule},
  RibbonNotepadDemoMain in 'RibbonNotepadDemoMain.pas' {RibbonDemoMainForm},
  RibbonNotepadDemoOptions in 'RibbonNotepadDemoOptions.pas' {RibbonDemoOptionsForm},
  RibbonNotepadDemoGallerySetup in 'RibbonNotepadDemoGallerySetup.pas' {ColorDialogSetupForm};

{$R *.RES}

begin
  Application.Title := 'ExpressBars6 RibbonNotepadDemo';
  Application.Initialize;
  Application.CreateForm(TdmCommonData, dmCommonData);
  Application.CreateForm(TRibbonDemoMainForm, RibbonDemoMainForm);
  Application.CreateForm(TRibbonDemoOptionsForm, RibbonDemoOptionsForm);
  Application.CreateForm(TColorDialogSetupForm, ColorDialogSetupForm);
  Application.Run;
end.
