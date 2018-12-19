object MasterDetailDemoMainForm: TMasterDetailDemoMainForm
  Left = 36
  Top = 37
  Width = 940
  Height = 684
  Caption = 'ExpressQuantumGrid Master Detail Demo'
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
    Width = 932
    Height = 18
    Align = alTop
    AutoSize = False
    Caption = 'Click '#39'About this demo'#39' for more information.'
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
  object StatusBar: TStatusBar
    Left = 0
    Top = 611
    Width = 932
    Height = 19
    AutoHint = True
    Panels = <>
    SimplePanel = False
  end
  object Grid: TcxGrid
    Left = 0
    Top = 18
    Width = 932
    Height = 593
    Align = alClient
    TabOrder = 1
    object tvFilms: TcxGridDBTableView
      DataController.DataSource = MasterDetailDemoDataDM.dsFilms
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object tvFilmsID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object tvFilmsCAPTION: TcxGridDBColumn
        DataBinding.FieldName = 'CAPTION'
      end
      object tvFilmsYEAR: TcxGridDBColumn
        DataBinding.FieldName = 'YEAR'
      end
      object tvFilmsTAGLINE: TcxGridDBColumn
        DataBinding.FieldName = 'TAGLINE'
        Visible = False
      end
      object tvFilmsPLOTOUTLINE: TcxGridDBColumn
        DataBinding.FieldName = 'PLOTOUTLINE'
        Visible = False
      end
      object tvFilmsRUNTIME: TcxGridDBColumn
        DataBinding.FieldName = 'RUNTIME'
      end
      object tvFilmsCOLOR: TcxGridDBColumn
        DataBinding.FieldName = 'COLOR'
        Visible = False
      end
      object tvFilmsPHOTO: TcxGridDBColumn
        DataBinding.FieldName = 'PHOTO'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekPict
        Properties.PictureGraphicClassName = 'TJPEGImage'
      end
      object tvFilmsICON: TcxGridDBColumn
        DataBinding.FieldName = 'ICON'
        Visible = False
      end
      object tvFilmsWEBSITE: TcxGridDBColumn
        DataBinding.FieldName = 'WEBSITE'
        Visible = False
      end
    end
    object cvPeople: TcxGridDBCardView
      DataController.DataSource = MasterDetailDemoDataDM.dsFilmsPersons
      DataController.DetailKeyFieldNames = 'FilmID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.StyleSheet = GridCardViewStyleSheetDevExpress
      object cvPeopleName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Kind = rkCaption
      end
      object cvPeoplePersonLineID: TcxGridDBCardViewRow
        Caption = 'Occupation'
        DataBinding.FieldName = 'PersonLineID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = MasterDetailDemoDataDM.dsPersonsLine
      end
      object cvPeopleFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvPeopleSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvPeopleNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
      end
      object cvPeopleBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvPeopleDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvPeopleLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvPeopleBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
      end
      object cvPeopleHOMEPAGE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'HOMEPAGE'
      end
      object cvPeopleID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cvPeopleFilmID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FilmID'
        Visible = False
      end
      object cvPeopleBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        Visible = False
      end
      object cvPeopleGender: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Gender'
        Visible = False
      end
    end
    object tvCompanies: TcxGridDBTableView
      DataController.DataSource = MasterDetailDemoDataDM.dsFilmsCompanies
      DataController.DetailKeyFieldNames = 'FILMID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      Styles.StyleSheet = GridTableViewStyleSheetDevExpress
      object tvCompaniesName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
      end
      object tvCompaniesType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
      end
      object tvCompaniesCountry: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
      end
      object tvCompaniesWebSite: TcxGridDBColumn
        DataBinding.FieldName = 'WebSite'
        Visible = False
      end
      object tvCompaniesID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object tvCompaniesFILMID: TcxGridDBColumn
        DataBinding.FieldName = 'FILMID'
        Visible = False
      end
    end
    object cvPhotos: TcxGridDBCardView
      DataController.DataSource = MasterDetailDemoDataDM.dsFilmsScreens
      DataController.DetailKeyFieldNames = 'FILMID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = GridCardViewStyleSheetDevExpress
      object cvPhotosID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cvPhotosFILMID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FILMID'
        Visible = False
      end
      object cvPhotosSCREEN: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SCREEN'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Options.ShowCaption = False
      end
      object cvPhotosICON: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ICON'
        Visible = False
      end
    end
    object lvFilms: TcxGridLevel
      GridView = tvFilms
      Options.DetailTabsPosition = dtpTop
      object lvPeople: TcxGridLevel
        Caption = 'People'
        GridView = cvPeople
      end
      object lvCompanies: TcxGridLevel
        Caption = 'Companies'
        GridView = tvCompanies
      end
      object lvPhotos: TcxGridLevel
        Caption = 'Photos'
        GridView = cvPhotos
      end
    end
  end
  object mmMain: TMainMenu
    Left = 488
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
      Caption = 'O&ptions'
      object miTabsPosition: TMenuItem
        Caption = 'Tabs Position'
        GroupIndex = 1
        object miLeftTabsPosition: TMenuItem
          Caption = 'Left'
          GroupIndex = 2
          Hint = 'Tabs are arranged on the Left of the master level'
          RadioItem = True
          OnClick = miTabsPositionClick
        end
        object miTopTabsPosition: TMenuItem
          Caption = 'Top'
          Checked = True
          GroupIndex = 2
          Hint = 'Tabs are arranged on the Top of the master level'
          RadioItem = True
          OnClick = miTabsPositionClick
        end
      end
      object miDetailViewsSynchronization: TMenuItem
        Caption = '&Synchronize Detail Views'
        Checked = True
        GroupIndex = 1
        Hint = 
          'Synchronize any changes across detail views (e.g. sorting, filte' +
          'ring, grouping)'
        OnClick = miDetailViewsSynchronizationClick
      end
      object miSeparator1: TMenuItem
        Caption = '-'
        GroupIndex = 1
      end
      object miShowPreviewData: TMenuItem
        Caption = 'Show Preview Data'
        GroupIndex = 1
        Hint = 'Show preview data for each films'
        OnClick = miShowPreviewDataClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      Hint = 'Displays the brief description of the current demo features'
      OnClick = miAboutClick
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 424
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
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle24: TcxStyle
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
    object GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle21
      Styles.IncSearch = cxStyle22
      Styles.Selection = cxStyle24
      Styles.CaptionRow = cxStyle16
      Styles.CardBorder = cxStyle17
      Styles.RowCaption = cxStyle23
      BuiltIn = True
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 456
    Top = 32
  end
end
