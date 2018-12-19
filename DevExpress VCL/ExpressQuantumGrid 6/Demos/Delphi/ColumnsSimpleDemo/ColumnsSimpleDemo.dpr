program ColumnsSimpleDemo;

uses
  Forms,
  ColumnsSimpleDemoMain in 'ColumnsSimpleDemoMain.pas' {ColumnsSimpleDemoMainForm},
  ColumnsSimpleDemoData in 'ColumnsSimpleDemoData.pas' {ColumnsSimpleDemoDataDM: TDataModule},
  ColumnsSimpleDemoCities in 'ColumnsSimpleDemoCities.pas' {ColumnsSimpleDemoCitiesForm},
  ColumnsSimpleDemoCars in 'ColumnsSimpleDemoCars.pas' {ColumnSimpleDemoCarsForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo},
  DemoUtils in '..\DemoUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid ColumnsSimpleDemo';
  Application.CreateForm(TColumnsSimpleDemoDataDM, ColumnsSimpleDemoDataDM);
  Application.CreateForm(TColumnsSimpleDemoMainForm, ColumnsSimpleDemoMainForm);
  Application.CreateForm(TColumnsSimpleDemoCitiesForm, ColumnsSimpleDemoCitiesForm);
  Application.CreateForm(TColumnSimpleDemoCarsForm, ColumnSimpleDemoCarsForm);
  Application.Run;
end.
