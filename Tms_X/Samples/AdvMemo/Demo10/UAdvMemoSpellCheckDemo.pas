unit UAdvMemoSpellCheckDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TMSSpellCheck, StdCtrls, ExtCtrls, AdvMemo, AdvMemoSpellCheck,
  TMSSpellCheckCorrectLinesForm;

type
  TForm5 = class(TForm)
    AdvMemo1: TAdvMemo;
    RadioGroup1: TRadioGroup;
    AdvSpellCheck1: TAdvSpellCheck;
    AdvMemoSpellChecker1: TAdvMemoSpellChecker;
    CheckBox1: TCheckBox;
    procedure RadioGroup1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.CheckBox1Click(Sender: TObject);
begin
  AdvMemoSpellChecker1.ShowDialog := CheckBox1.Checked;
end;

procedure TForm5.RadioGroup1Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
  0: AdvMemoSpellChecker1.AutoCorrectType := acWordCheck;
  1: AdvMemoSpellChecker1.AutoCorrectType := acWordCorrect;
  2: AdvMemoSpellChecker1.AutoCorrectType := acLineCheck;
  3: AdvMemoSpellChecker1.AutoCorrectType := acLineCorrect;
  end;
end;

end.
