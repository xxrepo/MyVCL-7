program EQGridReportLink;

uses
  Forms,
  EQGridRLMain in 'EQGridRLMain.pas' {EQGridRLMainForm},
  EQGridRLPreview in 'EQGridRLPreview.pas' {EQGridRLPreviewForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TEQGridRLMainForm, EQGridRLMainForm);
  Application.CreateForm(TEQGridRLPreviewForm, EQGridRLPreviewForm);
  Application.Run;
end.
