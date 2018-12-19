object CellLevelMultiselectDemoMainForm: TCellLevelMultiselectDemoMainForm
  Left = 107
  Top = 75
  Width = 730
  Height = 523
  Caption = 'ExpressQuantumGrid CellLevelMultiselect Demo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 722
    Height = 33
    Align = alTop
    AutoSize = False
    Caption = 
      'Experiment with cell selection. Click '#39'About this demo'#39' for more' +
      ' information.'
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
    Top = 453
    Width = 722
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 722
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = 16247513
    TabOrder = 1
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Selected rows:'
    end
    object Label2: TLabel
      Left = 4
      Top = 24
      Width = 87
      Height = 13
      Caption = 'Selected columns:'
    end
    object Label3: TLabel
      Left = 160
      Top = 8
      Width = 70
      Height = 13
      Caption = 'Selected Cells:'
    end
    object Label4: TLabel
      Left = 160
      Top = 24
      Width = 91
      Height = 13
      Caption = 'Selected Summary:'
    end
    object lblSelectedRows: TLabel
      Left = 96
      Top = 8
      Width = 45
      Height = 13
      AutoSize = False
      Caption = 'lblSelectedRows'
    end
    object lblSelectedColumns: TLabel
      Left = 96
      Top = 24
      Width = 44
      Height = 13
      AutoSize = False
      Caption = 'lblSelectedColumns'
    end
    object lblSelectedCells: TLabel
      Left = 259
      Top = 8
      Width = 74
      Height = 13
      Caption = 'lblSelectedCells'
    end
    object lblSelectedSummary: TLabel
      Left = 258
      Top = 24
      Width = 95
      Height = 13
      Caption = 'lblSelectedSummary'
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 33
    Width = 722
    Height = 379
    Align = alClient
    TabOrder = 2
    object TableView: TcxGridTableView
      OnMouseDown = TableViewMouseDown
      NavigatorButtons.ConfirmDelete = False
      OnSelectionChanged = TableViewSelectionChanged
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsSelection.InvertSelect = False
      OptionsSelection.MultiSelect = True
      OptionsSelection.CellMultiSelect = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 40
      Styles.OnGetHeaderStyle = TableViewStylesGetHeaderStyle
      OnCustomDrawIndicatorCell = TableViewCustomDrawIndicatorCell
    end
    object Level: TcxGridLevel
      GridView = TableView
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 24
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
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfOffice11
    Left = 472
    Top = 24
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 336
    Top = 88
    PixelsPerInch = 96
    object styleSelected: TcxStyle
      AssignedValues = [svFont, svTextColor]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clRed
    end
    object styleNormal: TcxStyle
    end
  end
end
