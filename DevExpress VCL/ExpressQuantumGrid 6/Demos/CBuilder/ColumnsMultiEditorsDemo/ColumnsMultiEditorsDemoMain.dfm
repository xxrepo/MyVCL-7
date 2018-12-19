object ColumnsMultiEditorsDemoMainForm: TColumnsMultiEditorsDemoMainForm
  Left = 292
  Top = 245
  Width = 593
  Height = 509
  Caption = 'ExpressQuantumGrid ColumnsMultiEditors Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 585
    Height = 32
    Align = alTop
    Caption = 
      'This demo shows how several editors can be used in a single colu' +
      'mn. Click "About this demo" for more information.'
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
    Top = 436
    Width = 585
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 32
    Width = 585
    Height = 404
    Align = alClient
    TabOrder = 1
    object tvSkills: TcxGridTableView
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object clnName: TcxGridColumn
        Caption = 'Name'
        Visible = False
        GroupIndex = 0
        Options.Editing = False
        Options.Focusing = False
        SortOrder = soAscending
      end
      object clnSkill: TcxGridColumn
        Caption = 'Skill'
        Options.Editing = False
        Options.Focusing = False
        Width = 50
      end
      object clnGrade: TcxGridColumn
        Caption = 'Grade'
        OnGetProperties = clnGradeGetProperties
        Options.Filtering = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 50
      end
    end
    object lvSkills: TcxGridLevel
      GridView = tvSkills
    end
  end
  object mmMain: TMainMenu
    Left = 496
    Top = 32
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        Hint = 'Press to quit the demo-program'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miOptions: TMenuItem
      Caption = '&Options'
      object miEditButtons: TMenuItem
        Caption = '&Edit Buttons'
        object Never1: TMenuItem
          Caption = '&Never'
          Checked = True
          Hint = 'The editor buttons are displayed only for the focused column'
          RadioItem = True
          OnClick = miEditButtonsNeverClick
        end
        object ForFocusedRecord1: TMenuItem
          Caption = 'For &Focused Record'
          Hint = 'The editor buttons are visible for the focused record'
          RadioItem = True
          OnClick = miEditButtonsFocusedRecordClick
        end
        object Always1: TMenuItem
          Caption = '&Always'
          Hint = 'The editor buttons are always visible within the current view'
          RadioItem = True
          OnClick = miEditButtonsAlwaysClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object EditRepository: TcxEditRepository
    Left = 432
    Top = 32
    object ImageComboLanguages: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Assembler'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Delphi'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Visual Basic'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'C++'
          ImageIndex = 3
          Value = 3
        end
        item
          Description = 'Java'
          ImageIndex = 4
          Value = 4
        end>
    end
    object ImageComboCommunication: TcxEditRepositoryImageComboBoxItem
      Properties.Items = <
        item
          Description = 'Bad'
          ImageIndex = 0
          Value = 0
        end
        item
          Description = 'Average'
          ImageIndex = 1
          Value = 1
        end
        item
          Description = 'Good'
          ImageIndex = 2
          Value = 2
        end
        item
          Description = 'Excellent'
          ImageIndex = 3
          Value = 3
        end>
    end
    object SpinItemYears: TcxEditRepositorySpinItem
      Properties.MaxValue = 30
      Properties.MinValue = 1
    end
    object DateItemStartWorkFrom: TcxEditRepositoryDateItem
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 528
    Top = 32
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
      AssignedValues = [svColor]
      Color = 14872561
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
      AssignedValues = [svColor]
      Color = 8453888
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
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
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
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 528
    Top = 64
  end
end
