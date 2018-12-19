object ViewBandedFixedDemoMainForm: TViewBandedFixedDemoMainForm
  Left = 207
  Top = 115
  Width = 735
  Height = 499
  Caption = 'ExpressQuantumGrid ViewBandedFixed Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 727
    Height = 32
    Align = alTop
    Caption = 
      'Fix columns on the left and right using bands. Experiment using ' +
      'the Options available. Click '#39'About this demo'#39' for more informat' +
      'ion.'
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
  object cxGrid: TcxGrid
    Left = 0
    Top = 32
    Width = 727
    Height = 394
    Align = alClient
    TabOrder = 0
    object btvUsersSchedule: TcxGridDBBandedTableView
      DataController.DataSource = ViewBandedFixedDemoDMMain.dsSCHEDULER
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleSUNDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleMONDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleTUESDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleWEDNESDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleTHURSDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleFRIDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleSATURDAY
        end
        item
          Kind = skSum
          Position = spFooter
          Column = btvUsersScheduleRowSum
        end
        item
          Kind = skAverage
          Position = spFooter
          Column = btvUsersScheduleRowAvg
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = btvUsersScheduleSUNDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleMONDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleTUESDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleWEDNESDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleTHURSDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleFRIDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleSATURDAY
        end
        item
          Kind = skSum
          Column = btvUsersScheduleRowSum
        end
        item
          Kind = skAverage
          Column = btvUsersScheduleRowAvg
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupFooters = gfVisibleWhenExpanded
      Bands = <
        item
          Caption = 'User Name'
          FixedKind = fkLeft
          Options.Moving = False
          Styles.Content = ViewBandedFixedDemoDMMain.cxStyle1
          Width = 200
        end
        item
          Caption = 'Days'
        end
        item
          Caption = 'Row Total'
          FixedKind = fkRight
          Options.Moving = False
          Styles.Content = ViewBandedFixedDemoDMMain.cxStyle1
          Width = 200
        end>
      object btvUsersScheduleUserName: TcxGridDBBandedColumn
        DataBinding.FieldName = 'UserName'
        Options.Editing = False
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvUsersScheduleSUNDAY: TcxGridDBBandedColumn
        Caption = 'Sunday'
        DataBinding.FieldName = 'SUNDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvUsersScheduleMONDAY: TcxGridDBBandedColumn
        Caption = 'Monday'
        DataBinding.FieldName = 'MONDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvUsersScheduleTUESDAY: TcxGridDBBandedColumn
        Caption = 'Tuesday'
        DataBinding.FieldName = 'TUESDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object btvUsersScheduleWEDNESDAY: TcxGridDBBandedColumn
        Caption = 'Wednesday'
        DataBinding.FieldName = 'WEDNESDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object btvUsersScheduleTHURSDAY: TcxGridDBBandedColumn
        Caption = 'Thursday'
        DataBinding.FieldName = 'THURSDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object btvUsersScheduleFRIDAY: TcxGridDBBandedColumn
        Caption = 'Friday'
        DataBinding.FieldName = 'FRIDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object btvUsersScheduleSATURDAY: TcxGridDBBandedColumn
        Caption = 'Saturday'
        DataBinding.FieldName = 'SATURDAY'
        PropertiesClassName = 'TcxCalcEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Position.BandIndex = 1
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object btvUsersScheduleRowSum: TcxGridDBBandedColumn
        Caption = 'Sum'
        DataBinding.FieldName = 'RowSum'
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object btvUsersScheduleRowAvg: TcxGridDBBandedColumn
        Caption = 'AVG'
        DataBinding.FieldName = 'RowAvg'
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object btvUsersScheduleProjectName: TcxGridDBBandedColumn
        Caption = 'Project Name'
        DataBinding.FieldName = 'PROJECTID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = ViewBandedFixedDemoDMMain.dsPROJECTS
        Visible = False
        GroupIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
    end
    object glUserslSchedule: TcxGridLevel
      GridView = btvUsersSchedule
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 426
    Width = 727
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 8
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
      Caption = 'Options'
      object miShowBandsHeaders: TMenuItem
        Caption = 'Show &Bands Headers'
        Checked = True
        Hint = 'Show Bands Headers'
        OnClick = miShowBandsHeadersClick
      end
      object miShowIndicator: TMenuItem
        Caption = 'Show &Indicator'
        Hint = 'Display the grid view indicator specifying the record state'
        OnClick = miShowIndicatorClick
      end
      object miShowColumnsHeaders: TMenuItem
        Caption = 'Show &Columns Headers'
        Checked = True
        Hint = 'Display header for all grid columns'
        OnClick = miShowColumnsHeadersClick
      end
      object miMultiSelect: TMenuItem
        Caption = '&Multi Select'
        Hint = 'Allows you to select several rows'
        OnClick = miMultiSelectClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object cxGridPopupMenu: TcxGridPopupMenu
    Grid = cxGrid
    PopupMenus = <>
    Left = 440
    Top = 8
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 8
  end
end
