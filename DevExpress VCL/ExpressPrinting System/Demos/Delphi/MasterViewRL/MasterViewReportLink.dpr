program MasterViewReportLink;

uses
  Forms,
  MasterViewRLMain in 'MasterViewRLMain.pas' {MasterViewRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressMasterView ReportLink';
  Application.CreateForm(TMasterViewRLMainForm, MasterViewRLMainForm);
  Application.Run;
end.
