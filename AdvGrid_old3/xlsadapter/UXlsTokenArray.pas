unit UXlsTokenArray;

interface

uses XlsMessages, sysUtils;

type
  ETokenException= class (EExcelException)
  public
    Token: integer;
    constructor Create(const aToken: integer;const aDummy1: integer; const ADummy2: integer);
  end;


//*************************************************************
{**} procedure ArrangeInsertRows(const Data: PArrayOfByte; const atPos, afPos: integer;
                                 const InsPos, InsOffset, CopyOffset: integer;
                                 const SheetInfo: TSheetInfo; const AllowedAbsolute: boolean);
{**} procedure ArrangeInsertSheets(const Data: PArrayOfByte; const atPos, afPos: integer;
                                   const SheetInfo: TSheetInfo);
{**} procedure ArrangeSharedFormulas(const Data: PArrayOfByte; const atPos, afPos: integer;
                              const SharedRow, SharedCol: integer);
//*************************************************************

implementation
procedure CreateInvalidRef(var Token: byte);
begin
  if Token in tk_Ref then Inc(Token, tk_RefToRefErr) else
  if Token in tk_Area then Inc(Token, tk_AreaToAreaErr) else
  if Token in tk_Ref3D then Inc(Token, tk_Ref3DToRef3DErr) else
  if Token in tk_Area3D then Inc(Token, tk_Area3DToArea3DErr) else
  if not (Token in tk_RefErr + tk_Ref3DErr + tk_AreaErr + tk_Area3DErr)
    then raise ETokenException.Create(Token,0,0);
end;

procedure IncWordRef( const Pdata: PArrayOfByte; const tPos: integer; const InsPos, Offset: integer; const Max: integer; const tkPos: integer);
var
  w: int64;
begin
  w:=Pdata^[tPos] or (PData^[tPos+1] shl 8);

  //Handle deletes...
  if (Offset<0) and (InsPos >=0) and (w> InsPos) and (w<Inspos - Offset) then
  begin
    CreateInvalidRef( PData[tkPos]);
    exit;
  end;

  inc(w, Offset);

  if (w>Max) then
  begin
    w:=Max;
    Pdata^[tPos]:= lo(w);
    Pdata^[tPos+1]:= hi(w);
    exit; //References are trimmed
  end;
  if (w<0) then
  begin
    CreateInvalidRef( PData[tkPos]);
    exit;
  end;
  Pdata^[tPos]:= lo(w);
  Pdata^[tPos+1]:= hi(w);
end;

procedure IncW(const pData: PArrayOfByte; const tPos: integer; const Offset: integer);
var
  w: ^Word;
begin
  w:=@(PData[tPos]);
  inc(w^, Offset);
end;

procedure ArrangeTokenOperand(Token: integer;const Data: ParrayOfByte;
                              var tPos: integer; const InsPos, InsOffset, CopyOffset: integer;
                              const SheetInfo: TSheetInfo; const InsertingSheet: boolean;
                              const SharedRow, SharedCol: integer; const AllowedAbsolute: boolean);
var
  AbsoluteRef: boolean;
  LocalSheet: integer;
  tkPos: integer;
begin
  // Shared formulas
  if (SharedRow>=0) and (Token in tk_RefN+ tk_AreaN) then
  begin
    Inc(Data[tPos],$24-$2C);
    Token:=Data[tPos];
  end;

  tkPos:=tPos;
  inc(tPos);
  LocalSheet:= SheetInfo.FormulaSheet;

  if Token in tk_Ref3D+ tk_Area3D+ tk_Ref3DErr + tk_Area3DErr then
  begin
    if Assigned(SheetInfo.GetSheet) then
    begin
      LocalSheet:=SheetInfo.GetSheet(GetWord(Data, tPos));
      if InsertingSheet and (LocalSheet=SheetInfo.FormulaSheet) and Assigned(SheetInfo.SetSheet) then
        SetWord(Data, tPos, SheetInfo.SetSheet(SheetInfo.InsSheet));        //this copies external refs to the old sheet to the new sheet
    end;
    inc(tPos, 2);
  end;


  if Token in tk_Array then
  begin
    inc(tPos,7);
    //Values are stored outside the formula
  end
  else if Token in tk_Name then inc(tPos, 4)
  else if Token in tk_NameX then inc(tPos, 6)
  else if Token in tk_Ref + tk_RefErr + tk_Ref3D + tk_Ref3DErr then
  begin
    if (LocalSheet= SheetInfo.InsSheet) then
    begin
      if GetWord(Data, tPos)>= InsPos then IncWordRef(Data, tPos, InsPos, InsOffset, Max_Rows, tkpos);
    end;
    AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+2) and $8000) <> $8000);
    if not AbsoluteRef then IncWordRef(Data, tPos, -1, CopyOffset, Max_Rows, tkpos);

    if SharedRow>=0 then
    begin
      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+2) and $8000) <> $8000);
      if not AbsoluteRef then IncW(Data, tPos,   SharedRow);
      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+2) and $4000) <> $4000);
      if not AbsoluteRef then IncW(Data, tPos+2, SharedCol);
    end;

    inc(tPos,4);
  end
  else if Token in tk_RefN then inc(tPos,4)//This is used in conditional formats, besides shared formulas

  else if Token in tk_Area + tk_AreaErr + tk_Area3D + tk_Area3DErr then
  begin
    if (LocalSheet= SheetInfo.InsSheet) then
    begin
      if GetWord(Data, tPos)>= InsPos then IncWordRef(Data, tPos, InsPos, InsOffset, Max_Rows, tkpos);
      if GetWord(Data, tPos+2)>= InsPos then IncWordRef(Data, tPos+2, InsPos, InsOffset, Max_Rows, tkpos);
    end;
    AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+4) and $8000) <> $8000);
    if not AbsoluteRef then IncWordRef(Data, tPos, -1, CopyOffset, Max_Rows, tkpos);
    AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+6) and $8000) <> $8000);
    if not AbsoluteRef then IncWordRef(Data, tPos+2, -1, CopyOffset, Max_Rows, tkpos);

    if SharedRow>=0 then
    begin
      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+4) and $8000) <> $8000);
      if not AbsoluteRef then IncW(Data, tPos, SharedRow);
      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+4) and $4000) <> $4000);
      if not AbsoluteRef then IncW(Data, tPos+4, SharedCol);

      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+6) and $8000) <> $8000);
      if not AbsoluteRef then IncW(Data, tPos+2, SharedRow);
      AbsoluteRef:= AllowedAbsolute and ((GetWord(Data, tPos+6) and $4000) <> $4000);
      if not AbsoluteRef then IncW(Data, tPos+6, SharedCol);
    end;

    inc(tPos,8);
  end
  else if Token in tk_AreaN then inc(tPos,8)  //PENDING: Arreglar inserts en CFs

  else raise ETokenException.Create(Token,0,0);
end;

procedure ArrangeTokenTable(const Data: ParrayOfByte;
                              var tPos: integer; const InsPos, InsOffset, CopyOffset: integer;
                              const SheetInfo: TSheetInfo; const InsertingSheet: boolean;
                              const SharedRow, SharedCol: integer; const AllowedAbsolute: boolean);
begin
  inc(tpos,5);
  if (SheetInfo.FormulaSheet<>SheetInfo.InsSheet)or
     (SharedRow>0) or (SharedCol>0) or InsertingSheet then exit;

  if GetWord(Data, tpos-4)>=InsPos then IncWordRef(Data, tPos-4, InsPos, InsOffset, Max_Rows, tPos-5);
  IncWordRef(Data, tPos-4, -1, CopyOffset, Max_Rows, tpos-5);
end;

procedure ArrangeTokenArray(const Data: PArrayOfByte; const atPos, afPos: integer;
                            const InsPos, InsOffset, CopyOffset: integer;
                            const SheetInfo: TSheetInfo; const InsertingSheet: boolean;
                            const SharedRow, SharedCol: integer; const AllowedAbsolute: boolean);
var
  tPos, fPos: integer;
  Token: byte;
begin;
  tPos:=atPos;
  fPos:=afPos;

  while tPos<fPos do
  begin
    Token:= Data[tPos];
    if Token in tk_UnaryOps + tk_BinaryOps + [tk_MissArg] then inc(tPos)
    else if Token = tk_Str then inc(tPos,1 + GetStrLen(false, Data,tPos+1, False, 0))
    else if Token in [tk_Err, tk_Bool] then inc(tPos,1+1)
    else if Token in [tk_Int]+ tk_Func then inc(tPos,1+2)
    else if Token in tk_FuncVar then inc(tPos,1+3)
    else if Token in [tk_Num] then inc(tPos,1+8)
    else if Token=tk_Attr then
    begin
      if (Data[tPos+1] and $04)=$04 then inc(tPos, (GetWord(Data, tPos+2)+1)*2);
      inc(tPos, 1+3);
    end

    else if Token in tk_Operand then ArrangeTokenOperand(Token, Data, tPos, InsPos, InsOffset, CopyOffset, SheetInfo, InsertingSheet, SharedRow, SharedCol, AllowedAbsolute)
    else if Token=tk_Table then ArrangeTokenTable(Data, tPos, InsPos, InsOffset, CopyOffset, SheetInfo, InsertingSheet, SharedRow, SharedCol, AllowedAbsolute)
    else if Token=tk_MemFunc then inc(tPos, 2+ GetWord(Data, tPos+1))
    else raise ETokenException.Create(Token,0,0);

  end;

end;

procedure ArrangeInsertRows(const Data: PArrayOfByte; const atPos, afPos: integer;
                            const InsPos, InsOffset, CopyOffset: integer;
                            const SheetInfo: TSheetInfo; const AllowedAbsolute: boolean);
begin
  ArrangeTokenArray(Data, atPos, afPos, InsPos, InsOffset, CopyOffset, SheetInfo, false, -1, -1, AllowedAbsolute);
end;

procedure ArrangeInsertSheets(const Data: PArrayOfByte; const atPos, afPos: integer;
                              const SheetInfo: TSheetInfo);
begin
  ArrangeTokenArray(Data, atPos, afPos, 0, 0, 0, SheetInfo, true, -1, -1, true);
end;

procedure ArrangeSharedFormulas(const Data: PArrayOfByte; const atPos, afPos: integer;
                              const SharedRow, SharedCol: integer);
var
  SheetInfo: TSheetInfo;
begin
  SheetInfo.InsSheet:=0;
  SheetInfo.FormulaSheet:=0;
  SheetInfo.GetSheet:=nil;
  sheetInfo.SetSheet:=nil;
  ArrangeTokenArray(Data, atPos, afPos, 0, 0, 0, SheetInfo, false, SharedRow, SharedCol, true);
end;


{ ETokenException }

constructor ETokenException.Create(const aToken: integer;const aDummy1: integer; const ADummy2: integer);
begin
  Token:= aToken;
  inherited CreateFmt(ErrBadToken, [Token]);
end;

end.
