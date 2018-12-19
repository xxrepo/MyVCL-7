unit UXlsReferences;

interface
uses Classes, Sysutils, XlsMessages, UXlsBaseRecords,
     UXlsBaseRecordLists, UxlsBaseList, UXlsStrings,
     XlsFormulaMessages,
     UFlxMessages;
type

  TSupBookRecord  = class(TBaseRecord)
  public
    function IsLocal: boolean;
    procedure InsertSheets(const SheetCount: word);
    function BookName: widestring;
    function SheetName(const SheetIndex: integer; const Globals: TObject): widestring;
  end;

  TExternSheetRecord = class(TBaseRecord)
  end;

  TExternRef= class
  public
    SupBookRecord: Word;
    FirstSheet, LastSheet: Word;
    constructor Create(const aSupBookRecord, aFirstSheet, aLastSheet: word);
    procedure SaveToStream(const DataStream: TStream);
  end;

  TSupBookRecordList = class(TBaseRecordList)
  {$INCLUDE TSupBookRecordListHdr.inc}
  end;



  TExternRefList= class(TBaseList)
  {$INCLUDE TExternRefListHdr.inc}
    procedure Load(const aRecord: TExternSheetRecord);
    procedure SaveToStream(const DataStream: TStream);
    function TotalSize: int64;

    procedure InsertSheets(const BeforeSheet, SheetCount:word; LocalSupBook: integer);
  end;

  TReferences = class
  private
    FSupBooks: TSupBookRecordList;
    FExternRefs: TExternRefList;
    LocalSupBook: integer;
  public
    constructor Create;
    destructor Destroy; override;

    function TotalSize:int64;
    procedure Clear;
    procedure SaveToStream(const DataStream: TStream);

    procedure AddSupBook(const aRecord: TSupBookRecord);
    procedure AddExternRef(const aRecord: TExternSheetRecord);

    procedure InsertSheets(const BeforeSheet, SheetCount: integer);
    function GetSheet(const SheetRef: word): integer;
    function SetSheet(const Sheet: word): integer;
    function GetSheetName(const SheetRef: word; const Globals: TObject): widestring;
  end;

implementation
uses UXlsWorkbookGlobals;
{$INCLUDE TExternRefListImp.inc}
{$INCLUDE TSupBookRecordListImp.inc}

{ TExternRefList }


procedure TExternRefList.InsertSheets(const BeforeSheet, SheetCount:word; LocalSupBook: integer);
var
  i:integer;
begin
  for i:=0 to Count-1 do
    if Items[i].SupBookRecord= LocalSupBook then
    begin
      if (Items[i].FirstSheet<>$FFFF) and (Items[i].FirstSheet>=BeforeSheet) then IncMax(Items[i].FirstSheet, SheetCount, MaxSheets);
      if (Items[i].LastSheet<>$FFFF) and (Items[i].LastSheet>=BeforeSheet) then IncMax(Items[i].LastSheet, SheetCount, MaxSheets);
    end;
end;

procedure TExternRefList.Load(const aRecord: TExternSheetRecord);
var
  n: word;
  i: integer;
  aPos: integer;
  MyRecord: TBaseRecord;
  Index, Fs, Ls: word;
begin
  n:=GetWord(aRecord.Data, 0);
  aPos:=2; MyRecord:= aRecord;
  for i:=0 to n-1 do
  begin
    ReadMem(MyRecord, aPos, 2, @Index);
    ReadMem(MyRecord, aPos, 2, @Fs);
    ReadMem(MyRecord, aPos, 2, @Ls);
    Add(TExternRef.Create(Index,Fs,Ls));
  end;
end;

procedure TExternRefList.SaveToStream(const DataStream: TStream);
var
  RecordHeader: TRecordHeader;
  i, k, Lines, CountRecords:integer;
  MyCount: word;
begin
  MyCount:=Count;
  if Count =0 then
  begin
    RecordHeader.Id:= xlr_EXTERNSHEET;
    RecordHeader.Size:=2;
    DataStream.Write(RecordHeader, SizeOf(RecordHeader));
    DataStream.Write(MyCount, SizeOf(MyCount));
    exit;
  end;

  Lines:=(6* Count-1) div MaxExternSheetDataSize;
  for i:= 0 to Lines do
  begin
    if i<Lines then CountRecords:= MaxExternSheetDataSize div 6
      else CountRecords:=((6* Count-1) mod MaxExternSheetDataSize + 1) div 6 ;
    RecordHeader.Size:= CountRecords*6;

    if i= 0 then
    begin
      RecordHeader.Id:= xlr_EXTERNSHEET;
      inc(RecordHeader.Size,2);
    end
    else RecordHeader.Id:= xlr_CONTINUE;

    DataStream.Write(RecordHeader, SizeOf(RecordHeader));
    if i=0 then DataStream.Write( MyCount, SizeOf (MyCount));

    for k:= i*(MaxExternSheetDataSize div 6) to i*(MaxExternSheetDataSize div 6)+CountRecords-1 do
     Items[k].SaveToStream(DataStream);
  end;
end;

function TExternRefList.TotalSize: int64;
begin
  //Take in count Continues...
  if Count=0 then Result:=2+SizeOf(TRecordHeader) else
  Result:=2+ (((6* Count-1) div MaxExternSheetDataSize)+1)* SizeOf(TRecordHeader)  //header + continues
          + 6*Count;
end;

{ TReferences }

procedure TReferences.AddExternRef(const aRecord: TExternSheetRecord);
begin
  FExternRefs.Load(aRecord);
end;

procedure TReferences.AddSupBook(const aRecord: TSupBookRecord);
begin
  FSupBooks.Add(aRecord);
  if aRecord.IsLocal then LocalSupBook:= FSupBooks.Count-1;
end;

procedure TReferences.Clear;
begin
  if FSupbooks<>nil then FSupBooks.Clear;
  if FExternRefs<>nil then FExternRefs.Clear;
  LocalSupBook:=-1;
end;

constructor TReferences.Create;
begin
  inherited;
  FSupBooks:=TSupBookRecordList.Create;
  FExternRefs:= TExternRefList.Create;
  LocalSupBook:=-1;
end;

destructor TReferences.Destroy;
begin
  FreeAndNil(FSupBooks);
  FreeAndNil(FExternRefs);
  inherited;
end;

function TReferences.GetSheet(const SheetRef: word): integer;
begin
  if (SheetRef>=FExternRefs.Count) then raise
    Exception.CreateFmt(ErrIndexOutBounds, [SheetRef,'Sheet Reference',0,FExternRefs.Count]);
  if (FExternRefs[SheetRef].SupBookRecord = LocalSupBook) and
     (FExternRefs[SheetRef].FirstSheet = FExternRefs[SheetRef].LastSheet) then

    Result:=FExternRefs[SheetRef].FirstSheet else Result:=-1;
end;

function TReferences.GetSheetName(const SheetRef: word; const Globals: TObject): widestring;
var
  idx: integer;
  Sh1: string;
  Ld: integer;
begin
  if (SheetRef>=FExternRefs.Count) then raise
    Exception.CreateFmt(ErrIndexOutBounds, [SheetRef,'Sheet Reference',0,FExternRefs.Count]);
  idx:=FExternRefs[SheetRef].SupBookRecord;
  Sh1:=FSupBooks[idx].SheetName(FExternRefs[SheetRef].FirstSheet, Globals);
  if FExternRefs[SheetRef].FirstSheet<>FExternRefs[SheetRef].LastSheet then
    Sh1:=Sh1+fmRangeSep+FSupBooks[idx].SheetName(FExternRefs[SheetRef].LastSheet, Globals);
  if idx = LocalSupBook then Result:='' else
  begin
    Result:= FSupBooks[idx].BookName;
    if Sh1<>'' then
    begin
      Ld:= LastDelimiter('\:',Result);
      if Ld>0 then Insert(fmWorkbookOpen, Result, Ld+1) else Result:=fmWorkbookOpen+Result;
      Result:=Result+fmWorkbookClose;
    end;
  end;
  Result:=Result+Sh1;
  if Result<>'' then Result:=''''+Result+''''+fmExternalRef;
end;

procedure TReferences.InsertSheets(const BeforeSheet, SheetCount: integer);
begin
  FExternRefs.InsertSheets(BeforeSheet, SheetCount, LocalSupBook);
  if LocalSupBook>=0 then FSupBooks[LocalSupBook].InsertSheets(SheetCount);
end;

procedure TReferences.SaveToStream(const DataStream: TStream);
begin
  FSupBooks.SaveToStream(DataStream);
  FExternRefs.SaveToStream(DataStream);
end;

function TReferences.SetSheet(const Sheet: word): integer;
var
  i:integer;
begin
  for i:=0 to FExternRefs.Count-1 do
    if (FExternRefs[i].SupBookRecord = LocalSupBook) and
       (FExternRefs[i].FirstSheet = FExternRefs[i].LastSheet) and
       (FExternRefs[i].FirstSheet = Sheet) then
       begin
         Result:=i;
         exit;
       end;

  //Ref doesnt exits...
  FExternRefs.Add(TExternRef.Create(LocalSupBook, Sheet, Sheet));
  Result:=FExternRefs.Count-1;

end;

function TReferences.TotalSize: int64;
begin
  Result:= FSupBooks.TotalSize+ FExternRefs.TotalSize;
end;

{ TExternRef }

constructor TExternRef.Create(const aSupBookRecord, aFirstSheet, aLastSheet: word);
begin
  SupBookRecord:=aSupBookRecord;
  FirstSheet:=aFirstSheet;
  LastSheet:=aLastSheet;
end;

procedure TExternRef.SaveToStream(const DataStream: TStream);
begin
  DataStream.Write(SupBookRecord, SizeOf(SupBookRecord));
  DataStream.Write(FirstSheet, SizeOf(FirstSheet));
  DataStream.Write(LastSheet, SizeOf(LastSheet));
end;

{ TSupBookRecord }

function DecodeFileName(const s: widestring): widestring;
var
  i,k: integer;
begin
  Result:=s; k:=0;
  for i:=1 to Length(s) do
  begin
    if s[i]=#1 then
      if Result[i+k+1]='@' then
      begin
        Result[i+k]:='\';
        Result[i+k+1]:='\';
      end else
      begin
        Result[i+k]:=Result[i+k+1];
        Result[i+k+1]:=':';
        Result[i+k+2]:='\';
        inc(k);
      end else
    if s[i]=#2 then
    begin
      Result[i+k]:='\';
    end else
    if s[i]=#3 then
    begin
      Result[i+k]:='\';
    end else
    if s[i]=#4 then
    begin
      Result[i+k]:='\';
      insert('.',Result, i+k);
      insert('.',Result, i+k);
      inc(k,2);
    end
  end;
end;

function TSupBookRecord.BookName: widestring;
var
  Xs: TExcelString;
  MySelf: TBaseRecord;
  MyPos: integer;
begin
  MySelf:=Self;
  MyPos:=2;
  Xs:=TExcelString.Create(2, MySelf, MyPos);
  try
    Result:=Xs.Value;
    if Length(Result)>0 then
    begin
      if Result[1]=#0 then Result:='' else
      if Result[1]=#1 then Result:=DecodeFileName(copy(Result,2,Length(Result))) else
      if Result[1]=#2 then Result:='';
    end;
  finally
    FreeAndNil(Xs);
  end; //finally
end;

procedure TSupBookRecord.InsertSheets(const SheetCount: word);
begin
  if not IsLocal then raise Exception.Create(ErrExcelInvalid);
  IncWord(Data, 0, SheetCount, MaxSheets);
end;

function TSupBookRecord.IsLocal: boolean;
begin
  IsLocal:= (DataSize = 4)and (GetWord (Data, 2)= $0401);
end;

function TSupBookRecord.SheetName(const SheetIndex: integer; const Globals: TObject): widestring;
var
  n: integer;
  i, tpos: integer;
  Xs: TExcelString;
  MySelf: TBaseRecord;
begin
  n:=GetWord(Data, 0);
  if (SheetIndex<0) or (SheetIndex>=n) then  //this might happen... on range references to another workbook
  begin
    Result:='';
    exit;
  end;

  if GetWord(Data,2)= $0401 then //current sheet
  begin
    Result:=(Globals as TWorkbookGlobals).SheetName[SheetIndex];
    exit;
  end;
  //A little slow... but it shouldn't be called much.
  //I don't think it justifies a cache.
  MySelf:=Self;
  tPos:=2;
  for i:=0 to SheetIndex do   //0 stands for the first unicode string, the book name.
  begin
    Xs:=TExcelString.Create(2, MySelf, tPos);
    try
    finally
      FreeAndNil(Xs);
    end; //finally
  end;

  Xs:=TExcelString.Create(2, MySelf, tPos);
  try
    Result:=Xs.Value;
  finally
    FreeAndNil(Xs);
  end; //finally
end;

end.
