unit Conference;

interface

uses SysUtils, Windows, SyncObjs, SipInts, Classes, AudioBuf;

type
  TSipConference = class (TInterfacedObject, ISipConference)
  protected
    FCS: TCriticalSection;
    FCallList: TStringList;
    FBuffList: TStringList;
    procedure OnSend (const Call: ISipCall; Buffer: Pointer);
    procedure OnRecv (const Call: ISipCall; Buffer: Pointer);
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

type
  TPCMData = TAudioData;
  PPCMData = ^TPCMData;

Constructor TSipConference.Create;
Begin
  Inherited;
  FCallList:=TStringList.Create;
  FBuffList:=TStringList.Create;
  FCS:=TCriticalSection.Create;
end;

Destructor TSipConference.Destroy;
Begin
  While FBuffList.Count>0 Do
  Begin
    FBuffList.Objects[0].Free;
    FBuffList.Delete(0);
  end;
  FBuffList.Free;
  FCallList.Free;
  FCS.Free;
  Inherited;
end;

function FindString (L: TStringList; const S: AnsiString; var Index: Integer): Boolean;
var
  i: Integer;
begin
  Index:=-1;
  Result:=False;
  for i:=0 to L.Count-1 do
    if L[i]=S Then
    Begin
      Index:=i;
      Result:=True;
      Exit;
    end;
end;

procedure TSipConference.OnRecv (const Call: ISipCall; Buffer: Pointer);
var
  NameIn: AnsiString;
  NameOut: AnsiString;
  i: Integer;
  n: Integer;
  CallIndex: Integer;
  BuffIndex: Integer;
  cnt: Integer;
  B: TAudioData;
  M: array[0..160] of Integer;
Begin
  FCS.Enter;
  try
    NameIn:='<<'+Call.CallID;
    NameOut:='>>'+Call.CallID;
    if not FindString(FCallList,NameIn,CallIndex) then FCallList.Add(NameIn);
    if not FindString(FCallList,NameOut,CallIndex) then FCallList.Add(NameOut);
    for i:=0 to FCallList.Count-1 Do
    Begin
      If (FCallList[i]<>NameIn)and(FCallList[i]<>NameOut) then
      Begin
        if not FindString(FBuffList,NameIn+'->'+FCallList[i],BuffIndex) Then
        Begin
          FBuffList.AddObject(NameIn+'->'+FCallList[i],TAudioBuffer.Create);
          FindString(FBuffList,NameIn+'->'+FCallList[i],BuffIndex); // needlees, Count-1 can be used directly
        end;
        TAudioBuffer(FBuffList.Objects[BuffIndex]).PutBuffer(Buffer);
      end;
    end;
    if Call.EnableAudioOut Then
    Begin
      cnt:=0;
      FillChar(M,SizeOf(M),0);
      for i:=0 to FCallList.Count-1 do
      Begin
        if (FCallList[i]<>NameIn)and(FCallList[i]<>NameOut) then
          if FindString(FBuffList,FCallList[i]+'->'+NameIn,BuffIndex) then
            if TAudioBuffer(FBuffList.Objects[BuffIndex]).GetBuffer(@B[0]) then
            Begin
              Inc(cnt);
              for n:=0 to High(B) do
                M[n]:=M[n] + B[n];
            end;
      end;
      if cnt>0 then
      Begin
        Inc(cnt);
        for n:=0 to High(TAudioData) do
          M[n]:=M[n] + PAudioData(Buffer)[n];
        // ==can be optimized - swap FOR and IF
        if cnt=1 Then
          for n:=0 to High(TAudioData) do
          Begin
            PAudioData(Buffer)[n]:=M[n];
          end
        Else
          for n:=0 to High(TAudioData) Do
          Begin
            PAudioData(Buffer)[n]:=M[n] Div cnt;
          end;
        // ==end of optimization
      end;
    end;
  Finally
    FCS.Leave;
  end;
end;

procedure TSipConference.OnSend (const Call: ISipCall; Buffer: Pointer);
var
  NameIn: AnsiString;
  NameOut: AnsiString;
  i: Integer;
  n: Integer;
  CallIndex: Integer;
  BuffIndex: Integer;
  cnt: Integer;
  B: TAudioData;
  M: array[0..160] of Integer;
Begin
  FCS.Enter;
  try
    NameIn:='<<'+Call.CallID;
    NameOut:='>>'+Call.CallID;
    if not FindString(FCallList,NameIn,CallIndex) then FCallList.Add(NameIn);
    if not FindString(FCallList,NameOut,CallIndex) then FCallList.Add(NameOut);
    if Call.EnableAudioIn then
      for i:=0 to FCallList.Count-1 Do
      Begin
        If (FCallList[i]<>NameIn)and(FCallList[i]<>NameOut) then
        Begin
          if not FindString(FBuffList,NameOut+'->'+FCallList[i],BuffIndex) Then
          Begin
            FBuffList.AddObject(NameOut+'->'+FCallList[i],TAudioBuffer.Create);
            FindString(FBuffList,NameOut+'->'+FCallList[i],BuffIndex); // needlees, Count-1 can be used directly
          end;
          TAudioBuffer(FBuffList.Objects[BuffIndex]).PutBuffer(Buffer);
        end;
      end;
    cnt:=0;
    FillChar(M,SizeOf(M),0);
    for i:=0 to FCallList.Count-1 do
    Begin
      if (FCallList[i]<>NameIn)and(FCallList[i]<>NameOut) then
        if FindString(FBuffList,FCallList[i]+'->'+NameOut,BuffIndex) then
          if TAudioBuffer(FBuffList.Objects[BuffIndex]).GetBuffer(@B[0]) then
          Begin
            Inc(cnt);
            for n:=0 to High(B) do
              M[n]:=M[n] + B[n];
          end;
    end;
    if Call.EnableAudioIn then
    Begin
      Inc(cnt);
      for n:=0 to High(TAudioData) do
        M[n]:=M[n] + PAudioData(Buffer)[n];
    End;
    if cnt>0 Then
    begin
      If cnt=1 then
        for n:=0 to High(TAudioData) do
        Begin
          PAudioData(Buffer)[n]:=M[n];
        end
      Else
        for n:=0 to High(TAudioData) Do
        Begin
          PAudioData(Buffer)[n]:=M[n] Div cnt;
        end;
    end;
  Finally
    FCS.Leave;
  end;
end;

end.
