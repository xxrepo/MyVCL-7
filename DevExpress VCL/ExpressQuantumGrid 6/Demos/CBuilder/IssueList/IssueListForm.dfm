object frmBasic: TfrmBasic
  Left = 399
  Top = 219
  BorderStyle = bsNone
  ClientHeight = 254
  ClientWidth = 225
  Color = clBtnFace
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbCaption: TLabel
    Left = 0
    Top = 0
    Width = 225
    Height = 35
    Align = alTop
    AutoSize = False
    Caption = 'lbCaption'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
  end
  object plTop: TPanel
    Left = 0
    Top = 60
    Width = 225
    Height = 194
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object cxNavigator: TcxNavigator
    Left = 0
    Top = 35
    Width = 216
    Height = 25
    TabStop = True
    Control = IssueListGridForm.cxGrid
    Buttons.Edit.Visible = False
    Buttons.Refresh.Visible = False
    Buttons.Filter.Visible = False
    Align = alTop
    TabOrder = 0
  end
end
