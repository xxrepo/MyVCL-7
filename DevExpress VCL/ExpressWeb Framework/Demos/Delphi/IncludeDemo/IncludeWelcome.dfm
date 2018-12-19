object IncludeWelcomePage: TIncludeWelcomePage
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
  Height = 368
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 636
  object wlWelcome: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stWellcome
    Left = 105
    Top = 15
    Height = 37
    Width = 81
    ZIndex = 0
    Styles.Default = stWellcome
    WordWrap = False
    Caption = 'Hello'
  end
  object cxWebStyleController1: TcxWebStyleController
    Left = 184
    Top = 48
    object stWellcome: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebDarkSlateBlue
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 24
      Style.Font.Weight = wfwBold
    end
  end
  object wbLogout: TcxWebButton
    CustomEvents = <>
    Left = 147
    Top = 36
    Width = 122
    ZIndex = 0
    TabOrder = 0
    Caption = 'Logout'
    GlyphPosition = gpBeforeText
    OnClick = wbLogoutClick
  end
  object wbView: TcxWebButton
    CustomEvents = <>
    Left = 150
    Top = 73
    Width = 122
    ZIndex = 0
    TabOrder = 1
    Caption = 'View database'
    GlyphPosition = gpBeforeText
    OnClick = wbViewClick
  end
end
