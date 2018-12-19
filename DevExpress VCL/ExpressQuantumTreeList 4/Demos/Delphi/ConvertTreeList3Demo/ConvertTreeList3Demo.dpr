program ConvertTreeList3Demo;

uses
  Forms,
  ConvertTreeList3DemoMain in 'ConvertTreeList3DemoMain.pas' {ConvertTreeList3DemoMainForm},
  ConvertTreeList3DemoData in 'ConvertTreeList3DemoData.pas' {ConvertTreeList3DemoDataDM: TDataModule},
  DemoRating in '..\Common\DemoRating.pas' {DemoRatingForm},
  DemoBasicAbout in '..\Common\DemoBasicAbout.pas' {DemoBasicAboutForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumTreeList4 ConvertTreeList3Demo';
  Application.HelpFile := '..\..\Help\EQTreeList4.hlp';
  Application.CreateForm(TConvertTreeList3DemoMainForm, ConvertTreeList3DemoMainForm);
  Application.CreateForm(TConvertTreeList3DemoDataDM, ConvertTreeList3DemoDataDM);
  Application.Run;
end.
