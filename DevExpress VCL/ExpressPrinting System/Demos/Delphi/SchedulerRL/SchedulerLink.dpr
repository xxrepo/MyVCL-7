program SchedulerLink;

uses
  Forms,
  SchedulerRLMain in 'SchedulerRLMain.pas' {SchedulerRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSchedulerRLMainForm, SchedulerRLMainForm);
  Application.Run;
end.
