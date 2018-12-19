unit CodecPCM;

interface

uses Codecs, SipInts, SysUtils;

type
  TCodecPCMA = class(TInterfacedObject, IAudioCodec)
  protected
    function GetSampleCount: Integer;
    function GetId: Integer;
    function Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
    function Encode(const InBuf,OutBuf: Pointer):Integer;
  end;

  TCodecPCMU = class(TInterfacedObject, IAudioCodec)
  protected
    function GetSampleCount: Integer;
    function GetId: Integer;
    function Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
    function Encode(const InBuf,OutBuf: Pointer):Integer;
  end;

implementation

uses AudioBuf;

type
  PPCMBuffer = ^TPCMBuffer;
  TPCMBuffer = TAudioData;

const
 u2a: array[0..127] of Byte = (
	1,	1,	2,	2,	3,	3,	4,	4,
	5,	5,	6,	6,	7,	7,	8,	8,
	9,	10,	11,	12,	13,	14,	15,	16,
	17,	18,	19,	20,	21,	22,	23,	24,
	25,	27,	29,	31,	33,	34,	35,	36,
	37,	38,	39,	40,	41,	42,	43,	44,
	46,	48,	49,	50,	51,	52,	53,	54,
	55,	56,	57,	58,	59,	60,	61,	62,
	64,	65,	66,	67,	68,	69,	70,	71,
	72,	73,	74,	75,	76,	77,	78,	79,
	80,	82,	83,	84,	85,	86,	87,	88,
	89,	90,	91,	92,	93,	94,	95,	96,
	97,	98,	99,	100,	101,	102,	103,	104,
	105,	106,	107,	108,	109,	110,	111,	112,
	113,	114,	115,	116,	117,	118,	119,	120,
	121,	122,	123,	124,	125,	126,	127,	128);

  a2u: array[0..127] of Byte = (
	1,	3,	5,	7,	9,	11,	13,	15,
	16,	17,	18,	19,	20,	21,	22,	23,
	24,	25,	26,	27,	28,	29,	30,	31,
	32,	32,	33,	33,	34,	34,	35,	35,
	36,	37,	38,	39,	40,	41,	42,	43,
	44,	45,	46,	47,	48,	48,	49,	49,
	50,	51,	52,	53,	54,	55,	56,	57,
	58,	59,	60,	61,	62,	63,	64,	64,
	65,	66,	67,	68,	69,	70,	71,	72,
	73,	74,	75,	76,	77,	78,	79,	80,
	80,	81,	82,	83,	84,	85,	86,	87,
	88,	89,	90,	91,	92,	93,	94,	95,
	96,	97,	98,	99,	100,	101,	102,	103,
	104,	105,	106,	107,	108,	109,	110,	111,
	112,	113,	114,	115,	116,	117,	118,	119,
	120,	121,	122,	123,	124,	125,	126,	127);

function alaw2ulaw (aval: Byte): Byte;
begin
  if (aval and $80) <> 0
  then Result := ($FF xor a2u[aval xor $D5])
  else Result := ($7F xor a2u[aval xor $55]);
end;

function ulaw2alaw (uval: Byte): Byte;
begin
  if (uval and $80) <> 0
  then Result := ($D5 xor (u2a[$FF xor uval] - 1))
  else Result := ($55 xor (u2a[$7F xor uval] - 1));
end;

function linear2ulaw1(sample: SmallInt): Byte;
var
  mask, seg: word;
  uval: word;
const
  su: array[0..7] of Integer = ($3F, $7F, $FF, $1FF, $3FF, $7FF, $FFF, $1FFF);
begin
  sample := sample shr 2;
  if sample < 0 then
  begin
    mask := $7F;
    sample := -sample;
  end
  else
  begin
    mask := $FF;
  end;
  if sample > 8159 then sample := 8159;
  sample := sample + ($84 shr 2);
  if sample <= su[0] then seg := 0
  else if sample <= su[1] then seg := 1
  else if sample <= su[2] then seg := 2
  else if sample <= su[3] then seg := 3
  else if sample <= su[4] then seg := 4
  else if sample <= su[5] then seg := 5
  else if sample <= su[6] then seg := 6
  else if sample <= su[7] then seg := 7
  else seg := 8;
  if seg >= 8 then Result := $7F xor mask
  else
  begin
    uval := (seg shl 4) or ((sample shr (seg + 1)) and $F);
    Result := uval xor mask;
  end;
  if Result = 0 then Result := 2;
end;

function linear2ulaw(sample: Integer): Byte;
const
  CLIP = 32635;
  BIAS = $84;
  exp_lut: array[0..255] of Integer =
                            (0,0,1,1,2,2,2,2,3,3,3,3,3,3,3,3,
                             4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,
                             5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                             5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,
                             6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                             6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                             6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                             6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,
                             7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7);
var
  sign: Word;
  exponent: Integer;
  mantissa: Integer;
  ulawbyte: Byte;
begin
  sign := (sample shr 8) and $80;
  if (sign <> 0) then sample := -sample;
  if (sample > CLIP) then sample := CLIP;
  sample := sample + BIAS;
  exponent := exp_lut[(sample shr 7) and $FF];
  mantissa := (sample shr (exponent+3)) and $0F;
  ulawbyte := not ((sign or (exponent shl 4)) or mantissa);
//  if (ulawbyte = 0 ) then ulawbyte := $02;
  Result := ulawbyte;
end;

function ulaw2linear(ulawbyte: Byte): SmallInt;
const
  exp_lut: array[0..7] of Integer = (0,132,396,924,1980,4092,8316,16764);
var
  sign, exponent, mantissa, sample: SmallInt;
begin
  ulawbyte := not ulawbyte;
  sign := (ulawbyte and $80);
  exponent := (ulawbyte shr 4) and $07;
  mantissa := ulawbyte and $0F;
  sample := exp_lut[exponent] + (mantissa shl (exponent+3));
  if (sign <> 0) then sample := -sample;
  Result := sample;
end;

{ TCodecPCM - aLaw }

function TCodecPCMA.Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
var
  i: Integer;
  IB: PByteArray;
  OB: PPCMBuffer;
begin
  IB := InBuf;
  OB := OutBuf;
  for i := 0 to Size - 1 do
    OB[i] := ulaw2linear(alaw2ulaw(IB[i]));
  Result := Size * 2;
end;

function TCodecPCMA.Encode(const InBuf,OutBuf: Pointer):Integer;
var
  i: Integer;
  OB: PByteArray;
  IB: PPCMBuffer;
begin
  IB := InBuf;
  OB := OutBuf;
  for i := 0 to High(IB^) do
    OB[i] := ulaw2alaw(linear2ulaw(IB[i])); // compiler exchanged ECX and EDX
  Result:=Length(IB^);
end;

function TCodecPCMA.GetId: Integer;
begin
  Result := 8;
end;

function TCodecPCMA.GetSampleCount: Integer;
begin
  Result := High(TPCMBuffer)+1;
end;

{ TCodecPCM - uLaw }

function TCodecPCMU.Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
var
  i: Integer;
  IB: PByteArray;
  OB: PPCMBuffer;
begin
  IB := InBuf;
  OB := OutBuf;
  for i := 0 to Size - 1 do
    OB[i] := ulaw2linear(IB[i]);
  Result := Size * 2;
end;

function TCodecPCMU.Encode(const InBuf,OutBuf: Pointer):Integer;
var
  i: Integer;
  OB: PByteArray;
  IB: PPCMBuffer;
begin
  IB := InBuf;
  OB := OutBuf;
  for i := 0 to High(IB^) do
    OB[i] := linear2ulaw1(IB[i]); // compiler exchanged ECX and EDX
  Result:=Length(IB^);
end;

function TCodecPCMU.GetId: Integer;
begin
  Result := 0;
end;

function TCodecPCMU.GetSampleCount: Integer;
begin
  Result := High(TPCMBuffer)+1;
end;

{ Codec creation }

Function CreateCodecPCMA: IAudioCodec;
Begin
  Result:=TCodecPCMA.Create;
end;

function CreateCodecPCMU: IAudioCodec;
Begin
  Result:=TCodecPCMU.Create;
end;

Initialization
  RegisterCodec(CreateCodecPCMA,8);
  RegisterCodec(CreateCodecPCMU,0);

end.
