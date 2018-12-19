unit UDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvTreeViewBase, AdvTreeViewData,
  AdvCustomTreeView, AdvTreeView, AdvDirectoryTreeView, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm98 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    AdvDirectoryTreeView1: TAdvDirectoryTreeView;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    OpenDialog1: TOpenDialog;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    Panel3: TPanel;
    Edit2: TEdit;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvDirectoryTreeView1AfterCollapseNode(Sender: TObject;
      ANode: TAdvTreeViewVirtualNode);
    procedure AdvDirectoryTreeView1AfterExpandNode(Sender: TObject;
      ANode: TAdvTreeViewVirtualNode);
    procedure AdvDirectoryTreeView1AfterSelectNode(Sender: TObject;
      ANode: TAdvTreeViewVirtualNode);
    procedure AdvDirectoryTreeView1GetCustomNodeText(Sender: TObject;
      ANode: TAdvTreeViewNode; AColumn: Integer; AFile: string;
      var AText: string);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AutoSizeColumns;
  end;

var
  Form98: TForm98;

implementation

{$R *.dfm}

uses
 {$WARNINGS OFF}
  FileCtrl, ShlObj;
 {$WARNINGS ON}

procedure TForm98.AdvDirectoryTreeView1AfterCollapseNode(Sender: TObject;
  ANode: TAdvTreeViewVirtualNode);
begin
  AutoSizeColumns;
end;

procedure TForm98.AdvDirectoryTreeView1AfterExpandNode(Sender: TObject;
  ANode: TAdvTreeViewVirtualNode);
begin
  AutoSizeColumns;
end;

procedure TForm98.AdvDirectoryTreeView1AfterSelectNode(Sender: TObject;
  ANode: TAdvTreeViewVirtualNode);
begin
  if Assigned(ANode.Node) then
    Edit2.Text := TAdvDirectoryTreeViewNode(ANode.Node).FileName;
end;

procedure TForm98.AdvDirectoryTreeView1GetCustomNodeText(Sender: TObject;
  ANode: TAdvTreeViewNode; AColumn: Integer; AFile: string; var AText: string);
begin
  if AColumn = 2 then
    AText := ExtractFileExt(AFile);
end;

procedure TForm98.AutoSizeColumns;
var
  I: Integer;
begin
  if CheckBox4.Checked then
  begin
    for I := 0 to AdvDirectoryTreeView1.Columns.Count - 1 do
      AdvDirectoryTreeView1.AutoSizeColumn(I);
  end;
end;

procedure TForm98.Button1Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.Filter := Edit1.Text;
end;

procedure TForm98.Button2Click(Sender: TObject);
var
  dir: string;

function GetMyDocuments: string;
var
  r: Boolean;
  path: array[0..Max_Path] of Char;
  begin
    r := ShGetSpecialFolderPath(0, path, CSIDL_Personal, False) ;
    if not r then
      raise Exception.Create('Could not find MyDocuments folder location.') ;

    Result := Path;
  end;
begin
  if SelectDirectory('Select Directory', GetMyDocuments, dir) then
  begin
    Edit2.Text := dir;
    AdvDirectoryTreeView1.LoadDirectory(dir);
    AutoSizeColumns;
  end;
end;

procedure TForm98.CheckBox1Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.Columns[3].Visible := CheckBox1.Checked;
end;

procedure TForm98.CheckBox2Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.Interaction.ColumnSizing := CheckBox2.Checked;
end;

procedure TForm98.CheckBox3Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.ColumnsAppearance.Stretch := CheckBox3.Checked;
end;

procedure TForm98.CheckBox5Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.Columns[2].Visible := CheckBox5.Checked;
end;

procedure TForm98.CheckBox6Click(Sender: TObject);
begin
  AdvDirectoryTreeView1.NodesAppearance.ShowLines := CheckBox6.Checked;
end;

procedure TForm98.FormCreate(Sender: TObject);
begin
  AdvDirectoryTreeView1.Interaction.ColumnAutoSizeOnDblClick := True;
  AdvDirectoryTreeView1.Interaction.ColumnSizing := True;
  AdvDirectoryTreeView1.ClearColumns;
  AdvDirectoryTreeView1.AddColumn(tvckName);
  AdvDirectoryTreeView1.AddColumn(tvckDisplayName);
  AdvDirectoryTreeView1.AddColumn(tvckCreationDate).Visible := False;
  AdvDirectoryTreeView1.AddColumn(tvckModificationDate).Visible := False;
  AdvDirectoryTreeView1.AddColumn(tvckCustom).Text := 'Extension';
  AdvDirectoryTreeView1.AddColumn(tvckFreeSpaceAndTotalSize);
  AdvDirectoryTreeView1.LoadDrives;
  AutoSizeColumns;
end;

end.
