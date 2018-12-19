unit CodecGSM;

interface

uses Codecs, SipInts, acm, Windows;

type
  PGsmBlock = ^TGsmBlock;
  TGsmBlock = array[0..64] of Byte;

  PGsmFrames = ^TGsmFrames;
  TGsmFrames = array[0..65] of Byte;
  
  TPcmBlock = array[1..320] of Word;

  TCodecGSM = class(TInterfacedObject, IAudioCodec)
  private
    gsmblock: TGsmBlock;
    gsmframes: TGsmFrames;
    pcmblock: TPcmBlock; // placed 1 byte later than in the original
    gsmblock1: TGsmBlock;
    gsmframes1: TGsmFrames;
    pcmblock1: TPcmBlock;
    ready: Integer;
    ready1: Integer;
    has: THandle;
    has1: THandle;
    sf: TWAVEFORMATEX;
    df: TWAVEFORMATGSM;
    sf1: TWAVEFORMATGSM;
    df1: TWAVEFORMATEX;
    hdr: TACMSTREAMHEADER;
    hdr1: TACMSTREAMHEADER;
  protected
    function GetSampleCount: Integer;
    function GetId: Integer;
    function Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
    function Encode(const InBuf,OutBuf: Pointer):Integer;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses AudioBuf;

{ TCodecGSM }

type
  PPayloadData = ^TPayloadData;
  TPayloadData = array[$0..$400] of Byte;

  PAudioDataBlock = ^TAudioDataBlock;
  TAudioDataBlock = array[$0..$400] of Smallint;

const
  USR2GSM: array[0..519] of Word =
   (14,15, 0, 1, 2, 3, 8, 9,10,11,12,13,19,20,21,22,23,30,31,16,17,18,26,27,
    28,29,38,39,24,25,35,36,37,32,33,34,41,42,43,44,45,46,47,55,40,53,54,63,
    48,49,50,51,52,60,61,62,57,58,59,70,71,56,67,68,69,64,65,66,77,78,79,74,
    75,76,87,72,73,84,85,86,81,82,83,94,95,80,91,92,93,88,89,90,97,98,99,100,
    101,102,103,111,96,109,110,119,104,105,106,107,108,116,117,118,113,114,115,
    126,127,112,123,124,125,120,121,122,133,134,135,130,131,132,143,128,129,
    140,141,142,137,138,139,150,151,136,147,148,149,144,145,146,153,154,155,
    156,157,158,159,167,152,165,166,175,160,161,162,163,164,172,173,174,169,
    170,171,182,183,168,179,180,181,176,177,178,189,190,191,186,187,188,199,
    184,185,196,197,198,193,194,195,206,207,192,203,204,205,200,201,202,209,
    210,211,212,213,214,215,223,208,221,222,231,216,217,218,219,220,228,229,
    230,225,226,227,238,239,224,235,236,237,232,233,234,245,246,247,242,243,
    244,255,240,241,252,253,254,249,250,251,262,263,248,259,260,261,256,257,
    258,278,279,264,265,266,267,272,273,274,275,276,277,283,284,285,286,287,
    294,295,280,281,282,290,291,292,293,302,303,288,289,299,300,301,296,297,
    298,305,306,307,308,309,310,311,319,304,317,318,327,312,313,314,315,316,
    324,325,326,321,322,323,334,335,320,331,332,333,328,329,330,341,342,343,
    338,339,340,351,336,337,348,349,350,345,346,347,358,359,344,355,356,357,
    352,353,354,361,362,363,364,365,366,367,375,360,373,374,383,368,369,370,
    371,372,380,381,382,377,378,379,390,391,376,387,388,389,384,385,386,397,
    398,399,394,395,396,407,392,393,404,405,406,401,402,403,414,415,400,411,
    412,413,408,409,410,417,418,419,420,421,422,423,431,416,429,430,439,424,
    425,426,427,428,436,437,438,433,434,435,446,447,432,443,444,445,440,441,
    442,453,454,455,450,451,452,463,448,449,460,461,462,457,458,459,470,471,
    456,467,468,469,464,465,466,473,474,475,476,477,478,479,487,472,485,486,
    495,480,481,482,483,484,492,493,494,489,490,491,502,503,488,499,500,501,
    496,497,498,509,510,511,506,507,508,519,504,505,516,517,518,513,514,515,
    526,527,512,523,524,525,520,521,522);

procedure GsmToUsrB(Block: PGsmBlock; Frames: PGsmFrames);
var
  IDX: Longint;
begin
  FillChar(Frames^, SizeOf(Frames^), 0);
  for IDX := Low(USR2GSM) to High(USR2GSM) do
    if (block[IDX div 8] and (1 shl (IDX mod 8))) > 0 then
      frames[USR2GSM[IDX] div 8] := frames[USR2GSM[IDX] div 8] or (1 shl (USR2GSM[IDX] mod 8));
  frames[0] := frames[0] or $D0;
  frames[33] := frames[33] or $D0;
end;

procedure UsrBToGsm(Frames: PGsmFrames; Block: PGsmBlock);
var
  IDX: Longint;
begin
  FillChar(block^, sizeof(block^), 0);
  for IDX := Low(USR2GSM) to High(USR2GSM) do
    if (frames[USR2GSM[IDX] div 8] and (1 shl (USR2GSM[IDX] mod 8))) > 0
      then block[IDX div 8] := block[IDX div 8] or (1 shl (IDX mod 8));
end;

constructor TCodecGSM.Create;
begin
  inherited;
  ready:=0;
  ready1:=0;
  InitFormatEx(sf, WAVE_FORMAT_PCM, 1, 8000, 16000, 2, 16, 0);
  InitFormatEx(TWAVEFORMATEX(df), WAVE_FORMAT_GSM610, 1, 8000, 1625, 65, 0, 2);
  df.unpackedBlockSize := 320;
  InitAcmHeader(hdr, @pcmblock, sizeof(pcmblock), sizeof(pcmblock), @gsmblock,
                sizeof(gsmblock), sizeof(gsmblock), 0);
  acmStreamOpen(@has, 0, @sf, @df, nil, 0, 0, ACM_STREAMOPENF_NONREALTIME);
  acmStreamPrepareHeader(has, @hdr, 0);

  InitFormatEx(TWAVEFORMATEX(sf1), WAVE_FORMAT_GSM610, 1, 8000, 1625, 65, 0, 2);
  sf1.unpackedBlockSize := 320;
  InitFormatEx(df1, WAVE_FORMAT_PCM, 1, 8000, 16000, 2, 16, 0);
  FillChar(hdr1, sizeof(hdr1), 0);
  InitAcmHeader(hdr1, @gsmblock1, sizeof(gsmblock1), sizeof(gsmblock1),
                @pcmblock1, sizeof(pcmblock1), sizeof(pcmblock1), 0);
  acmStreamOpen(@has1, 0, @sf1, @df1, nil, 0, 0, ACM_STREAMOPENF_NONREALTIME);
  acmStreamPrepareHeader(has1, @hdr1, 0);
end;

destructor TCodecGSM.Destroy;
begin
  acmStreamUnprepareHeader(has, @hdr, 0);
  acmStreamClose(has, 0);
  acmStreamUnprepareHeader(has1, @hdr1, 0);
  acmStreamClose(has1, 0);
  inherited;
end;

function TCodecGSM.Decode(const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
begin
  if ready=0 then
  begin
    Move(InBuf^, gsmframes1[0], 33);
    Move(pcmblock1[161],OutBuf^,SizeOf(pcmblock1) Div 2);
    ready:=1;
  end
  else
  Begin
    Move(InBuf^, gsmframes1[33], 33);
    UsrBToGsm(@gsmframes1, @gsmblock1);
    acmStreamConvert(has1, @hdr1, ACM_STREAMCONVERTF_BLOCKALIGN);
    Move(pcmblock1, OutBuf^, Length(pcmblock1));
    ready:=0;
  End;
  Result := Length(pcmblock1);
end;

function TCodecGSM.Encode(const InBuf,OutBuf: Pointer):Integer;
begin
  if ready1=0 Then
  Begin
    ready1:=1;
    Move(InBuf^, pcmblock, SizeOf(pcmblock) div 2);
    Move(gsmframes[33], OutBuf^, SizeOf(gsmframes) div 2);
  end
  Else
  Begin
    ready1:=0;
    Move(InBuf^,pcmblock[161],SizeOf(pcmblock) div 2);
    acmStreamConvert(has, @hdr, ACM_STREAMCONVERTF_BLOCKALIGN);
    GsmToUsrB(@gsmblock,@gsmframes);
    Move(gsmframes, OutBuf^, SizeOf(gsmframes) div 2);
  end;
  Result:=Length(gsmframes) div 2;
end;

function TCodecGSM.GetId: Integer;
begin
  Result := 3;
end;

function TCodecGSM.GetSampleCount: Integer;
begin
  Result := High(TAudioData)+1;
end;

{ Codec creation }

function CreateCodecGSM: IAudioCodec;
begin
  Result:=TCodecGSM.Create;
end;

Initialization
  RegisterCodec(CreateCodecGSM,3);

end.