object IssueListMainForm: TIssueListMainForm
  Left = 271
  Top = 121
  Width = 880
  Height = 643
  Caption = 'Issue List'
  Color = clBtnFace
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 572
    Width = 872
    Height = 17
    AutoHint = True
    Panels = <>
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 872
    Height = 26
    Align = alTop
    AutoSize = True
    BevelInner = bvNone
    BevelOuter = bvNone
    BevelKind = bkFlat
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    object tbView1: TToolBar
      Left = 142
      Top = 2
      Width = 107
      Height = 22
      AutoSize = True
      ButtonWidth = 26
      Caption = 'tbView1'
      Color = clBtnFace
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = dmMain.ilMain
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = actAutoWidth
      end
      object ToolButton2: TToolButton
        Left = 26
        Top = 0
        Action = actShowEditButtons
      end
      object ToolButton3: TToolButton
        Left = 52
        Top = 0
        Action = actInvertSelected
      end
      object ToolButton4: TToolButton
        Left = 78
        Top = 0
        Action = actAutoPreview
      end
    end
    object tbView: TToolBar
      Left = 11
      Top = 2
      Width = 118
      Height = 22
      AutoSize = True
      Caption = 'ToolBar1'
      Color = clBtnFace
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = dmMain.ilMain
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Action = actGrouping
      end
      object ToolButton10: TToolButton
        Left = 23
        Top = 0
        Action = acIndicator
      end
      object ToolButton12: TToolButton
        Left = 46
        Top = 0
        Action = actHeader
        Down = True
      end
      object ToolButton11: TToolButton
        Left = 69
        Top = 0
        Action = actSummaryFooter
        Down = True
      end
      object ToolButton7: TToolButton
        Left = 92
        Top = 0
        Action = actGridLines
      end
    end
    object tbOperat: TToolBar
      Left = 262
      Top = 2
      Width = 83
      Height = 22
      AutoSize = True
      ButtonWidth = 26
      Caption = 'tbOperations'
      Color = clBtnFace
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = dmMain.ilMain
      ParentColor = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object ToolButton6: TToolButton
        Left = 0
        Top = 0
        Action = actFullCollapse
      end
      object ToolButton8: TToolButton
        Left = 26
        Top = 0
        Action = actFullExpand
      end
      object ToolButton13: TToolButton
        Left = 52
        Top = 0
        Action = actColumnsCustomize
      end
    end
  end
  object alMain: TActionList
    Images = dmMain.ilMain
    Left = 40
    Top = 48
    object actShowDescription: TAction
      Category = 'View'
      Caption = 'Show &Description'
      Checked = True
      Hint = 
        'Press to display/hide the description panel with the currently d' +
        'isplayed information'
      OnExecute = actShowDescriptionExecute
    end
    object actColumnsCustomize: TAction
      Category = 'Actions'
      Caption = 'RunTime &Column Customization'
      Hint = 'Press to customize columns'
      ImageIndex = 24
      OnExecute = actColumnsCustomizeExecute
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Press to quit the program'
      ShortCut = 32856
      OnExecute = actExitExecute
    end
    object actShowPictures: TAction
      Category = 'View'
      Caption = 'Show &Pictures In A Grid'
      Hint = 
        'Press to activate/deactivate the display of images within grid c' +
        'ells'
      OnExecute = actShowPicturesExecute
    end
    object actGrouping: TAction
      Category = 'GridOptions'
      Caption = 'Show &GroupBox'
      Checked = True
      Hint = 
        'Dispaly the group panel containing column headers used for group' +
        'ing'
      ImageIndex = 5
      OnExecute = actGroupingExecute
      OnUpdate = actGroupingUpdate
    end
    object acIndicator: TAction
      Category = 'GridOptions'
      Caption = 'Show &Indicator'
      Hint = 'Display the grid view indicator specifying the record state'
      ImageIndex = 6
      OnExecute = acIndicatorExecute
      OnUpdate = acIndicatorUpdate
    end
    object actSummaryFooter: TAction
      Category = 'GridOptions'
      Caption = 'Show Summary &Footer'
      Hint = 'Display the summary footer at the bottom of the grid view'
      ImageIndex = 7
      OnExecute = actSummaryFooterExecute
      OnUpdate = actSummaryFooterUpdate
    end
    object actHeader: TAction
      Category = 'GridOptions'
      Caption = 'Show &Header'
      Hint = 'Display header for all grid columns'
      ImageIndex = 8
      OnExecute = actHeaderExecute
      OnUpdate = actHeaderUpdate
    end
    object actAutoWidth: TAction
      Category = 'GridOptions'
      Caption = 'Columns Auto&Width'
      Checked = True
      Hint = 
        'Automatically sets the width of columns to the width of a grid v' +
        'iew'
      ImageIndex = 19
      OnExecute = actAutoWidthExecute
      OnUpdate = actAutoWidthUpdate
    end
    object actInvertSelected: TAction
      Category = 'GridOptions'
      Caption = 'In&vert Selected'
      Checked = True
      Hint = 'Display the grid view indicator specifying the record state'
      ImageIndex = 23
      OnExecute = actInvertSelectedExecute
      OnUpdate = actInvertSelectedUpdate
    end
    object actFullExpand: TAction
      Category = 'Actions'
      Caption = 'Full &Expand'
      Hint = 'Press to expand all records'
      ImageIndex = 27
      OnExecute = actFullExpandExecute
    end
    object actFullCollapse: TAction
      Category = 'Actions'
      Caption = 'Full &Collapse'
      Hint = 'Press to collapse all records'
      ImageIndex = 26
      OnExecute = actFullCollapseExecute
    end
    object actBestFit: TAction
      Category = 'Actions'
      Caption = 'Best Fit (all columns)'
      Hint = 'Changes the width of columns to best fit inside a grid view'
      OnExecute = actBestFitExecute
    end
    object actShowEditButtons: TAction
      Category = 'GridOptions'
      Caption = 'Show Edit &Buttons'
      Hint = 'Displays/hides editor buttons for the current record'
      ImageIndex = 22
      OnExecute = actShowEditButtonsExecute
      OnUpdate = actShowEditButtonsUpdate
    end
    object actAbout: TAction
      Category = 'Help'
      Caption = '&About...'
      OnExecute = actAboutExecute
    end
    object actGridLines: TAction
      Category = 'GridOptions'
      Caption = 'Show Grid &Lines'
      Checked = True
      Hint = 'Displays/hides horizontal and vertical grid lines'
      ImageIndex = 20
      OnExecute = actGridLinesExecute
      OnUpdate = actGridLinesUpdate
    end
    object actAutoPreview: TAction
      Category = 'GridOptions'
      Caption = 'Auto&Preview'
      Checked = True
      Hint = 'Display the preview section for each row'
      ImageIndex = 21
      OnExecute = actAutoPreviewExecute
      OnUpdate = actAutoPreviewUpdate
    end
    object actShowDependsOnData: TAction
      Category = 'View'
      Caption = 'Depends On Data'
      Checked = True
      Hint = 'Press to activate/deactivate drawing depending on data'
      OnExecute = actShowDependsOnDataExecute
    end
    object actNewItemRow: TAction
      Category = 'GridOptions'
      Caption = 'Show New Item Row'
      Hint = 'Press to display an empty row to enter new values'
      OnExecute = actNewItemRowExecute
      OnUpdate = actNewItemRowUpdate
    end
    object actSelectStyleSheet: TAction
      Category = 'GridOptions'
      Caption = 'Select Predefined StyleSheet...'
      OnExecute = actSelectStyleSheetExecute
    end
    object actEditorsShadow: TAction
      Category = 'Style'
      Caption = '&Editors Shadow'
      Checked = True
      Hint = 
        'Setting this option activates/deactivates the shadow for stand-a' +
        'lone editors'
      OnExecute = actEditorsShadowExecute
    end
  end
  object MainMenu1: TMainMenu
    Images = dmMain.ilMain
    Left = 8
    Top = 48
    object miFile: TMenuItem
      Caption = '&File'
      object actExit1: TMenuItem
        Action = actExit
      end
    end
    object miView: TMenuItem
      Caption = '&View'
      object miShowDescription: TMenuItem
        Action = actShowDescription
      end
      object miGridPictures: TMenuItem
        Action = actShowPictures
      end
      object miShowDepentOnData: TMenuItem
        Action = actShowDependsOnData
      end
      object miEditorsShadow: TMenuItem
        Action = actEditorsShadow
      end
      object miSeparator1: TMenuItem
        Caption = '-'
      end
      object miGoProjects: TMenuItem
        Tag = 1
        Caption = '&Projects'
        Checked = True
        Hint = 'Press to show information on projects'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
      object miGoProjectItems: TMenuItem
        Tag = 2
        Caption = 'Project &Items'
        Hint = 'Press to show information on issues list'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
      object miGoDepartments: TMenuItem
        Tag = 3
        Caption = '&Departments'
        Hint = 'Press to show the list of departments'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
      object miGoTeams: TMenuItem
        Tag = 4
        Caption = 'Projects &Teams'
        Hint = 'Press to show information on the users involved in a project'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
      object miGoUsers: TMenuItem
        Tag = 5
        Caption = '&Users'
        Hint = 'Press to show the user list'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
      object miGoSchedule: TMenuItem
        Tag = 6
        Caption = 'Schedule'
        Hint = 'Press to show the schedule of the users involved in a project'
        RadioItem = True
        OnClick = actGoProjectExecute
      end
    end
    object miGridOptions: TMenuItem
      Caption = 'Grid&Options'
      object miGridView: TMenuItem
        Caption = '&View'
        object miGrouping: TMenuItem
          Action = actGrouping
        end
        object miacIndicator: TMenuItem
          Action = acIndicator
        end
        object miHeaders: TMenuItem
          Action = actHeader
        end
        object miSummaryFooter: TMenuItem
          Action = actSummaryFooter
        end
        object miShowGrid: TMenuItem
          Action = actGridLines
        end
        object miSeparator3: TMenuItem
          Caption = '-'
        end
        object mitAutoWidth: TMenuItem
          Action = actAutoWidth
        end
        object miAlwaysDisplayButtons: TMenuItem
          Action = actShowEditButtons
        end
        object miInvertSelected: TMenuItem
          Action = actInvertSelected
        end
        object actNewItemRow1: TMenuItem
          Action = actNewItemRow
        end
      end
      object miGridStyle: TMenuItem
        Caption = '&Style'
        object miFlat: TMenuItem
          Caption = '&Flat'
          Hint = 
            'Setting this option changes the grid view appearance to Flat sty' +
            'le'
          RadioItem = True
          OnClick = miLookAndFeelKindClick
        end
        object miStandard: TMenuItem
          Caption = '&Standard'
          Hint = 
            'Setting this option changes the grid view appearance to Standard' +
            ' style'
          RadioItem = True
          OnClick = miLookAndFeelKindClick
        end
        object miStyleUltraFlat: TMenuItem
          Caption = '&Ultra Flat'
          Checked = True
          Hint = 
            'Setting this option changes the grid view appearance to Ultra Fl' +
            'at style'
          RadioItem = True
          OnClick = miLookAndFeelKindClick
        end
        object miOffice11: TMenuItem
          Caption = '&Office11'
          Hint = 
            'Setting this option changes the grid view appearance to Office11' +
            ' style'
          RadioItem = True
          OnClick = miLookAndFeelKindClick
        end
        object miSeparator6: TMenuItem
          Caption = '-'
        end
        object miNativeStyle: TMenuItem
          Caption = '&NativeStyle'
          Checked = True
          Hint = 
            'Setting this option changes the appearance of grid items to the ' +
            'native style'
          OnClick = miNativeStyleClick
        end
        object miSeparator8: TMenuItem
          Caption = '-'
        end
        object actSelectStyleSheet1: TMenuItem
          Action = actSelectStyleSheet
          Caption = 'Predefined StyleSheets...'
          Hint = 
            'Press to select the predefined style sheet to change the grid'#39's ' +
            'display'
        end
      end
      object miGridActions: TMenuItem
        Caption = '&Actions'
        object miFullExpand: TMenuItem
          Action = actFullExpand
        end
        object miFullCollapse: TMenuItem
          Action = actFullCollapse
        end
        object miSeparator2: TMenuItem
          Caption = '-'
        end
        object miColumnCustomization: TMenuItem
          Action = actColumnsCustomize
        end
        object miBestFitallcolumns: TMenuItem
          Action = actBestFit
        end
      end
    end
    object miAbout: TMenuItem
      Action = actAbout
      Caption = '&About this demo'
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 72
    Top = 48
  end
end
