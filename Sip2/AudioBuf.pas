unit AudioBuf;

interface

type
  PAudioData = ^TAudioData;
  TAudioData = packed array[0..159] of Smallint;

  TAudioBuffer = class (TObject)
  private
    FBuffers: array[0..3] of TAudioData;
    FFreeIndex: Integer;
    FIndex: Integer;
    FCount: Integer;
  public
    procedure PutBuffer (Buffer: Pointer);
    function GetBuffer (Buffer: Pointer): Boolean;
    function Count: Integer;
    constructor Create;
  end;

implementation

Function TAudioBuffer.Count: Integer;
Begin
  Result:=FCount;
end;

Constructor TAudioBuffer.Create;
Begin
  FFreeIndex:=0; 
  FIndex:=0;
  FCount:=0;
  FillChar(FBuffers,SizeOf(FBuffers),0);
end;

Function TAudioBuffer.GetBuffer(Buffer:Pointer):Boolean;
Begin
  if FCount>0 then Dec(FCount);
  Result:=FFreeIndex<>FIndex;
  if Result Then
  Begin
    Move(FBuffers[FIndex],Buffer^,SizeOf(TAudioData));
    Inc(FIndex);
    if FIndex>High(FBuffers) then FIndex:=0;
  end;
end;

procedure TAudioBuffer.PutBuffer (Buffer: Pointer);
Begin
  if FCount<Length(FBuffers) then Inc(FCount);
  Move(Buffer,FBuffers[FFreeIndex],SizeOf(TAudioData));
  Inc(FFreeIndex);
  if FFreeIndex>High(FBuffers) then FFreeIndex:=0;
  if FFreeIndex=FIndex Then
  Begin
    Inc(FIndex);
    if FIndex>High(FBuffers) then FIndex:=0;
  end;
end;

end.