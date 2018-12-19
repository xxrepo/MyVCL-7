unit UXlsSheet;

interface
uses Classes, SysUtils, UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords, UXlsChart,
     UXlsSST, XlsMessages, UXlsSections, UXlsCondFmt, UXlsRowColEntries, UXlsEscher,
     UXlsRangeRecords, UEscherRecords, UXlsWorkbookGlobals, UXlsNotes, UXlsBaseList,
     UFlxMessages, UXlsCellRecords, UXlsFormula, UXlsPageBreaks, UXlsColInfo;

type
  TSheet= class (TBaseSection)
  private
    function GetShowGridLines: boolean;
    procedure SetShowGridLines(const Value: boolean);
    function GetPrintGridLines: boolean;
    procedure SetPrintGridLines(const Value: boolean);
    function GetPageFooter: WideString;
    function GetPageHeader: WideString;
    procedure SetPageFooter(const Value: WideString);
    procedure SetPageHeader(const Value: WideString);
    function GetMargins: TXlsMargins;
    procedure SetMargins(const Value: TXlsMargins);
    procedure AddMargin(var Margin: TMarginRecord; const aId: integer; const Value: extended);
    function GetSheetZoom: integer;
    procedure SetSheetZoom(const Value: integer);
  protected
    FWorkbookGlobals: TWorkbookGlobals;
    FWindow2: TWindow2Record;
    FPageHeader: TPageHeaderRecord;
    FPageFooter: TPageFooterRecord;
    FPrintGridLines: TPrintGridLinesRecord;
    FLeftMargin, FRightMargin, FTopMargin, FBottomMargin: TMarginRecord;
    FSetup: TSetupRecord;
    FWSBool: TWSBoolRecord;
    FZoom: TSCLRecord;

    FPrintRecords: TBaseRecordList;

    function GetSelected: boolean;
    procedure SetSelected(const Value: boolean);
    procedure SetPageHeaderFooter(const P: TPageHeaderFooterRecord; const s: Widestring);virtual;abstract;
    procedure AddZoomRecord; virtual;abstract;
  public
    OriginalDimensions: TDimensionsRec;

    function CopyTo: TSheet; //This method can't be virtual
    function DoCopyTo: TSheet; virtual;
    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);virtual;abstract;
    procedure DeleteRows(const aRow, aCount: word;const SheetInfo: TSheetInfo);virtual; abstract;
    procedure ArrangeInsert(const InsPos, InsCount: integer ; const SheetInfo: TSheetInfo);virtual;abstract;
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo); virtual;

    procedure DeleteHPageBreak(const aRow: word);virtual;
    procedure DeleteVPageBreak(const aCol: word);virtual;
    procedure InsertHPageBreak(const aRow: word);virtual;
    procedure InsertVPageBreak(const aCol: word);virtual;

    constructor Create(const aWorkbookGlobals: TWorkbookGlobals);virtual;

    property Selected: boolean read GetSelected write SetSelected;
    property ShowGridLines: boolean read GetShowGridLines write SetShowGridLines;
    property PrintGridLines: boolean read GetPrintGridLines write SetPrintGridLines;

    property PageHeader: Widestring read GetPageHeader write SetPageHeader;
    property PageFooter: Widestring read GetPageFooter write SetPageFooter;
    property Margins: TXlsMargins read GetMargins write SetMargins; //Margins are in inches

    property SheetZoom: integer read GetSheetZoom write SetSheetZoom;

  end;

  ClassOfTSheet= class of TSheet;

  TChart = class (TSheet)
  private
    FChartRecords: TChartRecordList;
  protected
    procedure SetPageHeaderFooter(const P: TPageHeaderFooterRecord; const s: Widestring);override;
    procedure AddZoomRecord; override;

  public

    constructor Create(const aWorkbookGlobals: TWorkbookGlobals);override;
    destructor Destroy;override;
    function DoCopyTo: TSheet; override;

    function TotalSize:int64; override;
    function TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange):int64; override;
    procedure LoadFromStream( const DataStream: TStream; const First: TBOFRecord; const SST: TSST);override;
    procedure SaveToStream(const DataStream: TStream);override;
    procedure SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer; const CellRange: TXlsCellRange);override;
    procedure Clear; override;
    procedure ArrangeCopyRows(const RowOffset: integer);
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);override;
    procedure ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);override;
    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);override;
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);override;

  end;

  TChartList = class(TBaseList) //records are TChart
    {$INCLUDE TChartListHdr.inc}
    procedure SaveToStream(const DataStream: TStream);
    procedure ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);
  end;


  TWorkSheet = class (TSheet)
  private
    FMiscRecords1: TBaseRecordList;
    FMiscRecords2: TBaseRecordList;
    FHPageBreaks: THPageBreakList;
    FVPageBreaks: TVPageBreakList;
    FDrawing: TDrawing;
    FCells: TCells;
    FRanges: TRangeList;
    FNotes: TNoteList;
    FColumns: TColInfoList;

    FDefRowHeight: Longint;
    FDefColWidth:  integer;

    function GetDrawingRow(index: integer): integer;
    function GetDrawingName(index: integer): widestring;
    function GetPrintNumberOfHorizontalPages: word;
    function GetPrintNumberOfVerticalPages: word;
    function GetPrintScale: integer;
    function GetPrintToFit: boolean;
    procedure SetPrintNumberOfHorizontalPages(const Value: word);
    procedure SetPrintNumberOfVerticalPages(const Value: word);
    procedure SetPrintScale(const Value: integer);
    procedure SetPrintToFit(const Value: boolean);
  protected
    procedure AddZoomRecord; override;
    procedure SetPageHeaderFooter(const P: TPageHeaderFooterRecord; const s: Widestring);override;
  public
    constructor Create(const aWorkbookGlobals: TWorkbookGlobals);override;
    destructor Destroy;override;
    function DoCopyTo: TSheet; override;

    function TotalSize:int64; override;
    function TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange): int64;override;
    procedure LoadFromStream( const DataStream: TStream; const First: TBOFRecord; const SST: TSST);override;
    procedure SaveToStream(const DataStream: TStream);override;
    procedure SaveRangeToStream(const DataStream: TStream; const SheetIndex: integer; const CellRange: TXlsCellRange);override;
    procedure Clear; override;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);override;
    procedure DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);override;

    procedure ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);override;
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo); override;

    property Notes: TNoteList read FNotes;
    property Cells: TCells read FCells;

    function DrawingCount: integer;
    procedure AssignDrawing(const Index: integer; const Data: string; const DataType: TXlsImgTypes);
    procedure GetDrawingFromStream(const Index: integer; const Data: TStream; var DataType: TXlsImgTypes);
    property DrawingRow[index: integer]: integer read GetDrawingRow;
    property DrawingName[index: integer]: widestring read GetDrawingName;
    function GetAnchor(const Index: integer): TClientAnchor;

    procedure DeleteImage(const Index: integer);
    procedure ClearImage(const Index: integer);
    procedure AddImage(const Data: string; const DataType: TXlsImgTypes; const Properties: TImageProperties;const Anchor: TFlxAnchorType);

    procedure AddNewComment(const Row, Col: integer; const Txt: widestring; const Properties: TImageProperties);

    procedure DeleteHPageBreak(const aRow: word);override;
    procedure DeleteVPageBreak(const aCol: word);override;
    procedure InsertHPageBreak(const aRow: word);override;
    procedure InsertVPageBreak(const aCol: word);override;

    function GetRowHeight(const aRow: integer): integer;
    function GetColWidth(const aCol: Word): integer;
    procedure SetRowHeight(const aRow: integer; const Value: integer);
    procedure SetColWidth(const aCol: Word; const Value: integer);

    property DefRowHeight: Longint read FDefRowHeight;
    property DefColWidth:  integer read FDefColWidth;

    function GetRowFormat(const aRow: integer): integer;
    function GetColFormat(const aCol: integer): integer;
    procedure SetRowFormat(const aRow: integer; const Value: integer);
    procedure SetColFormat(const aCol: integer; const Value: integer);

    function CellMergedBounds(const aRow, aCol: integer): TXlsCellRange;
    procedure MergeCells(aRow1, aCol1, aRow2, aCol2: integer);

    function HasHPageBreak(const Row: integer): boolean;
    function HasVPageBreak(const Col: integer): boolean;

    property PrintToFit: boolean read GetPrintToFit write SetPrintToFit;
    property PrintScale: integer read GetPrintScale write SetPrintScale;
    property PrintNumberOfHorizontalPages: word read GetPrintNumberOfHorizontalPages write SetPrintNumberOfHorizontalPages;
    property PrintNumberOfVerticalPages: word read GetPrintNumberOfVerticalPages write SetPrintNumberOfVerticalPages;
  end;

implementation
{$INCLUDE TChartListImp.inc}

{ TSheet }

function TSheet.CopyTo: TSheet;
begin
  if Self= nil then Result:=nil else Result:= DoCopyTo;
end;

constructor TSheet.Create(const aWorkbookGlobals: TWorkbookGlobals);
begin
  FWorkbookGlobals:=aWorkbookGlobals;
end;

function TSheet.DoCopyTo: TSheet;
begin
  Result:= ClassOfTSheet(ClassType).Create(FWorkbookGlobals);
  Result.BOF:= BOF.CopyTo as TBOFRecord;
  Result.EOF:= EOF.CopyTo as TEOFRecord;
end;

function TSheet.GetSelected: boolean;
begin
  if (FWindow2<>nil) then Result:=FWindow2.Selected else Result:=false;
end;

procedure TSheet.SetSelected(const Value: boolean);
begin
  if (FWindow2<>nil) then FWindow2.Selected:=value;
end;

procedure TSheet.DeleteHPageBreak(const aRow: word);
begin
  //Nothing in TSheet
end;

procedure TSheet.DeleteVPageBreak(const aCol: word);
begin
  //Nothing in TSheet
end;

procedure TSheet.InsertHPageBreak(const aRow: word);
begin
  //Nothing in TSheet
end;

procedure TSheet.InsertVPageBreak(const aCol: word);
begin
  //Nothing in TSheet
end;

procedure TSheet.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  //Nothing in TSheet
end;

function TSheet.GetShowGridLines: boolean;
begin
  if (FWindow2<>nil) then Result:=FWindow2.ShowGridLines else Result:=true;
end;

procedure TSheet.SetShowGridLines(const Value: boolean);
begin
  if (FWindow2<>nil) then FWindow2.ShowGridLines:=value;
end;

function TSheet.GetPrintGridLines: boolean;
begin
  if (FPrintGridLines<>nil) then Result:=FPrintGridLines.Value else Result:=true;
end;

procedure TSheet.SetPrintGridLines(const Value: boolean);
begin
  if (FPrintGridLines<>nil) then FPrintGridLines.Value:=value;
end;

function TSheet.GetPageFooter: WideString;
begin
  if (FPageFooter<>nil) then Result:=FPageFooter.Text else Result:='';
end;

function TSheet.GetPageHeader: WideString;
begin
  if (FPageHeader<>nil) then Result:=FPageHeader.Text else Result:='';
end;

procedure TSheet.SetPageFooter(const Value: WideString);
begin
  SetPageHeaderFooter(FPageFooter, Value);
end;

procedure TSheet.SetPageHeader(const Value: WideString);
begin
  SetPageHeaderFooter(FPageHeader, Value);
end;

function TSheet.GetMargins: TXlsMargins;
begin
  FillChar(Result, SizeOf(Result), 0);
  if FLeftMargin<>nil then Result.Left:=FLeftMargin.Value;
  if FRightMargin<>nil then Result.Right:=FRightMargin.Value;
  if FTopMargin<>nil then Result.Top:=FTopMargin.Value;
  if FBottomMargin<>nil then Result.Bottom:=FBottomMargin.Value;

  if FSetup<> nil then
  begin
    Result.Header:= FSetup.HeaderMargin;
    Result.Footer:= FSetup.FooterMargin;
  end;

end;

procedure TSheet.SetMargins(const Value: TXlsMargins);
begin
  if FLeftMargin=nil then AddMargin(FLeftMargin, xlr_LEFTMARGIN, Value.Left) else FLeftMargin.Value:=Value.Left;
  if FRightMargin=nil then AddMargin(FRightMargin, xlr_RIGHTMARGIN, Value.Right) else FRightMargin.Value:=Value.Right;
  if FTopMargin=nil then AddMargin(FTopMargin, xlr_TOPMARGIN, Value.Top) else FTopMargin.Value:=Value.Top;
  if FBottomMargin=nil then AddMargin(FBottomMargin, xlr_BOTTOMMARGIN, Value.Bottom) else FBottomMargin.Value:=Value.Bottom;

  if FSetup<> nil then
  begin
    FSetup.HeaderMargin:=Value.Header;
    FSetup.FooterMargin:=Value.Footer;
  end;

end;

procedure TSheet.AddMargin(var Margin: TMarginRecord; const aId: integer;
  const Value: extended);
const
  DataSize=SizeOf(Double);
var
  Data: PArrayOfByte;
  i,k, RId: integer;
begin
  //Search for the best position...
  k:=FPrintRecords.Count-1;
  for i:=FPrintRecords.Count-1 downto 0 do
  begin
    RId:=(FPrintRecords[i] as TBaseRecord).Id;
    if (RId=xlr_LEFTMARGIN) or(RId=xlr_RIGHTMARGIN)
       or(RId=xlr_TOPMARGIN) or(RId=xlr_BOTTOMMARGIN)
       or (RId=xlr_VCENTER)or (RId=xlr_DEFAULTROWHEIGHT)then
    begin
      k:=i;
      break;
    end;
  end;
  GetMem(Data, DataSize);
  try
    FPrintRecords.Insert(k +1,TMarginRecord.Create(aId, Data, DataSize));
  except
    FreeMem(Data);
    raise;
  end; //Except
  Margin:=(FPrintRecords[k+1] as TMarginRecord);
  Margin.Value:=Value;
end;

function TSheet.GetSheetZoom: integer;
begin
  if FZoom<>nil then Result:=FZoom.Zoom else Result:=100;
end;

procedure TSheet.SetSheetZoom(const Value: integer);
begin
  if FZoom=nil then AddZoomRecord;
  if FZoom=nil then exit;
  FZoom.Zoom:=Value;
end;

{ TChart }

procedure TChart.ArrangeCopyRows(const RowOffset: integer);
begin
  FChartRecords.ArrangeCopyRows(RowOffset);
end;

procedure TChart.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  FChartRecords.ArrangeCopySheet(SheetInfo);
end;

procedure TChart.InsertAndCopyRows(const FirstRow, LastRow, DestRow,
  aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
begin
  //Nothing, we never insert rows in a chart sheet
end;

procedure TChart.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
begin
  //Nothing, we never delete rows in a chart sheet
end;

procedure TChart.Clear;
begin
  inherited;
  if FChartRecords<>nil then FChartRecords.Clear;
end;

function TChart.DoCopyTo: TSheet;
begin
  Result:= inherited DoCopyTo;
  (Result as TChart).FChartRecords.CopyFrom(FChartRecords);
end;

constructor TChart.Create(const aWorkbookGlobals: TWorkbookGlobals);
begin
  inherited;
  FChartRecords:= TChartRecordList.Create;
  FPrintRecords:=FChartRecords;
end;

destructor TChart.Destroy;
begin
  FreeAndNil(FChartRecords);
  inherited;
end;

procedure TChart.LoadFromStream(const DataStream: TStream;
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
      if RecordHeader.Id=xlr_WINDOW2 then FWindow2:=R as TWindow2Record else
      if RecordHeader.Id=xlr_SCL then FZoom:=R as TSCLRecord else
      if RecordHeader.Id=xlr_FOOTER then FPageFooter:=R as TPageFooterRecord else
      if RecordHeader.Id=xlr_HEADER then FPageHeader:=R as TPageHeaderRecord else
      if RecordHeader.Id=xlr_PRINTGRIDLINES then FPrintGridLines:=R as TPrintGridLinesRecord else

      if RecordHeader.Id=xlr_LEFTMARGIN then FLeftMargin:=R as TMarginRecord else
      if RecordHeader.Id=xlr_RIGHTMARGIN then FRightMargin:=R as TMarginRecord else
      if RecordHeader.Id=xlr_TOPMARGIN then FTopMargin:=R as TMarginRecord else
      if RecordHeader.Id=xlr_BOTTOMMARGIN then FBottomMargin:=R as TMarginRecord else

      if RecordHeader.Id=xlr_SETUP then FSetup:=R as TSetupRecord else
      if RecordHeader.Id=xlr_WSBool then FWsBool:=R as TWsBoolRecord;

      if (R is TLabelSSTRecord) then (R as TLabelSSTRecord).AttachToSST(SST);
      if (R is TBofRecord) then raise Exception.Create(ErrExcelInvalid)
      else if (R is TIgnoreRecord) then FreeAndNil(R)
      else if (R is TDimensionsRecord) then begin; OriginalDimensions:=(R as TDimensionsRecord).Dim^; FreeAndNil(R);end
      else if (R is TEOFRecord) then EOF:=(R as TEOFRecord)
      else FChartRecords.Add(R) ;
    except
      FreeAndNil(R);
      Raise;
    end; //Finally

  until RecordHeader.id = xlr_EOF;
  BOF:=First; //Last statement
end;

procedure TChart.SaveToStream(const DataStream: TStream);
begin
  if (BOF=nil)or(EOF=nil) then raise Exception.Create(ErrSectionNotLoaded);
  BOF.SaveToStream(DataStream);
  FChartRecords.SaveToStream(DataStream);
  EOF.SaveToStream(DataStream);
end;

function TChart.TotalSize: int64;
begin
  Result:= inherited TotalSize+
    FChartRecords.TotalSize;
end;

procedure TChart.SaveRangeToStream(const DataStream: TStream;
  const SheetIndex: integer; const CellRange: TXlsCellRange);
begin
  //Can't save a chart range
  SaveToStream(DataStream);
end;

function TChart.TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange): int64;
begin
  //Can't save a chart range
  Result:=TotalSize;
end;

procedure TChart.ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);
begin
  FChartRecords.ArrangeInsert( InsPos, InsCount, SheetInfo);
end;

procedure TChart.SetPageHeaderFooter(const P: TPageHeaderFooterRecord;
  const s: Widestring);
var
  OldSize: integer;
begin
  if P=nil then exit;
  OldSize:=P.DataSize;
  P.Text:=s;
  FChartRecords.AdaptSize(P.DataSize-OldSize);
end;

procedure TChart.AddZoomRecord;
begin
  FZoom:=FChartRecords[FChartRecords.Add(TSCLRecord.CreateFromData(100))] as TSCLRecord;
end;

{ TChartList }

procedure TChartList.ArrangeInsert(const InsPos, InsCount: integer;
  const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count -1 do Items[i].ArrangeInsert(InsPos, InsCount, SheetInfo);
end;

procedure TChartList.SaveToStream(const DataStream: TStream);
var
  i:integer;
begin
  for i:=0 to Count-1 do Items[i].SaveToStream(DataStream);
end;

{ TWorkSheet }

procedure TWorkSheet.Clear;
begin
  inherited;
  if FMiscRecords1<>nil then FMiscRecords1.Clear;
  if FMiscRecords2<>nil then FMiscRecords2.Clear;
  if FHPageBreaks<>nil then FHPageBreaks.Clear;
  if FVPageBreaks<>nil then FVPageBreaks.Clear;
  if FDrawing<>nil then FDrawing.Clear;
  if FCells<>nil then FCells.Clear;
  if FRanges<>nil then FRanges.Clear;
  if FNotes<>nil then FNotes.Clear;
  if FColumns<>nil then FColumns.Clear;
end;

function TWorkSheet.DoCopyTo: TSheet;
begin
  Result:= inherited DoCopyTo;
  (Result as TWorkSheet).FMiscRecords1.CopyFrom(FMiscRecords1);
  (Result as TWorkSheet).FMiscRecords2.CopyFrom(FMiscRecords2);
  (Result as TWorkSheet).FHPageBreaks.CopyFrom(FHPageBreaks);
  (Result as TWorkSheet).FVPageBreaks.CopyFrom(FVPageBreaks);
  (Result as TWorkSheet).FDrawing.CopyFrom(FDrawing);
  (Result as TWorkSheet).FCells.CopyFrom(FCells);
  (Result as TWorkSheet).FRanges.CopyFrom(FRanges);
  (Result as TWorkSheet).FNotes.CopyFrom(FNotes);
  (Result as TWorkSheet).FColumns.CopyFrom(FColumns);

  (Result as TWorkSheet).FNotes.FixDwgIds((Result as TWorkSheet).FDrawing);

  (Result as TWorkSheet).FDefColWidth:=FDefColWidth;
  (Result as TWorkSheet).FDefRowHeight:=FDefRowHeight;
end;

constructor TWorkSheet.Create(const aWorkbookGlobals: TWorkbookGlobals);
begin
  inherited;
  FMiscRecords1:= TBaseRecordList.Create;
  FMiscRecords2:= TBaseRecordList.Create;
  FHPageBreaks:=THPageBreakList.Create;
  FVPageBreaks:=TVPageBreakList.Create;
  FDrawing:= TDrawing.Create(FWorkbookGlobals.DrawingGroup);
  FColumns:= TColInfoList.Create;
  FCells:= TCells.Create(aWorkbookGlobals, FColumns);
  FRanges :=TRangeList.Create;
  FNotes:= TNoteList.Create;

  FPrintRecords:=FMiscRecords1;

  FDefRowHeight:=$FF;
  FDefColWidth:=$0A*DefColWidthAdapt;
end;

destructor TWorkSheet.Destroy;
begin
  FreeAndNil(FRanges);
  FreeAndNil(FCells);
  FreeAndNil(FNotes);
  FreeAndNil(FColumns);
  //FDrawing should be freed after notes
  FreeAndNil(FDrawing);
  FreeAndNil(FVPageBreaks);
  FreeAndNil(FHPageBreaks);
  FreeAndNil(FMiscRecords1);
  FreeAndNil(FMiscRecords2);
  inherited;
end;

procedure TWorkSheet.LoadFromStream(const DataStream: TStream;
  const First: TBOFRecord; const SST: TSST);
var
  RecordHeader: TRecordHeader;
  R: TBaseRecord;
  MiscRecords: TBaseRecordList;
  FShrFmlas: TShrFmlaRecordList;
  LastFormula: TFormulaRecord;
begin
  Clear;
  MiscRecords:=FMiscRecords1;
  FShrFmlas:= TShrFmlaRecordList.Create;
  LastFormula:=nil;
  try
    repeat
      if (DataStream.Read(RecordHeader, sizeof(RecordHeader)) <> sizeof(RecordHeader)) then
        raise Exception.Create(ErrExcelInvalid);

      R:=LoadRecord(DataStream, RecordHeader);
      try
        if RecordHeader.Id=xlr_WINDOW2 then
        begin
          MiscRecords:=FMiscRecords2;
          FWindow2:=R as TWindow2Record;
        end;
        if RecordHeader.Id=xlr_SCL then FZoom:=R as TSCLRecord else
        if RecordHeader.Id=xlr_FOOTER then FPageFooter:=R as TPageFooterRecord else
        if RecordHeader.Id=xlr_HEADER then FPageHeader:=R as TPageHeaderRecord else
        if RecordHeader.Id=xlr_PRINTGRIDLINES then FPrintGridLines:=R as TPrintGridLinesRecord else

        if RecordHeader.Id=xlr_LEFTMARGIN then FLeftMargin:=R as TMarginRecord else
        if RecordHeader.Id=xlr_RIGHTMARGIN then FRightMargin:=R as TMarginRecord else
        if RecordHeader.Id=xlr_TOPMARGIN then FTopMargin:=R as TMarginRecord else
        if RecordHeader.Id=xlr_BOTTOMMARGIN then FBottomMargin:=R as TMarginRecord else

        if RecordHeader.Id=xlr_SETUP then FSetup:=R as TSetupRecord else
        if RecordHeader.Id=xlr_WSBool then FWsBool:=R as TWsBoolRecord;

        if (R is TFormulaRecord) then LastFormula:=R as TFormulaRecord;

        if (R is TDefColWidthRecord) then FDefColWidth:= (R as TDefColWidthRecord).Width*DefColWidthAdapt;
        if (R is TDefRowHeightRecord) then FDefRowHeight:= (R as TDefRowHeightRecord).Height;

        if (R is TLabelSSTRecord) then (R as TLabelSSTRecord).AttachToSST(SST);
        if (R is TBofRecord) then raise Exception.Create(ErrExcelInvalid)
        else if (R is TDrawingRecord) then FDrawing.LoadFromStream(DataStream, R as TDrawingRecord, SST)
        else if (R is TIgnoreRecord) then FreeAndNil(R)
        else if (R is TDimensionsRecord) then begin; OriginalDimensions:=(R as TDimensionsRecord).Dim^; FreeAndNil(R);end
        else if (R is TNoteRecord) then FNotes.AddRecord(R as TNoteRecord, (R as TNoteRecord).Row)
        else if (R is TColInfoRecord) then FColumns.AddRecord(R as TColInfoRecord)
        else if (R is TCellRecord) then FCells.AddCell(R as TCellRecord, (R as TCellRecord).Row)
        else if (R is TMultipleValueRecord) then begin FCells.AddMultipleCells(R as TMultipleValueRecord);FreeAndNil(R);end
        else if (R is TRowRecord) then FCells.AddRow(R as TRowRecord)
        else if (R is TCondFmtRecord) then FRanges[FRanges.Add(TCondFmt.Create)].LoadFromStream(DataStream, R as TCondFmtRecord)
        else if (R is TCellMergingRecord) then FRanges[FRanges.Add(TMergedCells.Create)].LoadFromStream(DataStream, R as TCellMergingRecord)
        else if (R is TShrFmlaRecord) then FShrFmlas.Add(R as TShrFmlaRecord)
        else if (R is THPageBreakRecord) then FHPageBreaks.AddRecord(R as THPageBreakRecord)
        else if (R is TVPageBreakRecord) then FVPageBreaks.AddRecord(R as TVPageBreakRecord)
        else if (R is TStringRecord) then begin if LastFormula=nil then raise Exception.Create(ErrExcelInvalid) else LastFormula.SetFormulaValue((R as TStringRecord).Value);FreeAndNil(R);end
        else if (R is TArrayRecord) then begin if LastFormula=nil then raise Exception.Create(ErrExcelInvalid) else LastFormula.ArrayRecord:=R as TArrayRecord;end
        else if (R is TEOFRecord) then EOF:=(R as TEOFRecord)
        else MiscRecords.Add(R) ;

      except
        FreeAndNil(R);
        Raise;
      end; //Finally

    until RecordHeader.id = xlr_EOF;

    FNotes.FixDwgIds(FDrawing);
    FCells.CellList.FixFormulas(FShrFmlas);
  finally
    FreeAndNil(FShrFmlas);
  end; //finally

  //this must be the last statment, so if there is an exception, we dont take First
  BOF:= First;
end;

procedure TWorkSheet.SaveToStream(const DataStream: TStream);
begin
  if (BOF=nil)or(EOF=nil) then raise Exception.Create(ErrSectionNotLoaded);
  BOF.SaveToStream(DataStream);
  FMiscRecords1.SaveToStream(DataStream);
  FHPageBreaks.SaveToStream(DataStream);
  FVPageBreaks.SaveToStream(DataStream);
  FColumns.SaveToStream(DataStream);
  FCells.SaveToStream(DataStream);
  FDrawing.SaveToStream(DataStream);
  FNotes.SaveToStream(DataStream);
  FMiscRecords2.SaveToStream(DataStream);
  FRanges.SaveToStream(DataStream);
  EOF.SaveToStream(DataStream);
end;

procedure TWorkSheet.SaveRangeToStream(const DataStream: TStream;
  const SheetIndex: integer; const CellRange: TXlsCellRange);
begin
  if (BOF=nil)or(EOF=nil) then raise Exception.Create(ErrSectionNotLoaded);
  BOF.SaveToStream(DataStream);
  FMiscRecords1.SaveToStream(DataStream);
  FHPageBreaks.SaveRangeToStream(DataStream, CellRange);
  FVPageBreaks.SaveRangeToStream(DataStream, CellRange);
  FColumns.SaveRangeToStream(DataStream, CellRange);
  FCells.SaveRangeToStream(DataStream, CellRange);
  //Excel doesnt save drawings to the clipboard
  //FDrawing.SaveToStream(DataStream);
  FNotes.SaveRangeToStream(DataStream, CellRange);
  FMiscRecords2.SaveToStream(DataStream);
  FRanges.SaveRangeToStream(DataStream, CellRange);
  EOF.SaveToStream(DataStream);
end;

procedure TWorkSheet.InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const SheetInfo: TSheetInfo; const OnlyFormulas: boolean);
begin
   FCells.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo, OnlyFormulas);
   FDrawing.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo);
   FRanges.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo);
   FNotes.InsertAndCopyRows(FirstRow, LastRow, DestRow, aCount, SheetInfo, false);
   FHPageBreaks.InsertRows(DestRow, aCount);
end;

procedure TWorkSheet.DeleteRows(const aRow, aCount: word; const SheetInfo: TSheetInfo);
begin
   FCells.DeleteRows(aRow, aCount, SheetInfo);
   FDrawing.DeleteRows(aRow, aCount, SheetInfo);
   FRanges.DeleteRows(aRow, aCount, SheetInfo);
   FNotes.DeleteRows(aRow, aCount, SheetInfo);
   FHPageBreaks.DeleteRows(aRow, aCount);
end;


procedure TWorkSheet.ArrangeInsert(const InsPos, InsCount: integer; const SheetInfo: TSheetInfo);
begin
  //PENDING: Optimize this
  FCells.ArrangeInsert(InsPos, InsCount, SheetInfo);
  FDrawing.ArrangeInsert(InsPos, InsCount, SheetInfo);
end;



procedure TWorkSheet.AssignDrawing(const Index: integer; const Data: string;
  const DataType: TXlsImgTypes);
begin
  FDrawing.AssignDrawing( Index, Data, DataType);
end;

procedure TWorkSheet.GetDrawingFromStream(const Index: integer; const Data: TStream;
  var DataType: TXlsImgTypes);
begin
  FDrawing.GetDrawingFromStream( Index, Data, DataType);
end;

function TWorkSheet.DrawingCount: integer;
begin
  Result:= FDrawing.DrawingCount;
end;

function TWorkSheet.GetDrawingRow(index: integer): integer;
begin
  Result:= FDrawing.DrawingRow[index];
end;

function TWorkSheet.GetDrawingName(index: integer): widestring;
begin
  Result:= FDrawing.DrawingName[index];
end;

procedure TWorkSheet.DeleteHPageBreak(const aRow: word);
begin
  inherited;
  FHPageBreaks.DeleteBreak(aRow);
end;

procedure TWorkSheet.DeleteVPageBreak(const aCol: word);
begin
  inherited;
  FVPageBreaks.DeleteBreak(aCol);
end;

procedure TWorkSheet.InsertHPageBreak(const aRow: word);
begin
  inherited;
  FHPageBreaks.AddBreak(aRow);
end;

procedure TWorkSheet.InsertVPageBreak(const aCol: word);
begin
  inherited;
  FVPageBreaks.AddBreak(aCol);
end;

procedure TWorkSheet.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  inherited;
  FDrawing.ArrangeCopySheet(SheetInfo);
end;

function TWorkSheet.GetColWidth(const aCol: Word): integer;
var
  index: integer;
begin
  if not FColumns.Find(aCol, Index) then Result:=DefColWidth else Result:=FColumns[Index].Width;
end;

function TWorkSheet.GetRowHeight(const aRow: integer): integer;
begin
  if not FCells.RowList.HasRow(aRow) then Result:=DefRowHeight else
  Result:= FCells.RowList.RowHeight(aRow);
end;

procedure TWorkSheet.SetColWidth(const aCol: Word; const Value: integer);
var
  Index: integer;
begin
  if FColumns.Find(aCol, Index) then
    FColumns[Index].Width:=Value
  else
    FColumns.Insert(Index, TColInfo.Create(aCol, Value, 0, 0));
end;

procedure TWorkSheet.SetRowHeight(const aRow, Value: integer);
begin
  FCells.RowList.SetRowHeight(aRow, Value);
end;

function TWorkSheet.GetColFormat(const aCol: integer): integer;
var
  index: integer;
begin
  if not FColumns.Find(aCol, Index) then Result:=-1 else Result:=FColumns[Index].XF;
end;

function TWorkSheet.GetRowFormat(const aRow: integer): integer;
begin
  if not FCells.RowList.HasRow(aRow) or not FCells.RowList[aRow].IsFormatted then Result:=-1 else
  Result:= FCells.RowList[aRow].XF;
end;

procedure TWorkSheet.SetColFormat(const aCol: integer; const Value: integer);
var
  Index: integer;
  i: integer;
begin
  if FColumns.Find(aCol, Index) then
    FColumns[Index].XF:=Value
  else
    FColumns.Insert(Index, TColInfo.Create(aCol, DefColWidth, Value, 0));

  //Reset all cells in column to format XF
  for i:=0 to FCells.CellList.Count-1 do
    if FCells.CellList[i].Find(aCol, Index) then FCells.CellList[i][Index].XF:=Value;
end;

procedure TWorkSheet.SetRowFormat(const aRow, Value: integer);
var
  i: integer;
begin
  FCells.RowList.AddRow(aRow);
  FCells.RowList[aRow].XF:= Value;

  //Reset all cells in column to format XF
  if(aRow>=0) and (aRow<FCells.CellList.Count) then
    for i:=0 to FCells.CellList[aRow].Count-1 do FCells.CellList[aRow][i].XF:=Value;

end;

function TWorkSheet.GetAnchor(const Index: integer): TClientAnchor;
begin
  Result:= FDrawing.GetAnchor(Index);
end;

function TWorkSheet.CellMergedBounds(const aRow, aCol: integer): TXlsCellRange;
var
  i: integer;
begin
  //Find the cell into the MergedCells array
  Result.Left:=aCol;
  Result.Right:=aCol;
  Result.Top:=aRow;
  Result.Bottom:=aRow;
  for i:=0 to FRanges.Count-1 do
    if FRanges[i] is TMergedCells then
      if (FRanges[i] as TMergedCells).CheckCell(aRow, aCol, Result) then exit;
end;

procedure TWorkSheet.MergeCells(aRow1, aCol1, aRow2, aCol2: integer);
var
  x: integer;
  Mc: TMergedCells;
  i: integer;
  bRow1, bCol1, bRow2, bCol2: integer;
begin
  if aRow1>aRow2 then begin x:=aRow2;aRow2:=aRow1; aRow1:=x;end;
  if aCol1>aCol2 then begin x:=aCol2;aCol2:=aCol1; aCol1:=x;end;

  //We have to take all existing included merged cells

  Mc:=nil;
  repeat
    bRow1:=aRow1; bRow2:=aRow2; bCol1:=aCol1; bCol2:=aCol2;
    for i:=0 to FRanges.Count-1 do
      if FRanges[i] is TMergedCells then
      begin
        Mc:=(FRanges[i] as TMergedCells);
        Mc.PreMerge(aRow1, aCol1, aRow2, aCol2)
      end;
  until (aRow1=bRow1) and (aRow2=bRow2) and (aCol1=bCol1) and (aCol2=bCol2);

  if Mc=nil then Mc:=FRanges[FRanges.Add(TMergedCells.Create)] as TMergedCells;
  Mc.MergeCells(aRow1, aCol1, aRow2, aCol2);
end;

function TWorkSheet.TotalRangeSize(const SheetIndex: integer; const CellRange: TXlsCellRange): int64;
begin
  Result:= inherited TotalRangeSize(SheetIndex, CellRange)+
    FMiscRecords1.TotalSize +
    FHPageBreaks.TotalRangeSize(CellRange) +
    FVPageBreaks.TotalRangeSize(CellRange) +
    FCells.TotalRangeSize(CellRange)+
    FRanges.TotalRangeSize(CellRange) +
    FDrawing.TotalSize +
    FMiscRecords2.TotalSize+
    FNotes.TotalRangeSize(CellRange)+
    FColumns.TotalRangeSize(CellRange);
end;

function TWorkSheet.TotalSize: int64;
begin
  Result:= inherited TotalSize+
    FMiscRecords1.TotalSize +
    FHPageBreaks.TotalSize +
    FVPageBreaks.TotalSize +
    FCells.TotalSize +
    FRanges.TotalSize +
    FDrawing.TotalSize +
    FMiscRecords2.TotalSize+
    FNotes.TotalSize+
    FColumns.TotalSize;
end;

procedure TWorkSheet.SetPageHeaderFooter(const P: TPageHeaderFooterRecord;
  const s: Widestring);
var
  OldSize: integer;
begin
  if P=nil then exit;
  OldSize:=P.DataSize;
  P.Text:=s;
  FMiscRecords1.AdaptSize(P.DataSize-OldSize);
end;

function TWorkSheet.HasHPageBreak(const Row: integer): boolean;
begin
  Result:=FHPageBreaks.HasPageBreak(Row);
end;

function TWorkSheet.HasVPageBreak(const Col: integer): boolean;
begin
  Result:=FVPageBreaks.HasPageBreak(Col);
end;


function TWorkSheet.GetPrintNumberOfHorizontalPages: word;
begin
  if FSetup= nil then Result:=1 else
    Result:= FSetup.FitWidth;
end;

function TWorkSheet.GetPrintNumberOfVerticalPages: word;
begin
  if FSetup= nil then Result:=1 else
    Result:= FSetup.FitHeight;
end;

function TWorkSheet.GetPrintScale: integer;
begin
  if FSetup= nil then Result:=100 else
    Result:= FSetup.Scale;
end;

function TWorkSheet.GetPrintToFit: boolean;
begin
  if FWsBool= nil then Result:=false else
    Result:= FWsBool.FitToPage;
end;

procedure TWorkSheet.SetPrintNumberOfHorizontalPages(const Value: word);
begin
  if FSetup<>nil then FSetup.FitWidth:=Value;
end;

procedure TWorkSheet.SetPrintNumberOfVerticalPages(const Value: word);
begin
  if FSetup<>nil then FSetup.FitHeight:=Value;
end;

procedure TWorkSheet.SetPrintScale(const Value: integer);
begin
  if (Value<Low(Word))or (Value>High(Word)) then
    raise Exception.CreateFmt(ErrXlsIndexOutBounds, [Value, 'PrintScale', Low(Word), High(Word)]);
  if FSetup<>nil then FSetup.Scale:=Value;
end;

procedure TWorkSheet.SetPrintToFit(const Value: boolean);
begin
  if FWSBool<>nil then FWsBool.FitToPage:=value;
end;

procedure TWorkSheet.AddImage(const Data: string; const DataType: TXlsImgTypes; const Properties: TImageProperties;const Anchor: TFlxAnchorType);
begin
  FDrawing.AddImage(Data, DataType, Properties, Anchor);
end;

procedure TWorkSheet.ClearImage(const Index: integer);
begin
  FDrawing.ClearImage(Index);
end;

procedure TWorkSheet.DeleteImage(const Index: integer);
begin
  FDrawing.DeleteImage(Index);
end;

procedure TWorkSheet.AddZoomRecord;
begin
  if FMiscRecords2.Count>1 then
  begin
    FMiscRecords2.Insert(1,TSCLRecord.CreateFromData(100));
    FZoom:=FMiscRecords2[1] as TSCLRecord;
  end;
end;

procedure TWorkSheet.AddNewComment(const Row, Col: integer;
  const Txt: widestring; const Properties: TImageProperties);
begin
  FNotes.AddNewComment(Row, Col, Txt, FDrawing, Properties);
end;

end.
