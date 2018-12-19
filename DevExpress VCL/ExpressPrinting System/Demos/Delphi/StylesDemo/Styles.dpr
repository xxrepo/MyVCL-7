program Styles;

uses
  Forms,
  StylesMain in 'StylesMain.pas' {StylesMainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TStylesMainForm, StylesMainForm);
  Application.Run;
end.
