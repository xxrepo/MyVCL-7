program PrefilterByCodeDemo;

uses
  Forms,
  DemoBasicMain in '..\Common\DemoBasicMain.pas' {frmDemoBaisicMain},
  AboutDemoForm in '..\Common\AboutDemoForm.pas' {formAboutDemo},
  DemoBasicDM in '..\Common\DemoBasicDM.pas' {dmOrders: TDataModule},
  PrefilterByCodeDemoMain in 'PrefilterByCodeDemoMain.pas' {fmPrefilterByCode},
  DemoUtils in '..\Common\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmOrders, dmOrders);
  Application.CreateForm(TfmPrefilterByCode, fmPrefilterByCode);
  Application.Run;
end.
