program DynRibbonToolBar;

uses
  Forms,
  mainform in 'mainform.pas' {Form5},
  uRibbonFrame in 'uRibbonFrame.pas' {ribbonframe: TFrame},
  uToolBarFrame in 'uToolBarFrame.pas' {ToolBarFrame: TFrame},
  UMenuFrame in 'UMenuFrame.pas' {TMSFrame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
