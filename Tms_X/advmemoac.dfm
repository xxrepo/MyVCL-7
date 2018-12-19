object MemoAC: TMemoAC
  Left = 1073
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Memo AutoCorrect setup'
  ClientHeight = 255
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 30
    Width = 365
    Height = 184
    Align = alClient
    ColCount = 2
    DefaultColWidth = 170
    DefaultRowHeight = 18
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
    OnKeyDown = StringGrid1KeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 214
    Width = 365
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 192
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 280
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      Default = True
      ModalResult = 2
      TabOrder = 1
    end
    object ckDoAutoCorrect: TCheckBox
      Left = 8
      Top = 8
      Width = 65
      Height = 17
      Caption = 'Active'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 365
    Height = 30
    Align = alTop
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 5
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Insert'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FF05710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710A05710A05710A05710A05710A20B33505710AFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A76F9A776F9A776
        F9A76BF09751DA7533C24D19AC2A05710AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF05710A05710A05710A05710A05710A05710A47D36805710AFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C5996FF00FFFF
        00FFFF00FF05710A05710AE4F0FC1C78D51C78D51C78D51C78D51C78D582C6F9
        57BCFF4EB5FF4DB4FF1C5996FF00FFFF00FFFF00FF05710AFF00FFE4F0FC2A95
        FF369BFF379CFF1C78D51C78D57DC3F756BCFF4EB4FE4DB3FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FC2893FF3499FF359AFF1C78D51C78D580C6F9
        5BC1FF53BAFF52B8FF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC1F8E
        FF2B95FF2C96FF1C78D51C78D580C6F95BC1FF53BAFF52B8FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF
        3589CF3589CF3589CF1C59961C59961C59961C59961C59961C5996FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D586CCF965CBFF5DC3FF5CC4FF3589CF53BAFF53
        BAFF4EB4FF4DB4FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D584C9F7
        65CAFF5EC3FE5EC4FF3589CF53BAFF54BAFF4FB4FE4FB4FF1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D585CBF864CBFF5EC6FF5EC7FF3589CF53BAFF55
        BDFF50B7FF50B7FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D59ECFF5
        92D7FD88D2FC8CD5FD629DCF85CEFD85CEFD80C9FC84CBFD1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C78D51C78D51C
        78D51C78D51C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 37
      Top = 4
      Width = 23
      Height = 22
      Hint = 'Remove'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710AFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05
        710A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF05710A76F9A705710A05710A05710A05710A0571
        0A05710AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF05710A76F9A776
        F9A76FF39E5BE38342CE6128B93F14A82405710AFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FF05710A76F9A705710A05710A05710A05710A0571
        0A05710AFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C5996FF00FF05
        710A05710AFF00FFFF00FFE4F0FC1C78D51C78D51C78D51C78D51C78D582C6F9
        57BCFF4EB5FF4DB4FF1C5996FF00FFFF00FF05710AFF00FFFF00FFE4F0FC2A95
        FF369BFF379CFF1C78D51C78D57DC3F756BCFF4EB4FE4DB3FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FC2893FF3499FF359AFF1C78D51C78D580C6F9
        5BC1FF53BAFF52B8FF1C5996FF00FFFF00FFFF00FFFF00FFFF00FFE4F0FC1F8E
        FF2B95FF2C96FF1C78D51C78D580C6F95BC1FF53BAFF52B8FF1C5996FF00FFFF
        00FFFF00FFFF00FFFF00FFE4F0FCE4F0FCE4F0FCE4F0FCE4F0FC1C78D5629DCF
        3589CF3589CF3589CF1C59961C59961C59961C59961C59961C5996FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D586CCF965CBFF5DC3FF5CC4FF3589CF53BAFF53
        BAFF4EB4FF4DB4FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D584C9F7
        65CAFF5EC3FE5EC4FF3589CF53BAFF54BAFF4FB4FE4FB4FF1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FF1C78D585CBF864CBFF5EC6FF5EC7FF3589CF53BAFF55
        BDFF50B7FF50B7FF1C78D5FF00FFFF00FFFF00FFFF00FFFF00FF1C78D59ECFF5
        92D7FD88D2FC8CD5FD629DCF85CEFD85CEFD80C9FC84CBFD1C78D5FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1C78D51C78D51C78D51C78D51C78D51C78D51C
        78D51C78D51C78D5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton2Click
    end
  end
end
