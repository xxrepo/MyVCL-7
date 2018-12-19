object IssueListStylesForm: TIssueListStylesForm
  Left = 381
  Top = 255
  BorderStyle = bsDialog
  Caption = 'Predefined stylesheets'
  ClientHeight = 338
  ClientWidth = 271
  Color = clBtnFace
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbPredefinedStyleSheets: TcxListBox
    Left = 0
    Top = 0
    Width = 193
    Height = 338
    Align = alLeft
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbPredefinedStyleSheetsClick
  end
  object btnEdit: TcxButton
    Left = 200
    Top = 32
    Width = 65
    Height = 20
    Caption = 'Edit...'
    TabOrder = 1
    OnClick = btnEditClick
  end
  object cxButton1: TcxButton
    Left = 200
    Top = 56
    Width = 65
    Height = 20
    Caption = 'Load...'
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 200
    Top = 80
    Width = 65
    Height = 20
    Caption = 'Save...'
    TabOrder = 3
    OnClick = cxButton2Click
  end
  object btnClear: TcxButton
    Left = 200
    Top = 8
    Width = 65
    Height = 20
    Caption = 'Clear'
    TabOrder = 4
    OnClick = btnClearClick
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 24
    Top = 16
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 56
    Top = 16
  end
end
