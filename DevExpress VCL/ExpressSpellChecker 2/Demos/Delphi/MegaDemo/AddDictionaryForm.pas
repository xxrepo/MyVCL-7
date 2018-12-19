unit AddDictionaryForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxCheckListBox, cxEdit, cxGroupBox, cxRadioGroup,
  cxTextEdit, cxHyperLinkEdit, dxSpellChecker, Menus, StdCtrls, cxButtons,
  ExtCtrls, cxDropDownEdit, cxMaskEdit, cxButtonEdit;

type
  TfmAddDictionary = class(TForm)
    rgDictionatyType: TcxRadioGroup;
    hlLink: TcxHyperLinkEdit;
    btnAdd: TcxButton;
    btnCancel: TcxButton;
    beAffFile: TcxButtonEdit;
    beDicFile: TcxButtonEdit;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    Label2: TLabel;
    cbLang: TcxComboBox;
    cbCodePage: TcxComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Label5: TLabel;
    procedure rgDictionatyTypePropertiesChange(Sender: TObject);
    procedure beAffFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure beDicFilePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure beAffFilePropertiesChange(Sender: TObject);
  private
  public
    procedure Add(ASpellChecker: TdxCustomSpellChecker);
  end;

var
  fmAddDictionary: TfmAddDictionary;

procedure AddDictionary(ASpellChecker: TdxCustomSpellChecker);

implementation

{$R *.dfm}

uses
  dxISpellDecompressor, dxHunspellDictionary, dxSpellCheckerUtils;

procedure AddDictionary(ASpellChecker: TdxCustomSpellChecker);
begin
  if fmAddDictionary.ShowModal = mrOk then
    fmAddDictionary.Add(ASpellChecker);
end;

{ TfmAddDictionary }

procedure TfmAddDictionary.FormCreate(Sender: TObject);
var
  ALanguages: TdxSpellCheckerLanguages;
  ACodePages: TdxSpellCheckerCodePages;
  I: Integer;
begin
  ALanguages := TdxSpellCheckerLanguages.Create;
  try
    for I := 0 to ALanguages.Count - 1 do
      cbLang.Properties.Items.AddObject(ALanguages.Name[I], Pointer(ALanguages.LocaleID[I]));
    cbLang.ItemIndex := ALanguages.IndexOf(ALanguages.GetDefaultLanguageLCID);
  finally
    ALanguages.Free;
  end;
  ACodePages := TdxSpellCheckerCodePages.Create(True);
  try
    for I := 0 to ACodePages.Count - 1 do
      cbCodePage.Properties.Items.AddObject(ACodePages.Name[I], Pointer(ACodePages.Code[I]));
    for I := 0 to ACodePages.Count - 1 do
      if ACodePages.Code[I] = GetACP then
      begin
        cbCodePage.ItemIndex := I;
        Break;
      end;
  finally
    ACodePages.Free;
  end;
end;

procedure TfmAddDictionary.Add(ASpellChecker: TdxCustomSpellChecker);
const
  DictionaryClasses: array[0..2] of TdxCustomSpellCheckerDictionaryClass = (
    TdxHunspellDictionary, TdxOpenOfficeDictionary, TdxISpellDictionary);
var
  ADictionaryItem: TdxSpellCheckerDictionaryItem;
begin
  ADictionaryItem := ASpellChecker.DictionaryItems.Add;
  ADictionaryItem.DictionaryTypeClass := DictionaryClasses[rgDictionatyType.ItemIndex];
  case rgDictionatyType.ItemIndex of
    0: with TdxHunspellDictionary(ADictionaryItem.DictionaryType) do
       begin
         GrammarPath := beAffFile.Text;
         DictionaryPath := beDicFile.Text;
         Language := Integer(cbLang.Properties.Items.Objects[cbLang.ItemIndex]);
       end;
    1: with TdxOpenOfficeDictionary(ADictionaryItem.DictionaryType) do
       begin
         GrammarPath := beAffFile.Text;
         DictionaryPath := beDicFile.Text;
         Language := Integer(cbLang.Properties.Items.Objects[cbLang.ItemIndex]);
       end;
    2: with TdxISpellDictionary(ADictionaryItem.DictionaryType) do
       begin
         GrammarPath := beAffFile.Text;
         DictionaryPath := beDicFile.Text;
         Language := Integer(cbLang.Properties.Items.Objects[cbLang.ItemIndex]);
         CodePage := Integer(cbCodePage.Properties.Items.Objects[cbCodePage.ItemIndex]);
       end;
  end;
  ShowHourglassCursor;
  try
    ADictionaryItem.DictionaryType.Load(dlmDirectLoad);
  finally
    HideHourglassCursor;
  end;
end;

procedure TfmAddDictionary.rgDictionatyTypePropertiesChange(
  Sender: TObject);
begin
  Label4.Visible := TcxRadioGroup(Sender).ItemIndex = 2;
  cbCodePage.Visible := Label4.Visible;
  Label5.Visible := not Label4.Visible;
  hlLink.Visible := not Label4.Visible;
end;

procedure TfmAddDictionary.beAffFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'Affix files (*.aff)|*.aff|All files (*.*)|*.*';
  if OpenDialog1.Execute then
    beAffFile.Text := OpenDialog1.FileName;
end;

procedure TfmAddDictionary.beDicFilePropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
  OpenDialog1.FileName := '';
  OpenDialog1.Filter := 'Dictionary files (*.dic)|*.dic|All files (*.*)|*.*';
  if OpenDialog1.Execute then
    beDicFile.Text := OpenDialog1.FileName;
end;

procedure TfmAddDictionary.beAffFilePropertiesChange(Sender: TObject);
begin
  btnAdd.Enabled := FileExists(beAffFile.Text) and FileExists(beDicFile.Text);
end;

end.
