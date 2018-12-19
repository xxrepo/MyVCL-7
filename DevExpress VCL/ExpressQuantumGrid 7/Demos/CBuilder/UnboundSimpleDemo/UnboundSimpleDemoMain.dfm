object UnboundSimpleDemoMainForm: TUnboundSimpleDemoMainForm
  Left = 270
  Top = 120
  Width = 797
  Height = 542
  Caption = 'ExpressQuantumGrid UnboundSimple Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 789
    Height = 32
    Align = alTop
    Caption = 
      'This example demonstrates the grid in unbound mode loading recor' +
      'ds from a CSV file. Click '#39'About this demo'#39' for more information' +
      '.'
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
    Top = 469
    Width = 789
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 32
    Width = 789
    Height = 437
    Align = alClient
    TabOrder = 1
    object tvPlanets: TcxGridTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = tvssDevExpress
      object tvPlanetsNAME: TcxGridColumn
        Caption = 'Name'
        HeaderAlignmentHorz = taCenter
        Width = 142
      end
      object tvPlanetsNO: TcxGridColumn
        Caption = '#'
        RepositoryItem = edrepCenterText
        HeaderAlignmentHorz = taCenter
        Width = 56
      end
      object tvPlanetsORBITS: TcxGridColumn
        Caption = 'Orbits'
        RepositoryItem = edrepCenterText
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object tvPlanetsDISTANCE: TcxGridColumn
        Caption = 'Distance (1000km)'
        RepositoryItem = edrepRightText
        HeaderAlignmentHorz = taCenter
        Width = 117
      end
      object tvPlanetsPERIOD: TcxGridColumn
        Caption = 'Period (days)'
        RepositoryItem = edrepRightText
        HeaderAlignmentHorz = taCenter
        Width = 112
      end
      object tvPlanetsDISCOVERER: TcxGridColumn
        Caption = 'Discoverer'
        RepositoryItem = edrepCenterText
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
      object tvPlanetsDATE: TcxGridColumn
        Caption = 'Date'
        RepositoryItem = edrepCenterText
        HeaderAlignmentHorz = taCenter
        Width = 91
      end
      object tvPlanetsRADIUS: TcxGridColumn
        Caption = 'Radius (km)'
        RepositoryItem = edrepRightText
        HeaderAlignmentHorz = taCenter
        Width = 89
      end
    end
    object lvPlanets: TcxGridLevel
      GridView = tvPlanets
    end
  end
  object mmMain: TMainMenu
    Left = 272
    Top = 35
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object StyleRepository: TcxStyleRepository
    Left = 336
    Top = 35
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16777088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object tvssDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle1
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.FilterBox = cxStyle5
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object edrepMain: TcxEditRepository
    Left = 368
    Top = 35
    object edrepCenterText: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taCenter
    end
    object edrepRightText: TcxEditRepositoryTextItem
      Properties.Alignment.Horz = taRightJustify
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 304
    Top = 36
  end
end
