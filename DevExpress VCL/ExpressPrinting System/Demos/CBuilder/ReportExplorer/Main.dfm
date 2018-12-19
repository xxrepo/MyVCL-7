object fmLauncher: TfmLauncher
  Left = 100
  Top = 100
  Width = 313
  Height = 143
  Caption = 'fmLauncher'
  Color = clBtnFace
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  object dxPSFileBasedExplorer1: TdxPSFileBasedExplorer
    OnItemDataLoadError = dxPSFileBasedExplorer1ItemDataLoadError
    Left = 220
    Top = 13
  end
  object dxComponentPrinter1: TdxComponentPrinter
    Explorer = dxPSFileBasedExplorer1
    PreviewOptions.ThumbnailsOptions.Font.Charset = DEFAULT_CHARSET
    PreviewOptions.ThumbnailsOptions.Font.Color = clBlue
    PreviewOptions.ThumbnailsOptions.Font.Height = -64
    PreviewOptions.ThumbnailsOptions.Font.Name = 'Tahoma'
    PreviewOptions.ThumbnailsOptions.Font.Style = []
    PreviewOptions.PreviewBoundsRect = {0000000000000000B603000058020000}
    Version = 0
    Left = 41
    Top = 12
  end
  object dxPSEngineController1: TdxPSEngineController
    LookAndFeel = pslfFlat
    Left = 131
    Top = 64
  end
end
