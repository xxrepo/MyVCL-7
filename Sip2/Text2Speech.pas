unit Text2Speech;

interface

uses ActiveX, ComObj, SysUtils, Classes;

procedure PlayText(const Text: AnsiString; VoiceIndex: Integer);
procedure Text2Wav(const Text: AnsiString; VoiceIndex: Integer; stm: TMemoryStream; Rate:Integer=0);

implementation

uses Variants;

const
  CLASS_SpVoice: TGUID = '{96749377-3391-11D2-9EE3-00C04F797396}';
  CLASS_SpMemoryStream: TGUID = '{5FB7EF7D-DFF4-468A-B6B7-2FCBD188F994}';
  SAFT8kHz16BitMono = $00000006;
  SAFTCCITT_uLaw_8kHzMono = $00000031;
  SAFTCCITT_ALaw_8kHzMono = $00000029;

type

  SpeechRunState = TOleEnum;
  SpeechDataKeyLocation = TOleEnum;
  SpeechTokenContext = TOleEnum;
  SpeechTokenShellFolder = TOleEnum;
  SpeechAudioFormatType = TOleEnum;
  SpeechStreamSeekPositionType = TOleEnum;
  SpeechVoiceEvents = TOleEnum;
  SpeechVoicePriority = TOleEnum;
  SpeechVoiceSpeakFlags = TOleEnum;

  ISpeechDataKey = interface;
  ISpeechObjectToken = interface;

  ISpeechObjectTokens = interface(IDispatch)
    ['{9285B776-2E7B-4BC0-B53E-580EB6FA967F}']
    function Get_Count: Integer; safecall;
    function Item(Index: Integer): ISpeechObjectToken; safecall;
    function Get__NewEnum: IUnknown; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

  ISpeechObjectTokenCategory = interface(IDispatch)
    ['{CA7EAC50-2D01-4145-86D4-5AE7D70F4469}']
    function Get_Id: WideString; safecall;
    procedure Set_Default(const TokenId: WideString); safecall;
    function Get_Default: WideString; safecall;
    procedure SetId(const Id: WideString; CreateIfNotExist: WordBool); safecall;
    function GetDataKey(Location: SpeechDataKeyLocation): ISpeechDataKey; safecall;
    function EnumerateTokens(const RequiredAttributes: WideString;
                             const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    property Id: WideString read Get_Id;
    property Default: WideString read Get_Default write Set_Default;
  end;

  ISpeechDataKey = interface(IDispatch)
    ['{CE17C09B-4EFA-44D5-A4C9-59D9585AB0CD}']
    procedure SetBinaryValue(const ValueName: WideString; Value: OleVariant); safecall;
    function GetBinaryValue(const ValueName: WideString): OleVariant; safecall;
    procedure SetStringValue(const ValueName: WideString; const Value: WideString); safecall;
    function GetStringValue(const ValueName: WideString): WideString; safecall;
    procedure SetLongValue(const ValueName: WideString; Value: Integer); safecall;
    function GetLongValue(const ValueName: WideString): Integer; safecall;
    function OpenKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    function CreateKey(const SubKeyName: WideString): ISpeechDataKey; safecall;
    procedure DeleteKey(const SubKeyName: WideString); safecall;
    procedure DeleteValue(const ValueName: WideString); safecall;
    function EnumKeys(Index: Integer): WideString; safecall;
    function EnumValues(Index: Integer): WideString; safecall;
  end;

  ISpeechObjectToken = interface(IDispatch)
    ['{C74A3ADC-B727-4500-A84A-B526721C8B8C}']
    function Get_Id: WideString; safecall;
    function Get_DataKey: ISpeechDataKey; safecall;
    function Get_Category: ISpeechObjectTokenCategory; safecall;
    function GetDescription(Locale: Integer): WideString; safecall;
    procedure SetId(const Id: WideString; const CategoryID: WideString; CreateIfNotExist: WordBool); safecall;
    function GetAttribute(const AttributeName: WideString): WideString; safecall;
    function CreateInstance(const pUnkOuter: IUnknown; ClsContext: SpeechTokenContext): IUnknown; safecall;
    procedure Remove(const ObjectStorageCLSID: WideString); safecall;
    function GetStorageFileName(const ObjectStorageCLSID: WideString; const KeyName: WideString;
                                const FileName: WideString; Folder: SpeechTokenShellFolder): WideString; safecall;
    procedure RemoveStorageFileName(const ObjectStorageCLSID: WideString;
                                    const KeyName: WideString; DeleteFile: WordBool); safecall;
    function IsUISupported(const TypeOfUI: WideString; var ExtraData: OleVariant;
                           const Object_: IUnknown): WordBool; safecall;
    procedure DisplayUI(hWnd: Integer; const Title: WideString; const TypeOfUI: WideString;
                        var ExtraData: OleVariant; const Object_: IUnknown); safecall;
    function MatchesAttributes(const Attributes: WideString): WordBool; safecall;
    property Id: WideString read Get_Id;
    property DataKey: ISpeechDataKey read Get_DataKey;
    property Category: ISpeechObjectTokenCategory read Get_Category;
  end;

  ISpeechVoiceStatus = interface(IDispatch)
    ['{8BE47B07-57F6-11D2-9EEE-00C04F797396}']
    function Get_CurrentStreamNumber: Integer; safecall;
    function Get_LastStreamNumberQueued: Integer; safecall;
    function Get_LastHResult: Integer; safecall;
    function Get_RunningState: SpeechRunState; safecall;
    function Get_InputWordPosition: Integer; safecall;
    function Get_InputWordLength: Integer; safecall;
    function Get_InputSentencePosition: Integer; safecall;
    function Get_InputSentenceLength: Integer; safecall;
    function Get_LastBookmark: WideString; safecall;
    function Get_LastBookmarkId: Integer; safecall;
    function Get_PhonemeId: Smallint; safecall;
    function Get_VisemeId: Smallint; safecall;
    property CurrentStreamNumber: Integer read Get_CurrentStreamNumber;
    property LastStreamNumberQueued: Integer read Get_LastStreamNumberQueued;
    property LastHResult: Integer read Get_LastHResult;
    property RunningState: SpeechRunState read Get_RunningState;
    property InputWordPosition: Integer read Get_InputWordPosition;
    property InputWordLength: Integer read Get_InputWordLength;
    property InputSentencePosition: Integer read Get_InputSentencePosition;
    property InputSentenceLength: Integer read Get_InputSentenceLength;
    property LastBookmark: WideString read Get_LastBookmark;
    property LastBookmarkId: Integer read Get_LastBookmarkId;
    property PhonemeId: Smallint read Get_PhonemeId;
    property VisemeId: Smallint read Get_VisemeId;
  end;

  ISpeechWaveFormatEx = interface(IDispatch)
    ['{7A1EF0D5-1581-4741-88E4-209A49F11A10}']
    function Get_FormatTag: Smallint; safecall;
    procedure Set_FormatTag(FormatTag: Smallint); safecall;
    function Get_Channels: Smallint; safecall;
    procedure Set_Channels(Channels: Smallint); safecall;
    function Get_SamplesPerSec: Integer; safecall;
    procedure Set_SamplesPerSec(SamplesPerSec: Integer); safecall;
    function Get_AvgBytesPerSec: Integer; safecall;
    procedure Set_AvgBytesPerSec(AvgBytesPerSec: Integer); safecall;
    function Get_BlockAlign: Smallint; safecall;
    procedure Set_BlockAlign(BlockAlign: Smallint); safecall;
    function Get_BitsPerSample: Smallint; safecall;
    procedure Set_BitsPerSample(BitsPerSample: Smallint); safecall;
    function Get_ExtraData: OleVariant; safecall;
    procedure Set_ExtraData(ExtraData: OleVariant); safecall;
    property FormatTag: Smallint read Get_FormatTag write Set_FormatTag;
    property Channels: Smallint read Get_Channels write Set_Channels;
    property SamplesPerSec: Integer read Get_SamplesPerSec write Set_SamplesPerSec;
    property AvgBytesPerSec: Integer read Get_AvgBytesPerSec write Set_AvgBytesPerSec;
    property BlockAlign: Smallint read Get_BlockAlign write Set_BlockAlign;
    property BitsPerSample: Smallint read Get_BitsPerSample write Set_BitsPerSample;
    property ExtraData: OleVariant read Get_ExtraData write Set_ExtraData;
  end;

  ISpeechAudioFormat = interface(IDispatch)
    ['{E6E9C590-3E18-40E3-8299-061F98BDE7C7}']
    function Get_type_: SpeechAudioFormatType; safecall;
    procedure Set_type_(AudioFormat: SpeechAudioFormatType); safecall;
    function Get_Guid: WideString; safecall;
    procedure Set_Guid(const Guid: WideString); safecall;
    function GetWaveFormatEx: ISpeechWaveFormatEx; safecall;
    procedure SetWaveFormatEx(const WaveFormatEx: ISpeechWaveFormatEx); safecall;
    property type_: SpeechAudioFormatType read Get_type_ write Set_type_;
    property Guid: WideString read Get_Guid write Set_Guid;
  end;

  ISpeechBaseStream = interface(IDispatch)
    ['{6450336F-7D49-4CED-8097-49D6DEE37294}']
    function Get_Format: ISpeechAudioFormat; safecall;
    procedure _Set_Format(const AudioFormat: ISpeechAudioFormat); safecall;
    function Read(out Buffer: OleVariant; NumberOfBytes: Integer): Integer; safecall;
    function Write(Buffer: OleVariant): Integer; safecall;
    function Seek(Position: OleVariant; Origin: SpeechStreamSeekPositionType): OleVariant; safecall;
    property Format: ISpeechAudioFormat read Get_Format write _Set_Format;
  end;

  ISpeechVoice = interface(IDispatch)
    ['{269316D8-57BD-11D2-9EEE-00C04F797396}']
    function Get_Status: ISpeechVoiceStatus; safecall;
    function Get_Voice: ISpeechObjectToken; safecall;
    procedure _Set_Voice(const Voice: ISpeechObjectToken); safecall;
    function Get_AudioOutput: ISpeechObjectToken; safecall;
    procedure _Set_AudioOutput(const AudioOutput: ISpeechObjectToken); safecall;
    function Get_AudioOutputStream: ISpeechBaseStream; safecall;
    procedure _Set_AudioOutputStream(const AudioOutputStream: ISpeechBaseStream); safecall;
    function Get_Rate: Integer; safecall;
    procedure Set_Rate(Rate: Integer); safecall;
    function Get_Volume: Integer; safecall;
    procedure Set_Volume(Volume: Integer); safecall;
    procedure Set_AllowAudioOutputFormatChangesOnNextSet(Allow: WordBool); safecall;
    function Get_AllowAudioOutputFormatChangesOnNextSet: WordBool; safecall;
    function Get_EventInterests: SpeechVoiceEvents; safecall;
    procedure Set_EventInterests(EventInterestFlags: SpeechVoiceEvents); safecall;
    procedure Set_Priority(Priority: SpeechVoicePriority); safecall;
    function Get_Priority: SpeechVoicePriority; safecall;
    procedure Set_AlertBoundary(Boundary: SpeechVoiceEvents); safecall;
    function Get_AlertBoundary: SpeechVoiceEvents; safecall;
    procedure Set_SynchronousSpeakTimeout(msTimeout: Integer); safecall;
    function Get_SynchronousSpeakTimeout: Integer; safecall;
    function Speak(const Text: WideString; Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    function SpeakStream(const Stream: ISpeechBaseStream; Flags: SpeechVoiceSpeakFlags): Integer; safecall;
    procedure Pause; safecall;
    procedure Resume; safecall;
    function Skip(const Type_: WideString; NumItems: Integer): Integer; safecall;
    function GetVoices(const RequiredAttributes: WideString; const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function GetAudioOutputs(const RequiredAttributes: WideString;
                             const OptionalAttributes: WideString): ISpeechObjectTokens; safecall;
    function WaitUntilDone(msTimeout: Integer): WordBool; safecall;
    function SpeakCompleteEvent: Integer; safecall;
    function IsUISupported(const TypeOfUI: WideString; var ExtraData: OleVariant): WordBool; safecall;
    procedure DisplayUI(hWndParent: Integer; const Title: WideString; const TypeOfUI: WideString;
                        var ExtraData: OleVariant); safecall;
    property Status: ISpeechVoiceStatus read Get_Status;
    property Voice: ISpeechObjectToken read Get_Voice write _Set_Voice;
    property AudioOutput: ISpeechObjectToken read Get_AudioOutput write _Set_AudioOutput;
    property AudioOutputStream: ISpeechBaseStream read Get_AudioOutputStream write _Set_AudioOutputStream;
    property Rate: Integer read Get_Rate write Set_Rate;
    property Volume: Integer read Get_Volume write Set_Volume;
    property AllowAudioOutputFormatChangesOnNextSet: WordBool read Get_AllowAudioOutputFormatChangesOnNextSet write Set_AllowAudioOutputFormatChangesOnNextSet;
    property EventInterests: SpeechVoiceEvents read Get_EventInterests write Set_EventInterests;
    property Priority: SpeechVoicePriority read Get_Priority write Set_Priority;
    property AlertBoundary: SpeechVoiceEvents read Get_AlertBoundary write Set_AlertBoundary;
    property SynchronousSpeakTimeout: Integer read Get_SynchronousSpeakTimeout write Set_SynchronousSpeakTimeout;
  end;

procedure PlayText(const Text: AnsiString; VoiceIndex: Integer);
var
  voice: ISpeechVoice;
  WideText: WideString;
begin
  voice := CreateComObject(CLASS_SpVoice) as ISpeechVoice;
  voice.Voice := voice.GetVoices('','').Item(VoiceIndex);
  WideText := Text;
  voice.Speak(WideText, 0);
end;

procedure Text2Wav(const Text: AnsiString; VoiceIndex: Integer; stm: TMemoryStream; Rate:Integer=0);
var
  voice: ISpeechVoice;
  stream: ISpeechBaseStream;
  ole: OleVariant;
  i, size: Integer;
  b: Byte;
  WideText: WideString;
begin
  try
    voice := CreateComObject(CLASS_SpVoice) as ISpeechVoice;
    stream := CreateComObject(CLASS_SpMemoryStream) as ISpeechBaseStream;
    voice.AudioOutputStream := stream;
    voice.AllowAudioOutputFormatChangesOnNextSet := False;
    voice.AudioOutputStream.Format.Type_ := SAFT8kHz16BitMono; //SAFTCCITT_ALaw_8kHzMono;
    voice.AudioOutputStream := voice.AudioOutputStream;
    voice.Voice := voice.GetVoices('','').Item(VoiceIndex);
    voice.Rate := Rate;
    WideText := Text;
    voice.Speak(WideText, 0);
    size := stream.Seek(0, 2);
    if size > 0 then
    begin
      stream.Seek(0, 0);
      stream.Read(ole, size);
      for i := 0 to size - 1 do
      begin
        b := ole[i];
        stm.Write(b, 1);
      end;
      stm.Position := 0;
    end;
  except
    on E: Exception do;
  end;
end;

end.
