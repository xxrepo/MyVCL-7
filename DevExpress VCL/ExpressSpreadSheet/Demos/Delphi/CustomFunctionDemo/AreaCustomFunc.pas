unit AreaCustomFunc;

interface

procedure RegisterCustomFunction;

implementation

uses cxExcelConst, cxSSFormulas;

procedure AreaFunc(Sender: TcxSSFunctionHandler);
  procedure AreaFuncCallBack(Sender: TcxSSFunctionHandler; const Value: Double);
  begin
    if Sender.CallBackIndex = 0 then
      Sender.FloatValue := Value
    else
      Sender.FloatValue := Sender.FloatValue * Value;
  end;
begin
  Sender.EnumParamValues(@AreaFuncCallBack, [vtFloat]);
  Sender.SetFloatResult(Sender.FloatValue);
end;

procedure RegisterCustomFunction;
const
  cxFuncDefinition: TcxFuncDefinition =
    (Token: $FFFF-1; Name: 'Area'; Definition: AreaFunc; Params: fpFixed; ParamsCount: 2);
begin
  TcxSSFunctionHandler.RegisterFunctions([cxFuncDefinition]);
end;

initialization

  RegisterCustomFunction;

end.
