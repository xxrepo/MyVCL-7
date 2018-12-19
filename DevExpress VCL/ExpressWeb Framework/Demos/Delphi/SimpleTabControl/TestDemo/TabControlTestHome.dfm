object TabControlTestHomePage: TTabControlTestHomePage
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
  Height = 550
  HorizontalOffset = 200
  VerticalOffset = 124
  Width = 784
  object SimpleTabControl: TcxWebSimpleTabControl
    CustomEvents = <>
    Left = 52
    Top = 29
    Height = 98
    Width = 178
    ZIndex = 0
    Tabs.Strings = (
      'Tab 1'
      'Tab 2'
      'Tab 3'
      'Tab 4')
    Activetab = -1
    TabStyles.Default = TabStyle
    TabStyles.Hover = TabHoverStyle
    ActiveTabStyles.Default = InactiveTabStyle
    OnTabClick = SimpleTabControlTabClick
  end
  object TabLabel: TcxWebLabel
    CustomEvents = <>
    Left = 64
    Top = 238
    Height = 17
    Width = 263
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Please click on the tab'
  end
  object StyleController: TcxWebStyleController
    Left = 220
    Top = 28
    object TabStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebInfoBackground
      Style.Shading.AssignedValues = [wsavColor]
    end
    object TabHoverStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebBackground
      Style.Shading.AssignedValues = [wsavColor]
    end
    object InactiveTabStyle: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Shading.Color = clWebButtonFace
      Style.Shading.AssignedValues = [wsavColor]
    end
  end
end
