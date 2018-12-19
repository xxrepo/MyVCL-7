object Frame1Page: TFrame1Page
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 1244184
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptFlow
  ServerScript = JScript
  TopPos = 0
  Left = 50
  Top = 50
  Height = 732
  HorizontalOffset = 361
  VerticalOffset = 209
  Width = 324
  object cxWebButton2: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          
            'window.parent.document.frames["Frame3Page"].location.href = "htt' +
            'p://www.devexpress.com"')
      end>
    Left = 14
    Top = 62
    Height = 26
    Width = 262
    ZIndex = 0
    TabOrder = 0
    Caption = 'Load www.devexpress.com'
    GlyphPosition = gpBeforeText
  end
  object cxWebButton3: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          
            'window.parent.document.frames["Frame3Page"].location.href = "htt' +
            'p://www.borland.com"')
      end>
    Left = 14
    Top = 98
    Height = 26
    Width = 262
    ZIndex = 0
    TabOrder = 1
    Caption = 'Load www.borland.com'
    GlyphPosition = gpBeforeText
  end
  object cxWebButton4: TcxWebButton
    CustomEvents = <
      item
        EventProcType = etProcedure
        EventType = 2
        HandlerText.Strings = (
          
            'window.parent.document.frames["Frame3Page"].location.href = "htt' +
            'p://www.microsoft.com"')
      end>
    Left = 14
    Top = 136
    Height = 26
    Width = 262
    ZIndex = 0
    TabOrder = 2
    Caption = 'Load www.microsoft.com'
    GlyphPosition = gpBeforeText
  end
end
