object EQGridRLPreviewForm: TEQGridRLPreviewForm
  Left = 826
  Top = 235
  Width = 347
  Height = 262
  BorderStyle = bsSizeToolWin
  Caption = 'Picture Preview'
  Color = clBtnFace
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBImage: TDBImage
    Left = 0
    Top = 0
    Width = 339
    Height = 235
    Align = alClient
    DataField = 'Graphic'
    DataSource = EQGridRLMainForm.dsBiolife
    TabOrder = 0
  end
end
