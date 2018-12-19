//************************************************************************************//
//  File created automatically by GenerateRecords.xls                                 //
//  Do not modify by hand                                                             //
//************************************************************************************//

function TCellRecordList.GetItems(index: integer): TCellRecord;
begin
  Result := TCellRecord (inherited Items[Index]);
end;

procedure TCellRecordList.SetItems(index: integer; const Value: TCellRecord);
begin
  inherited Items[Index] := Value;
end;

function TCellRecordList.Add(aRecord: TCellRecord):integer;
begin
  Result:=inherited Add(aRecord);
  Sorted:=false;  //When we add the list gets unsorted
end;

procedure TCellRecordList.Insert(Index: Integer; ARecord:TCellRecord);
begin
  inherited Insert(Index, ARecord);
  // We assume that when we insert, we respect the order, so we dont set Sorted=true
end;

function CompareCellCols(Item1, Item2: Pointer): Integer;
begin
  if TCellRecord(Item1).Column < TCellRecord(Item2).Column then Result:=-1 else if TCellRecord(Item1).Column > TCellRecord(Item2).Column then Result:=1 else Result:=0;
end;

procedure TCellRecordList.Sort;
begin
  inherited Sort(CompareCellCols);
  Sorted:=true;
end;

function TCellRecordList.Find(const aItem:integer ; var Index: integer): boolean;
Var
 L, H, I, C: Integer;
 V: integer;
begin
  if not Sorted then Sort;
  Result := False;
  L := 0;
  H := Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    V:=Items[i].Column;
    if V < aItem then C:=-1 else if V > aItem then C:=1 else C:=0;
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      If C = 0 Then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

