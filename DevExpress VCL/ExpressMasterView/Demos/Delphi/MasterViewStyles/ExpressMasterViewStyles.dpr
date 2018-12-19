program ExpressMasterViewStyles;

uses
  Forms,
  main in 'main.pas' {fmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'ExpressMasterView - StylesDemo';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
