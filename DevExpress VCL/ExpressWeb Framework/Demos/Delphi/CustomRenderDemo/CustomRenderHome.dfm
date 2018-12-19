object CustomRenderHomePage: TCustomRenderHomePage
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
  Height = 451
  HorizontalOffset = 200
  VerticalOffset = 116
  Width = 835
  object cxWebLabel1: TcxWebLabel
    CustomEvents = <>
    Left = 20
    Top = 96
    Height = 32
    Width = 748
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 
      'This TcxWebLabel has a yellow background color only in IE 5 or a' +
      'bove'
  end
  object cxWebURLLabel1: TcxWebURLLabel
    CustomEvents = <>
    Left = 20
    Top = 144
    Height = 30
    Width = 748
    ZIndex = 0
    AutoSize = False
    WordWrap = False
    Caption = 
      'This TcxWebURLLabel has a red single line border in all browser ' +
      'types without any other styles and events'
    TabOrder = 0
    URL.Href = 'http://www.devexpress.com'
  end
end
