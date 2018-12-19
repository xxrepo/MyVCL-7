object previewForm: TpreviewForm
  Left = 271
  Top = 185
  Width = 374
  Height = 224
  BorderStyle = bsSizeToolWin
  Caption = 'Picture Preview'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBImage: TDBImage
    Left = 0
    Top = 0
    Width = 366
    Height = 197
    Align = alClient
    DataField = 'Graphic'
    DataSource = MainForm.dsBiolife
    TabOrder = 0
  end
end
