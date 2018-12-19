program StylesMultiDemo;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicDM in '..\Common\DemoBasicDM.pas' {dmOrders: TDataModule},
  StylesMultiMain in 'StylesMultiMain.pas' {frmStylesMulti};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmOrders, dmOrders);
  Application.CreateForm(TfrmStylesMulti, frmStylesMulti);
  Application.Run;
end.
