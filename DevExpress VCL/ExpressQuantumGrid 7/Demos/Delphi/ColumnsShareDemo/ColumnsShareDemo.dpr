program ColumnsShareDemo;

uses
  Forms,
  ColumnsShareDemoMain in 'ColumnsShareDemoMain.pas' {ColumnsShareDemoMainForm},
  ColumnsShareDemoData in 'ColumnsShareDemoData.pas' {ColumnsShareDemoMainDM: TDataModule},
  ColumnsShareDemoLookupCustomize in 'ColumnsShareDemoLookupCustomize.pas' {ColumnsShareDemoLookupCustomizeForm},
  AboutDemoForm in '..\AboutDemoForm.pas' {formAboutDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressQuantumGrid Columns Share Demo ';
  Application.CreateForm(TColumnsShareDemoMainForm, ColumnsShareDemoMainForm);
  Application.CreateForm(TColumnsShareDemoMainDM, ColumnsShareDemoMainDM);
  Application.Run;
end.
