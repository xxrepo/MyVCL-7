unit Uricheditorspellcheckdemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TMSSpellCheck, StdCtrls, AdvScrollControl, AdvRichEditorBase,
  AdvRichEditor, AdvRichEditorToolBar, AdvToolBar, AdvToolBarExt, ExtCtrls,
  TMSSpellCheckCorrectForm, AdvRichEditorSpellCheck, TMSSpellCheckConfForm,
  AdvToolBarStylers, AdvOfficeHint;

type
  TForm1 = class(TForm)
    AdvDockPanel1: TAdvDockPanel;
    AdvRichEditorEditToolBar1: TAdvRichEditorEditToolBar;
    AdvRichEditorFormatToolBar1: TAdvRichEditorFormatToolBar;
    AdvRichEditor1: TAdvRichEditor;
    Panel1: TPanel;
    autocorrect: TCheckBox;
    spellcheck: TCheckBox;
    AdvRichEditorSpellCheck1: TAdvRichEditorSpellCheck;
    AdvRichEditorProofingToolBar1: TAdvRichEditorProofingToolBar;
    AdvToolBarOfficeStyler1: TAdvToolBarOfficeStyler;
    AdvOfficeHint1: TAdvOfficeHint;
    AdvRichEditorSpellCheckPanel1: TAdvRichEditorSpellCheckPanel;
    ComboBox1: TComboBox;
    AdvRichEditorSpellCheckDialog1: TAdvRichEditorSpellCheckDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure AdvRichEditor1CorrectWord(Sender: TObject; var AWord: string;
      var Error: Boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure AdvRichEditorSpellCheck1RequestsProcessed(Sender: TObject;
      Context: TProcessRequestContext);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AdvRichEditor1CorrectWord(Sender: TObject; var AWord: string;
  var Error: Boolean);
var
  s: string;
begin
  if spellcheck.Checked and not autocorrect.Checked then
  begin
    error := advricheditorspellcheck1.Validate(aword) <> wvrValidated;
  end;

  if spellcheck.Checked and autocorrect.Checked then
  begin
    s := AdvRichEditorSpellCheck1.FirstSuggestion(aword);
    if (s <> aword) and (s <> '') then
    begin
      aword := s;
      Error := false;
    end;
    if (s = '') then
      Error := true;
  end;
end;


procedure TForm1.AdvRichEditorSpellCheck1RequestsProcessed(Sender: TObject;
  Context: TProcessRequestContext);
begin
  AdvRichEditor1.SelectError(esFirst);
  AdvRichEditorSpellCheckPanel1.DoUpdate;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0: AdvRichEditor1.LoadFromTextFile('spellcheck_english.txt');
  1: AdvRichEditor1.LoadFromTextFile('spellcheck_german.txt');
  2: AdvRichEditor1.LoadFromTextFile('spellcheck_french.txt');
  3: AdvRichEditor1.LoadFromTextFile('spellcheck_dutch.txt');
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := true;

  AdvRichEditorSpellcheck1.Active := true;

  // words added to ignore list
  AdvRichEditorspellcheck1.IgnoreList.Add('TMS');
  AdvRichEditorspellcheck1.IgnoreList.Add('tmssoftware');
  AdvRichEditorspellcheck1.ActiveLanguageIndex := 0;

  // word added to dictionary
  AdvRichEditorspellcheck1.AddToDictionary(AdvRichEditorspellcheck1.ActiveLanguage, 'TAdvRichEditor');

  AdvRichEditor1.AddText('Perform a spell check to see waht hapens with TAdvRichEditor from tmssoftware that should be on teh ingore list.');
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  AdvRichEditorSpellCheckPanel1.Visible := true;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  AdvRichEditorSpellCheckPanel1.Visible := false;

  if AdvRichEditor1.ErrorCount > 0 then
  begin
    AdvRichEditor1.SelectError(esFirst);
    AdvRichEditorSpellCheckDialog1.Execute;
  end;
end;

end.
