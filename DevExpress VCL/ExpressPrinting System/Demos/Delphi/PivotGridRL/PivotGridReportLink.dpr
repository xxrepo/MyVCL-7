program PivotGridReportLink;

uses
  Forms,
  PivotGridRLMain in 'PivotGridRLMain.pas' {PivotGridRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TPivotGridRLMainForm, PivotGridRLMainForm);
  Application.Run;
end.
