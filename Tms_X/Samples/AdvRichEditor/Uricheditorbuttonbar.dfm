object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'TAdvRichEditor simple demo with buttonbar'
  ClientHeight = 462
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 35
    Align = alTop
    TabOrder = 0
    object AdvRichEditorEditButtonBar1: TAdvRichEditorEditButtonBar
      Left = 3
      Top = 4
      Width = 180
      Height = 25
      RichEditor = AdvRichEditor1
      ShowCaption = False
      TabOrder = 0
    end
    object AdvRichEditorFormatButtonBar1: TAdvRichEditorFormatButtonBar
      Left = 186
      Top = 4
      Width = 655
      Height = 25
      RichEditor = AdvRichEditor1
      ShowCaption = False
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 673
    Top = 35
    Width = 179
    Height = 427
    Align = alRight
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    ExplicitTop = -121
    ExplicitHeight = 583
    object RadioGroup1: TRadioGroup
      Left = 6
      Top = 6
      Width = 166
      Height = 147
      Caption = 'Samples'
      TabOrder = 0
    end
    object ListBox1: TListBox
      Left = 14
      Top = 26
      Width = 151
      Height = 114
      ItemHeight = 13
      Items.Strings = (
        'File test'
        'Indent'
        'Bullet'
        'Alignment'
        'Format'
        'Many lines'
        'Images'
        'Clear')
      TabOrder = 1
      OnClick = ListBox1Click
    end
  end
  object AdvRichEditor1: TAdvRichEditor
    Left = 0
    Top = 35
    Width = 673
    Height = 427
    Cursor = crIBeam
    HorzScrollBar.Tracking = True
    VertScrollBar.Range = 2
    VertScrollBar.Tracking = True
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
    TabStop = True
    ParentFont = False
    ReadOnly = False
    Version = '1.0.3.0'
    ExplicitLeft = 232
    ExplicitTop = 104
    ExplicitWidth = 400
    ExplicitHeight = 300
  end
end
