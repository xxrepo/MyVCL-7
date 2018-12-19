unit UScrollMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ImgList, StdCtrls, AdvScrollMenu;

type
  TForm9 = class(TForm)
    ImageList1: TImageList;
    AdvScrollMenu1: TAdvScrollMenu;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure AdvScrollMenu1Select(Sender: TObject;
      ACollection: TAdvScrollItems; AItemIndex: Integer; var Allow: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.AdvScrollMenu1Select(Sender: TObject; ACollection: TAdvScrollItems; AItemIndex: Integer; var Allow: Boolean);
begin
  if Allow then
    ListBox1.Items.Add(ACollection.Items[AItemIndex].Text);
end;

procedure TForm9.FormCreate(Sender: TObject);
var
  Item: TAdvScrollItem;
  SubItem: TAdvScrollItem;
begin
  AdvScrollMenu1.Items.Clear;

  AdvScrollMenu1.Items.Appearance.Fill.Color := clYellow;
  Item := AdvScrollMenu1.AddItem('Europe');
  Item.SubItems.AutoSize := False;
  Item.SubItems.Appearance.Fill.Color := clMoneyGreen;
    SubItem := Item.AddSubItem('Germany');
    SubItem.IconIndex := 1;
      SubItem.AddSubItem('Hamburg');
      SubItem.AddSubItem('Frankfurt');
      SubItem.AddSubItem('Stuttgart');
      SubItem.AddSubItem('München');
      SubItem.AddSubItem('Köln');
      SubItem.AddSubItem('Bremen');
      SubItem.AddSubItem('Koblenz');
      SubItem.AddSubItem('Hannover');
      SubItem.AddSubItem('Nürnberg');
      SubItem.AddSubItem('Leipzig');
      SubItem.AddSubItem('Berlin');

    SubItem := Item.AddSubItem('France');
    SubItem.IconIndex := 0;
      SubItem.AddSubItem('Paris');
      SubItem.AddSubItem('Lyon');
      SubItem.AddSubItem('Toulouse');
      SubItem.AddSubItem('Lille');
      SubItem.AddSubItem('Marseille');
      SubItem.AddSubItem('Mulhouse');
      SubItem.AddSubItem('Nantes');
      SubItem.AddSubItem('Dijon');
      SubItem.AddSubItem('Brest');
      SubItem.AddSubItem('Strassbourg');
      SubItem.AddSubItem('Reims');
      SubItem.AddSubItem('Rennes');

    SubItem := Item.AddSubItem('U.K');
    SubItem.IconIndex := 2;
      SubItem.AddSubItem('London');
      SubItem.AddSubItem('Brighton');
      SubItem.AddSubItem('Oxford');
      SubItem.AddSubItem('Birmingham');
      SubItem.AddSubItem('Manchester');
      SubItem.AddSubItem('Bristol');
      SubItem.AddSubItem('Plymouth');
      SubItem.AddSubItem('York');

  Item := AdvScrollMenu1.AddItem('USA');
  Item.SubItems.Appearance.Fill.Color := clMoneyGreen;
    Item.AddSubItem('Texas');
    Item.AddSubItem('Calilfornia');
    Item.AddSubItem('Washington');
    Item.AddSubItem('Minnesota');
    Item.AddSubItem('Montana');
    Item.AddSubItem('Oregon');
    Item.AddSubItem('Iowa');
    Item.AddSubItem('California');
    Item.AddSubItem('Louisiana');
    Item.AddSubItem('Georgia');

  Item := AdvScrollMenu1.AddItem('Asia');
  Item.SubItems.Appearance.Fill.Color := clMoneyGreen;
    Item.AddSubItem('Thailand');
    Item.AddSubItem('Malaysia');
    Item.AddSubItem('China');
    Item.AddSubItem('Cambodia');
    Item.AddSubItem('Tajikistan');
    Item.AddSubItem('Nepal');
    Item.AddSubItem('Taiwan');
    Item.AddSubItem('Vietnam');
    Item.AddSubItem('Laos');
end;

end.
