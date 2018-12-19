program SpreadSheetRL;

uses
  Forms,
  SpreadSheetRLMain in 'SpreadSheetRLMain.pas' {SpreadSheetRLForm},
  SpreadSheetRLModify in 'SpreadSheetRLModify.pas' {SpreadSheetRLModifyForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SpreadSheetRL';
  Application.CreateForm(TSpreadSheetRLForm, SpreadSheetRLForm);
  Application.Run;
end.
