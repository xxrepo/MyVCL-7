object SessionHomePage: TSessionHomePage
  OldCreateOrder = True
  ComponentPersistent.DefaultMode = pmSave
  ComponentPersistent.ExceptedComponents = <>
  DesignerID = 2
  EncodingType = wetApplication
  LeftPos = 0
  PositioningType = cxptAbsolute
  ServerScript = JScript
  TopPos = 0
  OnBeforeRender = cxWebPageModuleBeforeRender
  Left = 50
  Top = 50
  Height = 796
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 1072
  object cxWebLabel2: TcxWebLabel
    CustomEvents = <>
    Left = 18
    Top = 115
    Height = 21
    Width = 71
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Session ID'
  end
  object wlSessionID: TcxWebLabel
    CustomEvents = <>
    Left = 133
    Top = 115
    Height = 20
    Width = 11
    ZIndex = 0
    WordWrap = False
    Caption = '0'
  end
  object cxWebLabel3: TcxWebLabel
    CustomEvents = <>
    Left = 17
    Top = 146
    Height = 19
    Width = 81
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Session value'
  end
  object weSessionValue: TcxWebEdit
    CustomEvents = <>
    Left = 18
    Top = 176
    Height = 22
    Width = 95
    ZIndex = 0
    TabOrder = 0
  end
  object wbUpdate: TcxWebButton
    CustomEvents = <>
    Left = 124
    Top = 174
    Height = 23
    Width = 163
    ZIndex = 0
    TabOrder = 1
    Caption = 'Update session value'
    GlyphPosition = gpBeforeText
    OnClick = wbUpdateClick
  end
  object wlSessionValue: TcxWebLabel
    CustomEvents = <>
    Left = 133
    Top = 146
    Height = 20
    Width = 4
    ZIndex = 0
    WordWrap = False
  end
  object wbTerminate: TcxWebButton
    CustomEvents = <>
    Left = 15
    Top = 215
    Height = 23
    Width = 152
    ZIndex = 0
    TabOrder = 2
    Caption = 'Terminate session'
    GlyphPosition = gpBeforeText
    OnClick = wbTerminateClick
  end
  object wmSessionLog: TcxWebMemo
    CustomEvents = <>
    Left = 112
    Top = 265
    Height = 130
    Width = 795
    ZIndex = 0
    TabOrder = 3
  end
  object cxWebLabel4: TcxWebLabel
    CustomEvents = <>
    Left = 16
    Top = 270
    Height = 19
    Width = 75
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 'Session log'
  end
  object wbClear: TcxWebButton
    CustomEvents = <>
    Left = 15
    Top = 300
    Height = 24
    Width = 78
    ZIndex = 0
    TabOrder = 4
    Caption = 'Clear'
    GlyphPosition = gpBeforeText
    OnClick = wbClearClick
  end
end
