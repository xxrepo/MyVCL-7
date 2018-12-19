program FlowChartReportLink;

uses
  Forms,
  FlowChartRLMain in 'FlowChartRLMain.pas' {FlowChartRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TFlowChartRLMainForm, FlowChartRLMainForm);
  Application.Run;
end.
