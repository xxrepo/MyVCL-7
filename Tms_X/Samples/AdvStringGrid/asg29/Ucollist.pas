{*************************************************************************}
{ TAdvStringGrid demo unit                                                }
{                                                                         }
{ written by TMS Software                                                 }
{            copyright © 1998-2015                                        }
{            Email : info@tmssoftware.Com                                 }
{            Web : http://www.tmssoftware.Com                             }
{                                                                         }
{ The source code is given as is. The author is not responsible           }
{ for any possible damage done due to the use of this code.               }
{ The component can be freely used in any application. The complete       }
{ source code remains property of the author and may not be distributed,  }
{ published, given or sold in any form as such. No parts of the source    }
{ code can be included in any other component or application without      }
{ written authorization of the author.                                    }
{*************************************************************************}
unit Ucollist;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BtnListB, AdvGrid;

type
  TFieldChooser = class(TForm)
    ButtonListbox1: TButtonListbox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonListbox1OleDragStart(Sender: TObject;
      DropIndex: Integer);
    procedure ButtonListbox1OleDragStop(Sender: TObject;
      OLEEffect: Integer);
    procedure ButtonListbox1OleDragOver(Sender: TObject;
      var Allow: Boolean);
  private
    { Private declarations }
    colsource: TObject;
    FGrid: TAdvStringGrid;
  public
    { Public declarations }
    property Grid: TAdvStringGrid read FGrid write FGrid;
    procedure MoveToFieldChooser(AColumn: integer);
    procedure RemoveFromFieldChooser(AColumn, ToColumn: integer);
  end;

var
  FieldChooser: TFieldChooser;

implementation

{$R *.DFM}

procedure TFieldChooser.FormCreate(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE or SWP_NOMOVE);
end;

procedure TFieldChooser.MoveToFieldChooser(AColumn: integer);
begin
  ButtonListbox1.AddItem(Grid.Cells[AColumn, 0], TObject(AColumn));
  Grid.SuppressColumn(AColumn);
end;

procedure TFieldChooser.RemoveFromFieldChooser(AColumn, ToColumn: integer);
var
  i,j: integer;
  delta: integer;
begin
  Grid.UnSuppressColumn(AColumn);

  Grid.EnhRowColMove := true;

  if AColumn < ToColumn then
    dec(ToColumn);

  Grid.MoveColumn(AColumn, ToColumn);

  if ToColumn > AColumn then
    delta := -1
  else
    delta := +1;

  for i := 0 to FieldChooser.ButtonListbox1.Items.Count - 1 do
  begin
    j := integer(FieldChooser.ButtonListbox1.Items.Objects[i]);

    if (delta = -1) and (j > AColumn) and (j <= ToColumn) then
    begin
      j := j + delta;
      ButtonListbox1.Items.Objects[i] := TObject(j);
    end;

    if (delta = +1) and (j >= ToColumn) and (j < AColumn) then
    begin
      j := j + delta;
      ButtonListbox1.Items.Objects[i] := TObject(j);
    end;
  end;

  Grid.EnhRowColMove := false;

  ButtonListBox1.Items.Delete(ButtonListBox1.ItemIndex);
end;

procedure TFieldChooser.ButtonListbox1OleDragStart(Sender: TObject;
  DropIndex: Integer);
begin
  colsource := Sender;
end;

procedure TFieldChooser.ButtonListbox1OleDragStop(Sender: TObject;
  OLEEffect: Integer);
begin
  colsource := nil;
end;

procedure TFieldChooser.ButtonListbox1OleDragOver(Sender: TObject;
  var Allow: Boolean);
begin
  Allow := Sender <> ColSource;
end;

end.
