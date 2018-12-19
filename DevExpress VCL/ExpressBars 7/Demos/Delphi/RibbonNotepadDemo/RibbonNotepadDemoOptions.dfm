object RibbonDemoOptionsForm: TRibbonDemoOptionsForm
  Left = 417
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Options'
  ClientHeight = 150
  ClientWidth = 387
  Color = clBtnFace
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbPanel: TBevel
    Left = 8
    Top = 8
    Width = 371
    Height = 101
    Anchors = [akLeft, akTop, akRight]
    Shape = bsFrame
  end
  object lblColorScheme: TLabel
    Left = 22
    Top = 24
    Width = 67
    Height = 13
    Caption = 'Color scheme:'
  end
  object lblRibbonStyle: TLabel
    Left = 22
    Top = 51
    Width = 63
    Height = 13
    Caption = 'Ribbon Style:'
  end
  object lblScreenTipStyle: TLabel
    Left = 22
    Top = 78
    Width = 76
    Height = 13
    Caption = 'ScreenTip style:'
  end
  object Button1: TButton
    Left = 221
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 304
    Top = 116
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object cbColorScheme: TComboBox
    Left = 110
    Top = 21
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 2
    Items.Strings = (
      'Blue'
      'Black'
      'Silver')
  end
  object cbRibbonStyle: TComboBox
    Left = 110
    Top = 48
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    ItemIndex = 0
    TabOrder = 3
    Text = 'Office 2007'
    Items.Strings = (
      'Office 2007'
      'Office 2010'
      'Scenic')
  end
  object cbScreenTipStyle: TComboBox
    Left = 110
    Top = 75
    Width = 258
    Height = 21
    Style = csDropDownList
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 4
    Items.Strings = (
      'Show feature descriptions in ScreenTips'
      'Don'#39't show feature descriptions in ScreenTips'
      'Don'#39't show ScreenTips')
  end
end
