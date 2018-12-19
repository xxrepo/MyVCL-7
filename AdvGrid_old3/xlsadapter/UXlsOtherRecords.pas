unit UXlsOtherRecords;

interface
uses Classes, SysUtils, UXlsBaseRecords, XlsMessages, UXlsStrings;

type
  TBOFRecord = class(TBaseRecord)
  private
    function GetBOFType: Word;
  protected
  public
    property BOFType: Word read GetBOFType;

    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
  end;

  TEOFRecord= class(TBaseRecord)
  end;

  TObjRecord = class(TBaseRecord)
    ObjId: word;
    CmoId: word;
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
  end;

  TTXORecord = class (TBaseRecord)
    constructor CreateFromData;
  end;

  TSSTRecord   = class(TBaseRecord)
  private
  public
    Count: Cardinal;
    constructor Create(const aId: word; const aData: PArrayOfByte; const aDataSize: integer);override;
  end;

  TBoundSheetRecord = class(TBaseRecord)
  private
    function GetSheetName: WideString;
    procedure SetSheetName(const Value: WideString);
    function GetOptionFlags: word;
    procedure SetOptionFlags(const Value: word);
  public
    property OptionFlags: word read GetOptionFlags write SetOptionFlags;
    property SheetName: WideString read GetSheetName write SetSheetName;

    constructor CreateNew(const aOptionFlags: word; const aName: WideString);
    procedure SetOffset(aOffset: cardinal);
  end;

  TRangeRecord= class(TBaseRecord)
  end;

  TCellMergingRecord= class(TRangeRecord)
  end;

  TDValRecord= class(TRangeRecord)
  end;

implementation
uses UEscherRecords;
{ TBOFRecord }

constructor TBOFRecord.Create(const aId: word; const aData: PArrayOfByte;
  const aDataSize: integer);
begin
  inherited;
  if GetWord( aData, 0)<> xlr_BofVersion then raise Exception.Create(ErrInvalidVersion);

end;

function TBOFRecord.GetBOFType: Word;
begin
  Result:= GetWord( Data, 2);
end;

{ TSSTRecord }

constructor TSSTRecord.Create(const aId: word; const aData: PArrayOfByte;
  const aDataSize: integer);
begin
  inherited;
  Count:= GetCardinal(aData,4); // Total unique strings
end;

{ TBoundSheetRecord }

constructor TBoundSheetRecord.CreateNew(const aOptionFlags: word;
  const aName: WideString);
var
  Xs: TExcelString;
  PData: PArrayOfByte;
  DataSize: integer;
begin
  Xs:= TExcelString.Create(1, aName);
  try
    DataSize:=6 + Xs.TotalSize;
    GetMem(PData, DataSize);
    try
      SetCardinal( PData, 0, 0);
      SetWord( PData, 4, aOptionFlags );
      Xs.CopyToPtr( PData, 6 );
      Create( xlr_BOUNDSHEET, PData, DataSize);
      PData:=nil;
    finally
      FreeMem(Pdata);
    end;
  finally
    FreeAndNil(Xs);
  end;
end;

function TBoundSheetRecord.GetSheetName: WideString;
var
  Xs: TExcelString;
  Ofs: integer;
  Rec: TBaseRecord;
begin
  Ofs:=6;Rec:= Self;
  Xs:= TExcelString.Create(1, Rec, Ofs);
  try
    Result:= Xs.Value;
  finally
    FreeAndNil(Xs);
  end;
end;

function TBoundSheetRecord.GetOptionFlags: word;
begin
  Result:= GetWord(Data, 4);
end;

procedure TBoundSheetRecord.SetOffset(aOffset: cardinal);
begin
  SetCardinal(Data, 0, aOffset);
end;

procedure TBoundSheetRecord.SetSheetName(const Value: WideString);
  //Important: This method changes the size of the record without notifying it's parent list
  //It's necessary to adapt the Totalsize in the parent list.
var
  Xs: TExcelString;
  NewDataSize: integer;
begin
  Xs:= TExcelString.Create(1, Value);
  try
    NewDataSize:=6 + Xs.TotalSize;
    ReallocMem( Data, NewDataSize);
    DataSize:=NewDataSize;
    Xs.CopyToPtr( Data, 6 );
  finally
    FreeAndNil(Xs);
  end;

end;

procedure TBoundSheetRecord.SetOptionFlags(const Value: word);
begin
  SetWord(Data, 4, Value);
end;

{ TObjRecord }

constructor TObjRecord.Create(const aId: word; const aData: PArrayOfByte;
  const aDataSize: integer);
begin
  inherited;
  ObjId:=GetWord(aData, 0);
  if ObjId= ftCmo then CmoId:= GetWord(aData, 4);
end;


{ TTXORecord }

constructor TTXORecord.CreateFromData;
var
  aData: PArrayOfByte;
  aDataSize: integer;
begin
  aDataSize:= 18;
  GetMem(aData, aDataSize);
  try
    FillChar(aData^, aDataSize, 0);
    SetWord(aData, 0, $212);
    Create(xlr_TXO, aData, aDataSize);
  except
    FreeMem(aData);
    raise;
  end; //except
end;

end.
