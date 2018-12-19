program FlowChartReportLink;

uses
  Forms,
  FlowChartRLMain in 'FlowChartRLMain.pas' {FlowChartRLMainForm},
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {DemoBasicMainForm},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Report Link Demo - ExpressFlowChart';
  Application.CreateForm(TFlowChartRLMainForm, FlowChartRLMainForm);
  Application.Run;
end.
