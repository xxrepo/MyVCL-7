unit UEscherRecords;
interface
uses XlsMessages, UFlxMessages, UXlsBaseRecords, Classes, SysUtils, Contnrs, UXlsBaseClientData,
     UBreakList, UXlsBaseList;

type
  TEscherRecordHeader= packed record
    Pre, Id: word;
    Size: integer;
  end;

  TEscherRecord = class;
  TEscherClientDataRecord = class;
  TEscherClientAnchorRecord = class;
  TEscherBStoreRecord = class;
  TEscherDgRecord = class;
  TEscherSolverContainerRecord = class;
  TEscherDggRecord = class;
  TEscherContainerRecord=class;
  TEscherSpgrContainerRecord=class;
  TEscherSPRecord=class;
  TEscherOPTRecord= class;

  TEscherRecordCache = class (TBaseList)
    {$INCLUDE TEscherRecordCacheHdr.inc}
    constructor Create;
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo; const Forced: boolean);
  end;


  TEscherObjCache = class (TEscherRecordCache)
    {$INCLUDE TEscherObjCacheHdr.inc}
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);
  end;

  TEscherAnchorCache = class (TEscherRecordCache)
    {$INCLUDE TEscherAnchorCacheHdr.inc}
  end;

  TEscherShapeCache = class (TEscherRecordCache)
    {$INCLUDE TEscherShapeCacheHdr.inc}
  end;

  TEscherOPTCache = class (TEscherRecordCache)
    {$INCLUDE TEscherOPTCacheHdr.inc}
  end;

  TEscherDwgCache = record
    Destroying: boolean;
    MaxObjId: word;
    Dg: TEscherDgRecord;
    Solver: TEscherSolverContainerRecord;
    Patriarch: TEscherSpgrContainerRecord;
    Anchor: TEscherAnchorCache;
    Shape: TEscherShapeCache;
    Obj: TEscherObjCache;
    Blip: TEscherOPTCache;
  end;
  PEscherDwgCache=^TEscherDwgCache;

  TEscherDwgGroupCache =  record
    BStore: TEscherBStoreRecord;
    Dgg: TEscherDggRecord;
  end;
  PEscherDwgGroupCache=^TEscherDwgGroupCache;

//////////////////////////////////Base records ////////////////////////////

  ClassOfTEscherRecord= class of TEscherRecord;

  TEscherRecord= class
  private
    FParent: TEscherContainerRecord;

    procedure IncNextPos(var NextPos: integer; const Size: integer; var RealSize: integer; const BreakList: TBreakList);
    procedure CheckSplit(const DataStream: TStream; const BreakList: TBreakList);
    procedure WriteNewRecord(const DataStream: TStream; const BreakList: TBreakList);
  protected
    DwgCache: PEscherDwgCache;
    DwgGroupCache: PEscherDwgGroupCache;
  public
    Pre, Id: word;
    TotalDataSize, LoadedDataSize: integer;

    CopiedTo: TEscherRecord;

  protected
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; virtual;
    function Instance: word;
    function Version: word;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); virtual;
    procedure AfterCreate; virtual;

    procedure Load(var aRecord: TBaseRecord; var aPos: integer); virtual ; abstract;
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); virtual;
    function CopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;  //this should be non-virtual
    function TotalSizeNoSplit: int64;virtual;
    function Loaded: boolean;virtual;

    function IsContainer(const aPre: word): boolean;

    function WaitingClientData(var ClientType: ClassOfTBaseClientData) : boolean; virtual;
    procedure AssignClientData(const aClientData: TBaseClientData);virtual;
    procedure SplitRecords(var NextPos, RealSize, NextDwg: integer;const BreakList: TBreakList);virtual;

    procedure ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);virtual;

    procedure ClearCopiedTo; virtual;

    function FindRoot: TEscherRecord;
    function FindRec(const RecClass: ClassOfTEscherRecord): TEscherRecord; virtual;
    function Patriarch: TEscherSpgrContainerRecord;
    function CopyDwg(const RowOfs: integer): TEscherRecord;

    function CompareRec(const aRecord: TEscherRecord): integer; virtual;//this is used for searching

  end;


  TEscherRecordList= class (TBaseList)
  private
    {$INCLUDE TEscherRecordListHdr.inc}
  public
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
    procedure CopyFrom(const aEscherRecordList: TEscherRecordList; const NewDwgCache: PEscherDwgCache; const RowOfs: integer);
    function TotalSizeNoSplit: int64;
  end;


  TEscherDataRecord= class(TEscherRecord)
  protected
    Data: PArrayOfByte;
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; override;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);override;
    destructor Destroy; override;

    procedure Load(var aRecord: TBaseRecord; var aPos: integer);override;
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); override;
    function TotalSizeNoSplit: int64;override;

    procedure SplitRecords(var NextPos, RealSize, NextDwg: integer; const BreakList: TBreakList);override;
    function CompareRec(const aRecord: TEscherRecord): integer;override; //this is used for searching

    procedure ClearData;
  end;

  TEscherContainerRecord=class(TEscherRecord)
  protected
    FContainedRecords: TEscherRecordList;
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; override;
  public
    property ContainedRecords: TEscherRecordList read FContainedRecords;

    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);override;
    destructor Destroy; override;
    procedure Load(var aRecord: TBaseRecord; var aPos: integer);override;
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); override;
    function TotalSizeNoSplit: int64;override;

    function WaitingClientData(var ClientType: ClassOfTBaseClientData): boolean;override;
    procedure AssignClientData(const aClientData: TBaseClientData);override;
    function LastRecord: TEscherRecord;

    procedure SplitRecords(var NextPos, RealSize: integer; var NextDwg: integer; const BreakList: TBreakList);override;

    procedure ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);override;

    procedure ClearCopiedTo; override;

    function FindRec(const RecClass: ClassOfTEscherRecord): TEscherRecord; override;

  end;

  TEscherSpContainerRecord=class(TEscherContainerRecord)
  public
    SP: TEscherSPRecord;
    Opt: TEscherOPTRecord;
    ClientAnchor: TEscherClientAnchorRecord;

    function Row: integer;
    function Col: integer;
  end;

  TEscherSpgrContainerRecord=class(TEscherContainerRecord)
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);override;
    destructor Destroy; override;
  end;


  TEscherClientDataRecord= class(TEscherDataRecord)
  public
    ClientData: TBaseClientData;
  protected
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; override;
  public

    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);override;
    constructor CreateFromData(const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache:PEscherDwgCache; const aParent: TEscherContainerRecord);
    destructor Destroy; override;

    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); override;
    function TotalSizeNoSplit: int64;override;
    function Loaded: boolean;override;
    function WaitingClientData(var ClientType: ClassOfTBaseClientData): boolean;override;

    procedure SplitRecords(var NextPos, RealSize: integer; var NextDwg: integer; const BreakList: TBreakList);override;
    procedure AssignClientData(const aClientData: TBaseClientData);override;

    procedure ArrangeCopyRows(const RowOfs: integer);
    procedure ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);override;
    function ObjId: word;
  end;

//////////////////////////////////Other records ////////////////////////////
  TEscherSplitMenuRecord= class (TEscherDataRecord)
    constructor CreateFromData(const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
  end;

  TEscherClientAnchorRecord= class (TEscherDataRecord)
  private
    Anchor: PClientAnchor;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    constructor CreateFromData(const aAnchor: TClientAnchor;const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
    destructor Destroy; override;
    procedure ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);override;
    function AllowCopy(const FirstRow, LastRow: integer): boolean;
    function AllowDelete(const FirstRow, LastRow: integer): boolean;
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; override;

    function Row: integer;
    function Col: integer;
    function GetAnchor: TClientAnchor;
  end;

  TEscherBStoreRecord= class (TEscherContainerRecord)
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    destructor Destroy; override;
    procedure AddRef(const BlipPos: integer);
    procedure Release(const BlipPos: integer);
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); override;
  end;

  TEscherBSERecord= class (TEscherDataRecord)
    BStorePos: integer;
    procedure AddRef;
    procedure Release;
    function References: Cardinal;

    function CompareRec(const aRecord: TEscherRecord): integer;override; //search by signature

    procedure CopyFromData(const BSEHeader: Pointer; const BlipHeader: TEscherRecordHeader; const BlipData: TStream);
    procedure SaveGraphicToStream(const aData:TStream; var aDataType: TXlsImgTypes);
  end;


  TDg= packed record
    ShapeCount: Cardinal;
    MaxSpId: Cardinal;
  end;

  PDg = ^TDg;

  TEscherDgRecord= class(TEscherDataRecord)
  private
    Dg: PDg;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    constructor CreateFromData(const csp, cspidCur: LongWord; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); 
    destructor Destroy; override;

    function IncMaxShapeId: Cardinal;
    procedure DecShapeCount;
  end;

  TDgg= packed record
    MaxShapeId: Cardinal;
    FIDclCount: Cardinal;
    ShapesSaved: Cardinal;
    DwgSaved: Cardinal;
  end;

  PDgg= ^TDgg;

  TEscherDggRecord= class(TEscherDataRecord)
  public
    FDgg: PDgg;

    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    constructor CreateFromData(const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
    destructor Destroy; override;

  end;

  PCardinal= ^Cardinal;

  TEscherSPRecord= class(TEscherDataRecord)
  public
    ShapeId: PCardinal;
  protected
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord; override;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    constructor CreateFromData(const Pre, aShapeId: LongWord; const Flags: LongWord; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); 
    destructor Destroy; override;
  end;

  TEscherSolverContainerRecord = class (TEscherContainerRecord)
  public
    MaxRuleId: Cardinal;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    destructor Destroy; override;

    function IncMaxRuleId: Cardinal;
    procedure CheckMax(const aRuleId: Cardinal);

    procedure DeleteRef(const Shape: TEscherSPRecord);
    procedure FixPointers;
    procedure ArrangeCopyRows;
  end;

  TEscherOPTRecord= class (TEscherDataRecord)
  private
    BlipPtr: array of TEscherBSERecord;
    BlipPos: array of Cardinal;

    FShapeName: WideString;
    NameLen: PCardinal;
    NameOfs: Cardinal;

    function GetShapeName: WideString;
    function AddImg(const Data: string; const DataType: TXlsImgTypes): integer;
  protected
    function DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;override;
  public
    constructor Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord); override;
    constructor CreateFromDataImg(const aPict: string; const aPicType: TXlsImgTypes; const PicName: widestring; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
    constructor CreateFromDataNote( const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord; const Dummy: integer=1);
    constructor GroupCreateFromData(const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
    destructor Destroy; override;
    procedure AfterCreate;override;

    property ShapeName: WideString read GetShapeName;
    procedure SaveToStream(const DataStream: TStream; const BreakList: TBreakList); override;
    function Row: integer;
    function Col: integer;

    function GetAnchor: TClientAnchor;

    procedure ChangeRef(const aBSE: TEscherBSERecord);
    procedure ReplaceImg(const Data: string; const DataType: TXlsImgTypes);
    procedure GetImageFromStream(const Data: TStream; var DataType: TXlsImgTypes);
  end;


implementation
uses UXlsClientData,UEscherOtherRecords,UEscherGraphToBSE;

{ TEscherRecordCache }
{$INCLUDE TEscherRecordCacheImp.inc}

constructor TEscherRecordCache.Create;
begin
  inherited Create(False) //We don't own the objects
end;

procedure TEscherRecordCache.ArrangeInsert(const aPos, aCount: integer;
  const SheetInfo: TSheetInfo; const Forced: boolean);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ArrangeInsert(aPos, aCount,SheetInfo, Forced);
end;

{ TEscherObjCache }
{$INCLUDE TEscherObjCacheImp.inc}

{ TEscherAnchorCache }
{$INCLUDE TEscherAnchorCacheImp.inc}

{ TEscherShapeCache }
{$INCLUDE TEscherShapeCacheImp.inc}

{ TEscherSPContainerCache }
{$INCLUDE TEscherOPTCacheImp.inc}

{ TEscherRecord }

procedure TEscherRecord.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);
begin
  //Nothing
end;

procedure TEscherRecord.AssignClientData(const aClientData: TBaseClientData);
begin
  raise Exception.Create(ErrLoadingEscher);
end;

procedure TEscherRecord.ClearCopiedTo;
begin
  CopiedTo:=nil;
end;

function TEscherRecord.CopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  if Self=nil then Result:= nil   //for this to work, this can't be a virtual method
  else Result:=DoCopyTo(NewDwgCache, RowOfs);
end;

constructor TEscherRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited Create;
  LoadedDataSize:=0;
  TotalDataSize:=aEscherHeader.Size;
  Id:= aEscherHeader.Id;
  Pre:= aEscherHeader.Pre;

  DwgGroupCache:= aDwgGroupCache;
  DwgCache:= aDwgCache;
  FParent:=aParent;
end;

function TEscherRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
var
  ERec: TEscherRecordHeader;
begin
  ERec.Id:=Id;
  ERec.Pre:=Pre;
  ERec.Size:=TotalDataSize;

  Result:= ClassOfTEscherRecord(ClassType).Create(ERec, DwgGroupCache, NewDwgCache, Nil);
  CopiedTo:=Result;
  Result.LoadedDataSize:=LoadedDataSize;
  if FParent<> nil then
    if FParent.CopiedTo<>nil then Result.FParent:= FParent.CopiedTo as TEscherContainerRecord
    else Result.FParent:=FParent
  else Result.FParent:=nil;
end;

function TEscherRecord.IsContainer(const aPre: word): boolean;
begin
  IsContainer:=(aPre and $000F ) = $000F
end;

function TEscherRecord.Loaded: boolean;
begin
  if LoadedDataSize>TotalDataSize then Raise Exception.Create(ErrInternal);
  Loaded:= TotalDataSize=LoadedDataSize;
end;

procedure TEscherRecord.WriteNewRecord(const DataStream: TStream; const BreakList: TBreakList);
var
 Rh: TRecordHeader;
begin
  Rh.Id:= BreakList.CurrentId;
  Rh.Size:= BreakList.CurrentSize;
  if DataStream.Write(Rh, SizeOf(Rh)) <> Sizeof(Rh) then raise Exception.Create(ErrCantWrite);
end;

procedure TEscherRecord.IncNextPos(var NextPos: integer; const Size: integer;var RealSize:integer; const BreakList: TBreakList);
begin
  if NextPos> MaxRecordDataSize+1 then Raise Exception.Create(ErrInternal);
  inc(NextPos, Size);
  inc(RealSize, Size);
  while NextPos>MaxRecordDataSize+1 do
  begin
    dec(NextPos, MaxRecordDataSize+1);
    inc(RealSize, SizeOf(TRecordHeader));  //continue record
    if BreakList<>nil then BreakList.Add(xlr_CONTINUE, MaxRecordDataSize+1);
  end;
end;

procedure TEscherRecord.SplitRecords(var NextPos, RealSize: integer; var NextDwg: integer; const BreakList: TBreakList);
begin
  if NextDwg>0 then
  begin
    if BreakList<>nil then BreakList.Add(NextDwg, NextPos);
    Inc(RealSize, SizeOf(TRecordHeader));
    NextPos:=0;
    NextDwg:=-1;
  end;

  IncNextPos(NextPos, SizeOf(TEscherRecordHeader), RealSize, BreakList);
end;

procedure TEscherRecord.CheckSplit(const DataStream: TStream; const BreakList: TBreakList);
begin
  if (DataStream.Position > BreakList.AcumSize) then Raise Exception.Create(ErrInternal);
  if DataStream.Position = BreakList.AcumSize then
  begin
    WriteNewRecord(DataStream, BreakList);
    BreakList.IncCurrent;
  end;
end;

procedure TEscherRecord.SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
var
  Ds: Cardinal;
begin
  if not Loaded then raise Exception.Create(ErrEscherNotLoaded);

  CheckSplit(DataStream, BreakList);
  if DataStream.Write(Pre, Sizeof(Pre)) <> Sizeof(Pre) then raise Exception.Create(ErrCantWrite);
  if DataStream.Write(Id, Sizeof(Id)) <> Sizeof(Id) then raise Exception.Create(ErrCantWrite);

  Ds:= TotalSizeNoSplit-SizeOf(TEscherRecordHeader);
  if DataStream.Write(Ds, Sizeof(Ds)) <> Sizeof(Ds) then raise Exception.Create(ErrCantWrite);
end;

function TEscherRecord.TotalSizeNoSplit: int64;
begin
  Result:=SizeOf(TEscherRecordHeader);
end;

function TEscherRecord.WaitingClientData(var ClientType: ClassOfTBaseClientData): boolean;
begin
  Result:=false;
  ClientType:=nil;
end;

function TEscherRecord.Instance: word;
begin
  Result:= Pre shr 4;
end;

function TEscherRecord.Version: word;
begin
  Result:= Pre and $F;
end;


function TEscherRecord.FindRoot: TEscherRecord;
begin
  Result:=Self;
  if DwgCache=nil then exit;
  while (Result<>nil)and (Result.FParent<>DwgCache.Patriarch) do Result:=Result.FParent;
end;

function TEscherRecord.CopyDwg(const RowOfs: integer): TEscherRecord;
begin
  if ((DwgCache.Patriarch=nil) or (FindRoot=nil)) then raise Exception.Create(ErrLoadingEscher);
  DwgCache.Patriarch.FContainedRecords.Add(FindRoot.CopyTo(DwgCache, RowOfs));
  Result:=CopiedTo;
end;

function TEscherRecord.Patriarch: TEscherSpgrContainerRecord;
begin
  if (DwgCache=nil) then Result:=nil else
  Result:=DwgCache.Patriarch;
end;

function TEscherRecord.CompareRec(const aRecord: TEscherRecord): integer;
begin
  if Id< aRecord.Id then Result:=-1 else if aRecord.Id>Id then Result:=1 else
  if Pre<aRecord.Pre then result:=-1 else if Pre>aRecord.Pre then Result:=1 else
  if TotalDataSize< aRecord.TotalDataSize then Result:=-1 else if TotalDataSize> aRecord.TotalDataSize then Result:=1 else
  Result:=0;
end;

procedure TEscherRecord.AfterCreate;
begin
  //nothing
end;

function TEscherRecord.FindRec(const RecClass: ClassOfTEscherRecord): TEscherRecord;
begin
  Result:=nil;
end;

{ TEscherRecordList }

function TEscherRecordList.TotalSizeNoSplit: int64;
var
  i: integer;
begin
  Result:=0;
  for i:=0 to Count-1 do Result:=Result+Items[i].TotalSizeNoSplit;
end;

{$INCLUDE TEscherRecordListImp.inc}

procedure TEscherRecordList.SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
var
  i:integer;
begin
  for i:=0 to Count-1 do if Items[i]<>nil then Items[i].SaveToStream(DataStream, BreakList);
end;

procedure TEscherRecordList.CopyFrom(const aEscherRecordList: TEscherRecordList; const NewDwgCache: PEscherDwgCache; const RowOfs: integer);
var
  i:integer;
begin
  if aEscherRecordList=nil then exit;
  for i:=0 to aEscherRecordList.Count-1 do Add(aEscherRecordList[i].CopyTo(NewDwgCache, RowOfs));
end;

{ TEscherDataRecord }

procedure TEscherDataRecord.ClearData;
begin
  FillChar(Data^, TotalDataSize, 0);
end;

function TEscherDataRecord.CompareRec(const aRecord: TEscherRecord): integer;
var
  i:integer;
begin
  Result:=inherited CompareRec(aRecord);
  if Result=0 then
  begin
    for i:=0 to TotalDataSize-1 do if Data[i]<(aRecord as TEscherDataRecord).Data[i] then begin Result:=-1; exit;end else
                                   if Data[i]>(aRecord as TEscherDataRecord).Data[i] then begin Result:=1; exit; end;
  end;
end;

constructor TEscherDataRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  GetMem(Data, TotalDataSize);
end;

destructor TEscherDataRecord.Destroy;
begin
  FreeMem(Data);
  inherited;
end;

function TEscherDataRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  Result:=inherited DoCopyTo(NewDwgCache, RowOfs);
  Move(Data^, (Result as TEscherDataRecord).Data^, TotalDataSize);
end;

procedure TEscherDataRecord.Load(var aRecord: TBaseRecord; var aPos: integer);
var
  RSize: integer;
begin
  if TotalDataSize=0 then exit;
  RSize:=aRecord.TotalSizeNoHeaders-aPos;
  if RSize<=0 then raise Exception.Create(ErrLoadingEscher);
  if TotalDataSize - LoadedDataSize < RSize  then RSize:=TotalDataSize - LoadedDataSize;
  if LoadedDataSize+RSize> TotalDataSize then raise Exception.Create(ErrLoadingEscher);
  ReadMem(aRecord, aPos, RSize, PChar(Data)+ LoadedDataSize);
  inc(LoadedDataSize, RSize);
end;

procedure TEscherDataRecord.SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
var
  RemainingSize: integer;
  FracSize: integer;
begin
  inherited;
  if TotalDataSize > 0 then
  begin
    RemainingSize:= TotalDataSize;
    while RemainingSize> BreakList.AcumSize - DataStream.Position do
    begin
      FracSize:= BreakList.AcumSize - DataStream.Position;
      CheckSplit(DataStream, BreakList);
      if DataStream.Write((PCHAR(Data)+ TotalDataSize-RemainingSize)^, FracSize) <> FracSize then
        raise Exception.Create(ErrCantWrite);

      dec(RemainingSize, FracSize);
    end; //while

    CheckSplit(DataStream, BreakList);
    if DataStream.Write((PCHAR(Data)+ TotalDataSize-RemainingSize)^, RemainingSize) <> RemainingSize then
      raise Exception.Create(ErrCantWrite);

  end;
end;

procedure TEscherDataRecord.SplitRecords(var NextPos, RealSize: integer;
  var NextDwg: integer; const BreakList: TBreakList);
begin
  inherited;
  IncNextPos(NextPos, TotalDataSize, RealSize, BreakList);
end;

function TEscherDataRecord.TotalSizeNoSplit: int64;
begin
  Result:=inherited TotalSizeNoSplit + TotalDataSize;
end;

{ TEscherContainerRecord }

procedure TEscherContainerRecord.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);
var
  i:integer;
begin
  inherited;
  for i:=0 to FContainedRecords.Count-1 do FContainedRecords[i].ArrangeInsert(aPos, aCount, SheetInfo, Forced);
end;

procedure TEscherContainerRecord.AssignClientData(
  const aClientData: TBaseClientData);
begin
  LastRecord.AssignClientData(aClientData);
end;

procedure TEscherContainerRecord.ClearCopiedTo;
var
  i: integer;
begin
  inherited;
  for i:=0 to FContainedRecords.Count-1 do FContainedRecords[i].ClearCopiedTo;
end;

constructor TEscherContainerRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  FContainedRecords:= TEscherRecordList.Create;
end;

destructor TEscherContainerRecord.Destroy;
begin
  FreeAndNil(FContainedRecords);
  inherited;
end;

function TEscherContainerRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  Result:=inherited DoCopyTo(NewDwgCache, RowOfs);
  (Result as TEscherContainerRecord).FContainedRecords.CopyFrom(FContainedRecords, NewDwgCache, RowOfs);
end;

function TEscherContainerRecord.FindRec(const RecClass: ClassOfTEscherRecord): TEscherRecord;
var
  i: integer;
begin
  Result:=nil;
  for i:=0 to FContainedRecords.Count-1 do if FContainedRecords[i] is RecClass then
  begin
    Result:= FContainedRecords[i];
    exit;
  end;
end;

function TEscherContainerRecord.LastRecord: TEscherRecord;
begin
  if FContainedRecords.Count=0 then raise Exception.Create(ErrLoadingEscher);
  LastRecord:=FContainedRecords[FContainedRecords.Count-1];
end;

procedure TEscherContainerRecord.Load(var aRecord: TBaseRecord; var aPos: integer);
var
  RSize: integer;
  RecordHeader: TEscherRecordHeader;
begin
  RSize:= aRecord.TotalSizeNoHeaders;
  if aPos> RSize then raise Exception.Create(ErrExcelInvalid);
  while (not Loaded) and (aPos<RSize) do
  begin
    if (FContainedRecords.Count=0) or (LastRecord.Loaded) then
    begin
      ReadMem(aRecord, aPos, SizeOf(RecordHeader), @RecordHeader);
      if IsContainer(RecordHeader.Pre) then
        case RecordHeader.Id of
          MsofbtBstoreContainer:
               FContainedRecords.Add(TEscherBStoreRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtSpgrContainer:
               FContainedRecords.Add(TEscherSpgrContainerRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtSpContainer:
               FContainedRecords.Add(TEscherSpContainerRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtSolverContainer:
               FContainedRecords.Add(TEscherSolverContainerRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          else
               FContainedRecords.Add(TEscherContainerRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self))
        end // case
        else
        case RecordHeader.Id of
          MsofbtClientData:
               FContainedRecords.Add(TEscherClientDataRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtClientTextbox:
               FContainedRecords.Add(TEscherClientTextBoxRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtClientAnchor:
               FContainedRecords.Add(TEscherClientAnchorRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtBSE:
               FContainedRecords.Add(TEscherBSERecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtDg:
               FContainedRecords.Add(TEscherDgRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtDgg:
               FContainedRecords.Add(TEscherDggRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtSp:
               FContainedRecords.Add(TEscherSpRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtOPT:
               FContainedRecords.Add(TEscherOPTRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtSplitMenuColors:
               FContainedRecords.Add(TEscherSplitMenuRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));

          MsofbtConnectorRule:
               FContainedRecords.Add(TEscherConnectorRuleRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtAlignRule:
               FContainedRecords.Add(TEscherAlignRuleRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtArcRule:
               FContainedRecords.Add(TEscherArcRuleRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          MsofbtCallOutRule:
               FContainedRecords.Add(TEscherCallOutRuleRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
          else
               FContainedRecords.Add(TEscherDataRecord.Create(RecordHeader, DwgGroupCache, DwgCache, Self));
        end; //case
    end;
    LastRecord.Load(aRecord, aPos);
    if LastRecord.Loaded then
      begin
        inc(LoadedDataSize, LastRecord.TotalSizeNoSplit);
        LastRecord.AfterCreate;
      end;
  end;
end;

procedure TEscherContainerRecord.SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
begin
  inherited;
  FContainedRecords.SaveToStream(DataStream, BreakList);
end;

procedure TEscherContainerRecord.SplitRecords(var NextPos, RealSize,
  NextDwg: integer; const BreakList: TBreakList);
var
  i: integer;
begin
  inherited;
  for i:=0 to FContainedRecords.Count-1 do FContainedRecords[i].SplitRecords(NextPos, RealSize, NextDwg, BreakList);
end;

function TEscherContainerRecord.TotalSizeNoSplit: int64;
begin
  Result:= inherited TotalSizeNoSplit+ FContainedRecords.TotalSizeNoSplit;
end;

function TEscherContainerRecord.WaitingClientData(var ClientType: ClassOfTBaseClientData): boolean;
begin
  if (FContainedRecords.Count=0) then Result:=false
  else Result:=LastRecord.WaitingClientData(ClientType);
end;

{ TEscherClientDataRecord }

procedure TEscherClientDataRecord.ArrangeCopyRows(const RowOfs: integer);
begin
  if ClientData<>nil then ClientData.ArrangeCopyRows(RowOfs);
end;

procedure TEscherClientDataRecord.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);
begin
  inherited;
  if ClientData<>nil then ClientData.ArrangeInsert(aPos, aCount, SheetInfo);
end;

procedure TEscherClientDataRecord.AssignClientData(const aClientData: TBaseClientData);
begin
  ClientData:= aClientData;
  if (ClientData<>nil) then
  begin
    if (ClientData.Id> DwgCache.MaxObjId) then DwgCache.MaxObjId:=ClientData.Id;
  end;
end;

constructor TEscherClientDataRecord.Create( const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  if DwgCache.Obj<>nil then DwgCache.Obj.Add(Self);
end;

constructor TEscherClientDataRecord.CreateFromData(
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
var
  aEscherHeader: TEscherRecordHeader;
begin
  aEscherHeader.Pre:=0;
  aEscherHeader.Id:=MsofbtClientData;
  aEscherHeader.Size:=0;
  Create( aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  LoadedDataSize:=0;
end;

destructor TEscherClientDataRecord.Destroy;
begin
  if (DwgCache.Obj<>nil) and not DwgCache.Destroying then DwgCache.Obj.Remove(Self);
  FreeAndNil(ClientData);
  //MADE: remover los otros que referencian a estos objs.
  inherited;
end;

function TEscherClientDataRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  Result:=inherited DoCopyTo(NewDwgCache, RowOfs);
  (Result as TEscherClientDataRecord).AssignClientData(ClientData.CopyTo);

  if NewDwgCache=DwgCache then (Result as TEscherClientDataRecord).ClientData.ArrangeId(DwgCache.MaxObjId);
  (Result as TEscherClientDataRecord).ArrangeCopyRows(RowOfs);
end;

function TEscherClientDataRecord.Loaded: boolean;
begin
  Result:= inherited Loaded;
end;

function TEscherClientDataRecord.ObjId: word;
begin
  if ClientData<>nil then Result:=ClientData.Id else Result:=0;
end;

procedure TEscherClientDataRecord.SaveToStream(const DataStream: TStream; const BreakList: TBreakList);
var
  StreamPos: integer;
begin
  inherited;
  StreamPos:= DataStream.Position;
  if ClientData<>nil then ClientData.SaveToStream(DataStream);
  BreakList.AddToZeroPos(DataStream.Position-StreamPos);

end;

procedure TEscherClientDataRecord.SplitRecords(var NextPos,
  RealSize: integer; var NextDwg: integer; const BreakList: TBreakList);
begin
  inherited;
  if ClientData<>nil then inc(RealSize, ClientData.TotalSize);
  NextDwg:=xlr_MSODRAWING;
end;

function TEscherClientDataRecord.TotalSizeNoSplit: int64;
begin
  TotalSizeNoSplit:=inherited TotalSizeNoSplit;
end;

function TEscherClientDataRecord.WaitingClientData(var ClientType: ClassOfTBaseClientData): boolean;
begin
  Result:= inherited Loaded and (ClientData=nil);
  ClientType:=TMsObj;
end;

//////////////////////////////////////Other Records ///////////////////////////7

{ TEscherClientAnchorRecord }

constructor TEscherClientAnchorRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  Anchor:=PClientAnchor(Data);
  if DwgCache.Anchor<>nil then DwgCache.Anchor.Add(Self);
  if FParent <> nil then (FParent as TEscherSPContainerRecord).ClientAnchor:=Self;
end;

constructor TEscherClientAnchorRecord.CreateFromData(const aAnchor: TClientAnchor;const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  Create(aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  move(aAnchor, Anchor^, Sizeof(TClientAnchor));
  LoadedDataSize:=TotalDataSize;
end;

procedure TEscherClientAnchorRecord.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo; const Forced: boolean);
var
  dr: integer;
  Af: word;
begin
  if SheetInfo.FormulaSheet<> SheetInfo.InsSheet then exit;
  if Forced then Af:=2 else Af:=Anchor.Flag;
  case Af and 3 of
    0: //move and resize
    begin
      if Anchor.Row1>=aPos then
      begin
        dr:= Anchor.Row1+aCount;
        IncMaxMin(Anchor.Row1, aCount, Max_Rows, aPos);
        if dr< aPos then Anchor.Dy1:=0;
      end;
      if Anchor.Row2>=aPos then
      begin
        dr:= Anchor.Row2+aCount;
        IncMaxMin(Anchor.Row2, aCount, Max_Rows, aPos);
        if dr< aPos then Anchor.Dy2:=0;
      end;
    end;
    2: //move
    begin
      if Anchor.Row1>=aPos then
      begin
        dr:= Anchor.Row1;
        IncMaxMin(Anchor.Row1, aCount, Max_Rows, aPos);
        IncMaxMin(Anchor.Row2, Anchor.Row1-dr, Max_Rows, Anchor.Row1);
      end;
    end;
    3: //dont move
    begin
    end;
  end; //case
end;


destructor TEscherClientAnchorRecord.Destroy;
begin
  if (DwgCache.Anchor<> nil) and not DwgCache.Destroying then DwgCache.Anchor.Remove(Self);
  if FParent <> nil then (FParent as TEscherSpContainerRecord).ClientAnchor:=nil;
  inherited;
end;

function TEscherClientAnchorRecord.AllowCopy(const FirstRow, LastRow: integer): boolean;
begin
  AllowCopy:= ((Anchor.Flag and 3) in [0,2]) and (Anchor.Row1>=FirstRow) and (Anchor.Row2<=LastRow);
end;

function TEscherClientAnchorRecord.AllowDelete(const FirstRow, LastRow: integer): boolean;
begin
  AllowDelete:= ((Anchor.Flag and 3) in [0]) and (Anchor.Row1>=FirstRow) and (Anchor.Row2<=LastRow);
end;

function TEscherClientAnchorRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  Result:=inherited DoCopyTo(NewDwgCache, RowOfs);
  (Result.FParent as TEscherSPContainerRecord).ClientAnchor:=Result as TEscherClientAnchorRecord;
  inc((Result as TEscherClientAnchorRecord).Anchor.Row1, RowOfs);
  inc((Result as TEscherClientAnchorRecord).Anchor.Row2, RowOfs);
end;

function TEscherClientAnchorRecord.Col: integer;
begin
  Result:= Anchor.Col1;
end;

function TEscherClientAnchorRecord.Row: integer;
begin
  Result:= Anchor.Row1;
end;

function TEscherClientAnchorRecord.GetAnchor: TClientAnchor;
begin
  Result:= Anchor^;
end;


{ TEscherBSERecord }

procedure TEscherBSERecord.AddRef;
begin
  IncCardinal(Data,24,1);
end;

function TEscherBSERecord.CompareRec( const aRecord: TEscherRecord): integer;
type
  TUid=array[0..15] of byte;
  PUid=^TUid;
var
  Uid1, Uid2: PUid;
  i:integer;
begin
  //We can't just compare the data of the 2 records, because cRef can be different
  //no inherited

  if TotalDataSize< aRecord.TotalDataSize then Result:=-1 else if TotalDataSize> aRecord.TotalDataSize then Result:=1 else
  begin
    Uid1:= PUid(PChar(Data)+2);
    Uid2:= PUid(PChar((aRecord as TEscherBSERecord).Data)+2);
    for i:=0 to SizeOf(TUid)-1 do
      if Uid1[i]<Uid2[i] then
      begin
        Result:=-1;
        exit;
      end else
      if Uid1[i]>Uid2[i] then
      begin
        Result:=1;
        exit;
      end;

    Result:= 0;
  end;
end;

procedure TEscherBSERecord.CopyFromData(
  const BSEHeader: Pointer; const BlipHeader: TEscherRecordHeader; const BlipData: TStream);
var
  blp: PArrayOfByte;
begin
  if 36+BlipData.Size+SizeOf(BlipHeader)<> TotalDataSize then raise exception.Create(ErrInternal);
  System.Move(BSEHeader^, Data^, 36);
  System.Move(BlipHeader, (PChar(Data)+36)^, SizeOf(BlipHeader));
  blp:=PArrayOfByte(pchar(Data)+36+SizeOf(BlipHeader));
  BlipData.Read(blp^, BlipData.Size);
  LoadedDataSize:=TotalDataSize;
end;

function TEscherBSERecord.References: Cardinal;
begin
  References:= GetCardinal(Data, 24);
end;

procedure TEscherBSERecord.Release;
begin
  if self=nil then exit;
  IncCardinal(Data,24,-1);
  if (References=0)and (DwgGroupCache.BStore<>nil) then
    DwgGroupCache.BStore.ContainedRecords.Remove(Self); //When refs=0 , delete from bstore
end;

//This is the header to write a bitmap to disk
type
  tagBITMAPFILEHEADER = packed record
    bfType: Word;
    bfSize: LongWord;
    bfReserved1: Word;
    bfReserved2: Word;
    bfOffBits: LongWord;
  end;

procedure TEscherBSERecord.SaveGraphicToStream(const aData: TStream; var aDataType: TXlsImgTypes);
var
  HeadOfs: integer;
  BmpHead: tagBITMAPFILEHEADER;
begin
  case Data[0] of
    msoblipEMF  : aDataType:=xli_Emf;
    msoblipWMF  : aDataType:=xli_Wmf;
    msoblipJPEG : aDataType:=xli_Jpeg;
    msoblipPNG  : aDataType:=xli_Png;
    msoblipDIB  : aDataType:=xli_Bmp;
    else aDataType:=xli_Unknown;
  end; //case
  if aDataType in [xli_JPEG, xli_PNG, xli_BMP] then HeadOfs:=17 else HeadOfs:=16;

  if aDataType = xli_Bmp then
  begin
    FillChar(BmpHead, SizeOf(BmpHead), 0);
    BmpHead.BfType:=$4D42;
    aData.WriteBuffer(BmpHead, SizeOf(BmpHead));
  end;

  aData.WriteBuffer((PChar(Data)+36+SizeOf(TEscherRecordHeader)+HeadOfs)^ , TotalDataSize-36-SizeOf(TEscherRecordHeader)-HeadOfs);
end;

{ TEscherBStoreRecord }

procedure TEscherBStoreRecord.AddRef(const BlipPos: integer);
begin
  if (BlipPos<1)or(BlipPos> FContainedRecords.Count) then raise Exception.Create(ErrExcelInvalid);
  (FContainedRecords[BlipPos-1] as TEscherBSERecord).AddRef;
end;

constructor TEscherBStoreRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  if (DwgGroupCache.BStore=nil) then DwgGroupCache.BStore:=Self else raise Exception.Create(ErrBStroreDuplicated);
end;

destructor TEscherBStoreRecord.Destroy;
begin
  DwgGroupCache.BStore:=nil;
  inherited;
end;

procedure TEscherBStoreRecord.Release(const BlipPos: integer);
begin
  if (BlipPos<1)or(BlipPos> FContainedRecords.Count) then raise Exception.Create(ErrExcelInvalid);
  (FContainedRecords[BlipPos-1] as TEscherBSERecord).Release;
end;

procedure TEscherBStoreRecord.SaveToStream(const DataStream: TStream;
  const BreakList: TBreakList);
var
  i: integer;
begin
  //Fix bse positions
  for i:=0 to FContainedRecords.Count-1 do (FContainedRecords[i] as TEscherBSERecord).BStorePos:=i+1;
  inherited;
end;

{ TEscherDgRecord }

constructor TEscherDgRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  Dg:= Pdg(Data);
  if (DwgCache.Dg=nil) then DwgCache.Dg:=Self else raise Exception.Create(ErrDgDuplicated);
end;

constructor TEscherDgRecord.CreateFromData(const csp, cspidCur: LongWord;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
var
  EscherHeader: TEscherRecordHeader;
begin
  EscherHeader.Pre:=$10;
  EscherHeader.Id:=MsofbtDg;
  EscherHeader.Size:=2*SizeOf(LongWord);
  Create(EscherHeader, aDwgGroupCache, aDwgCache, aParent);
  SetCardinal(Data, 0, csp);
  SetCardinal(Data, 4, cspidCur);
  LoadedDataSize:=TotalDataSize;
end;

procedure TEscherDgRecord.DecShapeCount;
begin
  dec(Dg.ShapeCount);
end;

destructor TEscherDgRecord.Destroy;
begin
  DwgCache.Dg:=nil;
  inherited;
end;

function TEscherDgRecord.IncMaxShapeId: Cardinal;
begin
  inc(Dg^.MaxSpId);
  Result:= Dg^.MaxSpId;
  inc(Dg^.ShapeCount);
  //PENDING: cuando llega a 1024, new dgg group
end;

{ TEscherSPRecord }

constructor TEscherSPRecord.Create(const aEscherHeader: TEscherRecordHeader; const aDwgGroupCache: PEscherDwgGroupCache; const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  ShapeId:=PCardinal(Data);
  if DwgCache.Shape<>nil then DwgCache.Shape.Add(Self);
  if FParent <> nil then (FParent as TEscherSpContainerRecord).SP:=self;
end;

constructor TEscherSPRecord.CreateFromData(const Pre, aShapeId, Flags: LongWord;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
var
  RecordHeader: TEscherRecordHeader;
begin
  RecordHeader.Id:=MsofbtSp;
  RecordHeader.Pre:=Pre;
  RecordHeader.Size:=8;

  Create(RecordHeader, aDwgGroupCache, aDwgCache, aParent);
  ShapeId^:=aShapeId;
  SetCardinal(Data, 4, Flags);
  LoadedDataSize:=RecordHeader.Size;

end;

destructor TEscherSPRecord.Destroy;
var
  Index: integer;
begin
  if not DwgCache.Destroying then
  begin
    if DwgCache.Dg<>nil then  DwgCache.Dg.DecShapeCount;
    if DwgCache.Solver<>nil then DwgCache.Solver.DeleteRef(Self);
    if DwgCache.Shape<>nil then
      if DwgCache.Shape.Find(ShapeId^,Index) then
        DwgCache.Shape.Delete(Index);
    if FParent <> nil then (FParent as TEscherSpContainerRecord).SP:=nil;
  end;

  //MADE: Delete all references in connectors with shapedest= self;
  inherited;
end;

function TEscherSPRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
begin
  Result:=inherited DoCopyTo(NewDwgCache, RowOfs);
  if NewDwgCache=DwgCache then (Result as TEscherSPRecord).ShapeId^:=DwgCache.Dg.IncMaxShapeId;
end;

{ TEscherDggRecord }

constructor TEscherDggRecord.Create(
  const aEscherHeader: TEscherRecordHeader;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  FDgg:= PDgg(Data);
  if (DwgGroupCache.Dgg=nil) then DwgGroupCache.Dgg:=Self else raise Exception.Create(ErrDggDuplicated);
end;

constructor TEscherDggRecord.CreateFromData(
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
var
  RecordHeader: TEscherRecordHeader;
begin
  RecordHeader.Id:=MsofbtDgg;
  RecordHeader.Pre:=0;
  RecordHeader.Size:=24;

  Create(RecordHeader, aDwgGroupCache, aDwgCache, aParent);
  FillChar(Data^, RecordHeader.Size, 0);
  FDgg.MaxShapeId:=1;
  FDgg.FIDclCount:=2;
  FDgg.ShapesSaved:=1;
  FDgg.DwgSaved:=1;

  Data[16]:=1;
  Data[20]:=1;
  LoadedDataSize:=RecordHeader.Size;

end;

destructor TEscherDggRecord.Destroy;
begin
  DwgGroupCache.Dgg:=nil;
  inherited;
end;

{ TEscherSpgrContainerRecord }

constructor TEscherSpgrContainerRecord.Create(
  const aEscherHeader: TEscherRecordHeader;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  if (DwgCache.Patriarch=nil) then DwgCache.Patriarch:=Self;
end;

destructor TEscherSpgrContainerRecord.Destroy;
begin
  if DwgCache.Patriarch=Self then DwgCache.Patriarch:=nil;
  inherited;
end;

{ TEscherSolverContainerRecord }

procedure TEscherSolverContainerRecord.ArrangeCopyRows;
var
  i: integer;
begin
  for i:=0 to FContainedRecords.Count-1 do
    (FContainedRecords[i] as TRuleRecord).ArrangeCopyRows;
end;

procedure TEscherSolverContainerRecord.CheckMax(const aRuleId: Cardinal);
begin
  if MaxRuleId<aRuleId then MaxRuleId:=aRuleId;
end;

constructor TEscherSolverContainerRecord.Create(
  const aEscherHeader: TEscherRecordHeader;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  if (DwgCache.Solver=nil) then DwgCache.Solver:=Self else raise Exception.Create(ErrSolverDuplicated);
end;

procedure TEscherSolverContainerRecord.DeleteRef(
  const Shape: TEscherSPRecord);
var
  i: integer;
begin
  for i:=FContainedRecords.Count-1 downto 0 do
    if (FContainedRecords[i] as TRuleRecord).DeleteRef(Shape) then FContainedRecords.Delete(i);
end;

destructor TEscherSolverContainerRecord.Destroy;
begin
  DwgCache.Solver:=nil;
  inherited;
end;

procedure TEscherSolverContainerRecord.FixPointers;
var
  i: integer;
begin
  for i:=0 to FContainedRecords.Count-1 do
    (FContainedRecords[i] as TRuleRecord).FixPointers;
end;

function TEscherSolverContainerRecord.IncMaxRuleId: Cardinal;
begin
  inc(MaxRuleId,2);
  Result:=MaxRuleId;
end;

{ TEscherSpContainerRecord }

function TEscherSpContainerRecord.Col: integer;
begin
  if ClientAnchor<>nil then Result:=ClientAnchor.Col else Result:=0;
end;

function TEscherSpContainerRecord.Row: integer;
begin
  if ClientAnchor<>nil then Result:=ClientAnchor.Row else Result:=0;
end;


{ TEscherOPTRecord }

function TEscherOPTRecord.Col: integer;
var
  Fr: TEscherRecord;
begin
  Fr:=FindRoot;
  if (DwgCache.Patriarch=nil) or (Fr=nil) or ((Fr as TEscherSpContainerRecord).ClientAnchor=nil) then Result:=0
  else Result:=(Fr as TEscherSpContainerRecord).ClientAnchor.Col;
end;

constructor TEscherOPTRecord.Create(
  const aEscherHeader: TEscherRecordHeader;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
begin
  inherited;
  if (FParent <> nil) and (FParent is TEscherSpContainerRecord) then (FParent as TEscherSpContainerRecord).OPT:=self;
end;

destructor TEscherOPTRecord.Destroy;
var
  i: integer;
begin
  if (Length(BlipPtr)>0) and not DwgCache.Destroying then
  begin
    for i:=0 to Length(BlipPtr)-1 do
      BlipPtr[i].Release;
    if DwgCache.Blip<>nil then DwgCache.Blip.Remove(Self);
  end;

  if (FParent <> nil) and (FParent is TEscherSpContainerRecord) then (FParent as TEscherSpContainerRecord).Opt:=nil;

  inherited;
end;

function TEscherOPTRecord.DoCopyTo(const NewDwgCache: PEscherDwgCache; const RowOfs: integer): TEscherRecord;
var
  i: integer;
begin
  Result:= inherited DoCopyTo(NewDwgCache, RowOfs);

  if (DwgCache.Blip<>nil) and (Length(BlipPos)>0) then NewDwgCache.Blip.Add(Result as TEscherOptRecord);
  (Result as TEscherOPTRecord).BlipPtr:= copy(BlipPtr, Low(BlipPtr), 1+High(BlipPtr)-Low(BlipPtr));
  (Result as TEscherOPTRecord).BlipPos:= copy(BlipPos, Low(BlipPos), 1+High(BlipPos)-Low(BlipPos));
  (Result as TEscherOPTRecord).FShapeName:=FShapeName;
  (Result as TEscherOPTRecord).NameLen:= NameLen;
  (Result as TEscherOPTRecord).NameOfs:= NameOfs;


  if Length(BlipPtr)>0 then for i:=0 to Length(BlipPtr)-1 do
    BlipPtr[i].AddRef;
end;

function TEscherOPTRecord.GetShapeName: WideString;
begin
  Result:=FShapeName;
end;

function TEscherOPTRecord.Row: integer;
var
  Fr: TEscherRecord;
begin
  Fr:=FindRoot;
  if (DwgCache.Patriarch=nil) or (Fr=nil) or ((Fr as TEscherSpContainerRecord).ClientAnchor=nil) then Result:=0
  else Result:=(Fr as TEscherSpContainerRecord).ClientAnchor.Row;
end;

procedure TEscherOPTRecord.SaveToStream(const DataStream: TStream;
  const BreakList: TBreakList);
var
  i: integer;
begin
  //Fix Blip ids
  Assert(Length(BlipPtr)=Length(BlipPos), ErrInternal);
  for i:=0 to Length(BlipPos)-1 do
    PCardinal(PChar(Data)+ BlipPos[i])^:= BlipPtr[i].BStorePos;

  inherited;
end;

procedure TEscherOPTRecord.AfterCreate;
var
  i, tPos: integer;
  Pid: word;
  ComplexOfs: Cardinal;
begin
  if DwgCache.Blip=nil then exit;
  tPos:=0; ComplexOfs:=0;
  for i:=0 to Instance-1 do
  begin
    if tPos+6> TotalDataSize then Raise Exception.Create(ErrLoadingEscher);
    Pid:= GetWord(Data, tPos);
    if ((Pid and (1 shl 15)) = 0)and ((Pid and (1 shl 14))=(1 shl 14)) then //blip
    begin
      SetLength(BlipPtr, Length(BlipPtr)+1);
      BlipPtr[Length(BlipPtr)-1]:= DwgGroupCache.Bstore.ContainedRecords[PCardinal(PChar(Data)+ tPos+2)^-1] as TEscherBSERecord;
      SetLength(BlipPos, Length(BlipPos)+1);
      BlipPos[Length(BlipPos)-1]:= tPos+2;
      if (DwgCache.Blip<>nil) and (Length(BlipPos)=1) then DwgCache.Blip.Add(Self);
    end;
    if (Pid and ($FFFF shr 2))=896 then    //Shape Name
    begin
      NameLen:= PCardinal(PChar(Data)+ tPos+2);
      NameOfs:= ComplexOfs;
      SetLength(FShapeName, NameLen^ div 2-1);
      Move((PChar(Data)+NameOfs+Instance*6)^, FShapeName[1], NameLen^-2);

    end;

    if Pid and (1 shl 15) = 1 shl 15 then //Complex property
      inc(ComplexOfs, PCardinal(PChar(Data)+ tPos+2)^);

    //Goto Next
    inc(tPos, 6)
  end;
end;

procedure TEscherOPTRecord.ChangeRef(const aBSE: TEscherBSERecord);
begin
  if Length(BlipPtr)<>1 then raise Exception.Create(ErrChangingEscher);
  if BlipPtr[0]=aBSE then exit;
  aBSE.AddRef;
  BlipPtr[0].Release;
  BlipPtr[0]:=aBSE;
end;

function TEscherOPTRecord.AddImg(const Data: string; const DataType: TXlsImgTypes): integer;
var
  BSE: TEscherBSERecord;
  BStore: TEscherBStoreRecord;
begin
  BStore:=DwgGroupCache.BStore;
  Assert(BStore<>nil, 'BStore can''t be nil');
  BSE:= ConvertGraphicToBSE(Data, DataType, DwgGroupCache, DwgCache);
  if not BStore.ContainedRecords.Find( BSE, Result)
   then BStore.ContainedRecords.Insert(Result, BSE) else FreeAndNil(BSE);
  (BStore.ContainedRecords[Result] as TEscherBSERecord).AddRef;
end;

procedure TEscherOPTRecord.ReplaceImg(const Data: string; const DataType: TXlsImgTypes);
var
  BSE: TEscherBSERecord;
  BStore: TEscherBStoreRecord;
  Index: integer;
begin
  BStore:=DwgGroupCache.BStore;
  Assert(BStore<>nil, 'BStore can''t be nil');
  BSE:= ConvertGraphicToBSE(Data, DataType, DwgGroupCache, DwgCache);
  if not BStore.ContainedRecords.Find( BSE, Index)
   then BStore.ContainedRecords.Insert(Index, BSE) else FreeAndNil(BSE);
  ChangeRef(BStore.ContainedRecords[Index] as TEscherBSERecord);
end;

procedure TEscherOPTRecord.GetImageFromStream(const Data: TStream; var DataType: TXlsImgTypes);
begin
  if Length(BlipPtr)<>1 then raise Exception.Create(ErrChangingEscher);
  BlipPtr[0].SaveGraphicToStream(Data, DataType);
end;

function TEscherOPTRecord.GetAnchor: TClientAnchor;
var
  Fr: TEscherRecord;
begin
  Fr:=FindRoot;
  if (DwgCache.Patriarch=nil) or (Fr=nil) or ((Fr as TEscherSpContainerRecord).ClientAnchor=nil) then
    FillChar(Result, SizeOf(Result), 0)
  else Result:=(Fr as TEscherSpContainerRecord).ClientAnchor.GetAnchor;
end;

constructor TEscherOPTRecord.CreateFromDataImg(
  const aPict: string; const aPicType: TXlsImgTypes; const PicName: widestring;
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
var
  aEscherHeader: TEscherRecordHeader;
begin
  aEscherHeader.Id:=MsofbtOPT;
  aEscherHeader.Pre:=$0043; //4 properties, id, name, NoFillHitTest, fPrint

  aEscherHeader.Size:=6 + //blip
                      6 + Length(PicName)*2+ 2+ //Name
                      12; //NoFillHitTest, fPrint
  Create(aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  SetWord(Data, 0, $4104); //blip=260, is blip=1, complex=0
  SetCardinal(Data, 2, AddImg(aPict, aPicType)+1);
  SetWord(Data,6, $C105); //Name prop... it is a complex one... data goes at the end.
  SetCardinal(Data, 8, Length(PicName)*2+2);
  SetWord(Data, 12, $1BF); //NoFilHitTest... select on not filled areas.
  SetCardinal(Data, 14, $10000);
  SetWord(Data, 18, $3BF); //fPrint... print this shape.
  SetCardinal(Data, 20, $80000);
  // set the string data.
  move(PicName[1], Data[24], Length(PicName)*2);
  SetWord(Data,24+Length(PicName)*2,0); //00 at the end
  AfterCreate;
  LoadedDataSize:=TotalDataSize;

end;

constructor TEscherOPTRecord.GroupCreateFromData(
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
const
  DefaultData: array [0..17] of byte=($BF, $00, $08, $00, $08, $00, $81, $01, $09, $00, $00, $08, $C0, $01, $40, $00, $00, $08);
var
  aEscherHeader: TEscherRecordHeader;
begin
  aEscherHeader.Id:=MsofbtOPT;
  aEscherHeader.Pre:=$0033; //5 properties

  aEscherHeader.Size:=18;
  Create(aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  move(DefaultData, Data^, SizeOf(DefaultData));
  AfterCreate;
  LoadedDataSize:=TotalDataSize;
end;

constructor TEscherOPTRecord.CreateFromDataNote(
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord;
  const Dummy: integer);
const
DefaultData: array [0..53] of byte=(
  $80, $00, $00, $00, $00, $00,  //IdText. Nothing, as we dont know what goes here
  $BF, $00, $08, $00, $08, $00,  //fFitTextToShape
  $58, $01, $00, $00, $00, $00,  //unknown
  $81, $01, $50, $00, $00, $08,  //fillcolor
  $83, $01, $50, $00, $00, $08,  //fillbackcolor
  $BF, $01, $10, $00, $11, $00,  //fNoFillHitTest
  $01, $02, $00, $00, $00, $00,  //shadow color
  $3F, $02, $03, $00, $03, $00,  //shadowObscured
  $BF, $03, $02, $00, $0A, $00);   //Print

var
  aEscherHeader: TEscherRecordHeader;
begin
  aEscherHeader.Id:=MsofbtOPT;
  aEscherHeader.Pre:=$0093; //9 properties

  aEscherHeader.Size:=6*9;
  Create(aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  move(DefaultData, Data^, SizeOf(DefaultData));
  AfterCreate;
  LoadedDataSize:=TotalDataSize;

end;

{ TEscherObjCache }

procedure TEscherObjCache.ArrangeCopySheet(const SheetInfo: TSheetInfo);
var
  i: integer;
begin
  for i:=0 to Count-1 do Items[i].ClientData.ArrangeCopySheet(SheetInfo);
end;

{ TEscherSplitMenuRecord }

constructor TEscherSplitMenuRecord.CreateFromData(
  const aDwgGroupCache: PEscherDwgGroupCache;
  const aDwgCache: PEscherDwgCache; const aParent: TEscherContainerRecord);
const
  DefaultData: array [0..15] of byte=($0D, $00, $00, $08, $0C, $00, $00, $08, $17, $00, $00, $08, $F7, $00, $00, $10);
var
  aEscherHeader: TEscherRecordHeader;
begin
  aEscherHeader.Id:=MsofbtSplitMenuColors;
  aEscherHeader.Pre:=$0040;
  aEscherHeader.Size:=16;
  Create(aEscherHeader, aDwgGroupCache, aDwgCache, aParent);
  move(DefaultData, Data^, SizeOf(DefaultData));
  LoadedDataSize:=TotalDataSize;

end;

end.
