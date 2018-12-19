object MasterDetailMultiDemoMainForm: TMasterDetailMultiDemoMainForm
  Left = 300
  Top = 120
  Width = 800
  Height = 600
  Caption = 'ExpressQuantumGrid MasterDetailMulti Demo '
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 792
    Height = 29
    Align = alTop
    AutoSize = False
    Caption = 
      '  This demo shows how switching of tabs can be used to control v' +
      'isible grid data and allows you to customize tabs.'
    Color = 12937777
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Layout = tlCenter
    WordWrap = True
  end
  object Grid: TcxGrid
    Left = 0
    Top = 29
    Width = 792
    Height = 517
    Align = alClient
    TabOrder = 0
    LevelTabs.CaptionAlignment = taLeftJustify
    LevelTabs.Slants.Kind = skCutCorner
    LevelTabs.Style = 9
    RootLevelOptions.DetailTabsPosition = dtpLeft
    RootLevelStyles.OnGetTabStyle = GridRootLevelStylesGetTabStyle
    OnActiveTabChanged = GridActiveTabChanged
    object cvPeople: TcxGridDBCardView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = MasterDetailMultiDemoMainDM.dsFilmsPersons
      DataController.DetailKeyFieldNames = 'FilmID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      object cvPeopleName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Kind = rkCaption
        Position.BeginsLayer = True
      end
      object cvPeoplePersonLineID: TcxGridDBCardViewRow
        Caption = 'Occupation'
        DataBinding.FieldName = 'PersonLineID'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.GridLines = glNone
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = MasterDetailMultiDemoMainDM.dsPersonsLine
        Position.BeginsLayer = True
      end
      object cvPeopleFIRSTNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FIRSTNAME'
        Position.BeginsLayer = True
      end
      object cvPeopleSECONDNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SECONDNAME'
        Position.BeginsLayer = True
      end
      object cvPeopleNICKNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'NICKNAME'
        Position.BeginsLayer = True
      end
      object cvPeopleBIRTHNAME: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHNAME'
        Position.BeginsLayer = True
      end
      object cvPeopleDATEOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'DATEOFBIRTH'
        Position.BeginsLayer = True
      end
      object cvPeopleLOCATIONOFBIRTH: TcxGridDBCardViewRow
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
        Position.BeginsLayer = True
      end
      object cvPeopleBIOGRAPHY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Position.BeginsLayer = True
      end
      object cvPeopleHOMEPAGE: TcxGridDBCardViewRow
        DataBinding.FieldName = 'HOMEPAGE'
        Position.BeginsLayer = True
      end
      object cvPeopleID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPeopleFilmID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FilmID'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPeopleBIRTHCOUNTRY: TcxGridDBCardViewRow
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPeopleGender: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Gender'
        Visible = False
        Position.BeginsLayer = True
      end
    end
    object tvCompanies: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = MasterDetailMultiDemoMainDM.dsFilmsCompanies
      DataController.DetailKeyFieldNames = 'FILMID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object tvCompaniesName: TcxGridDBColumn
        DataBinding.FieldName = 'Name'
        Width = 202
      end
      object tvCompaniesType: TcxGridDBColumn
        DataBinding.FieldName = 'Type'
        Width = 130
      end
      object tvCompaniesCountry: TcxGridDBColumn
        DataBinding.FieldName = 'Country'
        Width = 251
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
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = MasterDetailMultiDemoMainDM.dsFilmsScreens
      DataController.DetailKeyFieldNames = 'FILMID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellAutoHeight = True
      object cvPhotosID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPhotosFILMID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FILMID'
        Visible = False
        Position.BeginsLayer = True
      end
      object cvPhotosSCREEN: TcxGridDBCardViewRow
        DataBinding.FieldName = 'SCREEN'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Options.ShowCaption = False
        Position.BeginsLayer = True
      end
      object cvPhotosICON: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ICON'
        Visible = False
        Position.BeginsLayer = True
      end
    end
    object bvFilms: TcxGridDBBandedTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = MasterDetailMultiDemoMainDM.dsFilms
      DataController.KeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      Preview.Column = bvFilmsCAPTION
      Preview.Place = ppTop
      Preview.Visible = True
      Bands = <
        item
          Caption = 'Film'
        end
        item
          Caption = 'Info'
        end>
      object bvFilmsCAPTION: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CAPTION'
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object bvFilmsPHOTO: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PHOTO'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.LineCount = 10
        Position.RowIndex = 1
      end
      object bvFilmsYEAR: TcxGridDBBandedColumn
        DataBinding.FieldName = 'YEAR'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object bvFilmsRUNTIME: TcxGridDBBandedColumn
        DataBinding.FieldName = 'RUNTIME'
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object bvFilmsPLOTOUTLINE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PLOTOUTLINE'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ScrollBars = ssVertical
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.LineCount = 8
        Position.RowIndex = 1
      end
      object bvFilmsWEBSITE: TcxGridDBBandedColumn
        DataBinding.FieldName = 'WEBSITE'
        PropertiesClassName = 'TcxHyperLinkEditProperties'
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 2
      end
    end
  end
  object mmMain: TMainMenu
    Left = 504
    Top = 44
    object miFile: TMenuItem
      Caption = '&File'
      object miExit: TMenuItem
        Caption = 'E&xit'
        ShortCut = 32856
        OnClick = miExitClick
      end
    end
    object miView: TMenuItem
      Caption = 'View'
      object miGenreTabPosition: TMenuItem
        Caption = 'Genre Tab &Position'
        object miTabPositionNone: TMenuItem
          Caption = 'dtpNone'
          GroupIndex = 2
          RadioItem = True
          OnClick = miTabPositionClick
        end
        object miTabPositionLeft: TMenuItem
          Tag = 1
          Caption = 'dtpLeft'
          GroupIndex = 2
          RadioItem = True
          OnClick = miTabPositionClick
        end
        object miTabPositionTop: TMenuItem
          Tag = 2
          Caption = 'dtpTop'
          GroupIndex = 2
          RadioItem = True
          OnClick = miTabPositionClick
        end
      end
      object miTabsForEmptyDetails: TMenuItem
        Caption = 'Tabs For Empty Details'
        OnClick = miTabsForEmptyDetailsClick
      end
    end
    object miTabStyle: TMenuItem
      Caption = 'Tab Style'
    end
    object miTabCaptionAlignment: TMenuItem
      Caption = 'Tab Caption Alignment'
      object miTabCaptionAlignmentLeft: TMenuItem
        Caption = 'taLeftJustify'
        GroupIndex = 1
        RadioItem = True
        OnClick = miTabCaptionAlignmentClick
      end
      object miTabCaptionAlignmentRight: TMenuItem
        Caption = 'taRightJustify'
        GroupIndex = 1
        RadioItem = True
        OnClick = miTabCaptionAlignmentClick
      end
      object miTabCaptionAlignmentCenter: TMenuItem
        Caption = 'taCenter'
        GroupIndex = 1
        RadioItem = True
        OnClick = miTabCaptionAlignmentClick
      end
    end
    object miAbout: TMenuItem
      Caption = '&About this demo'
      OnClick = miAboutClick
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    NativeStyle = True
    Left = 472
    Top = 44
  end
end
