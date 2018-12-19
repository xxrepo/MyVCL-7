object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TMS Spell check demo'
  ClientHeight = 558
  ClientWidth = 738
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 309
    Height = 13
    Caption = 'Performs spell check for each word entered + spell check on exit'
  end
  object Label2: TLabel
    Left = 16
    Top = 77
    Width = 201
    Height = 13
    Caption = 'Performs auto correct of sentence on exit'
  end
  object Label3: TLabel
    Left = 16
    Top = 133
    Width = 339
    Height = 13
    Caption = 
      'Performs sentence correct on exit in TAdvSpellCheckCorrectLinesP' +
      'anel'
  end
  object Label4: TLabel
    Left = 16
    Top = 189
    Width = 342
    Height = 13
    Caption = 
      'Performs sentence correct on exit in TAdvSpellCheckCorrectLinesD' +
      'ialog'
  end
  object Label5: TLabel
    Left = 16
    Top = 239
    Width = 148
    Height = 13
    Caption = 'Rich edit control for spell check'
  end
  object Edit1: TEdit
    Left = 16
    Top = 40
    Width = 369
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 16
    Top = 96
    Width = 369
    Height = 21
    TabOrder = 1
    OnExit = Edit2Exit
  end
  object AdvSpellCheckCorrectLinesPanel1: TAdvSpellCheckCorrectLinesPanel
    Left = 416
    Top = 152
    Width = 305
    Height = 361
    TabOrder = 2
    UI.ShowIgnore = True
    UI.ShowIgnoreAll = True
    UI.ShowAdd = True
    UI.ShowChange = True
    UI.ShowChangeAll = True
    UI.ShowNext = True
    UI.ShowPrevious = True
    UI.CaptionIgnore = '&Ignore'
    UI.CaptionIgnoreAll = 'I&gnore all'
    UI.CaptionAdd = '&Add'
    UI.CaptionChange = '&Change'
    UI.CaptionChangeAll = 'C&hange all'
    UI.CaptionNext = '&Next'
    UI.CaptionPrevious = '&Previous'
    UI.HintIgnore = 'Ignore current spell check error'
    UI.HintIgnoreAll = 'Ignore all spell check error'
    UI.HintAdd = 'Add new word to word list'
    UI.HintChange = 'Change spelling of current word'
    UI.HintChangeAll = 'Change spelling of all words'
    UI.HintNext = 'Go to next spell check error'
    UI.HintPrevious = 'Go to previous spell check error'
    UI.QueryAdd = 'Add new word'
    UI.QueryWord = 'Word'
    SpellCheck = AdvSpellCheck1
    OnSpellCheckComplete = AdvSpellCheckCorrectLinesPanel1SpellCheckComplete
  end
  object Edit3: TEdit
    Left = 16
    Top = 152
    Width = 369
    Height = 21
    TabOrder = 3
    OnExit = Edit3Exit
  end
  object Edit4: TEdit
    Left = 16
    Top = 208
    Width = 369
    Height = 21
    TabOrder = 4
    OnExit = Edit4Exit
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 258
    Width = 369
    Height = 255
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      
        'Wendsday, March 26 -- Too Atlantic bottle-nosed dolphins were pu' +
        't in to '
      
        'active duty today by the Navy. The two specially traned dolphins' +
        ' are '
      
        'searching the waters for explosives around the port citty of Umm' +
        ' Qasr.'
      
        'Makai, 33, and Tacoma, 22, both mails, use their natural ability' +
        'es to '
      
        'locate explosives and mark them with floats. The dolfins are wor' +
        'king to '
      'clear a path for ships carrying humanitarian aid to Iraq.'
      
        'The Navy has 20 trained dolphins as part of the Marine Mammal Pr' +
        'oject '
      
        'based in San Diego, California. Nine of those dolphins where flo' +
        'wn to the '
      
        'Persian Gulf recently. They are staying in specially bilt tanks ' +
        'abord a U.S. '
      'warship. '
      
        'The Navy dolphins are tauhgt to avoid touching the explasives. A' +
        'ccording '
      
        'to won bomb expert, the dolphins are more at risk from local dol' +
        'phins than '
      
        'the explosives. Dolphins are teritorial an cud drive away the tw' +
        'o '
      'newcomers.')
    ParentFont = False
    TabOrder = 5
  end
  object Button1: TButton
    Left = 16
    Top = 519
    Width = 369
    Height = 25
    Caption = 'Spell check document'
    TabOrder = 6
    OnClick = Button1Click
  end
  object AdvSpellCheck1: TAdvSpellCheck
    AutoUpdate = True
    Languages = <
      item
        AffixFileName = 'english.aff'
        SoundexProcess = spStandard
        SoundexName = 'ENGLISH'
        Guid = '{6EC21D33-9CAF-403B-BE90-2D7D904F71A8}'
        Enabled = True
        LanguageCode = lcEnglish
        SourceFileName = 'english.lat'
        Description = 'English dictionary'
      end>
    InMemoryDatabaseName = 'TMSSPELLCHECK'
    DatabaseFilename = 'TMSSPELLCHECK'
    StoreElements = [sseSpellcheckDB, sseIgnoreList]
    Active = False
    Version = '1.0.0.2'
    MultiLanguageValidation = False
    Left = 520
    Top = 32
  end
  object AdvSpellCheckCorrectLinesDialog1: TAdvSpellCheckCorrectLinesDialog
    Caption = 'Correct'
    SpellCheck = AdvSpellCheck1
    UI.ShowIgnore = True
    UI.ShowIgnoreAll = True
    UI.ShowAdd = True
    UI.ShowChange = True
    UI.ShowChangeAll = True
    UI.ShowNext = True
    UI.ShowPrevious = True
    UI.CaptionIgnore = '&Ignore'
    UI.CaptionIgnoreAll = 'I&gnore all'
    UI.CaptionAdd = '&Add'
    UI.CaptionChange = '&Change'
    UI.CaptionChangeAll = 'C&hange all'
    UI.CaptionNext = '&Next'
    UI.CaptionPrevious = '&Previous'
    UI.HintIgnore = 'Ignore current spell check error'
    UI.HintIgnoreAll = 'Ignore all spell check error'
    UI.HintAdd = 'Add new word to word list'
    UI.HintChange = 'Change spelling of current word'
    UI.HintChangeAll = 'Change spelling of all words'
    UI.HintNext = 'Go to next spell check error'
    UI.HintPrevious = 'Go to previous spell check error'
    UI.QueryAdd = 'Add new word'
    UI.QueryWord = 'Word'
    Left = 624
    Top = 32
  end
end
