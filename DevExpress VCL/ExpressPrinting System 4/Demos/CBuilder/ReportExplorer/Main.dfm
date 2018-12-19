object fmLauncher: TfmLauncher
  Left = 1145
  Top = 772
  Width = 310
  Height = 133
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
    PreviewOptions.PreviewBoundsRect = {0000000000000000B603000058020000}
    Version = 0
    Left = 41
    Top = 12
  end
  object dxPSEngineController1: TdxPSEngineController
    Active = True
    DialogsLookAndFeel.Kind = lfFlat
    PreviewDialogStyle = 'Standard'
    Left = 131
    Top = 64
  end
end
