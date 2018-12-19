unit Uacg1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, AdvCGrid, Menus, StdCtrls;

type
  TForm1 = class(TForm)
    AdvColumnGrid1: TAdvColumnGrid;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    Sortascending1: TMenuItem;
    Sortdescending1: TMenuItem;
    Setbackgroundcolor1: TMenuItem;
    SetFont1: TMenuItem;
    ColorDialog1: TColorDialog;
    FontDialog1: TFontDialog;
    PopupMenu2: TPopupMenu;
    Showrowindicator1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure AdvColumnGrid1ColumnPopup(Sender: TObject; ACol,
      ARow: Integer; PopupMenu: TPopupMenu);
    procedure Sortascending1Click(Sender: TObject);
    procedure Sortdescending1Click(Sender: TObject);
    procedure Setbackgroundcolor1Click(Sender: TObject);
    procedure SetFont1Click(Sender: TObject);
    procedure Showrowindicator1Click(Sender: TObject);
    procedure AdvColumnGrid1FilterSelect(Sender: TObject; Column,
      ItemIndex: Integer; FriendlyName: String;
      var FilterCondition: String);
  private
    { Private declarations }
  public
    { Public declarations }
    EditColumn: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvColumnGrid1.SaveFixedCells := False;
  AdvColumnGrid1.LoadFromCSV('cars.csv');
  AdvColumnGrid1.AutoSizeColumns(False,10);
end;

procedure TForm1.AdvColumnGrid1ColumnPopup(Sender: TObject; ACol,
  ARow: Integer; PopupMenu: TPopupMenu);
begin
  EditColumn := ACol;
  AdvColumnGrid1.SortSettings.Column := ACol;
end;

procedure TForm1.Sortascending1Click(Sender: TObject);
begin
  AdvColumnGrid1.SortSettings.Direction := sdAscending;
  AdvColumnGrid1.QSort;
end;

procedure TForm1.Sortdescending1Click(Sender: TObject);
begin
  AdvColumnGrid1.SortSettings.Direction := sdDescending;
  AdvColumnGrid1.QSort;
end;

procedure TForm1.Setbackgroundcolor1Click(Sender: TObject);
begin
  ColorDialog1.Color := AdvColumnGrid1.Columns[EditColumn].Color;
  if ColorDialog1.Execute then
    AdvColumnGrid1.Columns[EditColumn].Color := ColorDialog1.Color;
end;

procedure TForm1.SetFont1Click(Sender: TObject);
begin
  FontDialog1.Font.Assign(AdvColumnGrid1.Columns[EditColumn].Font);
  if FontDialog1.Execute then
    AdvColumnGrid1.Columns[EditColumn].Font.Assign(FontDialog1.Font);
end;

procedure TForm1.Showrowindicator1Click(Sender: TObject);
begin
  AdvColumnGrid1.AutoNumberCol(0); 
end;

procedure TForm1.AdvColumnGrid1FilterSelect(Sender: TObject; Column,
  ItemIndex: Integer; FriendlyName: String; var FilterCondition: String);
begin
  if FriendlyName= '[Custom]' then
    InputQuery('Set Filter',FriendlyName,FilterCondition);
end;

end.
