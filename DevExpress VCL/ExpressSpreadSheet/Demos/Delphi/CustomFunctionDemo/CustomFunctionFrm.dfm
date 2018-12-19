object CustomFunctionForm: TCustomFunctionForm
  Left = 166
  Top = 116
  Width = 964
  Height = 655
  Caption = 'Custom Function ExpressSheet demo'
  Color = clBtnFace
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxSpreadSheet: TcxSpreadSheet
    Left = 0
    Top = 0
    Width = 956
    Height = 628
    Align = alClient
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    ShowGrid = False
  end
end
