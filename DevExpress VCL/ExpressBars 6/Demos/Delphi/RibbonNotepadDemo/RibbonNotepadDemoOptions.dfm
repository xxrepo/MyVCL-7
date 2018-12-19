object RibbonDemoOptionsForm: TRibbonDemoOptionsForm
  Left = 417
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 107
  ClientWidth = 340
  Color = clBtnFace
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblColorScheme: TLabel
    Left = 8
    Top = 12
    Width = 67
    Height = 13
    Caption = 'Color scheme:'
  end
  object lblScreenTipStyle: TLabel
    Left = 8
    Top = 40
    Width = 76
    Height = 13
    Caption = 'ScreenTip style:'
  end
  object cbColorScheme: TComboBox
    Left = 92
    Top = 8
    Width = 240
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Blue'
      'Black'
      'Silver')
  end
  object cbScreenTipStyle: TComboBox
    Left = 92
    Top = 37
    Width = 240
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 13
    TabOrder = 1
    Items.Strings = (
      'Show feature descriptions in ScreenTips'
      'Don'#39't show feature descriptions in ScreenTips'
      'Don'#39't show ScreenTips')
  end
  object Button1: TButton
    Left = 174
    Top = 74
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object Button2: TButton
    Left = 257
    Top = 74
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
