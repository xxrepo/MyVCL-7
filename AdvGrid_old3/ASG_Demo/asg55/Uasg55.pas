// MAKE SURE TO ADD FIRST FRMCTRLLINK.PAS TO THE PACKAGE FILE
// IN WHICH TADVSTRINGGRID IS INSTALLED BEFORE OPENING AND RUNNING THIS SAMPLE APP

unit Uasg55;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, AsgLinks, StdCtrls, FileCtrl, FlCtrlEx,
  ExtCtrls, ComCtrls, ImgList, frmctrllink, AdvCombo, ColCombo;

type
  TForm1 = class(TForm)
    AdvStringGrid1: TAdvStringGrid;
    FormControlEditLink1: TFormControlEditLink;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    FormControlEditLink2: TFormControlEditLink;
    DriveComboBox12: TDriveComboBox;
    FormControlEditLink3: TFormControlEditLink;
    ColumnComboBox1: TColumnComboBox;
    DriveComboBox1: TComboBox;
    procedure AdvStringGrid1GetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure FormControlEditLink1GetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLink1SetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure FormControlEditLink2GetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLink2SetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink2SetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
    procedure Panel1Enter(Sender: TObject);
    procedure FormControlEditLink2SetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink1SetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink1SetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormCreate(Sender: TObject);
    procedure FormControlEditLink3GetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; var AValue: String);
    procedure FormControlEditLink3SetEditorFocus(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink3SetEditorProperties(Sender: TObject;
      Grid: TAdvStringGrid; AControl: TWinControl);
    procedure FormControlEditLink3SetEditorValue(Sender: TObject;
      Grid: TAdvStringGrid; AValue: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AdvStringGrid1GetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if ARow in [1,2, 3] then
    AEditor := edCustom;

  if ARow = 1 then
    AdvStringGrid1.EditLink := FormControlEditLink2;
  if ARow = 2 then
    AdvStringGrid1.EditLink := FormControlEditLink1;
  if ARow = 3 then
    AdvStringGrid1.EditLink := FormControlEditLink3;
end;

procedure TForm1.FormControlEditLink1GetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
//  AValue := DriveComboBox1.Text;
end;

procedure TForm1.FormControlEditLink1SetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
//  DriveCombobox1.Text := AValue;
end;

procedure TForm1.FormControlEditLink2GetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  AValue := Edit1.Text + #13 + Edit2.Text;
end;

procedure TForm1.FormControlEditLink2SetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
   Edit1.SetFocus;
end;

procedure TForm1.FormControlEditLink2SetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
begin
  if pos(#13,AValue) > 0 then
  begin
    Edit1.Text := copy(AValue,1,pos(#13,AValue)-1);
    Edit2.Text := copy(AValue,pos(#13,AValue)+1,length(AValue));
  end
  else
  begin
    Edit1.Text := AValue;
    Edit2.Text := '';
  end;  

end;

procedure TForm1.Panel1Enter(Sender: TObject);
begin
  Edit1.SetFocus;
end;

procedure TForm1.FormControlEditLink2SetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  Edit1.SetFocus;
end;

procedure TForm1.FormControlEditLink1SetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.SetFocus;
end;

procedure TForm1.FormControlEditLink1SetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.Height := 200;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvStringGrid1.Cells[1,1] :='Bill'#13'Gates';
end;

procedure TForm1.FormControlEditLink3GetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; var AValue: String);
begin
  AValue := ColumnComboBox1.items[ColumnComboBox1.ItemIndex];
end;

procedure TForm1.FormControlEditLink3SetEditorFocus(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.SetFocus;
end;

procedure TForm1.FormControlEditLink3SetEditorProperties(Sender: TObject;
  Grid: TAdvStringGrid; AControl: TWinControl);
begin
  AControl.Height := 200;
  if odd(AdvStringGrid1.Col) then
    begin
      with ColumnComboBox1.items do
      begin
        Clear;
        AddObject('...', Pointer(0));
        AddObject('Приходная', Pointer(1));
        AddObject('Расходная', Pointer(2));
      end;
    end
    else
    begin
      with ColumnComboBox1.items do
      begin
        Clear;
        AddObject('11', Pointer(0));
        AddObject('22', Pointer(1));
      end;
    end

end;

procedure TForm1.FormControlEditLink3SetEditorValue(Sender: TObject;
  Grid: TAdvStringGrid; AValue: String);
var N : integer;
begin
  N := ColumnComboBox1.items.IndexOf(AValue);
  ColumnComboBox1.ItemIndex := N;
end;

end.
