program Office12ViewsDemo;

uses
  Forms,
  Office12ViewsMain in 'Office12ViewsMain.pas' {fmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
