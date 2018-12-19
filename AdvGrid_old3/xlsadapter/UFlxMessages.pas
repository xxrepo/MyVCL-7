unit UFlxMessages;
{$IFDEF LINUX}{$INCLUDE ../FLXCONFIG.INC}{$ELSE}{$INCLUDE ..\FLXCONFIG.INC}{$ENDIF}


interface
uses {$IFDEF FLX_VCL} Windows, {$ENDIF}
     {$IFDEF ConditionalExpressions}{$if CompilerVersion >= 14} variants, varutils, {$IFEND}{$ENDIF} //Delphi 6 or above
     {$IFNDEF ConditionalExpressions}ActiveX,{$ENDIF} //Delphi 5
     Classes, SysUtils;


{$IFDEF BCB}
const
  VAR_LOCALE_USER_DEFAULT = $400;
{$ENDIF}

resourcestring
  FieldStr='##';
  DataSetStr='__';
  VarStr='#.';
  ExtrasDelim='...';
  MarkedRowStr='...delete row...';  //Remember to change ExtrasDelim if changing this
  HPageBreakStr='...page break...'; //Remember to change ExtrasDelim if changing this
  FullDataSetStr='*';
  MainTxt='MAIN'; //This is not strictly necessary... just for checking the template
  RecordCountPrefix='RC_';

  DefaultDateTimeFormat='mm/dd/yyyy hh:mm';

  FlexCelVersion='2.6.4';
{$IFDEF SPANISH}
  {$INCLUDE FlxSpanish.inc}
{$ELSE}
{$IFDEF FRENCH}
  {$INCLUDE FlxFrench.inc}
{$ELSE}
{$IFDEF ITALIAN}
  {$INCLUDE FlxItalian.inc}
{$ELSE}
{$IFDEF ROMANIAN}
  {$INCLUDE FlxRomanian.inc}
{$ELSE}
{$IFDEF PORTUGUESEBR}
  {$INCLUDE FlxPortugueseBR.inc}
{$ELSE}
{$IFDEF CHINESE}
  {$INCLUDE FlxChinese.inc}
{$ELSE}
{$IFDEF RUSSIAN}
  {$INCLUDE FlxRussian.inc}
{$ELSE}
{$IFDEF GERMAN}
  {$INCLUDE FlxGerman.inc}
{$ELSE}
  {$INCLUDE FlxEnglish.inc}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}


  xls_Emf='EMF';
  xls_Wmf='WMF';
  xls_Jpeg='JPEG';
  xls_Png='PNG';

  FlexCelTempPrefix = 'flx';

type
  TClientAnchor= packed record
    Flag,
    Col1, Dx1, Row1, Dy1,
    Col2, Dx2, Row2, Dy2: word;
  end;
  PClientAnchor = ^TClientAnchor;

  WidestringArray=array of widestring;

const
  DefColWidthAdapt: integer=290; //256;
var
  ColMult:extended=36.6;
  RowMult:extended=15;


type
  TColorPaletteRange=1..56;

  TXlsCellRange=record
    Left, Top, Right, Bottom: integer;
  end;

  TXlsMargins=record
    Left, Top, Right, Bottom: extended;
    Header, Footer: extended;
  end;

type
  TOnGetFileNameEvent  = procedure (Sender: TObject; const  FileFormat: integer; var Filename: TFileName) of object;
  TOnGetOutStreamEvent = procedure (Sender: TObject; const  FileFormat: integer; var OutStream: TStream) of object;

  TXlsImgTypes = (xli_Emf, xli_Wmf, xli_Jpeg, xli_Png, xli_Bmp, xli_Unknown);

  VariantArray=Array [0..maxint div sizeof(Variant)-1]of variant;
  ArrayOfVariant=Array of Variant;

  TXlsCellValue= record
    Value: variant;
    XF: integer;
    IsFormula: boolean;
  end;

  TFlxAnchorType=(at_MoveAndResize, at_MoveAndDontResize, at_DontMoveAndDontResize);

  TImageProperties=record
    Col1, dx1, Row1, dy1, Col2, dx2, Row2, dy2:integer;
    FileName: widestring;  //Not really needed to set.
  end;


  function SearchPathStr(const AFileName: String): String;
  {$IFDEF  VER130}
  function IncludeTrailingPathDelimiter(const S: string): string;
  function VarIsClear(const v: variant): boolean;
  {$ENDIF}

  function StringReplaceSkipQuotes(const S, OldPattern, NewPattern: widestring): widestring;
  function FlxTryStrToDateTime(const S: widestring; out Value: TDateTime; var dFormat: widestring; var HasDate, HasTime: boolean; const DateFormat: widestring=''; const TimeFormat: widestring=''): Boolean;

implementation
{$IFDEF FLX_VCL}
function SearchPathStr(const AFileName: String): String;
var
  FilePart: PChar;
begin
  SetLength(Result, MAX_PATH + 1);

  if SearchPath(nil, PChar(AFileName), '.xls',
                MAX_PATH, PChar(Result), FilePart) <> 0 then
  begin
    SetLength(Result, Length(PChar(Result)));
  end
  else
    Raise Exception.CreateFmt(ErrCantFindFile,[AFileName]);
end; // SearchRecStr
{$ELSE}
function SearchPathStr(const AFileName: String): String;
begin
  //We dont search for templates in linux
  if not FileExists(AFileName) then Raise Exception.CreateFmt(ErrCantFindFile,[AFileName]);
  Result:=AFileName;
end; // SearchRecStr
{$ENDIF}

{$IFDEF  VER130}
function IncludeTrailingPathDelimiter(const S: string): string;
begin
  Result:=IncludeTrailingBackslash(s);
end;

function VarIsClear(const v: variant): boolean;
begin
  Result:=VarIsNull(v);
end;
{$ENDIF}

//Defined as there is not posex on d5
function PosEx(const SubStr, S: string; Offset: Cardinal): Integer;
var
  i,k: integer;
  Equal: boolean;
begin
  i:= Offset;
  Result:=-1;

  while i<=Length(s)-Length(SubStr)+1 do
  begin
    if s[i]=Substr[1] then
    begin
      Equal:=true;
      for k:=2 to Length(Substr) do if s[i+k-1]<>Substr[k] then
      begin
        Equal:=false;
        break;
      end;
      if Equal then
      begin
        Result:=i;
        exit;
      end;
    end;
    inc(i);
  end;
end;
function StringReplaceSkipQuotes(const S, OldPattern, NewPattern: widestring): widestring;
var
  SearchStr, Patt: widestring;
  i,k,z: Integer;
  InQuote: boolean;
begin
  SearchStr := UpperCase(S);
  Patt := UpperCase(OldPattern);

  SetLength(Result, Length(SearchStr)*2);
  InQuote:=false;

  i:=1;k:=1;
  while i<= Length(SearchStr) do
  begin
    if SearchStr[i]='"' then InQuote:= not InQuote;
    if not InQuote and (PosEx(Patt,SearchStr,i)=i) then
    begin
       if k+Length(NewPattern)-1>Length(Result) then SetLength(Result, k+Length(NewPattern)+100);
     for z:=1 to Length(NewPattern) do Result[z+k-1]:=NewPattern[z];
      inc(k, Length(NewPattern));
      inc(i, Length(Patt));
    end else
    begin
      if k>Length(Result) then SetLength(Result, k+100);
      Result[k]:=s[i];
      inc(i);
      inc(k);
    end;
  end;

  SetLength(Result, k-1);
end;


function FlxTryStrToDateTime(const s:widestring; out Value: TDateTime; var dFormat: Widestring; var HasDate, HasTime: boolean; const DateFormat: widestring=''; const TimeFormat: widestring=''): Boolean;
var
  LResult: HResult;
  aDateFormat, aTimeFormat: widestring;
  {$IFNDEF ConditionalExpressions} //Delphi 5
    v1: olevariant;
  {$ENDIF}
begin
  if DateFormat='' then aDateFormat:=ShortDateFormat else aDateFormat:=DateFormat;
  if TimeFormat='' then aTimeFormat:=ShortTimeFormat else aTimeFormat:=TimeFormat;
  aTimeFormat:=StringReplaceSkipQuotes(aTimeFormat,'AMPM','AM/PM'); //Format AMPM is not recognized by Excel. This is harcoded on sysutils
  {$IFNDEF ConditionalExpressions} //Delphi 5
    LResult:=VariantChangeType(v1, s, 0, varDate);
    Value:=v1;
  {$ELSE}
    LResult := VarDateFromStr(S, VAR_LOCALE_USER_DEFAULT, 0, Value);
  {$ENDIF}

  Result:=LResult = 0;  //VAR_OK doesnt work on D5;

  //We have a problem with the german date separator "." and a.m. or p.m.
  //so we cant just test for a "." inside a formula to know it includes a date.
  HasDate:=(pos('.', s)>0) or (pos('/',s)>0) or (pos('-',s)>0)   //hate to hard-code this values, but I see not other viable way
          or (pos(DateSeparator, s)>0);
  HasDate:= HasDate and (Trunc(Value)>0);
  HasTime:=(pos(':',s)>0) or (pos(TimeSeparator, s)>0);    //Again... hard-coding :-( At least is isolated here

  dFormat:='';
  if HasDate then dFormat:=dFormat+aDateFormat;
  if HasTime then
  begin
    if dFormat<>'' then dFormat:=dFormat+' ';
    dFormat:=dFormat+aTimeFormat;
  end;

end;


end.







