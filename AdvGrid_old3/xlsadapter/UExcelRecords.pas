unit UExcelRecords;

interface
uses SysUtils, Contnrs, Classes, XlsMessages, UXlsBaseRecords, UXlsBaseRecordLists,
     UXlsOtherRecords, UXlsSST, UXlsReferences, USheetNameList, UXlsFormula,
     UXlsEscher, UXlsClientData, UXlsSheet, UXlsWorkbookGlobals, UXlsBaseList, UFlxMessages;

type

  TSheetList = class(TBaseList) //records are TSheet
    {$INCLUDE TSheetListHdr.inc}
    procedure SaveToStream(const DataStream: TStream);
    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
    procedure DeleteRows(const aRow, aCount: word; SheetInfo: TSheetInfo);
  end;

  TWorkbook = class
  private
    FGlobals: TWorkbookGlobals;
    FSheets: TSheetList;

    procedure FixBoundSheetsOffset;
    function GetWorkSheets(index: integer): TWorksheet;
    function GetActiveSheet: integer;
    procedure SetActiveSheet(const Value: integer);
    procedure FixRangeBoundSheetsOffset(const SheetIndex: integer; const CellRange: TXlsCellRange);
  public
    property Globals: TWorkbookGlobals read FGlobals write FGlobals;
    property Sheets: TSheetList read FSheets write FSheets;

    function IsWorksheet(const Index: integer): boolean;
    property WorkSheets[index:integer]: TWorksheet read GetWorkSheets;

    property ActiveSheet: integer read GetActiveSheet write SetActiveSheet;

    constructor Create;
    destructor Destroy;override;

    procedure LoadFromStream( const DataStream: TStream);
    procedure SaveToStream(const DataStream: TStream);
    procedure SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer; const CellRange: TXlsCellRange);

    //Manipulating Methods
    procedure InsertAndCopyRows(const SheetNo, FirstRow, LastRow: integer; const DestRow, aCount: integer; const OnlyFormulas: boolean);
    procedure DeleteRows(const SheetNo: byte; const aRow, aCount: word);
    procedure InsertSheets(const CopyFrom, InsertBefore, SheetCount: byte);

    procedure InsertHPageBreak(const SheetNo: byte; const aRow: word);
    procedure InsertVPageBreak(const SheetNo: byte; const aCol: word);
  end;

implementation

{ TSheetList }
{$INCLUDE TSheetListImp.inc}

procedure TSheetList.InsertAndCopyRows(const FirstRow, LastRow,
  DestRow, aCount: integer; SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
var
  i:integer;
begin
  Items[SheetInfo.InsSheet].InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo, OnlyFormulas);
  for i:=0 to Count -1 do if i<>SheetInfo.InsSheet then
  begin
    SheetInfo.FormulaSheet:=i;
    Items[i].ArrangeInsert(DestRow, (LastRow-FirstRow+1)*aCount, SheetInfo);
  end;
end;

procedure TSheetList.DeleteRows(const aRow, aCount: word;
  SheetInfo: TSheetInfo);
var
  i:integer;
begin
  Items[SheetInfo.InsSheet].DeleteRows(aRow, aCount, SheetInfo);
  for i:=0 to Count -1 do if i<>SheetInfo.InsSheet then
  begin
    SheetInfo.FormulaSheet:=i;
    Items[i].ArrangeInsert(aRow, -aCount, SheetInfo);
  end;
end;


procedure TSheetList.SaveToStream(const DataStream: TStream);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveToStream(DataStream);
end;

{ TWorkbook }

constructor TWorkbook.Create;
begin
  inherited;
  FGlobals:= TWorkbookGlobals.Create;
  FSheets := TSheetList.Create;
end;

procedure TWorkbook.DeleteRows(const SheetNo: byte; const aRow, aCount: word);
var
  SheetInfo: TSheetInfo;
begin
  if(SheetNo>= Sheets.Count) then raise Exception.CreateFmt(ErrInvalidSheetNo, [SheetNo, 0, Sheets.Count-1]);

  SheetInfo.InsSheet:=SheetNo;
  SheetInfo.FormulaSheet:=SheetNo;
  SheetInfo.GetSheet:=Globals.References.GetSheet;
  SheetInfo.SetSheet:=Globals.References.SetSheet;

  FSheets.DeleteRows(aRow, aCount, SheetInfo);
  Globals.DeleteRows(aRow, aCount, SheetInfo);
end;

  //PENDING: DVal (data validation)
  //PENDING: HLINKS // SCREENTIP
  //PENDING: LabelRanges
  //MADE: TABLE
  //PENDING: Index /dbcell
  //PENDING: property LoadValuesOnly
  //PENDING: String records    Ver como arreglamos esto y dbcells
  //MADE: Dimensions
  //PENDING: eliminar mensaje excel grabado con version anterior
destructor TWorkbook.Destroy;
begin
  FreeAndNil(FSheets);
  //Order is important. Globals should be freed after sheets
  FreeAndNil(FGlobals);
  inherited;
end;

procedure TWorkbook.FixRangeBoundSheetsOffset(const SheetIndex: integer; const CellRange: TXlsCellRange);
var
  TotalOfs: int64;
begin
  Globals.SST.FixRefs;
  TotalOfs:=Globals.TotalRangeSize(SheetIndex, CellRange);  //Includes the EOF on workbook Globals
  if Globals.SheetCount<> Sheets.Count then raise Exception.Create(ErrExcelInvalid);

  Globals.SheetSetOffset(SheetIndex, TotalOfs);
end;

procedure TWorkbook.FixBoundSheetsOffset;
var
  i: integer;
  TotalOfs: int64;
begin
  Globals.SST.FixRefs;
  TotalOfs:=Globals.TotalSize;  //Includes the EOF on workbook Globals
  if Globals.SheetCount<> Sheets.Count then raise Exception.Create(ErrExcelInvalid);

  for i:=0 to Globals.SheetCount-1 do
  begin
    Globals.SheetSetOffset(i,TotalOfs);
    TotalOfs:=TotalOfs+(Sheets[i].TotalSize);
  end;
end;

function TWorkbook.GetActiveSheet: integer;
begin
  Result:= Globals.ActiveSheet;
end;

function TWorkbook.GetWorkSheets(index: integer): TWorksheet;
begin
  Result:= Sheets[index] as TWorkSheet;
end;

procedure TWorkbook.InsertAndCopyRows(const SheetNo, FirstRow, LastRow, DestRow, aCount: integer; const OnlyFormulas: boolean);
var
  SheetInfo: TSheetInfo;
begin
  //Some error handling
  if (FirstRow>LastRow) or (FirstRow<0) or (LastRow> Max_Rows) or
  ((FirstRow<DestRow) and (DestRow<=LastRow)) or (DestRow+(LastRow-FirstRow+1)*aCount>Max_Rows)
  or (DestRow<0)
  then raise Exception.Create(ErrBadCopyRows);

  if (SheetNo<0) or (SheetNo>= Sheets.Count) then raise Exception.CreateFmt(ErrInvalidSheetNo, [SheetNo, 0, Sheets.Count-1]);

  SheetInfo.InsSheet:=SheetNo;
  SheetInfo.FormulaSheet:=SheetNo;
  SheetInfo.GetSheet:=Globals.References.GetSheet;
  SheetInfo.SetSheet:=Globals.References.SetSheet;

  FSheets.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo, OnlyFormulas);
  Globals.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo);
end;

procedure TWorkbook.InsertSheets(const CopyFrom, InsertBefore, SheetCount: byte);
var
  i:integer;
  aSheet: TSheet;
  OptionFlags: Word;
  SheetInfo: TSheetInfo;
begin
  if  (CopyFrom>= Sheets.Count) then raise Exception.CreateFmt(ErrInvalidSheetNo, [CopyFrom, 0, Sheets.Count-1]);
  if  (InsertBefore> Sheets.Count) then raise Exception.CreateFmt(ErrInvalidSheetNo, [InsertBefore, 0, Sheets.Count-1]);

  aSheet:= Sheets[CopyFrom];
  OptionFlags := Globals.SheetOptionFlags[CopyFrom];

  Globals.InsertSheets( CopyFrom, InsertBefore, OptionFlags, BaseSheetName, SheetCount);

  SheetInfo.GetSheet:=Globals.References.GetSheet;
  SheetInfo.SetSheet:=Globals.References.SetSheet;
  for i:=0 to SheetCount-1 do
  begin
    SheetInfo.InsSheet:=InsertBefore+SheetCount-1-i;
    SheetInfo.FormulaSheet:=CopyFrom;

    Sheets.Insert( InsertBefore , aSheet.CopyTo);
    Sheets[InsertBefore].ArrangeCopySheet(SheetInfo);
  end;
end;

procedure TWorkbook.InsertHPageBreak(const SheetNo: byte; const aRow: word);
begin
  Sheets[SheetNo].InsertHPageBreak(aRow);
end;

procedure TWorkbook.InsertVPageBreak(const SheetNo: byte; const aCol: word);
begin
  Sheets[SheetNo].InsertVPageBreak(aCol);
end;

function TWorkbook.IsWorksheet(const Index: integer): boolean;
begin
  Result:= Sheets[index] is TWorkSheet;
end;

procedure TWorkbook.LoadFromStream(const DataStream: TStream);
var
  RecordHeader: TRecordHeader;
  R: TBaseRecord;
begin
  Sheets.Clear;
  Globals.Clear;

  DataStream.Seek(soFromBeginning, 0);
  while (DataStream.Read(RecordHeader, sizeof(RecordHeader))=sizeof(RecordHeader)) and (RecordHeader.id<>0) do
  begin
    R:=LoadRecord(DataStream, RecordHeader);
    try
      if (RecordHeader.Id = xlr_BOF) then
      case (R as TBOFRecord).BOFType of
        xlb_Globals   : Globals.LoadFromStream(DataStream, R as TBOFRecord, Globals.SST);
        xlb_Worksheet : FSheets[FSheets.Add(TWorkSheet.Create(Globals))].LoadFromStream(DataStream, R as TBOFRecord, Globals.SST) ;
        xlb_Chart     : FSheets[FSheets.Add(TChart.Create(Globals))].LoadFromStream(DataStream, R as TBOFRecord, Globals.SST) ;
        else raise Exception.Create(ErrExcelInvalid);
      end //case
      else
        if (RecordHeader.Id = xlr_EOF) then FreeAndNil(R) //There can be 2 eof at the end of the file
        else raise Exception.Create(ErrExcelInvalid);
    except
      FreeAndNil(R);
      raise;
    end; //except
  end; //while

  // References from LABELSST to SST have been loaded, we can sort
  Globals.SST.Sort;
  //now we can safely sort, all BSEs are pointers, no integers
  if Globals.DrawingGroup.RecordCache.BStore <> nil then Globals.DrawingGroup.RecordCache.BStore.ContainedRecords.Sort;

end;

procedure TWorkbook.SaveToStream(const DataStream: TStream);
begin
  FixBoundSheetsOffset;
  FGlobals.SaveToStream( DataStream );
  FSheets.SaveToStream( DataStream );
end;

procedure TWorkbook.SetActiveSheet(const Value: integer);
begin
  Sheets[Globals.ActiveSheet].Selected:=false;
  Globals.ActiveSheet:=Value;
  Sheets[Value].Selected:=true;
end;

procedure TWorkbook.SaveRangeToStream(const DataStream: TStream;
  const SheetIndex: integer; const CellRange: TXlsCellRange);
begin
  FixRangeBoundSheetsOffset(SheetIndex, CellRange);
  FGlobals.SaveRangeToStream(DataStream, SheetIndex, CellRange);
  //we dont have to check SheetIndex is ok. this was done on FGlobals.SaveRangetoStream
  FSheets[SheetIndex].SaveRangeToStream(DataStream, SheetIndex, CellRange );
end;

end.

