program InspectorReportLink;

uses
  Forms,
  InspectorRLMain in 'InspectorRLMain.pas' {InspectorRLMainForm},
  InspectorRLDialog in 'InspectorRLDialog.pas' {InspectorRLDialogForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TInspectorRLMainForm, InspectorRLMainForm);
  Application.CreateForm(TInspectorRLDialogForm, InspectorRLDialogForm);
  Application.Run;
end.
