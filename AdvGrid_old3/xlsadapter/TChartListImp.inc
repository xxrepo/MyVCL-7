//************************************************************************************//
//  File created automatically by GenerateRecords.xls                                 //
//  Do not modify by hand                                                             //
//************************************************************************************//

function TChartList.GetItems(index: integer): TChart;
begin
  Result := TChart (inherited Items[Index]);
end;

procedure TChartList.SetItems(index: integer; const Value: TChart);
begin
  inherited Items[Index] := Value;
end;

function TChartList.Add(aRecord: TChart):integer;
begin
  Result:=inherited Add(aRecord);
end;

procedure TChartList.Insert(Index: Integer; ARecord:TChart);
begin
  inherited Insert(Index, ARecord);
end;

