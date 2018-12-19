unit UExcelAdapter;

interface

uses
  Classes, SysUtils,
  {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} variants,{$IFEND}{$ENDIF} //Delphi 6 or above
  UFlxMessages, UFlxFormats;

type
  TExcelFile=class
  protected
    //GetCellValue GetCellData are almost the same in native mode (Except for ofset in columns) They change for OLE, because "Data" are cached and "Values" are not
    function GetCellValue(aRow, aCol: integer): Variant; virtual; abstract;
    procedure SetCellValue(aRow, aCol: integer; const Value: Variant); virtual; abstract;
    function GetCellValueX(aRow, aCol: integer): TXlsCellValue; virtual; abstract;
    procedure SetCellValueX(aRow, aCol: integer; const Value: TXlsCellValue); virtual; abstract;

    function GetCellFormula(aRow, aCol: integer): widestring; virtual; abstract;
    procedure SetCellFormula(aRow, aCol: integer; const Value: widestring); virtual; abstract;

    function GetCommentsCount(Row: integer): integer; virtual; abstract;
    function GetCommentText(Row, aPos: integer): Widestring; virtual; abstract;
    function GetCommentColumn(Row, aPos: integer): integer; virtual; abstract;

    function GetPictureName(Row, aPos: integer): Widestring; virtual; abstract;
    function GetPicturesCount(Row: integer): integer; virtual; abstract;

    function GetExcelNameCount: integer; virtual; abstract;
    function GetRangeName(index: integer): Widestring; virtual; abstract;
    function GetRangeR1(index: integer): integer; virtual; abstract;
    function GetRangeR2(index: integer): integer; virtual; abstract;
    function GetRangeC1(index: integer): integer; virtual; abstract;
    function GetRangeC2(index: integer): integer; virtual; abstract;
    function GetRangeSheet(index: integer): integer; virtual; abstract;

    function GetActiveSheet: integer; virtual; abstract;
    procedure SetActiveSheet(const Value: integer); virtual; abstract;
    function GetActiveSheetName: WideString; virtual; abstract;
    procedure SetActiveSheetName(const Value: WideString); virtual; abstract;

    function GetColumnWidth(aCol: integer): integer;virtual; abstract;
    function GetRowHeight(aRow: integer): integer;virtual; abstract;
    procedure SetColumnWidth(aCol: integer; const Value: integer);virtual; abstract;
    procedure SetRowHeight(aRow: integer; const Value: integer);virtual; abstract;

    function GetDefaultColWidth: integer;virtual;abstract;
    function GetDefaultRowHeight: integer;virtual;abstract;

    function GetAutoRowHeight(Row: integer): boolean;virtual;abstract;
    procedure SetAutoRowHeight(Row: integer; const Value: boolean);virtual;abstract;

    function GetColumnFormat(aColumn: integer): integer;virtual;abstract;
    function GetRowFormat(aRow: integer): integer;virtual; abstract;
    procedure SetColumnFormat(aColumn: integer; const Value: integer);virtual; abstract;
    procedure SetRowFormat(aRow: integer; const Value: integer);virtual;abstract;

    function GetCellFormat(aRow, aCol: integer): integer;virtual;abstract;
    procedure SetCellFormat(aRow, aCol: integer; const Value: integer);virtual; abstract;

    function GetColorPalette(Index: TColorPaletteRange): LongWord; virtual; abstract;
    procedure SetColorPalette(Index: TColorPaletteRange; const Value: LongWord); virtual; abstract;

    function GetFormatList(index: integer): TFlxFormat;virtual; abstract;

    function GetPageFooter: WideString; virtual; abstract;
    function GetPageHeader: WideString; virtual; abstract;
    procedure SetPageFooter(const Value: WideString); virtual; abstract;
    procedure SetPageHeader(const Value: WideString); virtual; abstract;

    function GetShowGridLines: boolean;virtual; abstract;
    procedure SetShowGridLines(const Value: boolean);virtual; abstract;
    function GetPrintGridLines: boolean;virtual; abstract;
    procedure SetPrintGridLines(const Value: boolean);virtual; abstract;

    function GetSheetZoom: integer;virtual;abstract;
    procedure SetSheetZoom(const Value: integer);virtual;abstract;

    function GetMargins: TXlsMargins;virtual;abstract;
    procedure SetMargins(const Value: TXlsMargins);virtual;abstract;

    function GetPrintNumberOfHorizontalPages: word;virtual;abstract;
    function GetPrintNumberOfVerticalPages: word;virtual;abstract;
    function GetPrintScale: integer;virtual;abstract;
    function GetPrintToFit: boolean;virtual;abstract;
    procedure SetPrintNumberOfHorizontalPages(const Value: word);virtual;abstract;
    procedure SetPrintNumberOfVerticalPages(const Value: word);virtual;abstract;
    procedure SetPrintScale(const Value: integer);virtual;abstract;
    procedure SetPrintToFit(const Value: boolean);virtual;abstract;

    function GetCellMergedBounds(aRow, aCol: integer): TXlsCellRange;virtual;abstract;

  public
    procedure Connect;virtual;abstract;
    procedure Disconnect;virtual;abstract;

    procedure OpenFile(const FileName: TFileName);virtual;abstract;
    procedure NewFile;virtual;abstract;
    procedure LoadFromStream(const Stream: TStream);virtual;abstract;
    procedure CloseFile; virtual; abstract;

    property ActiveSheet: integer read GetActiveSheet write SetActiveSheet;
    procedure InsertAndCopySheets (const CopyFrom, InsertBefore, SheetCount: integer);virtual;abstract;
    function SheetCount: integer;virtual;abstract;
    property ActiveSheetName: WideString read GetActiveSheetName write SetActiveSheetName;
    procedure SelectSheet(const SheetNo:integer); virtual; abstract;

    property PageHeader: Widestring read GetPageHeader write SetPageHeader;
    property PageFooter: Widestring read GetPageFooter write SetPageFooter;

    property ShowGridLines: boolean read GetShowGridLines write SetShowGridLines;
    property PrintGridLines: boolean read GetPrintGridLines write SetPrintGridLines;

    property SheetZoom: integer read GetSheetZoom  write SetSheetZoom;

    property Margins: TXlsMargins read GetMargins write SetMargins; //Margins are in inches

    property PrintToFit: boolean read GetPrintToFit write SetPrintToFit;
    property PrintScale: integer read GetPrintScale write SetPrintScale;
    property PrintNumberOfHorizontalPages: word read GetPrintNumberOfHorizontalPages write SetPrintNumberOfHorizontalPages;
    property PrintNumberOfVerticalPages: word read GetPrintNumberOfVerticalPages write SetPrintNumberOfVerticalPages;


    procedure DeleteMarkedRows(const Mark: Widestring);virtual;abstract;
    procedure MakePageBreaks(const Mark: Widestring);virtual;abstract;

    procedure InsertHPageBreak(const Row: integer);virtual;abstract;
    procedure InsertVPageBreak(const Col: integer);virtual;abstract;
    procedure DeleteHPageBreak(const Row: integer);virtual;abstract;
    procedure DeleteVPageBreak(const Col: integer);virtual;abstract;
    function HasHPageBreak(const Row: integer): boolean;virtual;abstract;
    function HasVPageBreak(const Col: integer): boolean;virtual;abstract;

    procedure RefreshPivotTables;virtual;abstract;
    procedure RefreshChartRanges(const VarStr: string);virtual;abstract;

    procedure Save(const AutoClose: boolean; const FileName: string; const OnGetFileName: TOnGetFileNameEvent; const OnGetOutStream: TOnGetOutStreamEvent=nil; const DataStream: TStream=nil);virtual;abstract;

    procedure InsertAndCopyRows(const FirstRow, LastRow, DestRow, aCount: integer; const OnlyFormulas: boolean);virtual;abstract;
    procedure DeleteRows(const aRow, aCount: integer);virtual;abstract;

    procedure BeginSheet; virtual; abstract;
    procedure EndSheet(const RowOffset: integer); virtual; abstract;

    function CanOptimizeRead: boolean; virtual;abstract;

    property RangeCount: integer read GetExcelNameCount;
    property RangeName[index: integer]: Widestring read GetRangeName;
    property RangeR1[index: integer]: integer read GetRangeR1;
    property RangeR2[index: integer]: integer read GetRangeR2;
    property RangeC1[index: integer]: integer read GetRangeC1;
    property RangeC2[index: integer]: integer read GetRangeC2;
    property RangeSheet[index: integer]: integer read GetRangeSheet;

    property PicturesCount[Row: integer]: integer read GetPicturesCount;
    property PictureName[Row: integer; aPos: integer]: Widestring read GetPictureName;
    procedure AssignPicture(const Row, aPos: integer; const Pic: string; const PicType: TXlsImgTypes); virtual;abstract;
    procedure GetPicture(const Row, aPos: integer; const Pic: TStream; var PicType: TXlsImgTypes; var Anchor: TClientAnchor);virtual;abstract; //use row < 0 to return all

    procedure DeleteImage(const Index: integer);virtual;abstract;
    procedure ClearImage(const Index: integer);virtual;abstract;
    procedure AddImage(const Data: string; const DataType: TXlsImgTypes; const Properties: TImageProperties;const Anchor: TFlxAnchorType);virtual;abstract;

    property CommentsCount[Row: integer]: integer read GetCommentsCount;
    property CommentText[Row: integer; aPos: integer]: Widestring read GetCommentText;
    property CommentColumn[Row: integer; aPos: integer]: integer read GetCommentColumn;
    procedure AssignComment(const Row, aPos: integer; const Comment: Widestring); virtual;abstract;

    procedure SetCellComment(Row, Col: integer; const Value: widestring; const Properties: TImageProperties); virtual; abstract;
    function GetCellComment(Row, Col: integer): widestring; virtual; abstract;

    function CellCount(const aRow: integer): integer;virtual;abstract;
    function GetCellData(const aRow, aColOffset: integer): variant;virtual;abstract;
    function GetCellDataX(const aRow, aColOffset: integer): TXlsCellValue;virtual;abstract;
    procedure AssignCellData(const aRow, aColOffset: integer; const Value: variant);virtual;abstract;
    procedure AssignCellDataX(const aRow, aColOffset: integer; const Value: TXlsCellValue);virtual;abstract;
    procedure SetCellString(const aRow, aCol: integer; const Text: Widestring; const DateFormat: widestring=''; const TimeFormat: widestring=''); overload; virtual; abstract;
    procedure SetCellString(const aRow, aCol: integer; const Text: Widestring; const Fm: TFlxFormat; const DateFormat: widestring=''; const TimeFormat: widestring=''); overload; virtual; abstract;
    function MaxRow: integer; virtual;abstract;
    function MaxCol: integer; virtual;abstract;
    function IsEmptyRow(const aRow: integer): boolean; virtual; abstract;

    property CellValue[aRow, aCol: integer]: Variant read GetCellValue write SetCellValue; //this is for ole handling
    property CellValueX[aRow, aCol: integer]: TXlsCellValue read GetCellValueX write SetCellValueX; //this is for ole handling
    property CellFormat[aRow, aCol: integer]: integer read GetCellFormat write SetCellFormat;
    property CellFormula[aRow, aCol: integer]: widestring read GetCellFormula write SetCellFormula;

    function ColByIndex(const Row, ColIndex: integer): integer;virtual; abstract;
    function ColIndexCount(const Row: integer): integer; virtual; abstract;
    function ColIndex(const Row, Col: integer): integer;virtual; abstract;


    property ColumnWidth[aCol: integer]: integer read GetColumnWidth write SetColumnWidth;
    property RowHeight[aRow: integer]: integer read GetRowHeight write SetRowHeight;
    property DefaultColWidth: integer read GetDefaultColWidth;
    property DefaultRowHeight: integer read GetDefaultRowHeight;

    property ColumnFormat[aColumn: integer]: integer read GetColumnFormat write SetColumnFormat;
    property RowFormat[aRow: integer]: integer read GetRowFormat write SetRowFormat;

    procedure SetBounds(const aRangePos: integer);virtual;abstract;
    function GetFirstColumn: integer; virtual; abstract;

    procedure PrepareBlockData(const R1,C1,R2,C2: integer);virtual;abstract;
    procedure AssignBlockData(const Row,Col: integer; const v: variant);virtual;abstract;
    procedure PasteBlockData;virtual;abstract;

    function IsWorksheet(const index: integer): boolean; virtual; abstract;

    property AutoRowHeight[Row: integer]: boolean read GetAutoRowHeight write SetAutoRowHeight;

    property ColorPalette[Index: TColorPaletteRange]: LongWord read GetColorPalette write SetColorPalette;

    property FormatList[index: integer]: TFlxFormat read GetFormatList;
    function FormatListCount: integer;virtual; abstract;
    function AddFormat (const Fmt: TFlxFormat): integer;virtual; abstract;
    property CellMergedBounds[aRow, aCol: integer]: TXlsCellRange read GetCellMergedBounds;
    procedure MergeCells(const FirstRow, FirstCol, LastRow, LastCol: integer); virtual; abstract;

    procedure CopyToClipboard; overload; virtual; abstract;
    procedure CopyToClipboard(const Range: TXlsCellRange); overload; virtual; abstract;
    procedure PasteFromClipboard(const Row, Col: integer);virtual;abstract;

    procedure ParseComments; virtual;abstract;
  end;

  TExcelAdapter = class(TComponent)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    function GetWorkbook: TExcelFile;virtual;abstract;
    { Public declarations }
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  //No Register...
end;

end.
