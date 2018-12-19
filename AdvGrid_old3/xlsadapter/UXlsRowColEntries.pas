unit UXlsRowColEntries;
{$IFDEF LINUX}{$INCLUDE ../FLXCONFIG.INC}{$ELSE}{$INCLUDE ..\FLXCONFIG.INC}{$ENDIF}
interface
uses Classes, SysUtils, UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords,
     XlsMessages, UXlsRangeRecords, UXlsBaseList, UXlsCellRecords, UXlsFormula,
     {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} variants,{$IFEND}{$ENDIF} //Delphi 6 or above
     UXlsSST, UFlxMessages, UXlsColInfo, UXlsReferences, UXlsWorkbookGlobals;

type
  TListClass= class of TBaseRowColRecordList;

  TBaseRowColList = class(TBaseList) //records are TBaseRowColRecordList
    {$INCLUDE TBaseRowColListHdr.inc}
  protected
    ListClass: TListClass;
  public
    procedure AddRecord(const aRecord: TBaseRowColRecord; const aRow: integer);

    procedure CopyFrom(const aList: TBaseRowColList);

    procedure SaveToStream(const DataStream: TStream);
    procedure SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
    function TotalSize: int64;
    function TotalRangeSize(const CellRange: TXlsCellRange): int64;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
    procedure ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);

    constructor Create(const aListClass: TListClass);
  end;

  TCellList = class (TBaseRowColList)//records are TCellRecordList
  private
    FGlobals: TWorkbookGlobals;
    FRowRecordList: TRowRecordList;
    FColInfoList: TColInfoList;

    function GetValue(Row, Col: integer): TXlsCellValue;
    procedure SetValue(Row, Col: integer; const Value: TXlsCellValue);
    procedure FixFormulaTokens(const Formula: TFormulaRecord; const ShrFmlas: TShrFmlaRecordList);
    function GetFormula(Row, Col: integer): widestring;
    procedure SetFormula(Row, Col: integer; const Value: widestring);
    {$INCLUDE TCellListHdr.inc}
  public
    constructor Create(const aGlobals: TWorkbookGlobals; const aRowRecordList: TRowRecordList; const aColInfoList: TColInfoList);
    property Value[Row,Col:integer]:TXlsCellValue  read GetValue write SetValue;
    property Formula[Row,Col: integer]: widestring read GetFormula write SetFormula;
    function ArrayFormula(const Row, Col: integer): PArrayOfByte;
    function TableFormula(const Row, Col: integer): PArrayOfByte;
    procedure FixFormulas(const ShrFmlas: TShrFmlaRecordList);

    function GetSheetName(const SheetNumber: integer): widestring;
  end;

  TCells = class
  private
    FRowList: TRowRecordList;
    FCellList: TCellList;
    procedure WriteDimensions(const DataStream: TStream; const CellRange: TXlsCellRange);
    function DimensionsSize: integer;
    procedure CalcUsedRange(var CellRange: TXlsCellRange);

  public
    constructor Create(const aGlobals: TWorkbookGlobals; const aColInfoList: TColInfoList);
    destructor Destroy; override;

    procedure Clear;
    procedure CopyFrom(const aList: TCells);

    procedure SaveToStream(const DataStream: TStream);
    procedure SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
    function TotalSize: int64;
    function TotalRangeSize(const CellRange: TXlsCellRange): int64;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
    procedure ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);

    procedure AddRow(const aRecord: TRowRecord);
    procedure AddCell(const aRecord: TCellRecord;  const aRow: integer);
    procedure AddMultipleCells(const aRecord: TMultipleValueRecord);

    property CellList: TCellList read FCellList;
    property RowList: TRowRecordList read FRowList;
  end;


  TRangeList = class(TBaseList) //records are TRangeEntry
    {$INCLUDE TRangeListHdr.inc}
    procedure CopyFrom(const aRangeList: TRangeList);

    procedure SaveToStream(const DataStream: TStream);
    procedure SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
    function TotalSize: int64;
    function TotalRangeSize(const CellRange: TXlsCellRange): int64;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo);
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);

  end;

implementation
{$IFNDEF TMSASG}
uses UXlsFormulaParser, UXlsEncodeFormula;
{$ENDIF}

{$INCLUDE TBaseRowColListImp.inc}
{$INCLUDE TRangeListImp.inc}
{$INCLUDE TCellListImp.inc}
{ TBaseRowColList }


procedure TBaseRowColList.AddRecord(const aRecord: TBaseRowColRecord; const aRow: integer);
var
  i:integer;
begin
  for i:= Count to aRow do Add(ListClass.Create);
  Items[aRow].Add(aRecord);
end;

procedure TBaseRowColList.ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeInsert(InsPos, InsCount, SheetInfo);
end;

procedure TBaseRowColList.CopyFrom(const aList: TBaseRowColList);
var
  i: integer;
  Tr: TBaseRowColRecordList;
begin
  for i:=0 to aList.Count - 1 do
  begin
    Tr:= ListClass.Create;
    Tr.CopyFrom(aList[i]);
    Add(Tr);
  end;
end;

constructor TBaseRowColList.Create(const aListClass: TListClass);
begin
  inherited Create(true);
  ListClass:=aListClass;
end;

procedure TBaseRowColList.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
var
  i, Max: integer;
begin
  Max:=aRow+aCount ; if Max>Count then Max:= Count;
  for i:= Max-1 downto aRow do Delete(i);
  //Delete the cells. we have to look at all the formulas, not only those below arow
  ArrangeInsert(aRow, -aCount, SheetInfo);

end;

procedure TBaseRowColList.InsertAndCopyRows(const FirstRow, LastRow, DestRow,
  aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
var
  i, k, z, a, CopyOffs, MyDestRow: integer;
  aRecordList: TBaseRowColRecordList;
begin
  // Insert the cells. we have to look at all the formulas, not only those below destrow
  ArrangeInsert(DestRow, aCount*(LastRow-FirstRow+1), SheetInfo);

  //Copy the cells
  MyDestRow:=DestRow;
  CopyOffs:=0;
  for k:=1 to aCount do
    for i:=FirstRow to LastRow do
    begin
      aRecordList:= ListClass.Create;
      try
        if i+CopyOffs<Count then
        begin
          if OnlyFormulas then
          begin
            for a:=0 to Items[i+CopyOffs].Count-1 do
              if (Items[i+CopyOffs][a] is TFormulaRecord) then
                aRecordList.Add(Items[i+CopyOffs][a].CopyTo as TBaseRowColRecord);
          end else aRecordList.CopyFrom(Items[i+CopyOffs]);

          aRecordList.ArrangeCopyRows(MyDestRow);
        end;
        for z:= Count to MyDestRow-1 do Add(ListClass.Create);
        Insert(MyDestRow, aRecordList);
        aRecordList:=nil;
      finally
        FreeAndNil(aRecordList);
      end; //finally
      Inc(MyDestRow);
      if FirstRow>=DestRow then Inc(CopyOffs);
    end;

end;

procedure TBaseRowColList.SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveRangeToStream(DataStream, CellRange);
end;

procedure TBaseRowColList.SaveToStream(const DataStream: TStream);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveToStream(DataStream);
end;

function TBaseRowColList.TotalRangeSize(const CellRange: TXlsCellRange): int64;
var
  i: integer;
begin
  Result:=0;
  for i:=CellRange.Top to CellRange.Bottom do Result:=Result+Items[i].TotalRangeSize(CellRange);
end;

function TBaseRowColList.TotalSize: int64;
var
  i:integer;
begin
  Result:=0;
  for i:=0 to Count-1 do Result:=Result+Items[i].TotalSize;
end;

{ TCellList }

constructor TCellList.Create(const aGlobals: TWorkbookGlobals; const aRowRecordList: TRowRecordList; const aColInfoList: TColInfoList);
begin
  inherited Create(TCellRecordList);
  FGlobals:= aGlobals;
  FRowRecordList:=aRowRecordList;
  FColInfoList:=aColInfoList;
end;

function TCellList.GetValue(Row, Col: integer): TXlsCellValue;
var
  Index: integer;
begin
  if (Row<0) or (Row>Max_Rows) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);
  if Row>=Count then begin; Result.Value:=Unassigned; Result.XF:=-1; Result.IsFormula:=false; exit; end;
  if Items[Row].Find(Col,Index) then
  begin
    Result.Value:=Items[Row][Index].Value;
    Result.XF:=Items[Row][Index].XF;
    Result.IsFormula:=Items[Row][Index] is TFormulaRecord;
  end else
  begin
    Result.Value:=Unassigned;
    Result.XF:=-1;
    Result.IsFormula:=false;
  end;
end;

procedure TCellList.SetValue(Row, Col: integer; const Value: TXlsCellValue);
var
  Index, k: integer;
  XF, DefaultXF: integer;
  Found: boolean;
  Cell: TCellRecord;
  ValueType: integer;
begin
  if (Row<0) or (Row>Max_Rows) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);

  FRowRecordList.AddRow(Row);

  if FRowRecordList[Row].IsFormatted then DefaultXF:=FRowRecordList[Row].XF
  else if FColInfoList.Find(Col, Index) then DefaultXF:=FColInfoList[Index].XF
  else DefaultXF:=15;

  Cell:=nil;
  Found:=(Row<Count) and Items[Row].Find(Col,Index);
  XF:=DefaultXF;
  if Found then XF:=Items[Row][Index].XF;
  if Value.XF>=0 then XF:=Value.XF;


  ValueType:= VarType(Value.Value);

  {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14}
  //Check for Custom Variants
  if (ValueType>=$010F) and (ValueType<=$0FFF) then
  begin
    ValueType:=VarDouble; //should be VarType(OleVariant(Value.Value)), but this converts numbers to strings
  end;
  {$IFEND}{$ENDIF} //Delphi 6 or above

  case ValueType of
    varEmpty,
    varNull      : if (XF<>DefaultXF) then Cell:= TBlankRecord.CreateFromData(Row,Col,XF);

    varByte,
    varSmallint,
    varInteger,
    varSingle,
    varDouble,
    {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14}
      varShortInt, VarWord, VarLongWord, varInt64,
    {$IFEND}{$ENDIF} //Delphi 6 or above
    varCurrency : if IsRK(Value.Value) then Cell:= TRKRecord.CreateFromData(Row,Col,XF)
                                 else Cell:= TNumberRecord.CreateFromData(Row,Col,XF);

    varDate     : Cell:= TLabelSSTRecord.CreateFromData(Row,Col,XF,FGlobals.SST);

    varOleStr,
    varStrArg,
    varString   : if (Value.Value='') then
                  begin
                    if (XF<>DefaultXF) then Cell:= TBlankRecord.CreateFromData(Row,Col,XF);
                  end
                  else Cell:= TLabelSSTRecord.CreateFromData(Row,Col,XF,FGlobals.SST);

    varBoolean	: Cell:= TBoolErrRecord.CreateFromData(Row,Col,XF);
  end; //case

  if Found then Items[Row].Delete(Index);


  if Found and (Cell=nil) then  //We are deleting a cell
  begin
    if (Row>=Count) or (Items[Row]=nil)or(Items[Row].Count=0)then //Row emptied
      if (not FRowRecordList[Row].IsModified)  then     //Row always exists... it is added at the top
        FRowRecordList[Row]:=nil  //this frees the object
      else
      begin
        FRowRecordList[Row].MinCol:= 0;
        FRowRecordList[Row].MaxCol:= 0;
      end
    else
    begin
      FRowRecordList[Row].MinCol:= Items[Row][0].Column;
      FRowRecordList[Row].MaxCol:= Items[Row][Items[Row].Count-1].Column+1;
    end;
  end;

  //Remove all empty Rows at the end.
  k:=FRowRecordList.Count-1;
  while ((k>Row) or (Cell=nil)) and
        (k>=0) and (not FRowRecordList.HasRow(k) or (not FRowRecordList[k].IsModified)) and
        ((k>=Count) or (Items[k]=nil) or (Items[k].Count=0)) do
  begin
    FRowRecordList.Delete(k);
    if k<Count then Delete(k);
    dec(k);
  end;

  if Cell=nil then exit;

  if Col+1> FRowRecordList[Row].MaxCol then FRowRecordList[Row].MaxCol:=Col+1;
  if Col< FRowRecordList[Row].MinCol then FRowRecordList[Row].MinCol:=Col;
  Cell.Value:=Value.Value;
  if Row>=Count then AddRecord(Cell, Row) else Items[Row].Insert(Index, Cell);
end;

procedure TCellList.FixFormulaTokens(const Formula: TFormulaRecord; const ShrFmlas: TShrFmlaRecordList);
var
  Key: Cardinal;
  Index: integer;
begin
  if not Formula.IsExp(Key) then exit;
  if ShrFmlas.Find(Key, Index) then
    Formula.MixShared(ShrFmlas[Index].Data, ShrFmlas[Index].DataSize)
  else //Array formula
  begin
    //nothing, it's ok
    //raise Exception.Create(ErrShrFmlaNotFound);
  end;
end;

procedure TCellList.FixFormulas(const ShrFmlas: TShrFmlaRecordList);
var
  i, k: integer;
  it: TCellRecordList;
  OldFormulaSize: integer;
begin
  for i:=0 to Count-1 do
  begin
    it:=Items[i];
    for k:=0 to it.Count-1 do
      if it.Items[k] is TFormulaRecord then
      begin
        OldFormulaSize:=(it.Items[k] as TFormulaRecord).DataSize;
        FixFormulaTokens(it.Items[k] as TFormulaRecord, ShrFmlas);
        it.AdaptSize((it.Items[k] as TFormulaRecord).DataSize-OldFormulaSize);
      end;
  end;
end;

function TCellList.GetFormula(Row, Col: integer): widestring;
{$IFNDEF TMSASG}
var
  Index: integer;
{$ENDIF}
begin
{$IFDEF TMSASG}
  Result:='';
{$ELSE}
  if (Row<0) or (Row>Max_Rows) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);
  if Row>=Count then begin; Result:=''; exit; end;
  if Items[Row].Find(Col,Index) and (Items[Row][Index] is TFormulaRecord) then
  begin
    Result:=RPNToString(Items[Row][Index].Data, 22, FGlobals.Names, Self);
  end else
  begin
    Result:='';
  end;
{$ENDIF}
end;

procedure TCellList.SetFormula(Row, Col: integer; const Value: widestring);
{$IFNDEF TMSASG}
var
  Cell: TCellRecord;
  ds: integer;
  Ps: TParseString;
  Index, k: integer;
  XF, DefaultXF: integer;
  Found: boolean;
{$ENDIF}
begin
{$IFNDEF TMSASG}
  if (Row<0) or (Row>Max_Rows) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);
  FRowRecordList.AddRow(Row);
  if FRowRecordList[Row].IsFormatted then DefaultXF:=FRowRecordList[Row].XF
  else if FColInfoList.Find(Col, Index) then DefaultXF:=FColInfoList[Index].XF
  else DefaultXF:=15;

  Cell:=nil;
  Found:=(Row<Count) and Items[Row].Find(Col,Index);
  XF:=DefaultXF;
  if Found then XF:=Items[Row][Index].XF;
  //if Value.XF>=0 then XF:=Value.XF;

  if Value='' then Cell:=nil else
  begin
    Ps:=TParseString.Create(Value, FGlobals.Names, Self);
    try
      Ps.Parse;
      ds:= Ps.TotalSize+20;
      Cell:= TFormulaRecord.CreateFromData(xlr_FORMULA, ds, Row, Col, XF);
      Ps.CopyToPtr(Cell.Data, 20);
    finally
      FreeAndNil(Ps);
    end;
  end;

  try
    if Found then Items[Row].Delete(Index);

    if Found and (Cell=nil) then  //We are deleting a cell
    begin
      if (Row>=Count) or (Items[Row]=nil)or(Items[Row].Count=0)then //Row emptied
        if (not FRowRecordList[Row].IsModified)  then     //Row always exists... it is added at the top
          FRowRecordList[Row]:=nil  //this frees the object
        else
        begin
          FRowRecordList[Row].MinCol:= 0;
          FRowRecordList[Row].MaxCol:= 0;
        end
      else
      begin
        FRowRecordList[Row].MinCol:= Items[Row][0].Column;
        FRowRecordList[Row].MaxCol:= Items[Row][Items[Row].Count-1].Column+1;
      end;
    end;

    //Remove all empty Rows at the end.
    k:=FRowRecordList.Count-1;
    while ((k>Row) or (Cell=nil)) and
          (k>=0) and (not FRowRecordList.HasRow(k) or (not FRowRecordList[k].IsModified)) and
          ((k>=Count) or (Items[k]=nil) or (Items[k].Count=0)) do
    begin
      FRowRecordList.Delete(k);
      if k<Count then Delete(k);
      dec(k);
    end;

    if Cell=nil then exit;

    if Col+1> FRowRecordList[Row].MaxCol then FRowRecordList[Row].MaxCol:=Col+1;
    if Col< FRowRecordList[Row].MinCol then FRowRecordList[Row].MinCol:=Col;
    if Row>=Count then AddRecord(Cell, Row) else Items[Row].Insert(Index, Cell);
  except
    FreeAndNil(Cell);
    raise;
  end; //except
{$ENDIF}
end;

function TCellList.ArrayFormula(const Row, Col: integer): PArrayOfByte;
var
  Index: integer;
begin
  if (Row<0) or (Row>=Count) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);
  if Items[Row].Find(Col,Index) and (Items[Row][Index] is TFormulaRecord) then
  begin
    Result:=(Items[Row][Index] as TFormulaRecord).ArrayRecord.Data;
  end else
  begin
    raise Exception.Create(ErrShrFmlaNotFound);
  end;
end;

function TCellList.TableFormula(const Row, Col: integer): PArrayOfByte;
var
  Index: integer;
begin
  if (Row<0) or (Row>=Count) then raise Exception.CreateFmt(ErrInvalidRow,[Row]);
  if (Col>Max_Columns)or (Col<0) then raise Exception.CreateFmt(ErrInvalidCol,[Col]);
  if Items[Row].Find(Col,Index) and (Items[Row][Index] is TFormulaRecord) then
  begin
    Result:=(Items[Row][Index] as TFormulaRecord).TableRecord.Data;
  end else
  begin
    raise Exception.Create(ErrShrFmlaNotFound);
  end;
end;

function TCellList.GetSheetName(const SheetNumber: integer): widestring;
begin
  Result:= FGlobals.References.GetSheetName(SheetNumber, FGlobals);
end;

{ TCells }

procedure TCells.AddCell(const aRecord: TCellRecord; const aRow: integer);
begin
  FCellList.AddRecord(aRecord, aRow);
end;

procedure TCells.AddMultipleCells(const aRecord: TMultipleValueRecord);
var
  OneRec: TCellRecord;
begin
  while not aRecord.Eof do
  begin
    OneRec:=aRecord.ExtractOneRecord;
    FCellList.AddRecord( OneRec, OneRec.Row);
  end;
end;

procedure TCells.AddRow(const aRecord: TRowRecord);
begin
  FRowList.AddRecord(aRecord);
end;

procedure TCells.ArrangeInsert(const InsPos, InsCount: integer;
  const SheetInfo: TSheetInfo);
begin
  FRowList.ArrangeInsert(InsPos, InsCount, SheetInfo);
  FCellList.ArrangeInsert(InsPos, InsCount, SheetInfo);
end;

procedure TCells.Clear;
begin
  if FRowList<>nil then FRowList.Clear;
  if FCellList<>nil then FCellList.Clear;
end;

procedure TCells.CopyFrom(const aList: TCells);
begin
  FRowList.CopyFrom(aList.FRowList);
  FCellList.CopyFrom(aList.FCellList);
end;

constructor TCells.Create(const aGlobals: TWorkbookGlobals; const aColInfoList: TColInfoList);
begin
  inherited Create;
  FRowList:=TRowRecordList.Create;
  FCellList:=TCellList.Create(aGlobals, FRowList, aColInfoList);
end;

procedure TCells.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
begin
  FRowList.DeleteRows(aRow, aCount, SheetInfo);
  FCellList.DeleteRows(aRow, aCount, SheetInfo);
end;

destructor TCells.Destroy;
begin
  FreeAndNil(FRowList);
  FreeAndNil(FCellList);
  inherited;
end;

procedure TCells.InsertAndCopyRows(const FirstRow, LastRow, DestRow,
  aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
begin
  FRowList.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo);
  FCellList.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo, OnlyFormulas);
end;

function TCells.DimensionsSize: integer;
begin
  Result:= SizeOf(TDimensionsRec)+SizeOf(TRecordHeader);
end;

procedure TCells.CalcUsedRange(var CellRange: TXlsCellRange);
var
  i: integer;
begin
  CellRange.Top:=0;
  while (int64(CellRange.Top)<RowList.Count) and not RowList.HasRow(CellRange.Top) do inc(CellRange.Top);
  CellRange.Bottom:=RowList.Count-1;
  CellRange.Left:=0;
  CellRange.Right:=0;
  for i:=CellRange.Top to RowList.Count-1 do
    if RowList.HasRow(i) then
    begin
      if RowList[i].MaxCol>CellRange.Right then CellRange.Right:=RowList[i].MaxCol;
      if RowList[i].MinCol<CellRange.Left then CellRange.Left:=RowList[i].MinCol;
    end;
  if CellRange.Right>0 then Dec(CellRange.Right); //MaxCol is the max col+1
end;

procedure TCells.WriteDimensions(const DataStream: TStream; const CellRange: TXlsCellRange);
var
  DimRec: TDimensionsRecord;
  DimRecDat: PDimensionsRec;
begin
  GetMem(DimRecDat, SizeOf(TDimensionsRec));
  try
    DimRecDat.FirstRow:=CellRange.Top;
    DimRecDat.LastRow:=CellRange.Bottom+1; //This adds an extra row. Dimensions do from firstrow to lastrow+1
    DimRecDat.FirstCol:=CellRange.Left;
    DimRecDat.LastCol:=CellRange.Right+1;
    DimRecDat.Extra:=0;
    DimRec:=TDimensionsRecord.Create(xlr_DIMENSIONS, PArrayOfByte(DimRecDat), SizeOf(TDimensionsRec));
  except
    FreeMem(DimRecDat);
    raise;
  end;
  try
    DimRec.SaveToStream(DataStream);
  finally
    FreeAndNil(DimRec);
  end; //Finally
end;

procedure TCells.SaveToStream(const DataStream: TStream);
var
  CellRange: TXlsCellRange;
begin
  CalcUsedRange(CellRange);
  SaveRangetoStream(DataStream, CellRange);
end;

function TCells.TotalSize: int64;
begin
  TotalSize:= DimensionsSize + FRowList.TotalSize + FCellList.TotalSize;
end;

procedure TCells.SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
var
  i,k,j, Written :integer;
begin
  if FRowList.Count< FCellList.Count then raise Exception.Create(ErrBadRowCount);
  WriteDimensions(DataStream, CellRange);
  i:=CellRange.Top;
  while (i<=CellRange.Bottom) do
  begin
    k:=0;Written:=0;
    while (Written<32) and (k+i<=CellRange.Bottom) do
    begin
      if FRowList.HasRow(k+i) then
      begin
        FRowList[k+i].SaveRangeToStream(DataStream, CellRange.Left, CellRange.Right);
        //inc(Written);  //We want 32 records in total, counting blanks. that's why not here
      end;
      inc(Written);
      inc(k);
    end;

    for j:= i to k+i-1 do
      if (j<=CellRange.Bottom) and (j<FCellList.Count) then FCellList[j].SaveRangeToStream(DataStream, CellRange);

    inc(i, k);
  end;

end;


function TCells.TotalRangeSize(const CellRange: TXlsCellRange): int64;
begin
  TotalRangeSize:= DimensionsSize + FRowList.TotalRangeSize(CellRange) + FCellList.TotalRangeSize(CellRange);
end;

{ TRangeList }

procedure TRangeList.CopyFrom(const aRangeList: TRangeList);
var
  i: integer;
begin
  for i:=0 to aRangeList.Count - 1 do
    Add(aRangeList.Items[i].CopyTo);
end;

procedure TRangeList.DeleteRows(const aRow, aCount: word;
  const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].DeleteRows(aRow, aCount, SheetInfo);
end;

procedure TRangeList.InsertAndCopyRows(const FirstRow, LastRow, DestRow,
  aCount: integer; const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo);
end;

procedure TRangeList.SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveRangeToStream(DataStream, CellRange);
end;

procedure TRangeList.SaveToStream(const DataStream: TStream);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveToStream(DataStream);
end;

function TRangeList.TotalRangeSize(const CellRange: TXlsCellRange): int64;
var
  i:integer;
begin
  Result:=0;
  for i:=0 to Count-1 do Result:=Result+Items[i].TotalRangeSize(CellRange);
end;

function TRangeList.TotalSize: int64;
var
  i:integer;
begin
  Result:=0;
  for i:=0 to Count-1 do Result:=Result+Items[i].TotalSize;
end;


end.
