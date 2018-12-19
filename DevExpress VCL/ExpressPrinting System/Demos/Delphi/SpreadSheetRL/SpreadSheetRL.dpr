program SpreadSheetRL;

uses
  Forms,
  SpreadSheetRLMain in 'SpreadSheetRLMain.pas' {SpreadSheetRLForm},
  SpreadSheetRLModify in 'SpreadSheetRLModify.pas' {SpreadSheetRLModifyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SpreadSheetRL';
  Application.CreateForm(TSpreadSheetRLForm, SpreadSheetRLForm);
  Application.Run;
end.
