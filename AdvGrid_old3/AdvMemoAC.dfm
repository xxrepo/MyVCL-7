object MemoAC: TMemoAC
  Left = 517
  Top = 867
  BorderStyle = bsDialog
  Caption = 'MemoAC'
  ClientHeight = 232
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 0
    Top = 0
    Width = 365
    Height = 191
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
    Top = 191
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
  end
end
