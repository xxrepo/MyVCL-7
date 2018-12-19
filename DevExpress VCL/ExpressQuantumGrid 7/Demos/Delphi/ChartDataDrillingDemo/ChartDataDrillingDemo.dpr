program ChartDataDrillingDemo;

uses
  Forms,
  ChartDataDrillingDemoMain in 'ChartDataDrillingDemoMain.pas' {frmMain},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ChartDataDrilling Demo';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
