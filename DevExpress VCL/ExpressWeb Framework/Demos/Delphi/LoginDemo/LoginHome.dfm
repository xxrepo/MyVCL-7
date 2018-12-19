object LoginHomePage: TLoginHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 525
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 399
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    Left = 17
    Top = 103
    Height = 19
    Width = 95
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Login'
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    Left = 17
    Top = 140
    Height = 21
    Width = 94
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Password'
  end
  object weLogin: TcxWebEdit
    CustomEvents = <>
    Left = 128
    Top = 102
    Height = 22
    Width = 228
    ZIndex = 0
    TabOrder = 0
  end
  object wePassword: TcxWebEdit
    CustomEvents = <>
    Left = 128
    Top = 136
    Height = 22
    Width = 228
    ZIndex = 0
    TabOrder = 1
    Password = True
  end
  object wlMessage: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stIncorrectMsg
    Left = 18
    Top = 219
    Visible = False
    Height = 14
    Width = 331
    ZIndex = 0
    AutoSize = False
    Styles.Default = stIncorrectMsg
    WordWrap = False
    Caption = 'Invalid login or password'
  end
  object cxWebStyleController1: TcxWebStyleController
    Left = 212
    Top = 24
    object stIncorrectMsg: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebRed
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 8
    end
  end
  object cxWebButton2: TcxWebButton
    CustomEvents = <>
    Left = 19
    Top = 176
    ZIndex = 0
    TabOrder = 2
    Caption = 'Login'
    GlyphPosition = gpBeforeText
    OnClick = cxWebButton2Click
  end
  object cxWebButton3: TcxWebButton
    CustomEvents = <>
    Left = 130
    Top = 176
    ZIndex = 0
    TabOrder = 3
    ButtonType = btReset
    Caption = 'Clear'
    GlyphPosition = gpBeforeText
  end
end
