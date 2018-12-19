program DBTreeListReportLink;

uses
  Forms,
  DBTreeListRLMain in 'DBTreeListRLMain.pas' {DBTreeListRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDBTreeListRLMainForm, DBTreeListRLMainForm);
  Application.Run;
end.
