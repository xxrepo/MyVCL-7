object FlyingMainForm: TFlyingMainForm
  Left = 151
  Top = 95
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ExpressSpreadSheet Demo : G-RSFT Load Sheet'
  ClientHeight = 605
  ClientWidth = 797
  Color = clBtnFace
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 472
    Top = 8
    Width = 319
    Height = 576
    AutoSize = True
    Transparent = True
  end
  object Pb: TPaintBox
    Left = 472
    Top = 8
    Width = 327
    Height = 576
    OnPaint = PbPaint
  end
  object Image2: TImage
    Left = 8
    Top = 430
    Width = 461
    Height = 154
    Stretch = True
  end
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 797
    Height = 9
    Align = alTop
    Shape = bsTopLine
    Style = bsRaised
  end
  object cxSpread: TcxSpreadSheetBook
    Left = 8
    Top = 8
    Width = 460
    Height = 421
    ScrollBars = sbsNone
    DefaultStyle.Brush.BackgroundColor = 57
    DefaultStyle.Brush.ForegroundColor = 57
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    ShowCaptionBar = False
    OnActiveCellChanging = cxSpreadActiveCellChanging
    OnAfterCalculation = cxSpreadAfterCalculation
    OnSetSelection = cxSpread1SetSelection
    OnSheetPopupMenu = cxSpread1SheetPopupMenu
    OnTopLeftChanging = cxSpreadTopLeftChanging
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 586
    Width = 797
    Height = 19
    Panels = <
      item
        Width = 800
      end>
  end
  object ssPm: TPopupMenu
    Left = 152
    Top = 72
    object pmoFormat: TMenuItem
      Caption = 'Format...'
      OnClick = pmoFormatClick
    end
    object pmWizard: TMenuItem
      Caption = 'Wizard...'
      OnClick = pmWizardClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 184
    Top = 72
    object File1: TMenuItem
      Caption = '&File'
      object mmExit: TMenuItem
        Caption = 'E&xit'
        OnClick = mmExitClick
      end
    end
    object mmOptions: TMenuItem
      Caption = '&Options'
      object moToday: TMenuItem
        Caption = 'Todays Date'
        OnClick = moTodayClick
      end
      object moFuelTabs: TMenuItem
        Caption = 'Fuel to Tabs'
        OnClick = moFuelTabsClick
      end
    end
    object mmAircraft: TMenuItem
      Caption = '&Select Aircraft'
    end
  end
end
