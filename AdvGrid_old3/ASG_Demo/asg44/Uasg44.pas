{***************************************************************************}
{ TAdvStringGrid demo application                                           }
{ for Delphi & C++Builder                                                   }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright © 1996-2002                                          }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{***************************************************************************}

unit Uasg44;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ImgList, StdCtrls, ActnList, Menus
{$IFDEF VER140}
  , Variants
{$ENDIF}  
  ;

type
  TForm1 = class(TForm)
    AdvStringGrid1: TAdvStringGrid;
    Edit1: TEdit;
    ActionList1: TActionList;
    Action1: TAction;
    PopupMenu1: TPopupMenu;
    Action11: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure AdvStringGrid1GetDisplText(Sender: TObject; ACol,
      ARow: Integer; var Value: String);
    procedure AdvStringGrid1CellValidate(Sender: TObject; Col,
      Row: Integer; var Value: String; var Valid: Boolean);
    procedure Action1Execute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateSums;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvStringGrid1.RandomFill(false,1000);
  UpdateSums;
end;

procedure TForm1.AdvStringGrid1GetDisplText(Sender: TObject; ACol,
  ARow: Integer; var Value: String);
begin
  if (Arow = AdvStringgrid1.Rowcount - 1) and (ACol > 0) then
    Value := '<b>'+value+'</B>';
end;

procedure TForm1.AdvStringGrid1CellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
begin
  UpdateSums;
end;

procedure TForm1.UpdateSums;
var
  i: Integer;
begin
  for i := 1 to AdvStringGrid1.ColCount  - 1 do
    AdvStringGrid1.Floats[i,AdvStringGrid1.RowCount - 1] :=
      AdvStringGrid1.ColumnSum(i,1,AdvStringGrid1.RowCount - 2);
  AdvStringGrid1.FloatingFooter.Invalidate; 
end;

procedure TForm1.Action1Execute(Sender: TObject);
begin
//*
end;

procedure TForm1.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  edit1.Text := IntToStr(GetTickCount);
end;

end.
