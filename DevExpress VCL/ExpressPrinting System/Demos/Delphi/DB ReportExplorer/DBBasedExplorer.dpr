program DBBasedExplorer;

uses
  Forms,
  main in 'main.pas' {fmMain},
  Splash in 'Splash.pas' {fmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ExpressPrinting System DB Report Explorer';  
  with TfmSplash.Create(nil) do
  try
    ShowModal;
  finally
    Free;
  end;
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
