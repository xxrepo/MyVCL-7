object StylesMultiDemoMainForm: TStylesMultiDemoMainForm
  Left = 270
  Top = 120
  Width = 807
  Height = 566
  Caption = 'ExpressQuantumGrid StylesMulti Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 799
    Height = 18
    Align = alTop
    AutoSize = False
    Caption = 
      'Practice using Style Sheets.  Click "About this demo" for more i' +
      'nformation.'
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
  object Splitter: TSplitter
    Left = 177
    Top = 18
    Width = 2
    Height = 475
    Cursor = crHSplit
    MinSize = 4
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 493
    Width = 799
    Height = 19
    AutoHint = True
    Panels = <>
    ParentShowHint = False
    ShowHint = True
    SimplePanel = True
  end
  object cxGrid: TcxGrid
    Left = 179
    Top = 18
    Width = 620
    Height = 475
    Align = alClient
    TabOrder = 2
    object tvProjects: TcxGridDBTableView
      DataController.DataSource = StylesMultiDemoDataDM.dsProjects
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvProjectsNAME
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvProjectsID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object tvProjectsNAME: TcxGridDBColumn
        DataBinding.FieldName = 'NAME'
        Width = 200
      end
      object tvProjectsMANAGERID: TcxGridDBColumn
        DataBinding.FieldName = 'MANAGERID'
        RepositoryItem = StylesMultiDemoDataDM.edrepUserInfo
        Width = 200
      end
    end
    object tvTeam: TcxGridDBTableView
      DataController.DataSource = StylesMultiDemoDataDM.dsTeam
      DataController.DetailKeyFieldNames = 'PROJECTID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          Column = tvTeamFUNCTION
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object tvTeamPROJECTID: TcxGridDBColumn
        DataBinding.FieldName = 'PROJECTID'
        Visible = False
      end
      object tvTeamFUNCTION: TcxGridDBColumn
        DataBinding.FieldName = 'FUNCTION'
        Width = 150
      end
      object tvTeamUSERID: TcxGridDBColumn
        DataBinding.FieldName = 'USERID'
        RepositoryItem = StylesMultiDemoDataDM.edrepUserInfo
        Width = 200
      end
    end
    object lvProjects: TcxGridLevel
      GridView = tvProjects
      object lvTeam: TcxGridLevel
        GridView = tvTeam
      end
    end
  end
  object pnlLeft: TPanel
    Left = 0
    Top = 18
    Width = 177
    Height = 475
    Align = alLeft
    Anchors = [akLeft]
    BevelInner = bvLowered
    BevelOuter = bvNone
    Color = 15451300
    TabOrder = 1
    object gbUserDefined: TGroupBox
      Left = 1
      Top = 318
      Width = 175
      Height = 156
      Align = alBottom
      Caption = 'User Defined Style Sheets'
      Enabled = False
      TabOrder = 3
      TabStop = True
      object cbUserStyleSheets: TComboBox
        Left = 10
        Top = 31
        Width = 154
        Height = 19
        Style = csOwnerDrawFixed
        Anchors = [akLeft, akTop, akRight]
        Color = 16247513
        Enabled = False
        ItemHeight = 13
        TabOrder = 0
        OnClick = cbUserStyleSheetsChange
      end
      object btnLoad: TcxButton
        Left = 11
        Top = 89
        Width = 153
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '&LoadFromFile...'
        Enabled = False
        TabOrder = 2
        OnClick = btnLoadClick
      end
      object btnSave: TcxButton
        Left = 11
        Top = 116
        Width = 153
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '&SaveToFile...'
        Enabled = False
        TabOrder = 3
        OnClick = btnSaveClick
      end
      object btnEdit: TcxButton
        Left = 11
        Top = 62
        Width = 153
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = '&Edit Style Sheet'
        Enabled = False
        TabOrder = 1
        OnClick = btnEditClick
      end
    end
    object RadioGroup: TcxRadioGroup
      Left = 1
      Top = 36
      Width = 175
      Height = 88
      Align = alTop
      Caption = 'Use styles'
      ItemIndex = 1
      Properties.Items = <
        item
          Caption = 'None'
        end
        item
          Caption = 'Predefined'
        end
        item
          Caption = 'User defined'
        end>
      TabOrder = 1
      OnClick = RadioGroupClick
    end
    object gbPredefined: TGroupBox
      Left = 1
      Top = 124
      Width = 175
      Height = 194
      Align = alClient
      Caption = 'Predefined Style Sheets'
      TabOrder = 2
      TabStop = True
      object lbPredefinedStyleSheets: TcxListBox
        Left = 2
        Top = 15
        Width = 171
        Height = 177
        Align = alClient
        ItemHeight = 13
        Style.Color = 16247513
        TabOrder = 0
        OnClick = lbPredefinedStyleSheetsClick
      end
    end
    object pnlCurrentStyleSheet: TPanel
      Left = 1
      Top = 1
      Width = 175
      Height = 35
      Align = alTop
      BevelOuter = bvLowered
      Color = 4707838
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
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
      object miLookAndFeel: TMenuItem
        Caption = '&Look&&Feel'
        object miKind: TMenuItem
          Caption = 'Kind'
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
          object miUltraFlat: TMenuItem
            Caption = '&Ultra Flat'
            Checked = True
            Hint = 
              'Setting this option changes the grid view appearance to Ultra Fl' +
              'at style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
          object miOffice11: TMenuItem
            Tag = 3
            Caption = '&Office11'
            Hint = 
              'Setting this option changes the grid view appearance to Office11' +
              ' style'
            RadioItem = True
            OnClick = miLookAndFeelKindClick
          end
        end
        object miNativeStyle: TMenuItem
          Caption = '&Native Style'
          Checked = True
          Hint = 
            'Setting this option changes the appearance of grid items to the ' +
            'native style'
          OnClick = miNativeStyleClick
        end
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid
    PopupMenus = <>
    Left = 408
    Top = 8
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofExtensionDifferent, ofEnableSizing]
    Left = 536
    Top = 8
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.ini'
    Filter = '*.ini|*.ini'
    Left = 568
    Top = 8
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 376
    Top = 8
  end
end
