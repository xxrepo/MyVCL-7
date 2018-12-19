unit UXlsBaseRecordLists;

interface
uses SysUtils, Contnrs, Classes, XlsMessages,
     UXlsBaseRecords, UXlsOtherRecords, UXlsFormula, UXlsBaseList,
     UFlxMessages;

type

  TBaseRecordList = class(TBaseList) //Records are TBaseRecord
    {$INCLUDE TBaseRecordListHdr.inc}
  private
    FTotalSize: int64;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification);override;
  public
    procedure AdaptSize(Delta: integer);

    procedure CopyFrom(const aBaseRecordList: TBaseRecordList);
    property TotalSize: int64 read FTotalSize;
    procedure SaveToStream(const DataStream: TStream);
  end;

  TBaseRowColRecordList = class(TBaseRecordList) //Records are TBaseRowColRecord
    {$INCLUDE TBaseRowColRecordListHdr.inc}
    procedure ArrangeCopyRows(const NewRow: Word);
    procedure ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo);
    procedure SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);

    function TotalRangeSize(const CellRange: TXlsCellRange): int64;
  end;

  TNameRecordList = class(TBaseRecordList) //Records are TNameRecord
    {$INCLUDE TNameRecordListHdr.inc}
    procedure ArrangeInsert(const InsRow, aCount: integer; const SheetInfo: TSheetInfo);
    procedure InsertSheets(const CopyFrom, BeforeSheet, SheetCount: byte; SheetInfo: TSheetInfo);
  end;

  TBoundSheetRecordList = class (TBaseRecordList)
  private
    function GetSheetName(index: integer): widestring;
    procedure SetSheetName(index: integer; const Value: widestring);
  public
    {$INCLUDE TBoundSheetRecordListHdr.inc}
    property SheetName[index: integer]: widestring read GetSheetName write SetSheetName;
  end;

  TCellRecordList = class (TBaseRowColRecordList)
    {$INCLUDE TCellRecordListHdr.inc}
  end;

  TRowRecordList = class (TBaseRowColRecordList)
  private
    function GetItems(index: integer): TRowRecord;
    procedure SetItems(index: integer; const Value: TRowRecord);
  public
    function AddRecord(aRecord: TRowRecord): integer;
    property Items[index: integer]: TRowRecord read GetItems write SetItems; default;
    function HasRow(const Index: integer): boolean;
    procedure AddRow(const Index: word);
    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo);
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);

    function RowHeight(const aRow: integer): integer;
    procedure SetRowHeight(const aRow: integer; const Height: word);

    procedure AutoRowHeight(const aRow: integer; const Value: boolean);
    function IsAutoRowHeight(const aRow: integer): boolean;

    function TotalRangeSize(const CellRange: TXlsCellRange): int64;
  end;

  TShrFmlaRecordList=class(TBaseRecordList)
    {$INCLUDE TShrFmlaRecordListHdr.inc}
  end;

implementation

{ TBaseList }


{ TBaseRecordList }
{$INCLUDE TBaseRecordListImp.inc}

procedure TBaseRecordList.AdaptSize(Delta: integer);
begin
  Inc(FTotalSize, Delta);
end;

procedure TBaseRecordList.SaveToStream(const DataStream: TStream);
var
  i:integer;
  it: TBaseRecord;
begin
  for i:=0 to Count-1 do
  begin
    it:=(Items[i] as TBaseRecord);
    if it<>nil then it.SaveToStream(DataStream);
  end;
end;

procedure TBaseRecordList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  if Ptr<>nil then
  begin
    if Action = lnDeleted then FTotalSize:= FTotalSize-TBaseRecord(Ptr).TotalSize;
    if Action = lnAdded then FTotalSize:= FTotalSize+TBaseRecord(Ptr).TotalSize;
  end;
  inherited Notify(Ptr, Action);
end;

procedure TBaseRecordList.CopyFrom(const aBaseRecordList: TBaseRecordList);
var
  i:integer;
begin
  if aBaseRecordList=nil then exit;
  for i:=0 to aBaseRecordList.Count-1 do Add((aBaseRecordList[i] as TBaseRecord).CopyTo);
end;

{ TBaseRowColRecordList }
{$INCLUDE TBaseRowColRecordListImp.inc}

procedure TBaseRowColRecordList.ArrangeCopyRows(const NewRow: Word);
var
  i: integer;
  it: TBaseRowColRecord;
begin
  for i:=0 to Count-1 do
  begin
    it:= Items[i];
    if it<>nil then it.ArrangeCopy(NewRow);
  end;
end;

procedure TBaseRowColRecordList.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo);
var
  i: integer;
  it: TBaseRowColRecord;
begin
  for i:=0 to Count-1 do
  begin
    it:=Items[i];
    if it<>nil then it.ArrangeInsert(aPos, aCount, SheetInfo);
  end;
end;

procedure TBaseRowColRecordList.SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
var
  i, r, c:integer;
  it: TBaseRowColRecord;
begin
  for i:=0 to Count-1 do
  begin
    it:=(Items[i] as TBaseRowColRecord);
    if (it<>nil) then
    begin
      r:=it.Row;c:=it.Column;
      if  (r>=CellRange.Top) and (r<=CellRange.Bottom)
         and (c>=CellRange.Left) and (c<=CellRange.Right) then
         it.SaveToStream(DataStream);
    end;
  end;
end;

function TBaseRowColRecordList.TotalRangeSize(const CellRange: TXlsCellRange): int64;
var
  i:integer;
  it: TBaseRowColRecord;
begin
  Result:=0;
  for i:=0 to Count-1 do
  begin
    it:=(Items[i] as TBaseRowColRecord);
    if (it<>nil)and (it.Row>=CellRange.Top) and (it.Row<=CellRange.Bottom)
       and (it.Column>=CellRange.Left) and (it.Column<=CellRange.Right) then
       Result:=Result+it.TotalSize;
  end;
end;


{ TNameRecordList }
{$INCLUDE TNameRecordListImp.inc}

procedure TNameRecordList.ArrangeInsert(const InsRow, aCount: integer; const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeInsert(InsRow, aCount, SheetInfo);
end;

procedure TNameRecordList.InsertSheets(const CopyFrom, BeforeSheet,
  SheetCount: byte; SheetInfo: TSheetInfo);
var
  i, k, MyCount: integer;
begin
  MyCount:=Count;
  for i:=0 to MyCount-1 do
  begin
    if (Items[i].RangeSheet=CopyFrom) or
    ((Items[i].RefersToSheet(SheetInfo.GetSheet)=CopyFrom)and (Items[i].RangeSheet=-1))then
    begin
       for k:=0 to SheetCount-1 do
       begin
         SheetInfo.InsSheet:=BeforeSheet+k;
         Add((Items[i].CopyTo as TNameRecord).ArrangeCopySheet(SheetInfo));
       end;
    end;

    Items[i].ArrangeInsertSheets(BeforeSheet, SheetCount);
  end;
end;

{ TBoundSheetRecordList }
{$INCLUDE TBoundSheetRecordListImp.inc}

{ TCellRecordList }
{$INCLUDE TCellRecordListImp.inc}

{ TRowRecordList }
function TRowRecordList.AddRecord(aRecord: TRowRecord):integer;
var
  i:integer;
begin
  if aRecord.GetRow<Count then
  begin
    if inherited Items[aRecord.GetRow]=nil then Items[aRecord.GetRow]:=aRecord else Raise Exception.Create(ErrDupRow);
    Result:= aRecord.GetRow;
  end
  else
  begin
    for i:=Count to aRecord.GetRow-1 do inherited Add(nil);
    Result:=inherited Add(aRecord);
  end;
end;

function TRowRecordList.GetItems(index: integer): TRowRecord;
begin
  Result := inherited Items[Index] as TRowRecord;
  if Result=nil then raise Exception.CreateFmt(ErrRowMissing,[Index]);
end;

function TRowRecordList.HasRow(const Index: integer): boolean;
begin
 Result:= (Index>=0) and(Index<Count) and (inherited Items[Index]<>nil);
end;

procedure TRowRecordList.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
var
  i, Max: integer;
begin
  Max:=aRow+aCount ; if Max>Count then Max:= Count;
  for i:= Max-1 downto aRow do Delete(i);
  //Delete the cells. we can look only for those below arow
  for i:=aRow to Count-1 do if HasRow(i) then Items[i].ArrangeInsert(aRow, - aCount, SheetInfo);

end;


procedure TRowRecordList.InsertAndCopyRows(const FirstRow, LastRow,
  DestRow, aCount: integer; const SheetInfo: TSheetInfo);
var
  i, k, z, CopyOffs, MyDestRow: integer;
  aRecord: TRowRecord;
begin
  //Insert the cells. we can look only for those below destrow
  for i:=DestRow to Count-1 do if HasRow(i) then Items[i].ArrangeInsert(DestRow, aCount*(LastRow-FirstRow+1), SheetInfo);

  //Copy the cells
  MyDestRow:=DestRow;
  CopyOffs:=0;
  for k:=1 to aCount do
    for i:=FirstRow to LastRow do
    begin
      aRecord:=nil;
      try
        if (i+CopyOffs<Count) and HasRow(i+CopyOffs) then
        begin
          aRecord:=Items[i+CopyOffs].CopyTo as TRowRecord;
          aRecord.ArrangeCopy(MyDestRow);
        end;
        for z:= Count to MyDestRow-1 do Add(nil);
        Insert(MyDestRow, aRecord);
        aRecord:=nil;
      finally
        FreeAndNil(aRecord);
      end; //finally
      Inc(MyDestRow);
      if FirstRow>=DestRow then Inc(CopyOffs);
    end;
end;

procedure TRowRecordList.SetItems(index: integer; const Value: TRowRecord);
begin
  inherited Items[Index] := Value;
end;

procedure TRowRecordList.AddRow(const Index: word);
var
  aRecord: TRowRecord;
begin
  if HasRow(Index) then exit;
  aRecord:= TRowRecord.CreateStandard(Index);
  AddRecord(aRecord);
end;

function TRowRecordList.RowHeight(const aRow: integer): integer;
begin
  if not HasRow(aRow) then Result:=0 else Result:=Items[aRow].Height;
end;

procedure TRowRecordList.SetRowHeight(const aRow: integer; const Height: word);
begin
  AddRow(aRow);
  Items[aRow].Height:=Height;
  Items[aRow].ManualHeight;
end;

procedure TRowRecordList.AutoRowHeight(const aRow: integer;const Value: boolean);
begin
  if HasRow(aRow) then
    if Value then Items[aRow].AutoHeight else Items[aRow].ManualHeight;
end;


function TRowRecordList.IsAutoRowHeight(const aRow: integer): boolean;
begin
  if HasRow(aRow) then
    Result:= Items[aRow].IsAutoHeight else Result:=True;
end;

function TRowRecordList.TotalRangeSize(const CellRange: TXlsCellRange): int64;
var
  i: integer;
begin
  Result:=0;
  for i:= CellRange.Top to CellRange.Bottom do Result:=Result+Items[i].TotalSize;
end;

{ TBoundSheetRecordList }

function TBoundSheetRecordList.GetSheetName(index: integer): widestring;
begin
  Result:= Items[index].SheetName;
end;

procedure TBoundSheetRecordList.SetSheetName(index: integer;
  const Value: widestring);
var
  OldSize: integer;
begin
  OldSize:=Items[index].TotalSize;
  Items[index].SheetName:=Value;
  AdaptSize(Items[index].TotalSize-OldSize);
end;


{ TShrFmlaRecordList }
{$INCLUDE TShrFmlaRecordListImp.inc}

end.

