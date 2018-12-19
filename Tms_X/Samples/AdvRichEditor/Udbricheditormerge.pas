unit Udbricheditormerge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvScrollControl, AdvRichEditorBase, AdvRichEditor, DBAdvRichEditor,
  Grids, DBGrids, AdvToolBar, AdvToolBarExt, AdvRichEditorToolBar, StdCtrls, DB,
  ADODB, AdvAppStyler, AdvToolBarStylers;

type
  TForm1 = class(TForm)
    DBAdvRichEditor1: TDBAdvRichEditor;
    AdvRichEditorFormatToolBar1: TAdvRichEditorFormatToolBar;
    DBGrid1: TDBGrid;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    AdvFormStyler1: TAdvFormStyler;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    Button3: TButton;
    AdvRichEditorEditToolBar1: TAdvRichEditorEditToolBar;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  DBAdvRichEditor1.SetSelectionMergeField(combobox1.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  dbadvricheditor1.MergeSource := DataSource1;
  dbadvricheditor1.Merge;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
dbadvricheditor1.UnMerge;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
  adotable1.Active := true;

  for i := 0 to adotable1.FieldCount - 1 do
  begin
    combobox1.Items.Add(adotable1.Fields[i].FieldName);
    combobox1.ItemIndex := 0;
  end;

  dbadvricheditor1.LoadFromFile('.\mergedemo.rte');
end;

end.
