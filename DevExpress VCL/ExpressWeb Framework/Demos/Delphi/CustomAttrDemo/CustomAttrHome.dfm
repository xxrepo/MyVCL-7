object CustomAttrHomePage: TCustomAttrHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1244184
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptAbsolute
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 740
  HorizontalOffset = 185
  VerticalOffset = 134
  Width = 745
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    StyleItem_Default = stLabel
    Left = 19
    Top = 154
    Height = 21
    Width = 345
    ZIndex = 0
    AutoSize = False
    Styles.Default = stLabel
    WordWrap = False
    Caption = 'This WebLabel uses cxWebStyle'
  end
  object cxWebStyleController1: TcxWebStyleController
    Left = 424
    Top = 32
    object stLabel: TcxWebStyleItem
      Style.Borders.Bottom.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Color = clWebSteelBlue
      Style.Borders.Left.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Style = wbsSolid
      Style.Borders.Right.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Top.AssignedValues = [wbavColor, wbavStyle, wbavWidth]
      Style.Borders.Width = 1
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
      Style.Font.Weight = wfwBold
      Style.Shading.Color = clWebWheat
      Style.Shading.AssignedValues = [wsavColor]
    end
    object stButton: TcxWebStyleItem
      Style.Borders.Color = clWebWindowText
      Style.Borders.Style = wbsNone
      Style.Borders.Width = thin
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Names.Strings = (
        'MS Sans Serif')
    end
  end
  object cxWebButton3: TcxWebButton
    CustomEvents = <>
    Left = 402
    Top = 329
    Height = 27
    Width = 124
    ZIndex = 0
    TabOrder = 1
    Caption = 'Click me'
    GlyphPosition = gpBeforeText
  end
  object cxWebButton2: TcxWebButton
    CustomEvents = <>
    Left = 403
    Top = 292
    Height = 26
    Width = 124
    ZIndex = 0
    TabOrder = 0
    Caption = 'Click me'
    GlyphPosition = gpBeforeText
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    Left = 19
    Top = 187
    Height = 29
    Width = 346
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'And this WebLabel uses custom style attributes'
  end
  object cxWebButton4: TcxWebButton
    CustomEvents = <>
    Left = 404
    Top = 256
    Height = 26
    Width = 124
    ZIndex = 0
    TabOrder = 2
    Caption = 'Click me'
    GlyphPosition = gpBeforeText
    OnClick = cxWebButton4Click
  end
end
