program Stocks;

uses
  Forms,
  StocksMain in 'StocksMain.pas' {StocksMainForm},
  StocksModify in 'StocksModify.pas' {StocksModifyForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TStocksMainForm, StocksMainForm);
  Application.CreateForm(TStocksModifyForm, StocksModifyForm);
  Application.Run;
end.
