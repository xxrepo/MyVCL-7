unit UXlsWorkbookGlobals;

interface
uses Classes, SysUtils, UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords, UXlsChart,
     UXlsSST, XlsMessages, UXlsSections, UXlsReferences, USheetNameList, UXlsEscher,
     UXlsFormula, UEscherRecords, UXlsPalette, UXlsXF, UFlxMessages;
type
  TBoundSheetList = class
  private
   FSheetNames: TSheetNameList;  //Cache with all the sheet names to speed up searching
   FBoundSheets: TBoundSheetRecordList;
  public
    property BoundSheets: TBoundSheetRecordList read FBoundSheets;

    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    procedure Add(const aRecord: TBoundSheetRecord);

    procedure SaveToStream(const DataStream: TStream);
    procedure SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer);
    function TotalSize:int64;
    function TotalRangeSize(const SheetIndex: integer): int64;

    procedure InsertSheet(const BeforeSheet: byte; const OptionFlags: word; const SheetName: WideString);
  end;

  TWorkbookGlobals = class( TBaseSection)
  private
    FSST: TSST;
    FReferences: TReferences;
    FBoundSheets: TBoundSheetList;
    FMiscRecords: TBaseRecordList;
    FNames : TNameRecordList;
    FDrawingGroup: TDrawingGroup;
    FWindow1: TWindow1Record;
    FXF: TXFRecordList;
    FFonts: TFontRecordList;
    FFormats: TFormatRecordList;

    FPaletteCache: TPaletteRecord;
    FPaletteIndex: integer;

    function GetSheetCount: integer;
    function GetSheetName(const index: integer): Widestring;
    procedure SetSheetName(const index: integer; const Value: Widestring);
    function GetSheetOptionFlags(const index: integer): word;
    function GetActivesheet: integer;
    procedure SetActiveSheet(const Value: integer);
    function GetColorPalette(Index: integer): LongWord;
    procedure SetColorPalette(Index: integer; const Value: LongWord);
  public
    property SST: TSST read FSST;

    property SheetName[const index: integer]: Widestring read GetSheetName write SetSheetName;
    property SheetCount: integer read GetSheetCount;
    property SheetOptionFlags[const index: integer]: word read GetSheetOptionFlags;
    procedure SheetSetOffset(const index: integer; const Offset: cardinal);

    property ActiveSheet: integer read GetActivesheet write SetActiveSheet;

    property DrawingGroup: TDrawingGroup read FDrawingGroup;
    property References: TReferences read FReferences;
    property Names: TNameRecordList read FNames;

    constructor Create;
    destructor Destroy; override;
    function TotalSize:int64; override;
    function TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange): int64; override;
    procedure Clear; override;
    procedure LoadFromStream( const DataStream: TStream; const First: TBOFRecord; const SST: TSST); override;
    procedure SaveToStream(const DataStream: TStream);override;
    procedure SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer; const CellRange: TXlsCellRange);override;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo);
    procedure DeleteRows(const aRow, aCount: word;const SheetInfo: TSheetInfo);

    procedure InsertSheets(const CopyFrom, BeforeSheet: byte; const OptionFlags: word; const Name: WideString; const SheetCount: byte);

    property ColorPalette[Index: integer]: LongWord read GetColorPalette write SetColorPalette;

    property XF:TXFRecordList read FXF;
    property Fonts:TFontRecordList read FFonts;
    property Formats:TFormatRecordList read FFormats;
  end;


implementation
{ TBoundSheetList }

procedure TBoundSheetList.Add(const aRecord: TBoundSheetRecord);
begin
  FSheetNames.Add(aRecord.SheetName);
  FBoundSheets.Add(aRecord); //Last
end;

procedure TBoundSheetList.Clear;
begin
  if FSheetNames<>nil then FSheetNames.Clear;
  if FBoundSheets<>nil then FBoundSheets.Clear;
end;

constructor TBoundSheetList.Create;
begin
  inherited;
  FSheetNames:= TSheetNameList.Create;
  FBoundSheets:= TBoundSheetRecordList.Create;
end;

destructor TBoundSheetList.Destroy;
begin
  FreeAndNil(FSheetNames);
  FreeAndNil(FBoundSheets);
  inherited;
end;

procedure TBoundSheetList.InsertSheet(const BeforeSheet: byte;
  const OptionFlags: word; const SheetName: WideString);
var
  NewName: WideString;
begin
  NewName:= FSheetNames.AddUniqueName(SheetName);
  FBoundSheets.Insert(BeforeSheet, TBoundSheetRecord.CreateNew(OptionFlags, NewName));
end;

procedure TBoundSheetList.SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer);
begin
  if (SheetIndex>=FBoundSheets.Count)or (SheetIndex<0) then raise Exception.CreateFmt(ErrInvalidSheetNo, [SheetIndex,0,FBoundSheets.Count-1]);
  FBoundSheets[SheetIndex].SaveToStream(DataStream);
end;

procedure TBoundSheetList.SaveToStream(const DataStream: TStream);
begin
  FBoundSheets.SaveToStream(DataStream);
end;

function TBoundSheetList.TotalSize: int64;
begin
  TotalSize:= FBoundSheets.TotalSize;
end;

function TBoundSheetList.TotalRangeSize(const SheetIndex: integer): int64;
begin
  if (SheetIndex>=FBoundSheets.Count)or (SheetIndex<0) then raise Exception.CreateFmt(ErrInvalidSheetNo, [SheetIndex,0,FBoundSheets.Count-1]);
  Result:=FBoundSheets[SheetIndex].TotalSize;
end;

{ TWorkbookGlobals }

procedure TWorkbookGlobals.Clear;
begin
  inherited;
  if FSST<>nil then FSST.Clear;
  if FReferences<>nil then FReferences.Clear;
  if FBoundSheets<>nil then FBoundSheets.Clear;
  if FMiscRecords<>nil then FMiscRecords.Clear;
  if FNames<>nil then FNames.Clear;
  if FDrawingGroup<>nil then FDrawingGroup.Clear;
  if FXF<>nil then FXF.Clear;
  if FFonts<>nil then FFonts.Clear;
  if FFormats<>nil then FFormats.Clear;
  FPaletteCache:=nil;
  FWindow1:=nil;
end;

constructor TWorkbookGlobals.Create;
begin
  inherited;
  FSST:= TSST.Create;
  FReferences:= TReferences.Create;
  FBoundSheets:= TBoundSheetList.Create;
  FMiscRecords:= TBaseRecordList.Create;
  FNames:=TNameRecordList.Create;
  FDrawingGroup:= TDrawingGroup.Create;
  FXF:= TXFRecordList.Create;
  FFonts:= TFontRecordList.Create;
  FFormats:= TFormatRecordList.Create;
  FPaletteCache:=nil;
  FWindow1:=nil;
end;

procedure TWorkbookGlobals.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
begin
  FNames.ArrangeInsert(aRow, -aCount, SheetInfo);
end;

destructor TWorkbookGlobals.Destroy;
begin
  FreeAndNil(FSST);
  FreeAndNil(FReferences);
  FreeAndNil(FBoundSheets);
  FreeAndNil(FMiscRecords);
  FreeAndNil(FNames);
  FreeAndNil(FDrawingGroup);
  FreeAndNil(FXF);
  FreeAndNil(FFonts);
  FreeAndNil(FFormats);
  inherited;
end;

function TWorkbookGlobals.GetActivesheet: integer;
begin
  if FWindow1<>nil then Result:= FWindow1.ActiveSheet else Result:=0;
end;

function TWorkbookGlobals.GetColorPalette(Index: integer): LongWord;
begin
  if FPaletteCache=nil then Result:=StandardPalette(Index) else Result:=FPaletteCache.Color[Index];
end;

function TWorkbookGlobals.GetSheetCount: integer;
begin
  Result:= FBoundSheets.BoundSheets.Count;
end;

function TWorkbookGlobals.GetSheetName(const index: integer): Widestring;
begin
  Result:= FBoundSheets.BoundSheets.SheetName[index];
end;

function TWorkbookGlobals.GetSheetOptionFlags(const index: integer): word;
begin
  Result:= FBoundSheets.BoundSheets[index].OptionFlags;
end;

procedure TWorkbookGlobals.InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo);
begin
  FNames.ArrangeInsert(DestRow, (LastRow -FirstRow +1)* aCount, SheetInfo);
end;

procedure TWorkbookGlobals.InsertSheets(const CopyFrom, BeforeSheet: byte;
  const OptionFlags: word; const Name: WideString; const SheetCount: byte);
var
  i: integer;
  SheetInfo: TSheetInfo;
begin
  for i:=0 to SheetCount-1 do
    FBoundSheets.InsertSheet(BeforeSheet, OptionFlags, Name);
  FReferences.InsertSheets(BeforeSheet, SheetCount);

  SheetInfo.InsSheet:=-1;
  SheetInfo.FormulaSheet:=CopyFrom;
  SheetInfo.GetSheet:= FReferences.GetSheet;
  SheetInfo.SetSheet:= FReferences.SetSheet;
  FNames.InsertSheets(CopyFrom, BeforeSheet, SheetCount, SheetInfo );
end;

procedure TWorkbookGlobals.LoadFromStream(const DataStream: TStream;
  const First: TBOFRecord; const SST: TSST);
var
  RecordHeader: TRecordHeader;
  R: TBaseRecord;
begin
  Clear;
  repeat
    if (DataStream.Read(RecordHeader, sizeof(RecordHeader)) <> sizeof(RecordHeader)) then
      raise Exception.Create(ErrExcelInvalid);

    R:=LoadRecord(DataStream, RecordHeader);
    try
      if (R is TXFRecord) and (FXF.Count=0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FXF));
      if (R is TFontRecord) and (FFonts.Count=0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FFonts));
      if (R is TFormatRecord) and (FFormats.Count=0) then FMiscRecords.Add(TSubListRecord.CreateAndAssign(FFormats));

      if (R is TPaletteRecord) then FPaletteCache:=(R as TPaletteRecord);
      if (R is TXFRecord) or (R is TStyleRecord) then FPaletteIndex:=FMiscRecords.Count; //After the last Style record

      if (R is TBofRecord) then raise Exception.Create(ErrExcelInvalid)
      else if (R is TIgnoreRecord) then FreeAndNil(R)
      else if (R is TBoundSheetRecord) then FBoundSheets.Add(R as TBoundSheetRecord)
      else if (R is TNameRecord) then FNames.Add(R as TNameRecord)
      else if (R is TXFRecord) then FXF.Add(R as TXFRecord)
      else if (R is TFontRecord) then FFonts.Add(R as TFontRecord)
      else if (R is TFormatRecord) then FFormats.Add(R as TFormatRecord)
      else if (R is TEOFRecord) then EOF:=(R as TEOFRecord)
      else if (R is TSSTRecord) then begin FSST.Load(R as TSSTRecord); FreeAndNil(R);end
      else if (R is TSupBookRecord) then FReferences.AddSupbook(R as TSupBookRecord)
      else if (R is TExternSheetRecord) then begin; FReferences.AddExternRef(R as TExternSheetRecord); FreeAndNil(R);end
      else if (R is TDrawingGroupRecord) then FDrawingGroup.LoadFromStream(DataStream, R as TDrawingGroupRecord)
      else if (R is TWindow1Record) then begin; FWindow1:=R as TWindow1Record; FMiscRecords.Add(R); end

      else FMiscRecords.Add(R);

    except
      FreeAndNil(R);
      Raise;
    end; //Finally

  until RecordHeader.id = xlr_EOF;

  BOF:=First; //Last statement
end;

procedure TWorkbookGlobals.SaveRangeToStream(const DataStream: TStream;
  const SheetIndex: integer; const CellRange: TXlsCellRange);
begin
  //Someday this can be optimized to only save texts on the range
  //But even Excel does not do it...
  if (BOF=nil)or(EOF=nil) then raise Exception.Create(ErrSectionNotLoaded);

  BOF.SaveToStream(DataStream);
  FMiscRecords.SaveToStream(DataStream);
  //FXF, FFonts and FFormats are saved in FMiscRecords.SaveToStream;

  FBoundSheets.SaveRangeToStream(DataStream, SheetIndex);
  FReferences.SaveToStream(DataStream);
  FNames.SaveToStream(DataStream); //Should be after FBoundSheets.SaveToStream
  //Images are not saved to the clipboard by excel
  //FDrawingGroup.SaveToStream(DataStream);
  FSST.SaveToStream(DataStream);
  EOF.SaveToStream(DataStream);
end;

procedure TWorkbookGlobals.SaveToStream(const DataStream: TStream);
begin
  if (BOF=nil)or(EOF=nil) then raise Exception.Create(ErrSectionNotLoaded);

  BOF.SaveToStream(DataStream);
  FMiscRecords.SaveToStream(DataStream);
  //FXF, FFonts and FFormats are saved in FMiscRecords.SaveToStream;

  FBoundSheets.SaveToStream(DataStream);
  FReferences.SaveToStream(DataStream);
  FNames.SaveToStream(DataStream); //Should be after FBoundSheets.SaveToStream
  FDrawingGroup.SaveToStream(DataStream);
  FSST.SaveToStream(DataStream);
  EOF.SaveToStream(DataStream);
end;

procedure TWorkbookGlobals.SetActiveSheet(const Value: integer);
begin
  if FWindow1<>nil then FWindow1.ActiveSheet:=Value;
end;

procedure TWorkbookGlobals.SetColorPalette(Index: integer;
  const Value: LongWord);
begin
  if FPaletteCache=nil then
  begin
    //We have to create a standard palette first.
    FMiscRecords.Insert(FPaletteIndex, TPaletteRecord.CreateStandard);
    FPaletteCache:=FMiscRecords[FPaletteIndex] as TPaletteRecord;
  end;
  FPaletteCache.Color[Index]:= Value;
end;

procedure TWorkbookGlobals.SetSheetName(const index: integer;
  const Value: Widestring);
begin
   FBoundSheets.BoundSheets.SheetName[index]:=Value;
end;

procedure TWorkbookGlobals.SheetSetOffset(const index: integer; const Offset: cardinal);
begin
  FBoundSheets.BoundSheets[index].SetOffset(Offset);
end;

function TWorkbookGlobals.TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange): int64;
begin
  Result:= inherited TotalSize +
      FSST.TotalSize +
      FReferences.TotalSize +
      FBoundSheets.TotalRangeSize(SheetIndex) +
      FMiscRecords.TotalSize +
      FNames.TotalSize+
      //Excel doesnt save images to the clipboard
      //FDrawingGroup.TotalSize+
      //FXF.TotalSize, FFonts.TotalSize and FFormats.TotalSize are not included in FMiscRecords.TotalSize;
      FXF.TotalSize+
      FFonts.TotalSize+
      FFormats.TotalSize;
end;

function TWorkbookGlobals.TotalSize: int64;
begin
  Result:= inherited TotalSize +
      FSST.TotalSize +
      FReferences.TotalSize +
      FBoundSheets.TotalSize +
      FMiscRecords.TotalSize +
      FNames.TotalSize+
      FDrawingGroup.TotalSize+
      //FXF.TotalSize, FFonts.TotalSize and FFormats.TotalSize are not included in FMiscRecords.TotalSize;
      FXF.TotalSize+
      FFonts.TotalSize+
      FFormats.TotalSize;
end;

end.
