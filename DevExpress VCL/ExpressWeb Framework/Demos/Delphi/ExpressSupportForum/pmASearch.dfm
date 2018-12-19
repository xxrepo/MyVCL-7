object ASearch: TASearch
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
  Height = 468
  HorizontalOffset = 200
  VerticalOffset = 107
  Width = 621
  object Query: TADOQuery
    Connection = DM.Connection
    CursorType = ctStatic
    LockType = ltReadOnly
    Parameters = <>
    SQL.Strings = (
      'select distinct source '
      'from articles')
    Left = 104
    Top = 48
  end
  object ExQuery: TADOQuery
    Connection = DM.Connection
    Parameters = <>
    SQL.Strings = (
      'select * from experts')
    Left = 228
    Top = 70
  end
  object wcbSource: TcxWebComboBox
    CustomEvents = <>
    Left = 0
    Top = 0
    Height = 22
    Width = 352
    ZIndex = 0
    TabOrder = 0
    ItemIndex = 0
    Items = <
      item
        Selected = True
        Text = '--------------------------------------'
        Value = '-1'
      end>
  end
  object wcbExpert: TcxWebComboBox
    CustomEvents = <>
    Left = 0
    Top = 0
    Height = 22
    Width = 352
    ZIndex = 0
    TabOrder = 1
    ItemIndex = 0
    Items = <
      item
        Selected = True
        Text = '--------------------------------------'
        Value = '-1'
      end>
  end
  object weCont: TcxWebEdit
    CustomEvents = <>
    Left = 276
    Top = 45
    Height = 22
    Width = 356
    ZIndex = 0
    TabOrder = 2
  end
  object cxWebButton1: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          's_page();')
      end>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 158
    Top = 145
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 3
    Caption = 'Search'
    GlyphPosition = gpBeforeText
  end
  object wbReset: TcxWebButton
    CustomEvents = <>
    StyleItem_Default = DM.ButtonStyle
    StyleItem_Hover = DM.ButtonStyleHover
    Left = 316
    Top = 141
    Height = 20
    Width = 94
    ZIndex = 0
    Styles.Default = DM.ButtonStyle
    Styles.Hover = DM.ButtonStyleHover
    TabOrder = 4
    ButtonType = btReset
    Caption = 'Reset'
    GlyphPosition = gpBeforeText
  end
end
