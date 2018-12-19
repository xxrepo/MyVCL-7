unit Uricheditorbuttonbar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvScrollControl, AdvRichEditorBase, AdvRichEditor, StdCtrls,
  ExtCtrls, AdvRichEditorFormatButtonBar, AdvRichEditorEditButtonBar;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    AdvRichEditorEditButtonBar1: TAdvRichEditorEditButtonBar;
    AdvRichEditorFormatButtonBar1: TAdvRichEditorFormatButtonBar;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    ListBox1: TListBox;
    AdvRichEditor1: TAdvRichEditor;
    procedure ListBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SampleIndent;
    procedure SampleFile;
    procedure SampleBullet;
    procedure SampleAlignment;
    procedure SampleFormat;
    procedure SampleImages;
    procedure SampleManyLines;
    procedure SampleClear;

  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}


procedure TForm7.ListBox1Click(Sender: TObject);
begin
 AdvRichEditor1.Clear;

  case ListBox1.ItemIndex of
  0: SampleFile;
  1: SampleIndent;
  2: SampleBullet;
  3: SampleAlignment;
  4: SampleFormat;
  5: SampleManyLines;
  6: SampleImages;
  7: SampleClear;
  end;

  if AdvRichEditor1.Enabled then
    AdvRichEditor1.SetFocus;
end;

procedure TForm7.SampleAlignment;
var
  s: string;
  i,l: integer;
begin
  s := 'Left justified line';
  i := 0;

  AdvRichEditor1.AddText(s);
  AdvRichEditor1.AddLineBreak;

  l := Length(s);
  AdvRichEditor1.SelectText(0,i + l);

  i := i + l + 2;

  AdvRichEditor1.SetSelectionAttribute(taLeftJustify);

  s := 'Centered line';

  AdvRichEditor1.AddText(s);
  AdvRichEditor1.AddLineBreak;

  l := length(s);

  AdvRichEditor1.SelectText(i,i + l);

  AdvRichEditor1.SetSelectionAttribute(taCenter);

  i := i + l + 2;

  s := 'Right justified line';

  l := length(s);

  AdvRichEditor1.AddText(s);
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.SelectText(i, i + l);

  AdvRichEditor1.SetSelectionAttribute(taRightJustify);

  AdvRichEditor1.ClearSelection;
  AdvRichEditor1.ClearCaret;
end;

procedure TForm7.SampleBullet;
begin
  AdvRichEditor1.AddText('First bullet type:');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('Item 1');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddText('Item 2');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.SelectText(20,16);
  AdvRichEditor1.SetSelectionBullets(btCircle);

  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddText('Second bullet type:');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('Item 1');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddText('Item 2');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.SelectText(60,16);
  AdvRichEditor1.SetSelectionBullets(btStar);

  AdvRichEditor1.ClearSelection;
  AdvRichEditor1.ClearCaret;
end;

procedure TForm7.SampleClear;
begin
  AdvRichEditor1.Clear;
end;

procedure TForm7.SampleFile;
begin
  AdvRichEditor1.LoadFromTextFile('.\bellogallico.txt');
end;

procedure TForm7.SampleFormat;
begin
  AdvRichEditor1.AddText('This is sample formatted text with bold, italic, underline, strikethrough');

  AdvRichEditor1.SelectText(35,4);
  AdvRichEditor1.SetSelectionBold(true);

  AdvRichEditor1.SelectText(41,6);
  AdvRichEditor1.SetSelectionItalic(true);

  AdvRichEditor1.SelectText(49,9);
  AdvRichEditor1.SetSelectionUnderline(true);

  AdvRichEditor1.SelectText(60,13);
  AdvRichEditor1.SetSelectionStrikeOut(true);

  AdvRichEditor1.SelectText(15,9);
  AdvRichEditor1.SetSelectionColor(clGreen);

  AdvRichEditor1.SelectText(25,4);
  AdvRichEditor1.SetSelectionColor(clRed);
  AdvRichEditor1.SetSelectionBkColor(clYellow);

  AdvRichEditor1.ClearSelection;
  AdvRichEditor1.ClearCaret;
end;

procedure TForm7.SampleImages;
begin
  AdvRichEditor1.AddText('Car (PNG)');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddImage('.\car.png');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('Grammophone (ICO)');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddImage('.\grammo.ico');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('Toothpaste (BMP)');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddImage('.\toothpaste.bmp');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('Beach (JPEG)');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddImage('.\beach.jpg');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.AddText('GIFImage (GIF)');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddImage('.\gifimage.gif');
  AdvRichEditor1.AddLineBreak;
end;

procedure TForm7.SampleIndent;
begin
  AdvRichEditor1.AddText('First indent');
  AdvRichEditor1.AddLineBreak;
  AdvRichEditor1.AddText('First indent');
  AdvRichEditor1.AddLineBreak;

  AdvRichEditor1.SelectText(0,24);
  AdvRichEditor1.SetSelectionIndent(50);

  AdvRichEditor1.AddText('Second larger indent');
  AdvRichEditor1.SelectText(26,20);
  AdvRichEditor1.SetSelectionIndent(150);

  AdvRichEditor1.ClearSelection;
  AdvRichEditor1.ClearCaret;
end;


procedure TForm7.SampleManyLines;
var
  i: integer;
begin
  AdvRichEditor1.BeginUpdate;
  for i := 0 to 400 do
    begin
      AdvRichEditor1.AddText('This is line nr. '+inttostr(i)+' in the rich text editor');
      AdvRichEditor1.AddLineBreak;
    end;
  AdvRichEditor1.EndUpdate;
end;

end.
