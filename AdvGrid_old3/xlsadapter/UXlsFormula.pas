unit UXlsFormula;

interface
uses
  {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} variants,{$IFEND}{$ENDIF} //Delphi 6 or above
  Classes, SysUtils, UXlsBaseRecords, XlsMessages, UXlsTokenArray;

type
  TTableRecord = class(TBaseRecord)
  public
    procedure ArrangeInsert(const aPos, aCount:integer);
    procedure ArrangeCopy(const DeltaRow: integer);
  end;

  TArrayRecord=class(TBaseRecord)
  public
    procedure ArrangeInsert(const aPos, aCount:integer);
    procedure ArrangeCopy(const DeltaRow: integer);
  end;

  TFormulaRecord = class(TCellRecord)
  private
    FormulaValue: variant;
    FTableRecord: TTableRecord;
    FArrayRecord: TArrayRecord;

    procedure ArrangeTokensInsertRows(const InsPos, InsOffset, CopyOffset: integer; const SheetInfo: TSheetInfo);
    procedure ArrangeSharedTokens;
    procedure SetTableRecord(const Value: TTableRecord);
    procedure SetArrayRecord(const Value: TArrayRecord);
  protected
    function DoCopyTo: TBaseRecord; override;

  public

    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
    constructor CreateFromData(const aId, aDataSize, aRow, aCol, aXF: word);
    destructor Destroy;override;
    procedure ArrangeInsert(const aPos, aCount:integer;  const SheetInfo: TSheetInfo);override;
    procedure ArrangeCopy(const NewRow: Word);override;
    procedure SaveToStream(const Workbook: TStream); override;

    function TotalSize: integer;override;
    function TotalSizeNoHeaders: integer;override;

    property TableRecord: TTableRecord read FTableRecord write SetTableRecord;
    property ArrayRecord: TArrayRecord read FArrayRecord write SetArrayRecord;

    function IsExp(var Key: Cardinal): boolean;
    procedure MixShared(const PData: PArrayOfByte; const aDataSize: integer);
    function GetValue: Variant; override;
    procedure SetFormulaValue(const v: variant);
  end;

  TNameRecord =  class (TBaseRecord)
  private
    procedure ArrangeTokensInsertRows(const InsPos, InsOffset, CopyOffset: integer; const SheetInfo: TSheetInfo);
    function NameLength: byte;
    function NameSize: integer;
    function OptionFlags: byte;
  public
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
    procedure ArrangeInsert(aPos, aCount:integer; const SheetInfo: TSheetInfo);
    procedure ArrangeInsertSheets(const FirstSheet, SheetCount: Word);

    function ArrangeCopySheet(const SheetInfo: TSheetInfo): TNameRecord;

    function RangeSheet: integer;
    function RefersToSheet(const GetSheet:TGetSheet) : integer;
    function Name:Widestring;
    function R1: integer;
    function R2: integer;
    function C1: integer;
    function C2: integer;
  end;

  TShrFmlaRecord=class(TBaseRecord)
  public
    function FirstRow: integer;
    function LastRow: integer;
    function FirstCol: integer;
    function LastCol: integer;
    function Key: Cardinal;
  end;


implementation


{ TFormulaRecord }

procedure TFormulaRecord.ArrangeInsert(const aPos, aCount:integer; const SheetInfo: TSheetInfo);
begin
  inherited;
  ArrangeTokensInsertRows(aPos, aCount, 0, SheetInfo);
  if (FTableRecord<>nil) and (SheetInfo.FormulaSheet=SheetInfo.InsSheet) then FTableRecord.ArrangeInsert(aPos, aCount);
  if (FArrayRecord<>nil) and (SheetInfo.FormulaSheet=SheetInfo.InsSheet) then FArrayRecord.ArrangeInsert(aPos, aCount);
end;

constructor TFormulaRecord.Create(const aId: word;
  const aData: PArrayOfByte; const aDataSize: integer);
var
  d: double;
begin
  inherited;
  ArrayRecord:=nil;
  //Save the formula result
  FormulaValue:=unassigned;
  if GetWord(Data,12)<> $FFFF then //it's a number
  begin
    move(Data[6], d, sizeof(d));
    FormulaValue:=d;
  end else
  begin
    case Data[6] of
      0: FormulaValue:=''; //It's a string. We will fill it later when we read the string record
      1: FormulaValue:=data[8]=1; //boolean
      //2 is error. we can't codify this on a variant.
    end; //case
  end;

  FillChar(Data^[6],8,0); //clear result
  Data^[6]:=2; //error value
  SetWord(Data,12,$FFFF);
  FillChar(Data^[16],4,0); //clear chn

  // For automatic recalc on Excel97...
  Data^[14]:=Data^[14] or 2;
end;

constructor TFormulaRecord.CreateFromData(const aId, aDataSize, aRow, aCol,
  aXF: word);
begin
  inherited;
  FormulaValue:=unassigned;
end;

procedure TFormulaRecord.ArrangeCopy(const NewRow: Word);
const
  SheetInfo: TSheetInfo=(InsSheet:-1;FormulaSheet:-1;GetSheet:nil;SetSheet:nil);
begin
  ArrangeTokensInsertRows( 0, 0, NewRow-Row, SheetInfo); //Sheet info doesn't have meaninig on copy
  if (FTableRecord<>nil) and (SheetInfo.FormulaSheet=SheetInfo.InsSheet) then FTableRecord.ArrangeCopy(NewRow-Row);
  if (FArrayRecord<>nil) and (SheetInfo.FormulaSheet=SheetInfo.InsSheet) then FArrayRecord.ArrangeCopy(NewRow-Row);
  inherited;   //should be last, so we dont modify Row
end;

procedure TFormulaRecord.ArrangeTokensInsertRows(const InsPos, InsOffset,
  CopyOffset: integer; const SheetInfo: TSheetInfo);
begin
  try
    UXlsTokenArray.ArrangeInsertRows(Data, 22, 22+GetWord(Data,20), InsPos, InsOffset, CopyOffset, SheetInfo, true);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadFormula,[ Row+1, Column+1, e.Token]);
    else raise;
  end; //Except
end;

procedure TFormulaRecord.ArrangeSharedTokens;
begin
  try
    UXlsTokenArray.ArrangeSharedFormulas(Data, 22, 22+GetWord(Data,20), Row, Column);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadFormula,[ Row+1, Column+1, e.Token]);
    else raise;
  end; //Except
end;

function TFormulaRecord.IsExp(var Key: Cardinal): boolean;
begin
  Result:= (DataSize=27) and (GetWord(Data,20)=5) and (Data[22]=1);
  if Result then Key:=GetWord(Data,23) or (GetWord(Data,25) shl 16);
end;

procedure TFormulaRecord.MixShared(const PData: PArrayOfByte; const aDataSize: integer);
var
  NewDataSize: integer;
begin
  //Important: This method changes the size of the record without notifying it's parent list
  //It's necessary to adapt the Totalsize in the parent list.
  NewDataSize:=DataSize - 5+ aDataSize-8 ;
  ReallocMem(Data, NewDataSize);
  //Now is safe to change DataSize
  DataSize:=NewDataSize;
  Move(PData[8], Data[20], aDataSize-8);
  ArrangeSharedTokens;
end;

function TFormulaRecord.GetValue: Variant;
begin
  Result:=FormulaValue;
end;

procedure TFormulaRecord.SaveToStream(const Workbook: TStream);
begin
  inherited;
  if FArrayRecord<>nil then FArrayRecord.SaveToStream(Workbook);
  if FTableRecord<>nil then FTableRecord.SaveToStream(Workbook);
end;

procedure TFormulaRecord.SetFormulaValue(const v: variant);
begin
  FormulaValue:=v;
end;

function TFormulaRecord.DoCopyTo: TBaseRecord;
begin
  Result:=inherited DoCopyTo;
  (Result as TFormulaRecord).TableRecord:= (FTableRecord.CopyTo as TTableRecord);
  (Result as TFormulaRecord).ArrayRecord:= (FArrayRecord.CopyTo as TArrayRecord);
end;

function TFormulaRecord.TotalSize: integer;
begin
  Result:=inherited TotalSize;
  if FTableRecord<>nil then inc(Result, FTableRecord.TotalSize);
  if FArrayRecord<>nil then inc(Result, FArrayRecord.TotalSize);
end;

function TFormulaRecord.TotalSizeNoHeaders: integer;
begin
  Result:=inherited TotalSizeNoHeaders;
  if FTableRecord<>nil then inc(Result, FTableRecord.TotalSizeNoHeaders);
  if FArrayRecord<>nil then inc(Result, FArrayRecord.TotalSizeNoHeaders);
end;

destructor TFormulaRecord.Destroy;
begin
  FreeAndNil(FTableRecord);
  FreeAndNil(FArrayRecord);
  inherited;
end;

procedure TFormulaRecord.SetTableRecord(const Value: TTableRecord);
begin
  if FTableRecord<>nil then FreeAndNil(FTableRecord);
  FTableRecord := Value;
end;

procedure TFormulaRecord.SetArrayRecord(const Value: TArrayRecord);
begin
  if FArrayRecord<>nil then FreeAndNil(FArrayRecord);
  FArrayRecord := Value;
end;


{ TNameRecord }

procedure TNameRecord.ArrangeInsertSheets(const FirstSheet, SheetCount: Word);
begin
  if (RangeSheet<>$FFFF) and (RangeSheet>=FirstSheet) then IncWord(Data, 8, SheetCount, MaxSheets+1); //NewSheet is 0 based, Data[8] is one-based;
end;

procedure TNameRecord.ArrangeTokensInsertRows(const InsPos, InsOffset,
  CopyOffset: integer; const SheetInfo: TSheetInfo);
begin
  try
    UXlsTokenArray.ArrangeInsertRows(Data, 14+ NameSize,14+ NameSize+GetWord(Data,4), InsPos, InsOffset, CopyOffset, SheetInfo, true);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadName,[ Name, e.Token]);
    else raise;
  end; //Except
end;

constructor TNameRecord.Create(const aId: word; const aData: PArrayOfByte;
  const aDataSize: integer);
begin
  inherited;

end;

procedure TNameRecord.ArrangeInsert(aPos, aCount: integer; const SheetInfo: TSheetInfo);
begin
  ArrangeTokensInsertRows( aPos, aCount, 0, SheetInfo);
end;

function TNameRecord.Name: Widestring;
var
  s: string;
begin
  if (OptionFlags and 1)=1 then
  begin
    SetLength(Result, NameLength);
    Move(Data[15], Result[1], NameLength*2);
  end else
  begin
    SetLength(s, NameLength);
    Move(Data[15], s[1], NameLength);
    Result:=s;
  end;
end;

function TNameRecord.NameLength: byte;
begin
  Result:= Data[3];
end;

function TNameRecord.NameSize: integer;
begin
  Result:= GetStrLen(false , Data, 14, true, NameLength);
end;

function TNameRecord.OptionFlags: byte;
begin
  OptionFlags:= Data[14];
end;

function TNameRecord.RangeSheet: integer;
begin
  Result:=GetWord(Data,8)-1;
end;

function TNameRecord.ArrangeCopySheet(const SheetInfo: TSheetInfo): TNameRecord;
begin
  try
    UXlsTokenArray.ArrangeInsertSheets(Data, 14+ NameSize,14+ NameSize+GetWord(Data,4), SheetInfo);
  except
    on e: ETokenException do raise Exception.CreateFmt(ErrBadName,[ Name, e.Token]);
    else raise;
  end; //Except

  SetWord(Data, 8, SheetInfo.InsSheet+1); //InsSheet is 0 based, Data[8] is one-based;
  Result:=Self;
end;

function TNameRecord.R1: integer;
begin
  if Data[14+ NameSize] in tk_Area3d then Result:= GetWord(Data, 15+2+NameSize)
  else Result:=-1;
end;

function TNameRecord.R2: integer;
begin
  if Data[14+ NameSize] in tk_Area3d then Result:= GetWord(Data, 15+4+NameSize)
  else Result:=-1;
end;

function TNameRecord.RefersToSheet(const GetSheet:TGetSheet): integer;
begin
  if Data[14+ NameSize] in tk_Area3d then Result:= GetSheet(GetWord(Data, 15+NameSize))
  else Result:=-1;
end;


function TNameRecord.C1: integer;
begin
  if Data[14+ NameSize] in tk_Area3d then Result:= GetWord(Data, 15+6+NameSize)
  else Result:=-1;
end;

function TNameRecord.C2: integer;
begin
  if Data[14+ NameSize] in tk_Area3d then Result:= GetWord(Data, 15+8+NameSize)
  else Result:=-1;
end;


{ TShrFmlaRecord }
function TShrFmlaRecord.FirstRow: integer;
begin
  Result:=GetWord(Data,0);
end;

function TShrFmlaRecord.LastRow: integer;
begin
  Result:=GetWord(Data,2);
end;

function TShrFmlaRecord.FirstCol: integer;
begin
  Result:=Data[4];
end;

function TShrFmlaRecord.LastCol: integer;
begin
  Result:=Data[5];
end;

function TShrFmlaRecord.Key: cardinal;
begin
  Result:=GetWord(Data,0) or Data[4] shl 16;
end;


{ TTableRecord }

procedure TTableRecord.ArrangeCopy(const DeltaRow: integer);
begin
  if (GetWord(Data,0) <>$FFFF) then IncWord(Data, 0, DeltaRow, Max_Rows);
  if (GetWord(Data,2) <>$FFFF) then IncWord(Data, 2, DeltaRow, Max_Rows);

  if (GetWord(Data,8) <>$FFFF) then IncWord(Data, 8, DeltaRow, Max_Rows);
  if (GetWord(Data,12) <>$FFFF) then IncWord(Data, 12, DeltaRow, Max_Rows);
end;

procedure TTableRecord.ArrangeInsert(const aPos, aCount: integer);
begin
  if (GetWord(Data,0) >=aPos)and (GetWord(Data,0) <>$FFFF) then IncWord(Data, 0, aCount, Max_Rows);
  if (GetWord(Data,2) >=aPos)and (GetWord(Data,2) <>$FFFF) then IncWord(Data, 2, aCount, Max_Rows);

  SetWord(Data, 6, GetWord(Data, 6) and 2); // Calc on load...

  if (GetWord(Data,8) >=aPos)and (GetWord(Data,8) <>$FFFF) then IncWord(Data, 8, aCount, Max_Rows);
  if (GetWord(Data,12) >=aPos)and (GetWord(Data,12) <>$FFFF) then IncWord(Data, 12, aCount, Max_Rows);
end;

{ TArrayRecord }

procedure TArrayRecord.ArrangeCopy(const DeltaRow: integer);
begin
  //Pending:
end;

procedure TArrayRecord.ArrangeInsert(const aPos, aCount: integer);
begin
  //Pending:
end;

end.

