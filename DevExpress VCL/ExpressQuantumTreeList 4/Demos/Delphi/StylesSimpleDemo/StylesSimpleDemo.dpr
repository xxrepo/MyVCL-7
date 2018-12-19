program StylesSimpleDemo;

uses
  Forms,
  StylesSimpleDemoMain in 'StylesSimpleDemoMain.pas' {StylesSimpleDemoMainForm},
  StylesSimpleDemoEdit in 'StylesSimpleDemoEdit.pas' {StylesSimpleDemoEditForm},
  StylesSimpleDemoData in 'StylesSimpleDemoData.pas' {StylesSimpleDemoDataDM: TDataModule},
  StylesSimpleDemoStylesDialog in 'StylesSimpleDemoStylesDialog.pas' {StylesSimpleDemoStylesDialogForm},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 StylesSimple Demo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TStylesSimpleDemoDataDM, StylesSimpleDemoDataDM);
  Application.CreateForm(TStylesSimpleDemoMainForm, StylesSimpleDemoMainForm);
  Application.CreateForm(TStylesSimpleDemoStylesDialogForm, StylesSimpleDemoStylesDialogForm);
  Application.CreateForm(TDemoRatingForm, DemoRatingForm);
  Application.CreateForm(TDemoBasicMainForm, DemoBasicMainForm);
  Application.Run;
end.
