program SortBySummaryDemo;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicDM in '..\Common\DemoBasicDM.pas' {dmOrders: TDataModule},
  SortBySummaryMain in 'SortBySummaryMain.pas' {frmSortBySummary};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmOrders, dmOrders);
  Application.CreateForm(TfrmSortBySummary, frmSortBySummary);
  Application.Run;
end.
