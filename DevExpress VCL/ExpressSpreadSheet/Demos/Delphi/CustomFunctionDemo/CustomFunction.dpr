program CustomFunction;

uses
  Forms,
  CustomFunctionFrm in 'CustomFunctionFrm.pas' {CustomFunctionForm},
  AreaCustomFunc in 'AreaCustomFunc.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCustomFunctionForm, CustomFunctionForm);
  Application.Run;
end.
