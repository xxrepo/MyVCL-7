unit UXlsChart;

interface
uses UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords,
     XlsMessages, UXlsTokenArray, Classes, SysUtils, UXlsBaseList;

type
  TChartRecord = class (TBaseRecord)
  end;

  TChartAIRecord = class (TChartRecord)
  private
    Flags, Flen: word;

    procedure ArrangeTokensInsertRow(const  InsPos, InsOffset, CopyOffset: integer; const SheetInfo: TSheetInfo);

  public
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);
    procedure ArrangeCopyRows(const RowOffset: integer);
  end;

  TChartAIRecordCache = class (TBaseList)
    {$INCLUDE TChartAIRecordCacheHdr.inc}
    constructor Create;
    procedure ArrangeCopyRows(const RowOffset: integer);
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);
  end;

  TChartRecordList = class (TBaseRecordList)
  private
    AICache: TChartAIRecordCache;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification);override;
  public
    constructor Create;
    destructor Destroy;override;
    procedure ArrangeCopyRows(const RowOffset: integer);
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);
  end;

implementation

{ TChartAIRecordCache }
{$INCLUDE TChartAIRecordCacheImp.inc}

constructor TChartAIRecordCache.Create;
begin
  inherited Create(False) //We don't own the objects
end;

procedure TChartAIRecordCache.ArrangeCopyRows(const RowOffset: integer);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangecopyRows(RowOffset);
end;

procedure TChartAIRecordCache.ArrangeInsert(const aPos, aCount: integer;
  const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeInsert(aPos, aCount,SheetInfo);
end;

procedure TChartAIRecordCache.ArrangeCopySheet(const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeCopySheet(SheetInfo);
end;

{ TChartAIRecord }

//This shouldn't make sense... all ranges in charts are absolute. This is to support RelativeCharts
procedure TChartAIRecord.ArrangeCopyRows(const RowOffset: integer);
const
  SheetInfo: TSheetInfo=(InsSheet:-1;FormulaSheet:-1;GetSheet:nil;SetSheet:nil);
begin
  if Flen>0 then ArrangeTokensInsertRow(0, 0, RowOffset,  SheetInfo); //Sheet info doesn't have meaninig on copy
end;

procedure TChartAIRecord.ArrangeTokensInsertRow(const InsPos, InsOffset,
  CopyOffset: integer; const SheetInfo: TSheetInfo);
begin
  try
    UXlsTokenArray.ArrangeInsertRows(Data, 8, 8+FLen, InsPos, InsOffset, CopyOffset, SheetInfo, False);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadChartFormula,[e.Token]);
    else raise;
  end; //Except
end;

constructor TChartAIRecord.Create(const aId: word; const aData: PArrayOfByte;
  const aDataSize: integer);
begin
  inherited;
  Flags:=GetWord(Data, 0);
  FLen:=GetWord(Data, 6);
end;

procedure TChartAIRecord.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  if Flen=0 then exit;
  try
    UXlsTokenArray.ArrangeInsertSheets(Data, 8, 8+FLen, SheetInfo);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadChartFormula,[e.Token]);
    else raise;
  end; //Except
end;

procedure TChartAIRecord.ArrangeInsert(const aPos, aCount: integer;
  const SheetInfo: TSheetInfo);
begin
  if Flen>0 then ArrangeTokensInsertRow(aPos, aCount, 0,  SheetInfo);
end;

{ TChartRecordList }

constructor TChartRecordList.Create;
begin
  inherited;
  AICache:= TChartAIRecordCache.Create;
end;

destructor TChartRecordList.Destroy;
begin
  FreeAndNil(AICache);
  inherited;
end;

procedure TChartRecordList.ArrangeCopyRows(const RowOffset: integer);
begin
  AICache.ArrangeCopyRows(RowOffset);
end;

procedure TChartRecordList.ArrangeInsert(const aPos, aCount: integer;
  const SheetInfo: TSheetInfo);
begin
  AICache.ArrangeInsert(aPos, aCount, SheetInfo);
end;

procedure TChartRecordList.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  AICache.ArrangeCopySheet(SheetInfo);
end;

procedure TChartRecordList.Notify(Ptr: Pointer; Action: TListNotification);
begin
  if (Action = lnDeleted) and (AICache<>nil) then if (TBaseRecord(Ptr) is TChartAIRecord) then
    AICache.Delete(AICache.IndexOf(TBaseRecord(Ptr)));
  if Action = lnAdded then if (TBaseRecord(Ptr) is TChartAIRecord) then
    AICache.Add(TChartAIRecord(Ptr));
  inherited Notify(Ptr, Action);
end;


end.
