program OrgChartReportLink;

uses
  Forms,
  OrgChartRLMain in 'OrgChartRLMain.pas' {OrgChartRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TOrgChartRLMainForm, OrgChartRLMainForm);
  Application.Run;
end.
