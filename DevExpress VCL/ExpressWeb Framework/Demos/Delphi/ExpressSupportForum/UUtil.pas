unit UUtil;

interface

const
  ItemIdParametrName = 'ReportId';
  ProjectIdParametrName = 'ProjectId';
  UserIdParametrName = 'UserId';

type
  PMenuItem = ^TMenuItem;
  TMenuItem = record
    Caption: string;
    Url: string;
  end;

function Chop(ASource: string; ANumber: Integer): string;

function DecodePlatform(APlatform: Integer): string;
function DecodeVersion(AVersion: Integer): string;

function FormatHTML(const AText: string): string;
function Split(const AText: string): string;

implementation

uses
  Math, StrUtils, Classes, cxWebUtils;

function Chop(ASource: string; ANumber: Integer): string;
begin
  Result := Copy(ASource, 1, Length(ASource) - ANumber);
end;

function DecodePlatform(APlatform: Integer): string;
const
  arPlatforms: array[0..5] of string = ('Win95 ', ' Win98 ', ' WinNT ', ' Win2000 ', ' WinME ', ' WinXP ');
var
  I: Integer;
  Exp: Integer;
begin
  for I := Low(arPlatforms) to High(arPlatforms) do
  begin
    Exp := Trunc(Power(2, I));
    if (APlatform and Exp) = Exp then
	    Result := Result + arPlatforms[I];
  end;
end;

function DecodeVersion(AVersion: Integer): string;
const
  arVersions: array[0..25] of string = ('D1 ', ' D2 ', ' D3 ', ' D4 ', ' CB1 ', ' CB3 ', ' CB4 ',
    ' D5 ', ' CB5 ', ' VB5 ', ' VB6 ', ' VC5 ', ' VC6 ', ' Visual InterDev 6 ', ' IE ', ' MS Access 97 ',
    ' MS Access 2000 ', ' D6 ', ' MS Access 2002 ', ' C++.NET ', ' C#.NET ', ' VB.NET ', ' JS.NET ',
    ' FP.NET ', ' ASP.NET ', ' CB6 ');
var
  I: Integer;
  Exp: Integer;
begin
  for I := Low(arVersions) to High(arVersions) do
  begin
    Exp := Trunc(Power(2, I));
    if (AVersion and Exp) = Exp then
	    Result := Result + arVersions[I];
  end;
end;

function FormatHTML(const AText: string): string;
begin
  Result := AnsiReplaceText(AText, ' ', '&nbsp;');
  Result := AnsiReplaceText(Result, '<', '&lt;');
  Result := AnsiReplaceText(Result, #13, '<br>');
end;
{
function FindPos(const AText, ASub: string; APos: Integer): Integer;
var
  I: Integer;
begin
  I := Pos(ASub, AText);
  if (I = 0) or (APos = 1) then
    Result := I
  else
    Result := I + FindPos(Copy(AText, I + 1, Length(AText)), ASub, APos - 1);
end;

function Split(const AText: string): string;
var
  I: Integer;
begin
  I := FindPos(AText, ' ', 15);
  if I = 0 then
    Result := AText
  else
    Result := Copy(AText, 1, I) + #10#13 + Split(Copy(AText, I + 1, Length(AText)));
end;
}
function Split(const AText: string): string;
const
  SkipChars = 1024;
var
  AStream: TStringStream;
  AParser: TcxParser;
begin
  AStream := TStringStream.Create(AText);
  AParser := TcxParser.Create(AStream);
  Result := '';
  try
    with AParser do
    begin
      SkipUntilNextToken(' ');
      while not IsEOF do
      begin
        if (OutStringLength > SkipChars) then
        begin
          Result := Result + OutString  + #10+ #13;
          ResetOutput;
        end else NextToken;
        SkipUntilNextToken(' ');
      end;
      Result := Result + OutString;
    end;
  finally
    AParser.Free;
    AStream.Free;
  end;
end;


end.
