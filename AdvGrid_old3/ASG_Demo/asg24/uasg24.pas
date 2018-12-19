{***************************************************************************}
{ TAdvStringGrid demo application                                           }
{                                                                           }
{ written by TMS Software                                                   }
{            copyright © 1996-2002                                          }
{            Email : info@tmssoftware.com                                   }
{            Web : http://www.tmssoftware.com                               }
{                                                                           }
{***************************************************************************}

unit uasg24;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, AdvGrid, AdvEdit, StdCtrls, ExtCtrls, ComCtrls, CListEd,
  CheckLst, AsgLinks, MoneyEdit, ImgList, ImagePicker, BaseGrid, AsgMemo,
  AdvCombo, ColCombo, AdvGridExcel, ParamListbox, ccedlink, LayeredForm,
  frmshape, Db;

type
  TForm1 = class(TForm)
    AdvStringGrid1: TAdvStringGrid;
    el1: TAdvEditEditLink;
    el2: TColorComboEditLink;
    el3: TMemoEditLink;
    el5: TCheckEditLink;
    el4: TMoneyEditLink;
    ImageList1: TImageList;
    el6: TImagePickerEditLink;
    AdvGridUndoRedo1: TAdvGridUndoRedo;
    AdvGridExcelIO1: TAdvGridExcelIO;
    ColumnComboEditLink1: TColumnComboEditLink;
    Button1: TButton;
    Button2: TButton;
    ColumnComboEditLink2: TColumnComboEditLink;
    Button3: TButton;
    procedure AdvStringGrid1GetEditorType(Sender: TObject; aCol,
      aRow: Integer; var aEditor: TEditorType);
    procedure FormCreate(Sender: TObject);
    procedure AdvStringGrid1GetEditorProp(Sender: TObject; aCol,
      aRow: Integer; aEditLink: TEditLink);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
      AItemIndex: Integer; ASelection: String);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.AdvStringGrid1GetEditorType(Sender: TObject; aCol,
  aRow: Integer; var aEditor: TEditorType);
begin
 if acol=2 then advstringgrid1.EditLink:=el1;
 if acol=3 then advstringgrid1.EditLink:=el2;
 if acol=4 then advstringgrid1.EditLink:=el3;
 if acol=5 then advstringgrid1.EditLink:=el4;
 if acol=6 then advstringgrid1.EditLink:=el5;
 if acol=7 then advstringgrid1.EditLink:=el6;
 if acol=8 then
   advstringgrid1.EditLink:=ColumnComboEditLink1;
 if acol=9 then
   advstringgrid1.EditLink:=ColumnComboEditLink2;

 if acol in [2,3,4,5,6,7, 8, 9] then aEditor:=edCustom;

 if acol=4 then
   el3.popupwidth:=advstringgrid1.colwidths[4];
end;


procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
//  ColumnComboBox1.ColumnItems[1, 1] := '111';
   advstringgrid1.rowcount:=35;
  advstringgrid1.autonumbercol(0);

  for i:=1 to AdvStringGrid1.RowCount-1 do
  begin
    AdvStringGrid1.AddDataImage(7,i,0,haCenter,vaTop);
  end;
end;

procedure TForm1.AdvStringGrid1GetEditorProp(Sender: TObject; aCol,
  aRow: Integer; aEditLink: TEditLink);
begin
 case acol of
 2:begin
    if odd(arow) then (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clInfoBk else
                      (aEditLink.GetEditControl as TAdvEdit).FocusColor:=clWhite;
   end;
 4:begin
//    aEditLink.Popupwidth:=advstringgrid1.colwidths[4];
   end;
 6:begin
    with (aEditLink.GetEditControl as TCheckListEdit) do
      if odd(arow) then
        begin
         items.Add('BMW');
         items.Add('Ferrari');
         items.Add('Mercedes');
         items.Add('Porsche');
         items.Add('Audi');
        end
      else
        begin
         items.Add('Delphi');
         items.Add('C++Builder');
         items.Add('JBuilder');
         items.Add('Visual Basic');
         items.Add('Visual C');
        end;
   end;
 7:begin
     with (aEditLink.GetEditControl as TImagePicker) do
     begin

       BeginUpdate;
       Items.Clear;
       with Items.Add do
       begin
         Caption:='Germany';
         ImageIndex:=0;
       end;
       with Items.Add do
       begin
         Caption:='UK';
         ImageIndex:=1;
       end;
       with Items.Add do
       begin
         Caption:='USA';
         ImageIndex:=2;
       end;
       with Items.Add do
       begin
         Caption:='Japan';
         ImageIndex:=3;
       end;
       with Items.Add do
       begin
         Caption:='Italy';
         ImageIndex:=4;
       end;
       with Items.Add do
       begin
         Caption:='France';
         ImageIndex:=5;
       end;

       EndUpdate;
     end;



   end;

 end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  AdvGridUndoRedo1.Undo;
  Button1.Enabled := AdvGridUndoRedo1.Level > 0;
  Button2.Enabled := AdvGridUndoRedo1.Level < AdvGridUndoRedo1.Items.Count;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  AdvGridUndoRedo1.Redo;
  Button1.Enabled := AdvGridUndoRedo1.Level > 0;
  Button2.Enabled := AdvGridUndoRedo1.Level < AdvGridUndoRedo1.Items.Count;
end;

procedure TForm1.AdvStringGrid1ComboChange(Sender: TObject; ACol, ARow,
  AItemIndex: Integer; ASelection: String);
begin
  tag  := 0;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with ColumnComboEditLink2.Items do
  begin
    Clear;
    AddObject('ftString', Pointer(ftString));
    AddObject('ftInteger', Pointer(ftInteger));
    AddObject('ftBoolean', Pointer(ftBoolean));
    AddObject('ftFloat', Pointer(ftFloat));
    AddObject('ftCurrency', Pointer(ftCurrency));
    AddObject('ftBCD', Pointer(ftBCD));
    AddObject('ftDateTime', Pointer(ftDateTime));
  end;
end;

end.
