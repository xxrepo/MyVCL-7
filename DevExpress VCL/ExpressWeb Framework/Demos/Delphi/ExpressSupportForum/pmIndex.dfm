object Index: TIndex
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 434
  HorizontalOffset = 214
  VerticalOffset = 110
  Width = 931
  object weLogin: TcxWebEdit
    CustomEvents = <>
    Left = 103
    Top = 15
    Height = 22
    Width = 292
    ZIndex = 0
    TabOrder = 0
  end
  object wePass: TcxWebEdit
    CustomEvents = <>
    Left = 104
    Top = 45
    Height = 22
    Width = 292
    ZIndex = 0
    TabOrder = 1
    Password = True
  end
  object wbLogin: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 289
    Top = 94
    Height = 20
    Width = 104
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 2
    Caption = 'Login'
    GlyphIndex = 0
    GlyphPosition = gpBeforeText
    OnClick = wbLoginClick
  end
  object wcbUseCookies: TcxWebCheckBox
    CustomEvents = <>
    Left = 289
    Top = 216
    Height = 23
    ZIndex = 0
    TabOrder = 3
    Caption = 'Use cookies'
  end
end
