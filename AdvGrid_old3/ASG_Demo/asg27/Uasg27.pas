unit Uasg27;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpmlinks, AdvGrid, Grids, JPMFontComboBox, StdCtrls, JPMColorComboBox,
  BaseGrid;

type
  TForm1 = class(TForm)
    asg: TAdvStringGrid;
    jpmce: TJPMColorComboBoxEditLink;
    jpmfe: TJPMFontComboBoxEditLink;
    procedure asgGetEditorType(Sender: TObject; aCol,
      aRow: Integer; var aEditor: TEditorType);
    procedure FormCreate(Sender: TObject);
    procedure asgGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.asgGetEditorType(Sender: TObject; aCol,
  aRow: Integer; var aEditor: TEditorType);
begin
 aEditor:=edCustom;
 if odd(acol) then
  asg.EditLink:=JPMFE else asg.EditLink:=JPMCE;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 asg.AutoNumberCol(0);
end;

procedure TForm1.asgGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var
 jpmfc:TJPMColorComboBox;

begin
 if odd(acol) and (asg.Cells[acol,arow]<>'') and (arow>0) then aFont.Name:=asg.Cells[acol,arow];

 if not odd(acol) and (asg.Cells[acol,arow]<>'') and (arow>0) and (acol>0) then
  begin
    jpmfc:=TJPMColorComboBox.Create(self);
    jpmfc.width:=0;
    jpmfc.parent:=self;
    with jpmfc do
     begin
      ItemIndex:=Items.IndexOf(asg.Cells[acol,arow]);
      if ItemIndex>=0 then
       abrush.Color:=TColor(Items.Objects[ItemIndex]);
     end;
    jpmfc.Free;
  end;
end;

end.