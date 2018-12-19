object FlyingSeatCalcForm: TFlyingSeatCalcForm
  Left = 511
  Top = 230
  BorderStyle = bsDialog
  Caption = 'Seat Weights'
  ClientHeight = 280
  ClientWidth = 220
  Color = clBtnFace
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblFormula: TLabel
    Left = 8
    Top = 200
    Width = 72
    Height = 13
    Caption = 'Formula for Lbs'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 201
    Height = 89
    Caption = ' Left Hand Seat '
    TabOrder = 0
    object lblLsPrime: TLabel
      Left = 16
      Top = 40
      Width = 65
      Height = 13
      Caption = 'Weight in Lbs'
    end
    object lblLsLbs: TLabel
      Left = 120
      Top = 40
      Width = 65
      Height = 13
      Caption = 'Weight in Lbs'
      Visible = False
    end
    object rbLsKgs: TRadioButton
      Left = 16
      Top = 16
      Width = 49
      Height = 17
      Caption = 'Kilos'
      TabOrder = 0
      OnClick = rbLsKgsClick
    end
    object rbLsLbs: TRadioButton
      Tag = 1
      Left = 64
      Top = 16
      Width = 49
      Height = 17
      Caption = 'LBS'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbLsKgsClick
    end
    object rbLsStones: TRadioButton
      Tag = 2
      Left = 104
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Stones && Lbs'
      TabOrder = 2
      OnClick = rbLsKgsClick
    end
    object efLsPrime: TEdit
      Left = 16
      Top = 56
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 3
      Text = '0'
      OnExit = meLsPrimeExit
      OnKeyPress = EdtKeyPress
    end
    object efLsLbs: TEdit
      Left = 120
      Top = 56
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 4
      Text = '0'
      Visible = False
      OnExit = meLsPrimeExit
      OnKeyPress = EdtKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 104
    Width = 201
    Height = 89
    Caption = ' Right  Hand Seat '
    TabOrder = 1
    object lblRsPrime: TLabel
      Left = 16
      Top = 40
      Width = 65
      Height = 13
      Caption = 'Weight in Lbs'
    end
    object lblRsLbs: TLabel
      Left = 120
      Top = 40
      Width = 65
      Height = 13
      Caption = 'Weight in Lbs'
      Visible = False
    end
    object rbRsKgs: TRadioButton
      Left = 16
      Top = 16
      Width = 49
      Height = 17
      Caption = 'Kilos'
      TabOrder = 0
      OnClick = rbRsKgsClick
    end
    object rbRsLbs: TRadioButton
      Tag = 1
      Left = 64
      Top = 16
      Width = 49
      Height = 17
      Caption = 'LBS'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbRsKgsClick
    end
    object rbRsStones: TRadioButton
      Tag = 2
      Left = 104
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Stones && Lbs'
      TabOrder = 2
      OnClick = rbRsKgsClick
    end
    object efRsPrime: TEdit
      Left = 16
      Top = 56
      Width = 73
      Height = 21
      MaxLength = 3
      TabOrder = 3
      Text = '0'
      OnExit = meLsPrimeExit
      OnKeyPress = EdtKeyPress
    end
    object efRsLbs: TEdit
      Left = 120
      Top = 56
      Width = 33
      Height = 21
      MaxLength = 2
      TabOrder = 4
      Text = '0'
      Visible = False
      OnExit = meLsPrimeExit
      OnKeyPress = EdtKeyPress
    end
  end
  object efFormula: TEdit
    Left = 8
    Top = 216
    Width = 201
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object btnOk: TButton
    Left = 56
    Top = 248
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOkClick
  end
  object Button2: TButton
    Left = 136
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
