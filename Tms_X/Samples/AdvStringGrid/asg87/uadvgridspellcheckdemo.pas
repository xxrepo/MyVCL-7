{*************************************************************************}
{ TAdvStringGrid demo unit                                                }
{                                                                         }
{ written by TMS Software                                                 }
{            copyright © 2015                                             }
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
unit uadvgridspellcheckdemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, AdvGrid, ExtCtrls, BaseGrid, AdvObj, XPMan,
  TMSSpellCheck, AsgSpellCheck, TMSSpellCheckCorrectLinesForm,
  TMSSpellCheckCorrectForm, AsgCheck;

type
  TForm1 = class(TForm)
    Button3: TButton;
    Config: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    AdvStringGrid1: TAdvStringGrid;
    AdvStringGridSpellCheck1: TAdvStringGridSpellCheck;
    AdvSpellCheck1: TAdvSpellCheck;
    AdvSpellCheckCorrectLinesPanel1: TAdvSpellCheckCorrectLinesPanel;
    CheckBox1: TCheckBox;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ConfigClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AdvSpellCheckCorrectLinesPanel1SpellCheckComplete(Sender: TObject;
      OriginalText, CorrectedText: string);
    procedure AdvStringGrid1ClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoCheckActiveCell;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvSpellCheck1.Active := true;

  AdvSpellCheck1.IgnoreList.Add('TAdvStringGrid');
  AdvSpellCheck1.IgnoreList.Add('TMS');

  AdvStringGrid1.SaveFixedCells := False;
  AdvStringGrid1.Delimiter := ',';
  AdvStringGrid1.LoadFromCSV('.\spell.csv');
  AdvStringGrid1.AutoSizeColumns(False, 10);
  AdvStringGrid1.AutoSizeRows(False, 10);

  AdvStringGrid1.CheckGrid(False);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  AdvStringGrid1.UnMarkInGrid(false);
  AdvStringGrid1.CheckGrid(false);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  AdvSpellCheck1.OpenSettingsDialog;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
    DoCheckActiveCell
  else
    AdvSpellCheckCorrectLinesPanel1.Init('');
end;

procedure TForm1.ConfigClick(Sender: TObject);
begin
  AdvStringGrid1.UnMarkInGrid(False);

  case Config.ItemIndex of
    0: begin
        AdvStringGridSpellCheck1.ShowDialog := False;
        AdvStringGridSpellCheck1.AutoMarkError := True;
        AdvStringGridSpellCheck1.AutoCorrect := False;
      end;
    1: begin
        AdvStringGridSpellCheck1.ShowDialog := False;
        AdvStringGridSpellCheck1.AutoMarkError := False;
        AdvStringGridSpellCheck1.AutoCorrect := True;
      end;
    2: begin
        AdvStringGridSpellCheck1.ShowDialog := True;
        AdvStringGridSpellCheck1.AutoMarkError := False;
        AdvStringGridSpellCheck1.AutoCorrect := True;
      end;
    3: begin
        AdvStringGridSpellCheck1.ShowDialog := False;
        AdvStringGridSpellCheck1.AutoMarkError := False;
        AdvStringGridSpellCheck1.AutoCorrect := False;
      end;
  end;

end;

procedure TForm1.DoCheckActiveCell;
var
  s: string;
begin
  s := advstringgrid1.StrippedCells[Advstringgrid1.Col, AdvStringGrid1.Row];
  AdvSpellCheckCorrectLinesPanel1.Init(s);
end;

procedure TForm1.AdvSpellCheckCorrectLinesPanel1SpellCheckComplete(
  Sender: TObject; OriginalText, CorrectedText: string);
begin
  AdvStringGrid1.Cells[advstringgrid1.Col, advstringgrid1.Row] := CorrectedText;
end;

procedure TForm1.AdvStringGrid1ClickCell(Sender: TObject; ARow, ACol: Integer);
begin
  if CheckBox1.Checked then
    DoCheckActiveCell;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  AdvStringGridSpellCheck1.AutoCorrect := true;
  AdvStringGridSpellCheck1.UseCorrect := true;
  AdvStringGridSpellCheck1.UseMarkError := false;
  AdvStringGridSpellCheck1.ShowDialog := true;

  AdvStringGrid1.UnMarkInGrid(False);
  AdvStringGrid1.CheckGrid(False);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  AdvStringGrid1.SaveFixedCells := False;
  AdvStringGrid1.UnMarkInGrid(False);
  AdvStringGrid1.SaveToCSV('.\spell.csv');
end;

end.
