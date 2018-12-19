object UnboundExternalDataDemoMainForm: TUnboundExternalDataDemoMainForm
  Left = 270
  Top = 120
  Width = 652
  Height = 404
  Caption = 'ExpressQuantumGrid UnboundExternalData Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 644
    Height = 32
    Align = alTop
    Caption = 
      'Work with Ini files using the grid'#39's unbound mode. Experiment us' +
      'ing the menu items above. Click '#39'About this demo'#39' for more infor' +
      'mation.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    WordWrap = True
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 334
    Width = 644
    Height = 19
    AutoHint = True
    Panels = <
      item
        Width = 100
      end
      item
        Width = 150
      end
      item
        Text = 'Changes Count: 0'
        Width = 150
      end>
    ParentShowHint = False
    ShowHint = True
    OnResize = sbMainResize
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 32
    Width = 644
    Height = 302
    Align = alClient
    TabOrder = 1
    object tvSections: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = stGreyLight
      Styles.Content = stBlueLight
      Styles.FilterBox = stYellowLight
      Styles.Inactive = stBlueSky
      Styles.Selection = stBlueDark
      Styles.Header = stBlueDarkBold
    end
    object tvValues: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsSelection.InvertSelect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.Background = stGreyLight
      Styles.Content = stBlueBright
      Styles.FilterBox = stYellowLight
      Styles.Inactive = stBlueSky
      Styles.Selection = stBlueLight
      Styles.Header = stBlueDarkBold
    end
    object SectionLevel: TcxGridLevel
      Caption = 'Sections'
      GridView = tvSections
      MaxDetailHeight = 200
      object DetailLevel: TcxGridLevel
        Caption = 'Details'
        GridView = tvValues
      end
    end
  end
  object mmMain: TMainMenu
    Left = 136
    Top = 56
    object miFile: TMenuItem
      Caption = '&File'
      object miOpen: TMenuItem
        Caption = '&Open...'
        Hint = 'Open the existing ini-file for editing'
        OnClick = miOpenClick
      end
      object miSave: TMenuItem
        Caption = '&Save'
        Hint = 'Saves the modified ini-file'
        ShortCut = 16467
        OnClick = miSaveClick
      end
      object miSaveAs: TMenuItem
        Caption = 'Save&As..'
        Hint = 
          'Saves the modified ini-file allowing you to specify a new name a' +
          'nd a different location'
        OnClick = miSaveAsClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object miInsertSection: TMenuItem
        Caption = '&Insert'
        Hint = 'Inserts a new record to the current grid view'
        OnClick = miInsertSectionClick
      end
      object miDeleteSection: TMenuItem
        Caption = '&Delete'
        Hint = 'Deletes the selected record from the current grid view'
        OnClick = miDeleteSectionClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 168
    Top = 56
    PixelsPerInch = 96
    object stBlueDarkBold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object stBlueLight: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object stBlueBright: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object stYellowLight: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object stGreyLight: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object stBlueSky: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clBlack
    end
    object stBlueDark: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object stGold: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 16
    Top = 56
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 48
    Top = 56
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfOffice11
    Left = 200
    Top = 56
  end
end
