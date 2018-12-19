program TeeChartReportLink;

uses
  Forms,
  TeeChartRLMain in 'TeeChartRLMain.pas' {TeeChartRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTeeChartRLMainForm, TeeChartRLMainForm);
  Application.Run;
end.
