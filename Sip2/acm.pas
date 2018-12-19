unit acm;

interface

uses Windows, mmSystem;

const
  WAVE_FORMAT_GSM610 = $31;
  WAVE_FORMAT_PCM    = $01;

  ACM_FORMATSUGGESTF_WFORMATTAG = $00010000;
  ACM_STREAMOPENF_NONREALTIME   = $00000004;
  ACM_STREAMCONVERTF_BLOCKALIGN = $00000004;

type
  PWAVEFORMATEX = ^TWAVEFORMATEX;
  TWAVEFORMATEX = record
    wFormatTag: WORD;
    nChannels: WORD;
    nSamplesPerSec: DWORD;
    nAvgBytesPerSec: DWORD;
    nBlockAlign: WORD;
    wBitsPerSample: WORD;
    cbSize: WORD;
  end;

  TWAVEFORMATGSM = record
    wFormatTag: WORD;
    nChannels: WORD;
    nSamplesPerSec: DWORD;
    nAvgBytesPerSec: DWORD;
    nBlockAlign: WORD;
    wBitsPerSample: WORD;
    cbSize: WORD;
    unpackedBlockSize: WORD;
  end;

  PACMSTREAMHEADER = ^TACMSTREAMHEADER;
  TACMSTREAMHEADER = packed record
    cbStruct         : DWORD;
    fdwStatus        : DWORD;
    dwUser           : DWORD;
    pbSrc            : PBYTE;
    cbSrcLength      : DWORD;
    cbSrcLengthUsed  : DWORD;
    dwSrcUser        : DWORD;
    pbDst            : PBYTE;
    cbDstLength      : DWORD;
    cbDstLengthUsed  : DWORD;
    dwDstUser        : DWORD;
    dwReservedDriver : array [0..9] of DWORD;
  end;

function acmStreamOpen(phas : Pointer; had : THandle; pwfxSrc : PWAVEFORMATEX; pwfxdst : PWAVEFORMATEX; pwfltr : Pointer;
  dwCallback : DWORD; dwInstance : DWORD; fdwOpen : DWORD): UINT; stdcall; external 'msacm32.dll';

function acmFormatSuggest (had: Windows.THandle; pwfxSrc: PWAVEFORMATEX; pwfxDst: PWAVEFORMATEX;
  cbwfxDst: DWORD; fdwSuggest: DWORD): UINT; stdcall; External 'msacm32.dll';

function acmStreamPrepareHeader(has : THandle; pash: PACMSTREAMHEADER; fdwPrepare : DWORD): UINT; stdcall; external 'msacm32.dll';
function acmStreamConvert(has : THandle; pash : PACMSTREAMHEADER; fdwConvert : DWORD): UINT; stdcall; external 'msacm32.dll';
function acmStreamUnprepareHeader(has: THandle; pash: PACMSTREAMHEADER; fdwUnprepare: DWORD): UINT; stdcall; external 'msacm32.dll';
function acmStreamClose(has: THandle; fdwClose: DWORD): UINT; stdcall; external 'msacm32.dll';
procedure InitFormatEx(var fe: TWAVEFORMATEX;
                       wFormatTag,
                       nChannels,
                       nSamplesPerSec,
                       nAvgBytesPerSec,
                       nBlockAlign,
                       wBitsPerSample,
                       cbSize: Longint);

procedure InitAcmHeader(var ah: TACMSTREAMHEADER;
                        pbSrc: Pointer;
                        cbSrcLength,
                        cbSrcLengthUsed: Longint;
                        pbDst: Pointer;
                        cbDstLength,
                        cbDstLengthUsed,
                        fdwStatus: Longint);

function AudioInDeviceNameToDeviceID(const ADeviceName: AnsiString): Cardinal;
function AudioOutDeviceNameToDeviceID(const ADeviceName: AnsiString): Cardinal;

implementation

procedure InitFormatEx(var fe: TWAVEFORMATEX;
                       wFormatTag,
                       nChannels,
                       nSamplesPerSec,
                       nAvgBytesPerSec,
                       nBlockAlign,
                       wBitsPerSample,
                       cbSize: Longint);
begin
  fe.wFormatTag := wFormatTag;
  fe.nChannels := nChannels;
  fe.nSamplesPerSec := nSamplesPerSec;
  fe.nAvgBytesPerSec := nAvgBytesPerSec;
  fe.nBlockAlign := nBlockAlign;
  fe.wBitsPerSample := wBitsPerSample;
  fe.cbSize := cbSize;
end;

procedure InitAcmHeader(var ah: TACMSTREAMHEADER;
                        pbSrc: Pointer;
                        cbSrcLength,
                        cbSrcLengthUsed: Longint;
                        pbDst: Pointer;
                        cbDstLength,
                        cbDstLengthUsed,
                        fdwStatus: Longint);
begin
  FillChar(ah, sizeof(ah), 0);
  ah.cbStruct := sizeof(TACMSTREAMHEADER);
  ah.pbSrc := pbSrc;
  ah.cbSrcLength := cbSrcLength;
  ah.cbSrcLengthUsed := cbSrcLengthUsed;
  ah.pbDst := pbDst;
  ah.cbDstLength := cbDstLength;
  ah.cbDstLengthUsed := cbDstLengthUsed;
  ah.fdwStatus := fdwStatus;
end;

function AudioInDeviceNameToDeviceID(const ADeviceName: AnsiString): Cardinal;
var
  DevInCaps: TWaveInCaps;
  i: Cardinal;
  s: AnsiString;
begin
  Result := WAVE_MAPPER;
  for i := 0 to waveInGetNumDevs-1 do
  begin
    waveInGetDevCaps(i, @DevInCaps, SizeOf(DevInCaps));
    s := PChar(@DevInCaps.szPname);
    if (s = ADeviceName) then
    begin
      Result := i;
      break;
    end;
  end;
end;

function AudioOutDeviceNameToDeviceID(const ADeviceName: AnsiString): Cardinal;
var
  DevOutCaps: TWaveInCaps;
  i: Cardinal;
  s: AnsiString;
begin
  Result := WAVE_MAPPER;
  for i := 0 to waveOutGetNumDevs-1 do
  begin
    waveOutGetDevCaps(i, @DevOutCaps, SizeOf(DevOutCaps));
    s := PChar(@DevOutCaps.szPname);
    if s = ADeviceName then
    begin
      Result := i;
      break;
    end;
  end;
end;

end.