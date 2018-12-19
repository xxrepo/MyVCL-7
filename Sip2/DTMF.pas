UNIT DTMF;

interface

uses SysUtils,Windows,AudioBuf;

const
  dtran: array[0..15] of AnsiChar = '0123456789*#ABCD';

function DetectDtmf (AudioData: PAudioData): AnsiString;
function DtmfIndex (Code: AnsiChar): Integer;

function decode_silence(data: PByteArray; threshold: Integer): Boolean;

implementation

const
  NUMTONES = 18;

type
  TANumTon = array[0..NUMTONES-1] of real;

const

{      k : array[0..17] of integer = ( 11, 13, 14, 19, 21, 23, 26,
                                      27, 28, 33, 36, 39, 40,
                                      45, 49, 51, 72, 78);

 *   2 * cos( 2*pi* k/N )}

  coef: array[0..NUMTONES-1] of real = (1.917639, 1.885283, 1.867161,
                                 1.757634, 1.705280, 1.648252,
                                 1.554292, 1.520812, 1.486290,
                                 1.298896, 1.175571, 1.044997,
                                 1.000000, 0.8{0.765367}, 0.568031,
                                 0.466891, -0.618034, -0.907981);
  DSIL = 27;

  RANGE = 0.10;
  THRESH = 100.0;
  FLUSH_TIME = 100;

function DetectDtmf (AudioData: PAudioData): AnsiString;
var
  pon: array[0..6] of Boolean;
  power: array[0..6] of Real;
  u0: array[0..6] of Real;
  u1: array[0..6] of Real;
  maxPower: Real;
  on_count: Integer;
  t: Real;
  pin: Real;
  i: Integer;
  j: Integer;
const
  Coef: array[0..6] of Real = (1.707, 1.645, 1.567, 1.479, 1.164, 0.996, 0.84);
begin
  Result:='';
  for j:=Low(u0) to High(u0) do
  begin
    u0[j]:=0.0;
    u1[j]:=0.0;
  end;
  For i:=Low(AudioData^) to High(AudioData^) do
  begin
    pin:=AudioData[i] / 32767;
    for j:=Low(Coef) to High(Coef) do
    begin
      t:=u0[j];
      u0[j]:=Coef[j] * u0[j] + pin - u1[j];
      u1[j]:=t;
    end;
  end;
  for j:=Low(Coef) to High(Coef) Do
    power[j]:=u0[j]*u0[j] + u1[j]*u1[j] - Coef[j]*u0[j]*u1[j];
  maxPower:=0.0;
  for i:=Low(Power) to High(Power) do
    if power[i]>maxPower then maxPower:=Power[i];
  if maxPower < 0.2 Then
  Begin
    Result:=''; // needless
    Exit;
  end;
  maxPower:=maxPower * RANGE;
  on_count:=0;
  for i:=Low(Power) to High(power) do
    if Power[i]>maxPower then
    Begin
      pon[i]:=True;
      Inc(on_count);
    end
    else pon[i]:=False;
  if on_count=2 Then
  Begin
    if pon[0] and pon[4] then Result:='1'
    else if pon[0] and pon[5] Then Result:='2'
    else if pon[0] and pon[6] then Result:='3'
    else if pon[1] and pon[4] then Result:='4'
    else if pon[1] and pon[5] then Result:='5'
    else if pon[1] and pon[6] then Result:='6'
    else if pon[2] and pon[4] then Result:='7'
    else if pon[2] and pon[5] then Result:='8'
    else if pon[2] and pon[6] then Result:='9'
    else if pon[3] and pon[4] then Result:='*'
    else if pon[3] and pon[5] then Result:='0'
    else if pon[3] and pon[6] then Result:='#';
  end
  Else Result:=''; // needless
End;

procedure calc_power(data: PByteArray; var power : TANumTon);
var
  u0, u1 : TANumTon;
  t, pin : real;
  i, j : integer;
begin
  for j := 0 to High(u0) do
  begin
    u0[j] := 0.0;
    u1[j] := 0.0;
  end;

  for i := 0 to High(TAudioData) do
  begin
    pin := (ord(data[i]) - 128) / 128.0;
    for j := 0 to High(Coef) do
    begin
      t := u0[j];
      u0[j] := pin + coef[j] * u0[j] - u1[j];
      u1[j] := t;
    end;
  end;

  for j := 0 to High(Power) do
    power[j] := u0[j] * u0[j] + u1[j] * u1[j] - coef[j] * u0[j] * u1[j];
end;

function DtmfIndex (Code: AnsiChar): Integer;
Begin
  Case Code Of // can be optimized with Ord
    '0': Result:=0;
    '1': Result:=1;
    '2': Result:=2;
    '3': Result:=3;
    '4': Result:=4;
    '5': Result:=5;
    '6': Result:=6;
    '7': Result:=7;
    '8': Result:=8;
    '9': Result:=9;
    '*': Result:=10;
    '#': Result:=11;
  Else Result:=FLUSH_TIME;
  end;
end;

function decode_silence(data: PByteArray; threshold: Integer): Boolean;
var
  power : TANumTon;
  maxpower : real;
  i : integer;
begin
  Result := False;
  calc_power(data, power);
  maxpower := 0.0;
  for i := 0 to High(Power) do
    if power[i] > maxpower then maxpower := power[i];
  if maxpower < threshold then
    Result := True;
end;

(*
function decode(data: PByteArray) : integer;
var
  pon : array[0..NUMTONES-1] of Boolean;
  pow : array[0..NUMTONES-1] of Integer;
  on_count : integer;
  power : TANumTon;
  trs, maxpower : real;
  i : integer;
begin
  Result := -1;
  calc_power(data, power);
  maxpower := 0.0;
  for i := 0 to NUMTONES-1 do if power[i] > maxpower then maxpower := power[i];
  if maxpower < THRESH then
  begin
    Result := DSIL;
    Exit;
  end;
  trs := RANGE * maxpower;
  on_count := 0;
  for i := 0 to NUMTONES-1 do
  begin
    pow[i] := round(power[i]);
    if power[i] > trs then
    begin
      pon[i] := True;
      inc(on_count);
    end else pon[i] := False;
  end;
  pow[13] := pow[13];
  pow[6] := pow[6];
  if (on_count = 1) and (maxpower > 2000)  then
  begin
    if pon[1] then
    begin
      Result := 13;
      Exit;
    end;
  end;

  if on_count = 2 then
  begin
    if pon[4] and pon[10] then Result := 1 else //1    2 רק 8
    if pon[4] and pon[12] then Result := 2 else //2
    if pon[4] and pon[13] then Result := 3 else //3
    if pon[5] and pon[10] then Result := 4 else //4
    if pon[5] and pon[12] then Result := 5 else //5
    if pon[5] and pon[13] then Result := 6 else //6
    if pon[6] and pon[10] then Result := 7 else //7
    if pon[6] and pon[12] then Result := 8 else //8
    if pon[6] and pon[13] then Result := 9 else //9
    if pon[8] and pon[10] then Result := 10 else //*
    if pon[8] and pon[12] then Result := 0 else //0
    if pon[8] and pon[13] then Result := 11 else //#
    if pon[4] and pon[14] then Result := 12 else //A
    if pon[5] and pon[14] then Result := 13 else //B
    if pon[6] and pon[14] then Result := 14 else //C
    if pon[8] and pon[14] then Result := 15;     //D
  end else Result := -1;
end;

function detect_dtmf(data: PByteArray): String;
var
  i: Integer;
begin
  i := decode(data);
  if i in [0..15] then Result := dtran[i] else Result := '';
end;
*)
end.