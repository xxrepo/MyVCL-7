unit UXlsCondFmt;
interface

uses UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords,
     XlsMessages, Classes, SysUtils, UXlsRangeRecords, UXlsTokenArray, UFlxMessages ;

type

  TCondFmtRecord= class(TRangeRecord)
  end;

  TCFRecord = class(TBaseRecord)
  private
    CfType, Op: byte;
    Cce1, Cce2: word;

    procedure ArrangeTokensInsertRow(const  atPos, fPos, InsPos, InsOffset, CopyOffset: integer; const SheetInfo: TSheetInfo);

  public
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
    procedure ArrangeCopy(const NewRow: Word);
  end;

  TCFRecordList = class (TBaseRecordList)
    {$INCLUDE TCFRecordListHdr.inc}
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
  end;


  TCondFmt = class (TRangeEntry)
  private
    Flag: word;
    AllRange: TExcelRange;
    CFs: TCFRecordList;
  protected
    function DoCopyTo: TRangeEntry; override;
  public
    constructor Create; override;
    destructor Destroy; override;

    procedure Clear;
    procedure LoadFromStream( const DataStream: TStream; const First: TRangeRecord); override;
    procedure SaveToStream(const DataStream: TStream); override;
    procedure SaveRangeToStream(const DataStream: TStream; const CellRange: TXlsCellRange);override;
    function TotalSize: int64; override;
    function TotalRangeSize(const CellRange: TXlsCellRange): int64;override;

    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);override;
    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo); override;
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);override;
  end;

implementation
{$INCLUDE TCFRecordListImp.inc}

{ TCondFmt }

procedure TCondFmt.Clear;
begin
  if CFs<>nil then CFs.Clear;
  if RangeValuesList<>nil then RangeValuesList.Clear;
end;

constructor TCondFmt.Create;
begin
  inherited;
  RangeValuesList:= TRangeValuesList.Create(4+SizeOf(TExcelRange));
  CFs:= TCFRecordList.Create;
end;

destructor TCondFmt.Destroy;
begin
  FreeAndNil(CFs);
  inherited;
end;

function TCondFmt.DoCopyTo: TRangeEntry;
begin
  Result:=inherited DoCopyTo;
  (Result as TCondFmt).Flag:=Flag;
  (Result as TCondFmt).AllRange:=AllRange;
  (Result as TCondFmt).CFs.CopyFrom(CFs);
end;

procedure TCondFmt.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
begin
  RangeValuesList.DeleteRows(aRow, aCount, true);
  inherited;

end;

procedure TCondFmt.InsertAndCopyRows(const FirstRow, LastRow, DestRow,
  aCount: integer; const SheetInfo: TSheetInfo);
var
  RangeIntersects: boolean;
begin
  RangeIntersects:=(AllRange.R1<= LastRow) and(AllRange.R2>= FirstRow);
  inherited;
  if RangeIntersects then
    RangeValuesList.CopyRowsInclusive( FirstRow, LastRow, DestRow, aCount, AllRange.R1, AllRange.R2);

end;

procedure TCondFmt.ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
begin
  if AllRange.R2>= aPos then
  begin
    inherited;
    if AllRange.R1>= aPos then IncMaxMin(AllRange.R1, aCount, Max_Rows, aPos);
    IncMaxMin(AllRange.R2, aCount, Max_Rows, AllRange.R1);
  end;

  CFs.ArrangeInsert(aPos, aCount, SheetInfo );
end;

procedure TCondFmt.LoadFromStream(const DataStream: TStream;
  const First: TRangeRecord);
var
  MyRecord: TBaseRecord;
  aPos, CFCount, i: integer;

  RecordHeader: TRecordHeader;
  R: TBaseRecord;
begin
  Clear;
  MyRecord:= First;

  CFCount:=GetWord(First.Data, 0);
  Flag:=GetWord(First.Data,2);
  aPos:=4;
  ReadMem(MyRecord, aPos, SizeOf(TExcelRange), @AllRange);
  RangeValuesList.Load(First, aPos);

  //Load corresponding CFs
  for i:=0 to CFCount-1 do
  begin
    if (DataStream.Read(RecordHeader, sizeof(RecordHeader)) <> sizeof(RecordHeader)) then
       raise Exception.Create(ErrExcelInvalid);
    R:=LoadRecord(DataStream, RecordHeader);
    try
      if not (R is TCFRecord) then raise Exception.Create(ErrInvalidCF);
      CFs.Add(R as TCFRecord);
    except
      FreeAndNil(R);
      raise;
    end; //Except
  end;

  First.Free;  //to be consistent with the other LoadFromStream, we should take ownership of the record if there are no exceptions

end;

procedure TCondFmt.SaveToStream(const DataStream: TStream);
var
  RecordHeader: TRecordHeader;
  CFCount: Word;
  i: integer;
begin
  if RangeValuesList.Count=0 then exit; //Don't save empty CF's
  RecordHeader.Id:= xlr_CONDFMT;
  for i:=0 to RangeValuesList.RepeatCountR(RangeValuesList.Count)-1 do
  begin
    RecordHeader.Size:=RangeValuesList.RecordSizeR(i, RangeValuesList.Count);
    DataStream.Write(RecordHeader, SizeOf(RecordHeader));

    CFCount:= CFs.Count;
    DataStream.Write(CFCount, SizeOf(CFCount));
    DataStream.Write(Flag, SizeOf(Flag));
    DataStream.Write(AllRange, SizeOf(AllRange));

    RangeValuesList.SaveToStreamR(DataStream, i);
    CFs.SaveToStream(DataStream);
  end;

end;

function TCondFmt.TotalSize: int64;
begin
  if RangeValuesList.Count=0 then TotalSize:=0 else
    TotalSize:=RangeValuesList.TotalSizeR(RangeValuesList.Count) + CFs.TotalSize*RangeValuesList.RepeatCountR(RangeValuesList.Count);
end;

procedure TCondFmt.SaveRangeToStream(const DataStream: TStream;
  const CellRange: TXlsCellRange);
var
  RecordHeader: TRecordHeader;
  CFCount: Word;
  i: integer;
  Rc: integer;
begin
  Rc:=RangeValuesList.CountRangeRecords(CellRange);
  if Rc=0 then exit; //Don't save empty CF's
  RecordHeader.Id:= xlr_CONDFMT;
  for i:=0 to RangeValuesList.RepeatCountR(Rc)-1 do
  begin
    RecordHeader.Size:=RangeValuesList.RecordSizeR(i, Rc);
    DataStream.Write(RecordHeader, SizeOf(RecordHeader));

    CFCount:= CFs.Count;
    DataStream.Write(CFCount, SizeOf(CFCount));
    DataStream.Write(Flag, SizeOf(Flag));
    DataStream.Write(AllRange, SizeOf(AllRange));

    RangeValuesList.SaveRangeToStreamR(DataStream, i, Rc, CellRange );
    CFs.SaveToStream(DataStream);
  end;
end;

function TCondFmt.TotalRangeSize(const CellRange: TXlsCellRange): int64;
var
  i: integer;
begin
  i:= RangeValuesList.CountRangeRecords(CellRange);
  if RangeValuesList.Count=0 then Result:=0 else
    Result:=RangeValuesList.TotalSizeR(i)
            + CFs.TotalSize*RangeValuesList.RepeatCountR(i);
end;

{ TCFRecord }

procedure TCFRecord.ArrangeCopy(const NewRow: Word);
begin
//  No need to arrange nothing... ranges are relative to the cells
end;

procedure TCFRecord.ArrangeTokensInsertRow(const atPos, fPos, InsPos, InsOffset, CopyOffset: integer; const SheetInfo: TSheetInfo);
begin
  try
    UXlsTokenArray.ArrangeInsertRows(Data, atPos, fPos, InsPos, InsOffset, CopyOffset, SheetInfo, true);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadCF,[e.Token]);
    else raise;
  end; //Except
end;

constructor TCFRecord.Create(const aId: word;
  const aData: PArrayOfByte; const aDataSize: integer);
begin
  inherited;
  CfType:= Data[0];
  Op:=Data[1];
  Cce1:=GetWord(Data, 2);
  Cce2:=GetWord(Data, 4);
end;

procedure TCFRecord.ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
begin
  inherited;
  if Cce1>0 then ArrangeTokensInsertRow(DataSize-Cce1-Cce2 , DataSize-Cce2, aPos, aCount, 0,  SheetInfo);
  if Cce2>0 then ArrangeTokensInsertRow(DataSize-Cce2 , DataSize, aPos, aCount, 0,  SheetInfo);
end;

{ TCFRecordList }


procedure TCFRecordList.ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeInsert(aPos, aCount,SheetInfo);
end;

end.
