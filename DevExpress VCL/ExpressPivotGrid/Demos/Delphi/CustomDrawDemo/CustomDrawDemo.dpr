program CustomDrawDemo;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicDM in '..\Common\DemoBasicDM.pas' {dmOrders: TDataModule},
  CustomDrawMain in 'CustomDrawMain.pas' {frmCustomDraw};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmOrders, dmOrders);
  Application.CreateForm(TfrmCustomDraw, frmCustomDraw);
  Application.Run;
end.
