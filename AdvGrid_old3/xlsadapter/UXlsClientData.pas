unit UXlsClientData;

interface
uses Classes, SysUtils, UXlsBaseRecords, UXlsBaseRecordLists, UXlsOtherRecords, UXlsChart,
     UXlsSST, XlsMessages, UXlsSheet, UXlsBaseClientData;
type
  TMsObj = class(TBaseClientData)
  private
    FObjRecord: TObjRecord;
    FChart: TChart;
    HasPictFmla: boolean;
  protected
    function GetId: Word; override;
    procedure SetId(const Value: Word); override;
    procedure ScanRecord( myRecord: TBaseRecord);
  public
    procedure  ArrangeId(var MaxId: word);override;

    constructor Create;
    constructor CreateEmptyImg(var MaxId: word);
    constructor CreateEmptyNote(var MaxId: word; const Dummy: integer=1);
    destructor Destroy; override;
    procedure Clear; override;
    function CopyTo: TBaseClientData; override;
    procedure LoadFromStream(const DataStream: TStream; const First: TBaseRecord; const SST: TSST); override;
    procedure SaveToStream(const DataStream: TStream); override;
    function TotalSize: int64;override;

    procedure ArrangeCopyRows(const RowOfs: integer);override;
    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);override;
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);override;

    class function ObjRecord: ClassOfTBaseRecord; override;

  end;

  TTXO= class (TBaseClientData)
  private
    FTXO: TTXORecord;
    function GetValue: WideString;
    procedure SetValue(const aValue: WideString);
  public
    constructor Create;
    constructor CreateFromData(const Dummy: integer=1);
    destructor Destroy; override;
    procedure Clear; override;
    function CopyTo: TBaseClientData; override;
    procedure LoadFromStream(const DataStream: TStream; const First: TBaseRecord; const SST: TSST); override;
    procedure SaveToStream(const DataStream: TStream); override;
    function TotalSize: int64;override;

    procedure ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);override;
    procedure ArrangeCopySheet(const SheetInfo: TSheetInfo);override;
    class function ObjRecord: ClassOfTBaseRecord; override;

    property Value: WideString read GetValue write SetValue;
  end;

implementation

{ TMsObj }

procedure TMsObj.Clear;
begin
  FreeAndNil(FObjRecord);
  FreeAndNil(FChart);
  FreeAndNil(RemainingData);
end;

function TMsObj.CopyTo: TBaseClientData;
begin
  if HasPictFmla then Raise Exception.Create(ErrCantCopyPictFmla);
  Result:= TMsObj.Create;
  (Result as TMsObj).FObjRecord:= FObjRecord.CopyTo as TObjRecord;
  if FChart<>nil then (Result as TMsObj).FChart:= FChart.CopyTo as TChart;
end;

constructor TMsObj.Create;
begin
  inherited;
end;

destructor TMsObj.Destroy;
begin
  Clear;
  inherited;
end;

procedure TMsObj.ArrangeCopyRows(const RowOfs: integer);
begin
  if FChart<>nil then FChart.ArrangeCopyRows(RowOfs);
end;

procedure TMsObj.ArrangeInsert(const aPos, aCount: integer; const SheetInfo: TSheetInfo);
begin
  if FChart<>nil then FChart.ArrangeInsert(aPos, aCount, SheetInfo);
end;

procedure TMsObj.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  if FChart<>nil then FChart.ArrangeCopySheet(SheetInfo);
end;


procedure TMsObj.LoadFromStream(const DataStream: TStream; const First: TBaseRecord; const SST: TSST);
var
  RecordHeader: TRecordHeader;
  R: TBaseRecord;
begin
  Clear;
  if ((First as TObjRecord).ObjId= ftCmo) and ((First as TObjRecord).CmoId = xlCmo_Chart) then
  begin
    if (DataStream.Read(RecordHeader, sizeof(RecordHeader)) <> sizeof(RecordHeader)) then
       raise Exception.Create(ErrExcelInvalid);
    R:=LoadRecord(DataStream, RecordHeader);
    try
      if not(R is TBOFRecord) then raise Exception.Create(ErrExcelInvalid);
      FChart:= TChart.Create(nil);
      try
        FChart.LoadFromStream(DataStream, R as TBOFRecord, SST);
      except
        FreeAndNil(FChart);
        raise
      end; //except
    except
      FreeAndNil(R);
      raise
    end; //Except
  end;

  ScanRecord(First);

  //this must be the last statment, so if there is an exception, we dont take First
  FObjRecord:= First as TObjRecord;

end;

procedure TMsObj.SaveToStream(const DataStream: TStream);
begin
  if FObjRecord=nil then raise Exception.Create(ErrExcelInvalid);
  FObjRecord.SaveToStream(DataStream);
  if FChart<>nil then FChart.SaveToStream(DataStream);
end;

function TMsObj.TotalSize: int64;
begin
  if FObjRecord=nil then raise Exception.Create(ErrExcelInvalid);
  Result:=FObjRecord.TotalSize;
  if FChart<>nil then Result:=Result+FChart.TotalSize;
end;



class function TMsObj.ObjRecord: ClassOfTBaseRecord;
begin
  Result:= TObjRecord;
end;

function TMsObj.GetId: Word;
begin
  if FObjRecord<>nil then GetId:=GetWord( FObjRecord.Data, 6) else GetId:=0;
end;

procedure TMsObj.SetId(const Value: Word);
begin
  if FObjRecord<>nil then SetWord( FObjRecord.Data, 6, Value);
end;

procedure TMsObj.ArrangeId(var MaxId: word);
begin
  inherited;
  inc(MaxId);
  Id:=MaxId;
end;

procedure TMsObj.ScanRecord( myRecord: TBaseRecord);
var
  RHeader: TRecordHeader;
  aPos: integer;
begin
  aPos:=0;
  repeat
    ReadMem(myRecord, aPos, SizeOf(RHeader), @RHeader);
    if RHeader.Id= 9 then HasPictFmla:=true;
    if (Rheader.Size+aPos>myRecord.DataSize) then //This shouldn't be really necessary, but Obj records sometimes don't count right. So, we have to ensure all is in the same Obj record. I assume there are no continues here.
    begin
      //Longer than expected???
      RemainingData:=myRecord.Continue;
      MyRecord.Continue:=nil;
      exit;
    end;

    try
      ReadMem(myRecord, aPos, RHeader.Size, nil);
    except
      //Longer than expected???
      RemainingData:=nil;
      exit;
    end;

  until RHeader.Id=0; // ftEnd
  RemainingData:=myRecord.Continue;
  myRecord.Continue:=nil;
end;

const
  EmptyMsObjImg: array[0..37] of byte=
    ($15, $00, $12, $00, $08, $00, $01, $00, $11, $60, $00, $00, $00, $00, //Note that here ObjId=1. This has to be changed later on code
     $00, $00, $00, $00, $00, $00, $00, $00, // ftCmo
     $07, $00, $02, $00, $FF, $FF, //ftCf
     $08, $00, $02 ,$00 ,$01, //ftPioGrbit
     $00, $00, $00, $00, $00); //ftEnd

  EmptyMsObjNote: array[0..51] of byte=
    ($15, $00, $12, $00, $19, $00, $01, $00, $11, $40, $00, $00, $00, $00, //Note that here ObjId=1. This has to be changed later on code
     $00, $00, $00, $00, $00, $00, $00, $00, // ftCmo
     $0D, $00, $16, $00,
     $00, $12, $23, $8C, $6C, $50, $8B, $4D, $A8, $C5, $7B, $64, $FF, $A8, $C5,
     $A3, $00, $00, $10, $00, $00,  //ftNts
     $00, $00, $00, $00, $00); //ftEnd


constructor TMsObj.CreateEmptyImg(var MaxId: word);
var
  MyData: PArrayOfByte;
  MyDataSize: integer;
begin
  Create;
  MyDataSize:=SizeOf(EmptyMsObjImg);
  GetMem(MyData, MyDataSize);
  try
    Move(EmptyMsObjImg, MyData^, MyDataSize);
    FObjRecord:=TObjRecord.Create(xlr_OBJ, MyData, MyDataSize);
    ArrangeId(MaxId);
  except
    FreeAndNil(MyData);
    raise;
  end; //Except
end;

constructor TMsObj.CreateEmptyNote(var MaxId: word; const Dummy: integer=1);
var
  MyData: PArrayOfByte;
  MyDataSize: integer;
begin
  Create;
  MyDataSize:=SizeOf(EmptyMsObjNote);
  GetMem(MyData, MyDataSize);
  try
    Move(EmptyMsObjNote, MyData^, MyDataSize);
    FObjRecord:=TObjRecord.Create(xlr_OBJ, MyData, MyDataSize);
    ArrangeId(MaxId);
  except
    FreeAndNil(MyData);
    raise;
  end; //Except
end;

{ TTXO }

procedure TTXO.ArrangeCopySheet(const SheetInfo: TSheetInfo);
begin
  //nothing
end;

procedure TTXO.ArrangeInsert(const aPos, aCount: integer;
  const SheetInfo: TSheetInfo);
begin
end;

procedure TTXO.Clear;
begin
  FreeAndNil(FTXO);
end;

function TTXO.CopyTo: TBaseClientData;
begin
  Result:= TTXO.Create;
  if FTXO <>nil then (Result as TTXO).FTXO:= FTXO.CopyTo as TTXORecord;
end;

constructor TTXO.Create;
begin
  inherited;
end;

constructor TTXO.CreateFromData(const Dummy: integer=1);
begin
  Create;
  FTXO:=TTXORecord.CreateFromData;
  //No need for continue recods
end;

destructor TTXO.Destroy;
begin
  Clear;
  inherited;
end;

function TTXO.GetValue: WideString;
var
  Len: integer;
  s: string;
  ws:Widestring;
  TxtRec: TBaseRecord;
  aPos: integer;
begin
  Result:='';
  if FTXO.Continue=nil then exit;
  Len:= GetWord(FTXO.Data, 10);
  if Len=0 then exit;

  TxtRec:=FTXO.Continue; aPos:=1;
  case FTXO.Continue.Data[0] of
    0:  //single byte string
    begin
      SetLength(s, Len);
      ReadMem(TxtRec, aPos, Len, @(s[1]));
      Result:=s;
    end;
    1:  //double byte string
    begin
      SetLength(Ws, Len);
      ReadMem(TxtRec, aPos, Len*2, @(ws[1]));
      Result:=Ws;
    end;
    else Raise Exception.Create(ErrExcelInvalid);
  end; //case
end;

procedure TTXO.LoadFromStream(const DataStream: TStream;
  const First: TBaseRecord; const SST: TSST);
begin
  FTXO:=First as TTXORecord;
end;

class function TTXO.ObjRecord: ClassOfTBaseRecord;
begin
  Result:= TTXORecord;
end;

procedure TTXO.SaveToStream(const DataStream: TStream);
begin
  if FTXO<>nil then FTXO.SaveToStream(DataStream);
end;

procedure TTXO.SetValue(const aValue: WideString);
var
  Len: integer;
  Dat: PArrayOfByte;
  s:string;
begin
  Len:=Length(aValue);
  SetWord(FTXO.Data, 10, Len); //length of text
  if Len>0 then SetWord(FTXO.Data, 12, 16) else SetWord(FTXO.Data, 12, 0); //length of formatting runs
  FreeAndNil(FTXO.Continue);
  if Len>0 then
  begin
    if IsWide(aValue) then
      begin
        GetMem(Dat, Len*2+1);
        Dat[0]:=1;
        move(aValue[1], Dat[1], Len*2);
        FTXO.Continue:=TContinueRecord.Create(xlr_CONTINUE, Dat, Len*2+1);
      end else
      begin
        GetMem(Dat, Len+1);
        Dat[0]:=0;
        s:=aValue;
        move(s[1], Dat[1], Len);
        FTXO.Continue:=TContinueRecord.Create(xlr_CONTINUE, Dat, Len+1);
      end;

      Len:= 2*8;
      GetMem(Dat, Len);
      FillChar(Dat^, Len, 0);
      SetWord(Dat, 8, Length(aValue));

      FTXO.Continue.Continue:= TContinueRecord.Create(xlr_CONTINUE, Dat, Len);
  end;

end;

function TTXO.TotalSize: int64;
begin
  Result:= FTXO.TotalSize;
end;

end.
