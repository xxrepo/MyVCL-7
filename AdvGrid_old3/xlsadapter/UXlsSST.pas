{$B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
unit UXlsSST;
//This is a unit to optimize the SST for a big number of strings.
//Optimizations:
  //We use records, no objects to store the strings (4 bytes of VMT per string and avoid calling create/destroy)
  //We don't use Widestrings or Strings to store them (8+6 bytes / string and avoid double allocation, one for the record and one for the string)
  //PENDING: Hash array to locate strings

interface
uses SysUtils, XlsMessages, UXlsBaseRecords,
     UXlsOtherRecords, UXlsStrings, Classes;
type
  TExtraData=Packed Record
    Refs: word;
    AbsStreamPos: Cardinal;
    RecordStreamPos: Word;
    PosInTable:Cardinal;
  end;

  PExtraData=^TExtraData;

  TiSSTEntry   = integer;  //offset to the array
  PiSSTEntry   = PArrayOfByte;  //Pointer to intenal calcs. Neve store it, because MemData.Buffer can be realocated

  TMemSST=record
     UsedSize: integer;
     Buffer: Array of Byte;
  end;

  TSST = class (TList)
    {$INCLUDE TiSSTHdr.inc}
  private
    MemSST: TMemSST;
    procedure QuickSort(L, R: Integer);
  public
    constructor Create;
    function Find(const s:PiSSTEntry; var Index: integer): boolean;
    procedure Load(const aSSTRecord: TSSTRecord);
    procedure SaveToStream(const DataStream: TStream);
    procedure WriteExtSST(const DataStream: TStream);
    function AddString(const s:Widestring):integer;
    procedure Sort;
    function TotalSize: int64;
    function SSTRecordSize: int64;
    function ExtSSTRecordSize: int64;
    procedure FixRefs;

    function GetEntry(const aEntry: TiSSTEntry): PiSSTEntry;
  private
    procedure CalcNextContinue(const First: integer; var Last: integer;
      var RecordSize: word);
  end;

  TLabelSSTRecord= class(TCellRecord)
  private
    pSSTEntry: TiSSTEntry;
    SST: TSST;
    function GetAsString: WideString;
    procedure SetAsString(const Value: WideString);
  protected
    function GetValue: Variant; override;
    procedure SetValue(const Value: Variant); override;
    function DoCopyTo: TBaseRecord; override;
  public
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
    constructor CreateFromData(const aRow, aCol, aXF: word; const aSST: TSST);

    procedure AttachToSST(const aSST: TSST);
    procedure SaveToStream(const Workbook: TStream); override;

    destructor Destroy;override;

    property AsString: WideString read GetAsString write SetAsString;
  end;

  TLabelRecord=class(TCellRecord)
    function GetValue: Variant; override;
    //We dont implement writing to a label. All writing should o to a LabelSST
  end;

implementation
{$INCLUDE TiSSTImp.inc}

const
  MemSSTDeltaSize=8096*1024; {4M}

procedure CreateSSTEntryFromString(var MemSST: TMemSST; const s: wideString; var Entry: TiSSTEntry);
var
  OptionFlags: byte;
  Lb, OldSize: integer;
  pEntry: PArrayOfByte;
begin
  if IsWide(s) then OptionFlags:=1 else OptionFlags:=0;

{  GetMem(Entry, SizeOf(TExtraData)+ //Extra data not to be saved
                SizeOf(Word) + // String Length
                SizeOf(byte) + // OptionsFlag
                Length(s)*(1+OptionFlags));
}
  OldSize:=MemSST.UsedSize;
  inc( MemSST.UsedSize, SizeOf(TExtraData)+ //Extra data not to be saved
                        SizeOf(Word) + // String Length
                        SizeOf(byte) + // OptionsFlag
                        Length(s)*(1+OptionFlags));

  Lb:=Length(MemSST.Buffer);
  if MemSST.UsedSize>=Lb then
    SetLength(MemSST.Buffer, Lb+ MemSSTDeltaSize); //A string can't be longer than 8192 bytes;

  Entry:=OldSize;
  pEntry:=@MemSST.Buffer[Entry];
  PExtraData(pEntry).Refs:=0;
  PExtraData(pEntry).AbsStreamPos:=0;
  PExtraData(pEntry).RecordStreamPos:=0;
  PExtraData(pEntry).PosInTable:=0;

  SetWord(pEntry, SizeOf(TExtraData), Length(s));
  pEntry[2+SizeOf(TExtraData)]:=OptionFlags;
  if OptionFlags= 1 then System.Move(s[1], pEntry^[3+SizeOf(TExtraData)], Length(s)*2)
    else System.Move(WideStringToStringNoCodePage(s)[1], pEntry^[3+SizeOf(TExtraData)], Length(s));
end;

procedure CreateSSTEntryFromRecord(var MemSST: TMemSST; var aSSTRecord: TBaseRecord; var Ofs: integer; var Entry: TiSSTEntry);
var
  Xs: TExcelString;
  Lb, OldSize: integer;
  pEntry: PArrayOfByte;
begin
  Xs:=TExcelString.Create(2, aSSTRecord, Ofs); //Ok, we use TExcelString... This could be done without creating an object, but I don't think there is a difference
                                             // and it's complicated, because it has to handle all continues and char-widechar issues
  try
    {GetMem(Entry, SizeOf(TExtraData)+Xs.TotalSize);}
    OldSize:=MemSST.UsedSize;
    inc( MemSST.UsedSize, SizeOf(TExtraData)+Xs.TotalSize);

    Lb:=Length(MemSST.Buffer);
    if MemSST.UsedSize>=Lb then
      SetLength(MemSST.Buffer, Lb+ MemSSTDeltaSize); //A string can't be longer than 8192 bytes;

    Entry:=OldSize;
    pEntry:=@MemSST.Buffer[OldSize];

    PExtraData(pEntry).Refs:=0;
    PExtraData(pEntry).AbsStreamPos:=0;
    PExtraData(pEntry).RecordStreamPos:=0;
    PExtraData(pEntry).PosInTable:=0;
    Xs.CopyToPtr(pEntry, SizeOf(TExtraData));
  finally
    FreeAndNil(Xs);
  end;

end;

function SSTLength(const S: PiSSTEntry): int64;
var
  OptionFlags: byte;
  Ofs: integer;
begin
    Ofs:=0;
    OptionFlags:=S[2+SizeOf(TExtraData)];
    Result:=SizeOf(TExtraData)+
            2+ //Length
            SizeOf(OptionFlags);
    if OptionFlags and $1 = 0 then Result:=Result+GetWord(S, SizeOf(TExtraData))
        else Result:= Result+GetWord(S, SizeOf(TExtraData))*2;

    //Rich text
    if OptionFlags and $8 = $8 {HasRichText} then
    begin
      Result:=Result + 2+ 4* GetWord(S,3+SizeOf(TExtraData));
      Ofs:=2;
    end;

    //FarEast
    if OptionFlags and $4 = $4 {HasFarInfo} then
      Result:=Result+ 4 + GetCardinal(S, 3+SizeOf(TExtraData)+Ofs);
end;

function SSTRealLength(const S: PiSSTEntry): int64;
begin
  Result:=SSTLength(S)-SizeOf(TExtraData);
end;
function CompareSSTEntry(const S1, S2: PiSSTEntry): integer;
var
  i:integer;
  L1, L2: integer;
begin
  Result:=0;
  L1:= SSTLength(S1);
  L2:= SSTLength(S2);
  if L1<L2 then Result:=-1 else if L1>L2 then Result:=1
  else
  for i:=SizeOf(TExtraData) to L1-1 do
  begin
    if S1[i]=S2[i] then continue
    else if S1[i]<S2[i] then Result:=-1 else Result:=1;
    exit;
  end;
end;

function CompareSSTEntries(Item1, Item2: Pointer): Integer;
begin
  CompareSSTEntries:= CompareSSTEntry(PiSSTEntry(Item1),PiSSTEntry(Item2));
end;


procedure AddSSTRef(const Entry: PiSSTEntry);
begin
  Inc(PExtraData(Entry).Refs);
end;

procedure DecSSTRef(const Entry: PiSSTEntry);
begin
  Dec(PExtraData(Entry).Refs);
end;

function SSTRefs(const Entry: PiSSTEntry): word;
begin
  Result:=PExtraData(Entry).Refs;
end;

procedure SaveSSTToStream(const Entry: PiSSTEntry; const DataStream: TStream; const BeginRecordPos: Cardinal);
begin
  PExtraData(Entry).AbsStreamPos:=DataStream.Position;
  PExtraData(Entry).RecordStreamPos:= PExtraData(Entry).AbsStreamPos- BeginRecordPos;
  DataStream.Write((PChar(Entry)+SizeOf(TExtraData))^, SSTRealLength(Entry));
end;

function GetSSTValue(const Entry: PiSSTEntry): widestring;
var
  OptionFlags: byte;
  Ini: integer;
  St: string;
begin
    OptionFlags:=Entry[2+SizeOf(TExtraData)];
    Ini:=SizeOf(TExtraData)+
            2+ //Length
            SizeOf(OptionFlags);
    //Rich text
    if OptionFlags and $8 = $8 {HasRichText} then
      Inc(Ini, 2);

    //FarEast
    if OptionFlags and $4 = $4 {HasFarInfo} then
      Inc(Ini, 4);

    if OptionFlags and $1 = 0 then
    begin
      SetLength(St, GetWord(Entry, SizeOf(TExtraData)));
      Move(Entry[Ini], St[1], Length(St));
      Result:=StringToWideStringNoCodePage(St);
      exit;
    end else
    begin
      SetLength(Result, GetWord(Entry, SizeOf(TExtraData)));
      Move(Entry[Ini], Result[1], Length(Result)*2);
    end;

end;

//**************************************************************
{ TSST }
function TSST.AddString(const s: Widestring): integer;
var
  es: TiSSTEntry;
  pEs: PiSSTEntry;
  LastMem: integer;
begin
  LastMem:=MemSST.UsedSize;
  CreateSSTEntryFromString(MemSST, s, es);
  try
    pEs:=@MemSST.Buffer[es];
    if Find(pEs, Result) then
    begin
      AddSSTRef(@MemSST.Buffer[Items[Result]]);
      MemSST.UsedSize:=LastMem; //No need to add space.
    end else
    begin
      Insert(Result, es);
      AddSSTRef(pEs);
      //es:=nil;  //so we dont free it
    end;
  finally
    //No need to free. if es<>nil then Freemem(es);
  end;
end;

function TSST.Find(const S: PiSSTEntry; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := Count - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := CompareSSTEntry(@MemSST.Buffer[Items[I]],S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        L := I;
      end;
    end;
  end;
  Index := L;
end;

procedure TSST.Load(const aSSTRecord: TSSTRecord);
var
  i, Ofs:integer;
  Es: TiSSTEntry;
  TmpSSTRecord: TBaseRecord;
begin
  Ofs:=8;
  TmpSSTRecord:= aSSTRecord;
  for i:=0 to aSSTRecord.Count-1 do
  begin
    CreateSSTEntryFromRecord(MemSST, TmpSSTRecord, Ofs, Es);
    try
      Add(Es);
      //Es:=nil;
    finally
      //No need to free. if es<>nil then Freemem(Es);
    end; //Finally
  end;
  //We can't sort now, this should be done after all the LABELSST records have been loaded
end;

procedure TSST.FixRefs;
var
  i: integer;
begin
  for i:=count-1 downto 0 do
    if SSTRefs(@MemSST.Buffer[Items[i]])<=0 then Delete(i);
end;

procedure TSST.SaveToStream(const DataStream: TStream);
var
  i:integer;
  TotalRefs, aCount: Cardinal;
  RecordHeader: TRecordHeader;
  BeginRecordPos: Cardinal;
  First, Last: integer;
  Se: PiSSTEntry;
begin
  BeginRecordPos:=DataStream.Position;
  RecordHeader.Id:= xlr_SST;

  //Renum the items
  i:=0; TotalRefs:=0;
  while i< Count do
  begin
    Se:=@MemSST.Buffer[Items[i]];
    Assert(SSTRefs(Se)>0,'Refs should be >0');
    PExtraData(Se).PosInTable:=i;
    TotalRefs:=TotalRefs+Cardinal(SSTRefs(Se));
    inc(i);
   end;


  First:=0;
  RecordHeader.Size:=8;
  CalcNextContinue(First, Last, RecordHeader.Size);

  DataStream.Write(RecordHeader, SizeOf(RecordHeader));
  DataStream.Write(TotalRefs, SizeOf(TotalRefs));
  aCount:=Count;
  DataStream.Write(aCount, Sizeof(aCount));

  while First<Count do
  begin
    for i:= First to Last-1 do
    begin
      SaveSSTToStream(@MemSST.Buffer[Items[i]], DataStream, BeginRecordPos);
    end;

    //Write continue
    First:=Last;
    if First<Count then
    begin
      BeginRecordPos:= DataStream.Position;
      RecordHeader.Id:= xlr_CONTINUE;
      RecordHeader.Size:=0;
      CalcNextContinue(First, Last, RecordHeader.Size);
      DataStream.Write(RecordHeader, SizeOf(RecordHeader));
    end;
  end;

  WriteExtSST(DataStream);
end;

procedure TSST.WriteExtSST(const DataStream: TStream);
var
  n, nBuckets, Dummy: Word;
  i: integer;
  RecordHeader: TRecordHeader;
begin
  // Calc number of strings per hash bucket
  n:=Count div 128+1;
  if n<8 then n:=8;

  if Count=0 then nBuckets:=0 else nBuckets:= (Count-1) div n + 1;

  RecordHeader.Id:= xlr_EXTSST;
  RecordHeader.Size:= 2+8*nBuckets;
  DataStream.Write(RecordHeader, SizeOf(RecordHeader));
  DataStream.Write(n, SizeOf(n));
  i:= 0; Dummy:=0;
  while i<Count do
  begin
    DataStream.Write(PExtraData(@MemSST.Buffer[Items[i]]).AbsStreamPos, SizeOf(PExtraData(nil).AbsStreamPos));
    DataStream.Write(PExtraData(@MemSST.Buffer[Items[i]]).RecordStreamPos, SizeOf(PExtraData(nil).RecordStreamPos));
    DataStream.Write(Dummy, SizeOf(Dummy));
    inc(i,n);
  end;

end;


procedure TSST.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P, T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := @MemSST.Buffer[Items[(L + R) shr 1]];
    repeat
      while CompareSSTEntries(@MemSST.Buffer[Items[I]], P) < 0 do
        Inc(I);
      while CompareSSTEntries(@MemSST.Buffer[Items[J]], P) > 0 do
        Dec(J);
      if I <= J then
      begin
        T := inherited Items[I];
        inherited Items[I] := inherited Items[J];
        inherited Items[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TSST.Sort;
begin
  if (Count > 0) then
    QuickSort(0, Count - 1);
end;

function TSST.ExtSSTRecordSize: int64;
var
  n, nBuckets: word;
begin
  n:=Count div 128+1;
  if n<8 then n:=8;

  if Count=0 then nBuckets:=0 else nBuckets:= (Count-1) div n + 1;
  Result:= 2+8*nBuckets;
end;

function TSST.SSTRecordSize: int64;
//Has to handle continue records
var
  First, Last: integer;
  Rs: Word;
begin
  Result:=8;
  Rs:=0;
  First:=0;
  while First<Count do
  begin
    CalcNextContinue(First,Last, Rs);
    First:=Last;
    Result:=Result+Rs;
    if Last< Count then Result:=Result+SizeOf(TRecordHeader);
    Rs:=0;
  end;
end;


function TSST.TotalSize: int64;
begin
  Result:= SSTRecordSize + ExtSSTRecordSize + 2* SizeOf(TRecordHeader);
end;

procedure TSST.CalcNextContinue(const First: integer; var Last: integer; var RecordSize: word);
var
 RSize: integer;
begin
  Last:=First;
  if Last<Count then RSize:=SSTRealLength(@MemSST.Buffer[Items[Last]]) else RSize:=0;
  while (Last<Count) and (RecordSize+ RSize< MaxRecordDataSize) do
  begin
    inc(RecordSize, RSize);
    inc(Last);
    if Last<Count then RSize:=SSTRealLength(@MemSST.Buffer[Items[Last]]);
  end;
  if (First=Last) and (Last<Count) then raise Exception.Create(ErrStringTooLarge);
end;

constructor TSST.Create;
begin
  inherited;
  MemSST.UsedSize:=0;
  SetLength(MemSST.Buffer, MemSSTDeltaSize);
end;

function TSST.GetEntry(const aEntry: TiSSTEntry): PiSSTEntry;
begin
  Result:=@MemSST.Buffer[aEntry];
end;

{ TLabelSSTRecord }

constructor TLabelSSTRecord.Create(const aId: word;
  const aData: PArrayOfByte; const aDataSize: integer);
begin
  inherited Create(aId, aData, aDataSize);
end;

procedure TLabelSSTRecord.AttachToSST(const aSST: TSST);
var
  a:int64;
begin
  SST:=aSST;
  a:=GetCardinal(Data,6);
  if a> SST.Count then raise Exception.Create(ErrExcelInvalid);
  pSSTEntry:= SST[a];
  AddSSTRef(SST.GetEntry(pSSTEntry));
end;

destructor TLabelSSTRecord.Destroy;
begin
  if pSSTEntry>=0 then DecSSTRef(SST.GetEntry(pSSTEntry));
  inherited;
end;

procedure TLabelSSTRecord.SaveToStream(const Workbook: TStream);
begin
  SetCardinal(Data, 6, PExtraData(SST.GetEntry(pSSTEntry)).PosInTable);
  inherited;
end;

function TLabelSSTRecord.DoCopyTo: TBaseRecord;
begin
  Result:= inherited DoCopyTo;
  (Result as TLabelSSTRecord).SST:= SST;
  (Result as TLabelSSTRecord).pSSTEntry:= pSSTEntry;
  AddSSTRef(SST.GetEntry((Result as TLabelSSTRecord).pSSTEntry));

end;

function TLabelSSTRecord.GetValue: Variant;
begin
  Result:=GetAsString;
end;

procedure TLabelSSTRecord.SetValue(const Value: Variant);
begin
  SetAsString(Value);
end;

function TLabelSSTRecord.GetAsString: WideString;
begin
  Result:=GetSSTValue(SST.GetEntry(pSSTEntry));
end;

procedure TLabelSSTRecord.SetAsString(const Value: WideString);
var
  OldpSSTEntry: TiSSTEntry;
begin
  OldpSSTEntry:=pSSTEntry;
  pSSTEntry:= SST[SST.AddString(Value)];
  if OldpSSTEntry>=0 then DecSSTRef(SST.GetEntry(OldpSSTEntry));
end;

constructor TLabelSSTRecord.CreateFromData(const aRow, aCol, aXF: word; const aSST: TSST);
begin
  inherited CreateFromData(xlr_LABELSST, 10, aRow, aCol, aXF);
  SST:=aSST;
  pSSTEntry:=-1;
end;


{ TLabelRecord }

function TLabelRecord.GetValue: Variant;
var
  XS: TExcelString;
  MySelf: TBaseRecord;
  MyOfs: integer;
begin
  MySelf:=Self;
  MyOfs:=6;
  XS:=TExcelString.Create(2, Myself, MyOfs);
  try
    Result:= XS.Value;
  finally
    FreeAndNil(XS);
  end;
end;

end.
