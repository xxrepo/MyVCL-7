program DBTreeReportLink;

uses
  Forms,
  DBTreeRLMain in 'DBTreeRLMain.pas' {DBTreeRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDBTreeRLMainForm, DBTreeRLMainForm);
  Application.Run;
end.
