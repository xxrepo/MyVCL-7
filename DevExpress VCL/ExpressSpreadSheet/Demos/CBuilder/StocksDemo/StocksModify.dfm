object StocksModifyForm: TStocksModifyForm
  Left = 349
  Top = 207
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 142
  ClientWidth = 167
  Color = clBtnFace
  KeyPreview = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 8
    Top = 112
    Width = 75
    Height = 22
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 88
    Top = 112
    Width = 75
    Height = 22
    ModalResult = 2
    TabOrder = 1
  end
  object gpPanel: TPanel
    Left = 0
    Top = 0
    Width = 167
    Height = 105
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object rbShiftCol: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = 'rbShiftCol'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbShiftRw: TRadioButton
      Left = 16
      Top = 44
      Width = 113
      Height = 17
      Caption = 'rbShiftRw'
      TabOrder = 1
    end
    object rbRw: TRadioButton
      Left = 16
      Top = 68
      Width = 113
      Height = 17
      Caption = 'rbRw'
      TabOrder = 2
    end
    object rbCol: TRadioButton
      Left = 16
      Top = 88
      Width = 113
      Height = 17
      Caption = 'rbCol'
      TabOrder = 3
    end
    object cxLB: TcxLabelBevel
      Left = 8
      Top = 4
      Width = 153
      Height = 12
      CaptionText = 'Insert'
    end
  end
end
