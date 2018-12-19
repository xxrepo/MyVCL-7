unit Uspellcheckdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TMSSpellCheck, TMSSpellCheckCorrectLinesForm,
  ComCtrls;

type
  TForm1 = class(TForm)
    AdvSpellCheck1: TAdvSpellCheck;
    Edit1: TEdit;
    Edit2: TEdit;
    AdvSpellCheckCorrectLinesPanel1: TAdvSpellCheckCorrectLinesPanel;
    Edit3: TEdit;
    Edit4: TEdit;
    AdvSpellCheckCorrectLinesDialog1: TAdvSpellCheckCorrectLinesDialog;
    RichEdit1: TRichEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure AdvSpellCheckCorrectLinesPanel1SpellCheckComplete(Sender: TObject;
      OriginalText, CorrectedText: string);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidSentence(s: string): boolean;
    function LastWord(s: string): string;
    procedure SpellCallBack(Sender: TObject;
      CallBackContext: TAdvSpellCheckCallbackContext);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  TMSSpellParser;

procedure TForm1.AdvSpellCheckCorrectLinesPanel1SpellCheckComplete(
  Sender: TObject; OriginalText, CorrectedText: string);
begin
  Edit3.Text := AdvSpellCheckCorrectLinesPanel1.Text;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  sl: TStringList;
  i: integer;
  hl: TSpellCheckHighlight;
  s: string;
begin
  sl := TStringList.Create;

  s := '';
  for i := 0 to richedit1.Lines.Count - 1 do
    begin
      if i > 0 then
        s := s + #13;

      s := s + richedit1.Lines[i];
    end;

  ParseStringToWords(s, sl);

  AdvSpellCheck1.BeginRequest('1');

  for i := 0 to sl.Count - 1 do
  begin
    hl := TSpellCheckHighlight.Create;
    hl.SelStart := integer(sl.Objects[i]);
    hl.SelLength := Length(sl.Strings[i]);
    AdvSpellCheck1.AddValidationRequest(sl.Strings[i], hl, SpellCallBack);
  end;

  AdvSpellCheck1.EndRequest;
end;

procedure TForm1.Edit1Exit(Sender: TObject);
begin
  if not ValidSentence(Edit1.Text) then
    Edit1.Color := clRed
  else
    Edit1.Color := clWindow;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  s: string;
begin
  if key = ' ' then
  begin
    s := LastWord(Edit1.Text);

    if AdvSpellCheck1.Validate(s) <> wvrValidated then
      Edit1.Color := clRed
    else
      Edit1.Color := clWindow;
  end;
end;

procedure TForm1.Edit2Exit(Sender: TObject);
var
  sl: TStringList;
  i: integer;
  s,res: string;
begin
  sl := TStringList.Create;

  try
    ParseStringToWords(Edit2.Text, sl);

    res := '';

    for i := 0 to sl.Count - 1 do
    begin
      s := AdvSpellCheck1.FirstSuggestion(sl.Strings[i]);

      if i > 0 then
        res := res + ' ';

      if (s <> '') and (s <> sl.Strings[i]) then
        res := res + s
      else
        res := res + sl.Strings[i];
    end;

    Edit2.Text := res;
  finally
    sl.Free;
  end;
end;

procedure TForm1.Edit3Exit(Sender: TObject);
begin
  if not ValidSentence(Edit3.Text) then
  begin
    AdvSpellCheckCorrectLinesPanel1.Init(Edit3.Text);
  end;
end;

procedure TForm1.Edit4Exit(Sender: TObject);
var
  s: string;
begin
  s := Edit4.Text;
  if not ValidSentence(s) then
  begin
    if AdvSpellCheckCorrectLinesDialog1.Execute(Edit4, s) = mrOK then
      Edit4.Text := s;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AdvSpellCheck1.Active := true;
end;

function TForm1.LastWord(s: string): string;
var
  i: integer;
begin
  s := Trim(s);
  Result := '';
  for i := Length(s) downto 1 do
  begin
    if s[i] <> ' ' then
      Result := s[i] + Result
    else
      break;
  end;
end;

procedure TForm1.SpellCallBack(Sender: TObject;
  CallBackContext: TAdvSpellCheckCallbackContext);
var
  hl: TSpellCheckHighlight;
begin
  if CallBackContext.ValidationResult = wvrNotValidated then
  begin
    hl := CallBackContext.Data as TSpellCheckHighlight;

    RichEdit1.SelStart := hl.SelStart;
    RichEdit1.SelLength := hl.SelLength;
    RichEdit1.SelAttributes.Color := clRed;
    hl.Free;
  end
  else
  begin
    hl := CallBackContext.Data as TSpellCheckHighlight;

    RichEdit1.SelStart := hl.SelStart;
    RichEdit1.SelLength := hl.SelLength;
    RichEdit1.SelAttributes.Color := clGreen;
  end;
end;

function TForm1.ValidSentence(s: string): boolean;
var
  sl: TStringList;
  i: integer;
begin
  sl := TStringList.Create;
  Result := true;

  try
    ParseStringToWords(s, sl);

    for i := 0 to sl.Count - 1 do
    begin
      if AdvSpellCheck1.Validate(sl.Strings[i]) = wvrNotValidated then
        Result := false;
    end;
  finally
    sl.Free;
  end;
end;

end.
