program cxTreeListReportLink;

uses
  Forms,
  cxTreeListRLMain in 'cxTreeListRLMain.pas' {cxTreeListRLMainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Express Printing System ExpressQuantumTreeList Demo';
  Application.CreateForm(TcxTreeListRLMainForm, cxTreeListRLMainForm);
  Application.Run;
end.
