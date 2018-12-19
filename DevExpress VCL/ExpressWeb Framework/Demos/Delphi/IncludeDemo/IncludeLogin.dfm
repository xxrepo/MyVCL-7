object IncludeLoginPage: TIncludeLoginPage
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
  Height = 374
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 771
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    Left = 11
    Top = 16
    Height = 16
    Width = 37
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Login'
  end
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    Left = 12
    Top = 42
    Height = 16
    Width = 64
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Password'
  end
  object weLogin: TcxWebEdit
    CustomEvents = <>
    Left = 89
    Top = 14
    Height = 22
    Width = 144
    ZIndex = 0
    TabOrder = 0
  end
  object wePassword: TcxWebEdit
    CustomEvents = <>
    Left = 89
    Top = 40
    Height = 22
    Width = 144
    ZIndex = 0
    TabOrder = 1
    Password = True
  end
  object wbLogin: TcxWebButton
    CustomEvents = <>
    Left = 15
    Top = 73
    ZIndex = 0
    TabOrder = 2
    Caption = 'Login'
    GlyphPosition = gpBeforeText
    OnClick = wbLoginClick
  end
  object wlMessage: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stWarning
    Left = 17
    Top = 116
    Visible = False
    Height = 16
    Width = 186
    ZIndex = 0
    AutoSize = False
    Styles.Default = stWarning
    WordWrap = False
    Caption = 'Incorrect login or password'
  end
  object cxWebStyleController1: TcxWebStyleController
    Left = 184
    Top = 24
    object stWarning: TcxWebStyleItem
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
end
