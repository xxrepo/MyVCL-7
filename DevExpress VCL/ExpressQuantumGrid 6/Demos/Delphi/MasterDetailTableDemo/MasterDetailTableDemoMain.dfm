object MasterDetailTableDemoMainForm: TMasterDetailTableDemoMainForm
  Left = 100
  Top = 40
  Width = 903
  Height = 631
  Caption = 'ExpressQuantumGrid Master Detail Table Demo'
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblStyle: TLabel
    Left = 0
    Top = 32
    Width = 895
    Height = 24
    Align = alTop
    Alignment = taCenter
    Caption = 'Standard master-detail style'
    Color = 15790320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblMaster: TLabel
    Left = 0
    Top = 61
    Width = 895
    Height = 22
    Align = alTop
    Caption = 'Master : Films'
    Color = 15790320
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Arial'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object Bevel1: TBevel
    Left = 0
    Top = 56
    Width = 895
    Height = 5
    Align = alTop
    Shape = bsTopLine
  end
  object lbDescription: TLabel
    Left = 0
    Top = 0
    Width = 895
    Height = 32
    Align = alTop
    Caption = 
      'Initially displays as separate master and detail grids. Use the ' +
      'Options in order to show both tables in a single grid. Click '#39'Ab' +
      'out this demo'#39' for more information.'
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
    Left = 0
    Top = 292
    Width = 895
    Height = 2
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  object pnlDetail: TPanel
    Left = 0
    Top = 294
    Width = 895
    Height = 264
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlDetail'
    TabOrder = 0
    object lblDetail: TLabel
      Left = 0
      Top = 0
      Width = 895
      Height = 22
      Align = alTop
      Caption = 'Detail: People involved with the film'
      Color = 15790320
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object GridDetail: TcxGrid
      Left = 0
      Top = 22
      Width = 895
      Height = 242
      Align = alClient
      TabOrder = 0
      RootLevelOptions.DetailFrameColor = 16247513
      object tvFilmsPersonsStaff: TcxGridDBTableView
        DataController.DataSource = MasterDetailTableDemoMainDM.dsFilmsPersonsStaff
        DataController.KeyFieldNames = 'ID'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        NavigatorButtons.ConfirmDelete = False
        OptionsBehavior.FocusCellOnTab = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.Indicator = True
        OptionsView.NewItemRow = True
        Styles.StyleSheet = MasterDetailTableDemoMainDM.GridTableViewStyleSheetDevExpress
        object tvFilmsPersonsStaffPERSONLINEID: TcxGridDBColumn
          Caption = 'Occupation'
          DataBinding.FieldName = 'PERSONLINEID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = MasterDetailTableDemoMainDM.dsPersonsLine
        end
        object tvFilmsPersonsStaffPERSONID: TcxGridDBColumn
          Caption = 'Person'
          DataBinding.FieldName = 'PERSONID'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'ID'
          Properties.ListColumns = <
            item
              FieldName = 'NAME'
            end>
          Properties.ListOptions.GridLines = glNone
          Properties.ListOptions.ShowHeader = False
          Properties.ListSource = MasterDetailTableDemoMainDM.dsPersons
        end
        object tvFilmsPersonsStaffDESCRIPTION: TcxGridDBColumn
          Caption = 'Description'
          DataBinding.FieldName = 'DESCRIPTION'
          Width = 300
        end
      end
      object lvDetail: TcxGridLevel
        GridView = tvFilmsPersonsStaff
      end
    end
  end
  object Grid: TcxGrid
    Left = 0
    Top = 83
    Width = 895
    Height = 209
    Align = alClient
    TabOrder = 1
    object tvFilms: TcxGridDBTableView
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = MasterDetailTableDemoMainDM.dsFilms
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsView.CellAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.NewItemRow = True
      Preview.Column = tvFilmsPLOTOUTLINE
      Preview.Visible = True
      Styles.StyleSheet = MasterDetailTableDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvFilmsCAPTION: TcxGridDBColumn
        Caption = 'Caption'
        DataBinding.FieldName = 'CAPTION'
      end
      object tvFilmsYEAR: TcxGridDBColumn
        Caption = 'Year'
        DataBinding.FieldName = 'YEAR'
      end
      object tvFilmsRUNTIME: TcxGridDBColumn
        Caption = 'Runtime'
        DataBinding.FieldName = 'RUNTIME'
      end
      object tvFilmsPHOTO: TcxGridDBColumn
        Caption = 'Photo'
        DataBinding.FieldName = 'PHOTO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekPict
        Properties.PictureGraphicClassName = 'TJPEGImage'
      end
      object tvFilmsTAGLINE: TcxGridDBColumn
        Caption = 'TagLine'
        DataBinding.FieldName = 'TAGLINE'
        Width = 350
      end
      object tvFilmsPLOTOUTLINE: TcxGridDBColumn
        Caption = 'PlotOutline'
        DataBinding.FieldName = 'PLOTOUTLINE'
        Width = 350
      end
    end
    object lvFilms: TcxGridLevel
      GridView = tvFilms
      MaxDetailHeight = 200
      object lvFilmsPersonsStaff: TcxGridLevel
        Visible = False
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 558
    Width = 895
    Height = 19
    AutoHint = True
    Panels = <>
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
      object miGrid4: TMenuItem
        Caption = 'ExpressQuantumGrid Master-Detail display style'
        Hint = 
          'ExpressQuantumGrid master-detail display style Combines two sepa' +
          'rate grid views into the master-detail representation'
        OnClick = miGrid4Click
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 8
  end
end
