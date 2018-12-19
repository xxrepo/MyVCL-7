object LoginTargetPage: TLoginTargetPage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptGrid
  ServerScript = JScript
  TopPos = 0
  OnActivate = cxWebPageModuleActivate
  Left = 50
  Top = 50
  Height = 359
  HorizontalOffset = 213
  VerticalOffset = 332
  Width = 504
  object wlGreeting: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stGreeting
    Left = 3
    Top = 10
    Height = 37
    Width = 81
    ZIndex = 0
    Styles.Default = stGreeting
    WordWrap = False
    Caption = 'Hello'
  end
  object cxWebButton1: TcxWebButton
    CustomEvents = <>
    Left = 1
    Top = 73
    Width = 141
    ZIndex = 0
    TabOrder = 0
    Caption = 'Back to login page'
    GlyphPosition = gpBeforeText
    OnClick = cxWebButton1Click
  end
  object cxWebButton2: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          'window.close();')
      end>
    Left = 155
    Top = 73
    Width = 141
    ZIndex = 0
    TabOrder = 1
    Caption = 'Close window'
    GlyphPosition = gpBeforeText
  end
  object cxWebStyleController1: TcxWebStyleController
    Left = 368
    Top = 32
    object stGreeting: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Color = clWebBlack
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Size.Value = 24
      Style.Font.Weight = wfwBold
    end
  end
end
