unit GUIDs;

interface

uses SysUtils;

function GenerateBranch: AnsiString;
function GenerateTag: AnsiString;
function NewStrGuid: String;

implementation

function GenerateBranch: AnsiString;
begin
  Result:='z9hG4bK'+Copy(NewStrGuid,1,10);
end;

function GenerateTag: AnsiString;
begin
  Result:=Copy(NewStrGuid,1,9);
end;

function NewStrGuid: String;
var
  G: System.TGUID;
begin
  CreateGUID(G);
  Result := GUIDToString(G);
  Result := copy(Result,2,8)+
             copy(Result,11,4)+
             copy(Result,16,4)+
             copy(Result,21,4)+
             copy(Result,26,12);
end;

end.