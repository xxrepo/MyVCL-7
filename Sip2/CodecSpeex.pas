unit CodecSpeex;

interface

uses Windows, SysUtils, SipInts, Codecs;

type
  PSpeexBits = ^TSpeexBits;
  TSpeexBits = record
    bytes: PAnsiChar;
    nbBits: Integer;
    bytePtr: Integer;
    bitPtr: Integer;
    owner: Integer;
    overflow: Integer;
    buf_size: Integer;
    reserved1: Integer;
    reserved2: Pointer;
  end;

  PSpeexMode = ^TSpeexMode;
  TSpeexMode = record
    mode: Pointer;
    query: Pointer;
    modeName: PAnsiChar;
    modeID: Integer;
    bitstream_version: Integer;
    enc_init: Pointer;
    enc_destroy: Pointer;
    enc: Pointer;
    dec_init: Pointer;
    dec_destroy: Pointer;
    dec: Pointer;
    enc_ctl: Pointer;
    dec_ctl: Pointer;
  end;

  PSpeexState = Pointer;

  TCodecSpeex = class (TInterfacedObject, IAudioCodec)
  protected
    function GetSampleCount: Integer;
    function GetCompressedSize: Integer;
    function GetId: Integer;
    function Decode (const InBuf, OutBuf: Pointer; const Size: Integer): Integer;
    function Encode (const InBuf,OutBuf: Pointer): Integer;
  public
    encbits: TSpeexBits;
    decbits: TSpeexBits;
    encstate: Pointer;
    decstate: Pointer;
    encframe: Integer;
    decframe: Integer;
    smpRt: Integer; // Sample Rate
    q: Integer; // Quality
    constructor Create;
    destructor Destroy; override;
  end;

function SpeexLibraryLoaded: Boolean;

implementation

Uses AudioBuf;

const
  SPEEX_MODEID_NB = 0;
  SPEEX_SET_SAMPLING_RATE = 24;
  SPEEX_SET_QUALITY = 4;
  SPEEX_SET_VBR_QUALITY = 14;
  SPEEX_GET_FRAME_SIZE = 3;
  SPEEX_SET_ENH = 0;

var
  DLLHandle: THandle;

  speex_bits_read_from: procedure(bits: PSpeexBits; bytes: PAnsiChar; len: Integer); cdecl;
  speex_decoder_init: function(mode: PSpeexMode): Pointer; cdecl;
  speex_decode: function(state: Pointer; bits: PSpeexBits; out_: PSingle): Integer; cdecl;
  speex_bits_reset: procedure(bits: PSpeexBits); cdecl;
  speex_encode: function(state: Pointer; in_: PSingle; bits: PSpeexBits): Integer; cdecl;
  speex_bits_nbytes: function(bits: PSpeexBits): Integer; cdecl;
  speex_bits_write: function(bits: PSpeexBits; bytes: PAnsiChar; max_len: Integer): Integer; cdecl;
  speex_bits_init: procedure(bits: PSpeexBits); cdecl;
  speex_encoder_init: function(mode: PSpeexMode): Pointer; cdecl;
  speex_lib_get_mode: function(mode: Integer): PSpeexMode; cdecl;
  speex_encoder_ctl: function(state: Pointer; request: Integer; ptr: Pointer): Integer; cdecl;
  speex_decoder_ctl: function(state: Pointer; request: Integer; ptr: Pointer): Integer; cdecl;
  speex_bits_destroy: procedure(bits: PSpeexBits); cdecl;
  speex_encoder_destroy: procedure(state: Pointer); cdecl;
  speex_decoder_destroy: procedure(state: Pointer); cdecl;

type
  PPCMBuffer = ^TPCMBuffer;
  TPCMBuffer = TAudioData;

function TCodecSpeex.Decode (const InBuf,OutBuf: Pointer; const Size: Integer): Integer;
var
  i: Integer;
  OB: PPCMBuffer;
  buff: array[0..159] of Single;
begin
  OB:=OutBuf;
  speex_bits_read_from(@decbits,InBuf,Size);
  speex_decode(decstate,@decbits,@buff[0]);
  for i:=0 to High(buff) do
    OB[i]:=Round(buff[i]); // compiler exchanged ECX and EDX
  Result:=SizeOf(OB^);
end;

function TCodecSpeex.Encode (const InBuf,OutBuf: Pointer): Integer;
var
  i: Integer;
  IB: PPCMBuffer;
  buff: array[0..159] of Single;
begin
  IB:=InBuf;
  for i:=0 to High(Buff) do
    buff[i]:=IB[i];
  speex_bits_reset(@encbits);
  speex_encode(encstate,@buff[0],@encbits);
  Result:=speex_bits_nbytes(@encbits);
  speex_bits_write(@encbits,OutBuf,Result);
end;

function TCodecSpeex.GetId: Integer;
begin
  Result := 110;
end;

function TCodecSpeex.GetSampleCount: Integer;
begin
  Result := High(TPCMBuffer)+1;
end;

function TCodecSpeex.GetCompressedSize: Integer;
Begin
  Result:=High(TPCMBuffer)+1;
end;

Constructor TCodecSpeex.Create;
Begin
  Inherited;
  smpRt:=8000;
  q:=10;
  speex_bits_init(@encbits);
  encstate:=speex_encoder_init(speex_lib_get_mode(SPEEX_MODEID_NB));
  speex_encoder_ctl(encstate,SPEEX_SET_SAMPLING_RATE,@smpRt);
  speex_encoder_ctl(encstate,SPEEX_SET_QUALITY,@q);
  speex_encoder_ctl(encstate,SPEEX_SET_VBR_QUALITY,@q);
  speex_encoder_ctl(encstate,SPEEX_GET_FRAME_SIZE,@encframe);
  speex_bits_init(@decbits);
  decstate:=speex_decoder_init(speex_lib_get_mode(SPEEX_MODEID_NB));
  speex_decoder_ctl(decstate,SPEEX_GET_FRAME_SIZE,@decframe);
  q:=0;
  speex_decoder_ctl(decstate,SPEEX_SET_ENH,@q);
end;

Destructor TCodecSpeex.Destroy;
Begin
  speex_bits_destroy(@encbits);
  speex_encoder_destroy(encstate);
  speex_bits_destroy(@decbits);
  speex_decoder_destroy(decstate);
  Inherited;
end;

Function SpeexLibraryLoaded:Boolean;
Begin
  Result:=DLLHandle<>0;
end;

Function CreateCodecSpeex:IAudioCodec;
Begin
  Result:=TCodecSpeex.Create;
end;

Initialization
  DLLHandle:=LoadLibrary('libspeex.dll');
  If DLLHandle<>0 Then
  Begin
    speex_bits_read_from:=GetProcAddress(DLLHandle,'speex_bits_read_from');
    speex_decoder_init:=GetProcAddress(DLLHandle,'speex_decoder_init');
    speex_decode:=GetProcAddress(DLLHandle,'speex_decode');
    speex_bits_reset:=GetProcAddress(DLLHandle,'speex_bits_reset');
    speex_encode:=GetProcAddress(DLLHandle,'speex_encode');
    speex_bits_nbytes:=GetProcAddress(DLLHandle,'speex_bits_nbytes');
    speex_bits_write:=GetProcAddress(DLLHandle,'speex_bits_write');
    speex_bits_init:=GetProcAddress(DLLHandle,'speex_bits_init');
    speex_encoder_init:=GetProcAddress(DLLHandle,'speex_encoder_init');
    speex_lib_get_mode:=GetProcAddress(DLLHandle,'speex_lib_get_mode');
    speex_encoder_ctl:=GetProcAddress(DLLHandle,'speex_encoder_ctl');
    speex_decoder_ctl:=GetProcAddress(DLLHandle,'speex_decoder_ctl');
    speex_bits_destroy:=GetProcAddress(DLLHandle,'speex_bits_destroy');
    speex_encoder_destroy:=GetProcAddress(DLLHandle,'speex_encoder_destroy');
    speex_decoder_destroy:=GetProcAddress(DLLHandle,'speex_decoder_destroy');
    RegisterCodec(CreateCodecSpeex,110);
  end;

Finalization
  If DLLHandle<>0 then FreeLibrary(DLLHandle);

end.