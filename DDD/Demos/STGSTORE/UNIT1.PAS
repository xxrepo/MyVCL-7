unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ActiveX;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
function StrToUniCode(    S       : string;
                       Var NewSize : Integer): PWideChar;
Var
    Size : Integer;
    P    : PWideChar;
begin
  Size := Length(S);
  NewSize := Size * 2;
  P := VirtualAlloc(nil, Size, Mem_Commit, Page_ReadWrite);
  MultiByteToWideChar(CP_ACP, 0, PChar(S), Size, P, NewSize);
  Result := P;
end;
procedure TForm1.FormShow(Sender: TObject);
Var
   Hr     : HResult;
   PSize  : Integer;
    P     : PWideChar;
    StorageFile : IStorage;
begin
  OleInitialize(Nil);
  P:=StrToUniCode('C:\TEMP\TStorage.tmp',PSize);
  Hr:=StgCreateDocFile(P,STGM_DIRECT OR STGM_CREATE OR STGM_WRITE
                         OR STGM_SHARE_EXCLUSIVE,0,StorageFile);
  If Hr=S_OK then
  begin
    StorageFile._Release;
  end;
  Caption:='Fred';
{  VirtualFree(P,PSize,MEM_RELEASE);}
  OleUnInitialize;
end;

end.
