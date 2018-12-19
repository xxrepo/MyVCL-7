program TreeListReportLink;

uses
  Forms,
  TreeListRLMain in 'TreeListRLMain.pas' {TreeListRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TTreeListRLMainForm, TreeListRLMainForm);
  Application.Run;
end.
