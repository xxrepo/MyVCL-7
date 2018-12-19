program StandardReportLink;

uses
  Forms,
  StandardRLMain in 'StandardRLMain.pas' {StandardRLMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TStandardRLMainForm, StandardRLMainForm);
  Application.Run;
end.
