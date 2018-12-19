unit SimpleDemoMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSpellChecker, StdCtrls, ComCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, cxRichEdit, Menus, cxLookAndFeelPainters,
  cxButtons, cxLookAndFeels, cxLabel, cxDropDownEdit, cxCalendar,
  cxMaskEdit, ExtCtrls, cxGroupBox, ActnList, ImgList, cxGraphics, ShellApi;

const
  dxDownloadURL = 'http://www.devexpress.com/downloads';
  dxSupportURL = 'http://www.devexpress.com/Support/Center';
  dxStartURL = 'http://www.devexpress.com';
  dxProductsURL = 'http://www.devexpress.com/products';
  dxMyDXURL = 'http://www.mydevexpress.com';

type
  dxSitePage = (spDownloads, spSupport, spStart, spProducts, spMyDX);

  TfmCV = class(TForm)
    dxSpellChecker1: TdxSpellChecker;
    cxLookAndFeelController1: TcxLookAndFeelController;
    gbPersonal: TcxGroupBox;
    cxLabel8: TcxLabel;
    cxTextEdit5: TcxTextEdit;
    cxLabel13: TcxLabel;
    cxMaskEdit3: TcxMaskEdit;
    cxLabel14: TcxLabel;
    cxDateEdit2: TcxDateEdit;
    cxMaskEdit4: TcxMaskEdit;
    cxLabel15: TcxLabel;
    cxTextEdit6: TcxTextEdit;
    edtName: TcxTextEdit;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    gbProfessional: TcxGroupBox;
    cxLabel6: TcxLabel;
    cxTextEdit3: TcxTextEdit;
    cxLabel7: TcxLabel;
    cxMemo1: TcxMemo;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxRichEdit2: TcxRichEdit;
    cxRichEdit1: TcxRichEdit;
    Panel1: TPanel;
    btnCheckSpelling: TcxButton;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Options1: TMenuItem;
    Help1: TMenuItem;
    alMain: TActionList;
    actDownloads: TAction;
    actSupport: TAction;
    actDXOnTheWeb: TAction;
    actProducts: TAction;
    actExit: TAction;
    Exit1: TMenuItem;
    DeveloperExpressProducts1: TMenuItem;
    DeveloperExpressDownloads1: TMenuItem;
    DeveloperExpressontheWeb1: TMenuItem;
    DevExpressSupportCenter1: TMenuItem;
    aOutlookSpellType: TAction;
    dfsd1: TMenuItem;
    aWordSpellType: TAction;
    Outlook1: TMenuItem;
    Word1: TMenuItem;
    aCheckFromCursorPos: TAction;
    CheckFromCursorPos1: TMenuItem;
    aCheckSelectedTextFirst: TAction;
    aIgnoreEmails: TAction;
    CheckSelectedTextFirst1: TMenuItem;
    IgnoreEmails1: TMenuItem;
    aIgnoreMixedCaseWords: TAction;
    IgnoreMixedCaseWords1: TMenuItem;
    aCAYTActive: TAction;
    aCAYTActive1: TMenuItem;
    aIgnoreRepeatedWords: TAction;
    IgnoreRepeatedWords1: TMenuItem;
    aIgnoreUpperCaseWords: TAction;
    IgnoreUppercaseWords1: TMenuItem;
    aIgnoreURLs: TAction;
    IgnoreURLs1: TMenuItem;
    aIgnoreWordsWithNumbers: TAction;
    aNative: TAction;
    aStandard: TAction;
    aFlat: TAction;
    aOffice11: TAction;
    aUltraFlat: TAction;
    View1: TMenuItem;
    aFlat1: TMenuItem;
    Standard1: TMenuItem;
    UltraFlat1: TMenuItem;
    Office111: TMenuItem;
    NativeStyel1: TMenuItem;
    Spelling1: TMenuItem;
    aCheckSpelling: TAction;
    CheckSpelling1: TMenuItem;
    N1: TMenuItem;
    cxButton1: TcxButton;
    IgnoreWordsWithNumbers1: TMenuItem;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    procedure actExitExecute(Sender: TObject);
    procedure actDownloadsExecute(Sender: TObject);
    procedure actSupportExecute(Sender: TObject);
    procedure actDXOnTheWebExecute(Sender: TObject);
    procedure actProductsExecute(Sender: TObject);
    procedure aOutlookSpellTypeExecute(Sender: TObject);
    procedure aCheckFromCursorPosExecute(Sender: TObject);
    procedure aCheckSelectedTextFirstExecute(Sender: TObject);
    procedure aIgnoreEmailsExecute(Sender: TObject);
    procedure aIgnoreMixedCaseWordsExecute(Sender: TObject);
    procedure aCAYTActiveExecute(Sender: TObject);
    procedure dxSpellChecker1CheckAsYouTypeStart(
      Sender: TdxCustomSpellChecker; AControl: TWinControl;
      var AAllow: Boolean);
    procedure dxSpellChecker1CheckControlInContainer(
      Sender: TdxCustomSpellChecker; AControl: TWinControl; var AAllow,
      AContinue: Boolean);
    procedure aIgnoreRepeatedWordsExecute(Sender: TObject);
    procedure aIgnoreUpperCaseWordsExecute(Sender: TObject);
    procedure aIgnoreWordsWithNumbersExecute(Sender: TObject);
    procedure aIgnoreURLsExecute(Sender: TObject);
    procedure aViewExecute(Sender: TObject);
    procedure aCheckSpellingExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCV: TfmCV;

implementation

{$R *.dfm}

procedure Browse(ASitePage: dxSitePage);
var
  AURL: string;
begin
  case ASitePage of
    spDownloads: AURL := dxDownloadURL;
    spSupport: AURL := dxSupportURL;
    spStart: AURL := dxStartURL;
    spProducts: AURL := dxProductsURL;
    spMyDX: AURL := dxMyDXURL;
  end;
  ShellExecute(0, 'OPEN', PChar(AURL), nil, nil, SW_SHOW);
end;

procedure TfmCV.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmCV.actDownloadsExecute(Sender: TObject);
begin
  Browse(spDownloads);
end;

procedure TfmCV.actSupportExecute(Sender: TObject);
begin
  Browse(spSupport);
end;

procedure TfmCV.actDXOnTheWebExecute(Sender: TObject);
begin
  Browse(spStart);
end;

procedure TfmCV.actProductsExecute(Sender: TObject);
begin
  Browse(spProducts);
end;

procedure TfmCV.aOutlookSpellTypeExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingFormType := TdxSpellCheckerSpellingFormType(TAction(Sender).Tag);
end;

procedure TfmCV.aCheckFromCursorPosExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.CheckFromCursorPos := aCheckFromCursorPos.Checked;
end;

procedure TfmCV.aCheckSelectedTextFirstExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.CheckSelectedTextFirst := aCheckSelectedTextFirst.Checked;
end;

procedure TfmCV.aIgnoreEmailsExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreEmails := aIgnoreEmails.Checked;
end;

procedure TfmCV.aIgnoreMixedCaseWordsExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreMixedCaseWords := aIgnoreMixedCaseWords.Checked;
end;

procedure TfmCV.aIgnoreRepeatedWordsExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreRepeatedWords := aIgnoreRepeatedWords.Checked;
end;

procedure TfmCV.aIgnoreUpperCaseWordsExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreUpperCaseWords := aIgnoreUpperCaseWords.Checked;
end;

procedure TfmCV.aIgnoreURLsExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreUrls := aIgnoreURLs.Checked;
end;

procedure TfmCV.aIgnoreWordsWithNumbersExecute(Sender: TObject);
begin
  dxSpellChecker1.SpellingOptions.IgnoreWordsWithNumbers := aIgnoreWordsWithNumbers.Checked;
end;

procedure TfmCV.aCAYTActiveExecute(Sender: TObject);
begin
  dxSpellChecker1.CheckAsYouTypeOptions.Active := aCAYTActive.Checked;
end;

procedure TfmCV.dxSpellChecker1CheckAsYouTypeStart(
  Sender: TdxCustomSpellChecker; AControl: TWinControl;
  var AAllow: Boolean);
begin
  AAllow := AControl <> edtName;
end;

procedure TfmCV.dxSpellChecker1CheckControlInContainer(
  Sender: TdxCustomSpellChecker; AControl: TWinControl; var AAllow,
  AContinue: Boolean);
begin
  AAllow := AControl <> edtName;
end;

procedure TfmCV.aViewExecute(Sender: TObject);
begin
  case TAction(Sender).Tag of
    0..3:
      begin
        cxLookAndFeelController1.Kind := TcxLookAndFeelKind(TAction(Sender).Tag);
        cxLookAndFeelController1.NativeStyle := False;
      end;
    4: cxLookAndFeelController1.NativeStyle := True;
  end;
end;

procedure TfmCV.aCheckSpellingExecute(Sender: TObject);
begin
  dxSpellChecker1.CheckContainer(Self, True);
end;

end.
