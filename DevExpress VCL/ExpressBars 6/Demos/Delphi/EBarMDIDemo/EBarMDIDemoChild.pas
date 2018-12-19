unit EBarMDIDemoChild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TEBarMDIDemoChildForm = class(TForm)
    Editor: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FFileName: string;
    procedure SetFileName(Value: string);
  public
    property FileName: string read FFileName write SetFileName;
  end;

implementation

uses EBarMDIDemoMain;

{$R *.DFM}

procedure TEBarMDIDemoChildForm.SetFileName(Value: string);
var
  I: Integer;
begin
  FFileName := Value;
  Caption := FFileName;
  with EBarMDIDemoMainForm.dxBarListWindows do
  begin
    I := Items.IndexOfObject(Self);
    if (0 <= I) and (I < Items.Count) then Items[I] := FFileName;
  end;
end;

procedure TEBarMDIDemoChildForm.FormCreate(Sender: TObject);
begin
  Inc(EBarMDIDemoMainForm.CreatedMDICount);
  Caption := 'Document' + IntToStr(EBarMDIDemoMainForm.CreatedMDICount);
  Editor.OnChange := EBarMDIDemoMainForm.EditorChange;
  Editor.OnSelectionChange := EBarMDIDemoMainForm.EditorSelectionChange;
  EBarMDIDemoMainForm.dxBarListWindows.Items.AddObject(Caption, Self);
  Editor.Modified;

  if EBarMDIDemoMainForm.MDIChildCount = 1 then EBarMDIDemoMainForm.ShowItems(True);
end;

procedure TEBarMDIDemoChildForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if EBarMDIDemoMainForm.FileName <> '' then
    EBarMDIDemoMainForm.dxBarMRUFiles.AddItem(EBarMDIDemoMainForm.FileName, nil);
  Action := caFree;
end;

procedure TEBarMDIDemoChildForm.FormActivate(Sender: TObject);
begin
  Editor.OnChange(Editor);
end;

procedure TEBarMDIDemoChildForm.FormDestroy(Sender: TObject);
begin
  with EBarMDIDemoMainForm.dxBarListWindows.Items do
    Delete(IndexOfObject(Self));

  if EBarMDIDemoMainForm.MDIChildCount = 1 then EBarMDIDemoMainForm.ShowItems(False);
end;

procedure TEBarMDIDemoChildForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  Res: Integer;
begin
  if Editor.Modified then
  begin
    Res := Application.MessageBox(
      PChar(Format('Do you want to save the changes you made to "%s"?', [Caption])),
      PChar(Application.Title), MB_ICONQUESTION or MB_YESNOCANCEL);
    case Res of
      ID_YES: CanClose := EBarMDIDemoMainForm.SaveFile(False);
      ID_NO: CanClose := True;
      ID_CANCEL: CanClose := False;
    end;
  end;
end;

procedure TEBarMDIDemoChildForm.EditorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    EBarMDIDemoMainForm.dxBarPopupMenu.PopupFromCursorPos;
end;

end.
