unit MDIDemoChild;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls;

type
  TfrmMDIChild = class(TForm)
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

uses
  FileCtrl, MDIDemoMain;

{$R *.DFM}

procedure TfrmMDIChild.SetFileName(Value: string);
var
  I: Integer;
begin
  FFileName := Value;
  Caption := MinimizeName(FFileName, Canvas, 100);
  with frmMDIMain.dxBarListWindows do
  begin
    I := Items.IndexOfObject(Self);
    if (0 <= I) and (I < Items.Count) then Items[I] := FFileName;
  end;
end;

procedure TfrmMDIChild.FormCreate(Sender: TObject);
begin
  Inc(frmMDIMain.CreatedMDICount);
  Caption := 'Document' + IntToStr(frmMDIMain.CreatedMDICount);
  Editor.OnChange := frmMDIMain.EditorChange;
  Editor.OnSelectionChange := frmMDIMain.EditorSelectionChange;
  frmMDIMain.dxBarListWindows.Items.AddObject(Caption, Self);
  Editor.Modified;

  if frmMDIMain.MDIChildCount = 1 then frmMDIMain.ShowItems(True);
end;

procedure TfrmMDIChild.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if frmMDIMain.FileName <> '' then
    frmMDIMain.dxBarMRUFiles.AddItem(frmMDIMain.FileName, nil);
  Action := caFree;
end;

procedure TfrmMDIChild.FormActivate(Sender: TObject);
begin
  Editor.OnChange(Editor);
end;

procedure TfrmMDIChild.FormDestroy(Sender: TObject);
begin
  with frmMDIMain.dxBarListWindows.Items do
    Delete(IndexOfObject(Self));

  if frmMDIMain.MDIChildCount = 1 then frmMDIMain.ShowItems(False);
end;

procedure TfrmMDIChild.FormCloseQuery(Sender: TObject;
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
      ID_YES: CanClose := frmMDIMain.SaveFile(False);
      ID_NO: CanClose := True;
      ID_CANCEL: CanClose := False;
    end;
  end;
end;

procedure TfrmMDIChild.EditorMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbRight then
    frmMDIMain.dxBarPopupMenu.PopupFromCursorPos;
end;

end.
