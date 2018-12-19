unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, E_StgStr, ActiveX, ComObj, AxCtrls ;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    function ReadStream(const aStreamName : String) : AnsiString ;
  public
    TreeStorage  : TStructuredStorage;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

const
     ID_Subject     = '__substg1.0_0037' ;
     ID_RecvByName  = '__substg1.0_0040' ;
     ID_Topic       = '__substg1.0_0070' ;
     ID_SenderName  = '__substg1.0_0C1A' ;
     ID_SenderEmail = '__substg1.0_0C1F' ;
     ID_Body        = '__substg1.0_1000' ;

function TForm2.ReadStream(const aStreamName : String) : AnsiString ;
var
   Stream : IStream ;
   OleStream : TOleStream;
begin
     Result := '' ;

     if not TreeStorage.OpenStream(TreeStorage.StorageFile, aStreamName,
                                   STGM_DIRECT OR STGM_READ OR STGM_SHARE_EXCLUSIVE, Stream)
      then Exit ;

     try
        OleStream := TOleStream.Create(Stream);
        try
           SetLength(Result, OleStream.Size) ;
           OleStream.ReadBuffer(Result[1], OleStream.Size);
        finally
          TreeStorage.DoneStream(Stream);
          OleStream.Free ;
        end ;
     finally
       Stream := Nil ;
     end ;
end ;

procedure TForm2.Button1Click(Sender: TObject);
var
   Storage  : IStorage;
   FileName : String ;
   Enum     : IEnumStatStg;
   Data     : TStatStg;
   Str      : String ;
begin
     Memo1.Lines.Clear ;
     FileName := ExtractFilePath(Application.ExeName)+'1.msg' ;
     TreeStorage := TStructuredStorage.Create;
     try
        if not TreeStorage.IsStorageFile(FileName) then Exit ;

        if not TreeStorage.OpenStorageFile(FileName,STGM_DIRECT OR STGM_READ OR
                                           STGM_SHARE_DENY_WRITE) then Exit ;

        { собираем все потоки в файле }
        OleCheck (TreeStorage.StorageFile.EnumElements (0,nil,0,Enum));
        try
           while Enum.Next(1,Data,nil) = S_Ok do
            begin
                 if Data.cbSize = 0 then Continue ;

                 Str := Data.pwcsName ;
                 if Pos(ID_Subject,Str) > 0 then
                  begin
                       Memo1.Lines.Add('Subject: '+ReadStream(Str)) ;
                  end else
                 if Pos(ID_RecvByName,Str) > 0 then
                  begin
                       Memo1.Lines.Add('RecvByName: '+ReadStream(Str)) ;
                  end else
                 if Pos(ID_Topic,Str) > 0 then
                  begin
                       Memo1.Lines.Add('Topic: '+ReadStream(Str)) ;
                  end else
                 if Pos(ID_SenderName,Str) > 0 then
                  begin
                       Memo1.Lines.Add('SenderName: '+ReadStream(Str)) ;
                  end else
                 if Pos(ID_SenderEmail,Str) > 0 then
                  begin
                       Memo1.Lines.Add('SenderEmail: '+ReadStream(Str)) ;
                  end else
                 if Pos(ID_Body,Str) > 0 then
                  begin
                       Memo1.Lines.Add('Body: '+ReadStream(Str)) ;
                  end ;
            end ;
        finally
          Enum:= nil;
        end;
  finally
    TreeStorage.Free;
  end;
end;

end.
