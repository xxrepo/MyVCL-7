unit main;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, Grids, DBGrids, DBTables, ExtCtrls, ComCtrls, StdCtrls,
  DBCtrls, Buttons, ShellAPI, dxdbtrel;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Table1: TTable;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBTreeViewEdit1: TdxDBTreeViewEdit;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    procedure DBTreeViewEdit1CloseUp(Sender: TObject; Accept: Boolean);
    procedure FormCreate(Sender: TObject);
  end;

var
  FMain: TFMain;

implementation

{$R *.DFM}

{Fill TreeNodes}
procedure TFMain.DBTreeViewEdit1CloseUp(Sender: TObject; Accept: Boolean);
Var
  tr : TTreeNode;
begin
  tr := DBTreeViewEdit1.Selected;
  if(Accept) then begin
   Table1.FindField('state').AsString := '';  
    while (tr <> Nil) And (tr.Parent <> Nil) do begin
      tr := tr.Parent;
      if(tr.Level = 1) then
        Table1.FindField('state').AsString := tr.Text;
      if(tr.Level = 0) then
        Table1.FindField('country').AsString := tr.Text;
    end;
  end;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  tr, tr1 : TTreeNode;
begin
  Table1.DisableControls;
  DBTreeViewEdit1.Items.Clear;
  while Not Table1.EOF do begin
    tr := DBTreeViewEdit1.GetTreeNodeByText(Nil, Table1.FindField('country').AsString, False);
    if(tr = Nil) then
      tr := DBTreeViewEdit1.Items.Insert(Nil,Table1.FindField('country').AsString);
    if(Table1.FindField('state').AsString <> '') then begin
      tr1 := DBTreeViewEdit1.GetTreeNodeByText(tr, Table1.FindField('state').AsString, False);
      if(tr1 = Nil) then
        tr1 := DBTreeViewEdit1.Items.AddChild(tr,Table1.FindField('state').AsString);
      tr := tr1;
    end;
    tr1 := DBTreeViewEdit1.GetTreeNodeByText(tr, Table1.FindField('city').AsString, False);
    if(tr1 = Nil) then
      DBTreeViewEdit1.Items.AddChild(tr,Table1.FindField('city').AsString);
    Table1.Next;
  end;
  Table1.First;
  Table1.EnableControls;
  DBTreeViewEdit1.TreeViewSortType := stText;
end;

end.
