//************************************************************************************//
//  File created automatically by GenerateRecords.xls                                 //
//  Do not modify by hand                                                             //
//************************************************************************************//

function TBaseRowColRecordList.GetItems(index: integer): TBaseRowColRecord;
begin
  Result := TBaseRowColRecord (inherited Items[Index]);
end;

procedure TBaseRowColRecordList.SetItems(index: integer; const Value: TBaseRowColRecord);
begin
  inherited Items[Index] := Value;
end;

function TBaseRowColRecordList.Add(aRecord: TBaseRowColRecord):integer;
begin
  Result:=inherited Add(aRecord);
end;

procedure TBaseRowColRecordList.Insert(Index: Integer; ARecord:TBaseRowColRecord);
begin
  inherited Insert(Index, ARecord);
end;

