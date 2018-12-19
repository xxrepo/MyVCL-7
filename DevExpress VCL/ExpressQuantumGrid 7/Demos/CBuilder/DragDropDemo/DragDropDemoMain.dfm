object DragDropDemoMainForm: TDragDropDemoMainForm
  Left = 187
  Top = 55
  Width = 761
  Height = 646
  Caption = 'ExpressQuantumGrid DragDropDemo '
  Color = clBtnFace
  Menu = mmMain
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbDescrip: TLabel
    Left = 0
    Top = 0
    Width = 753
    Height = 32
    Align = alTop
    Caption = 
      'This demo demonstrates how to copy records into another grid usi' +
      'ng drag/drop. Click "About this demo" for more information.'
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
    Top = 573
    Width = 753
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
    Width = 753
    Height = 541
    Align = alClient
    TabOrder = 1
    RootLevelOptions.DetailTabsPosition = dtpLeft
    RootLevelStyles.Tab = DragDropDemoMainDM.cxStyle1
    RootLevelStyles.TabsBackground = DragDropDemoMainDM.cxStyle39
    OnActiveTabChanged = GridActiveTabChanged
    object cvPersons: TcxGridDBCardView
      OnDragDrop = cvPersonsDragDrop
      OnDragOver = cvPersonsDragOver
      DataController.DataSource = DragDropDemoMainDM.dsFilmsPersons
      DataController.DetailKeyFieldNames = 'FilmID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.DragFocusing = dfDragOver
      OptionsData.Inserting = False
      Styles.StyleSheet = DragDropDemoMainDM.GridCardViewStyleSheetDevExpress
      object cvPersonsName: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Name'
        Kind = rkCaption
      end
      object cvPersonsPersonLineID: TcxGridDBCardViewRow
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
        Properties.ListSource = DragDropDemoMainDM.dsPersonsLine
      end
      object cvPersonsFIRSTNAME: TcxGridDBCardViewRow
        Caption = 'First Name'
        DataBinding.FieldName = 'FIRSTNAME'
        Options.Editing = False
      end
      object cvPersonsSECONDNAME: TcxGridDBCardViewRow
        Caption = 'Second Name'
        DataBinding.FieldName = 'SECONDNAME'
        Options.Editing = False
      end
      object cvPersonsNICKNAME: TcxGridDBCardViewRow
        Caption = 'Nick Name'
        DataBinding.FieldName = 'NICKNAME'
        Options.Editing = False
      end
      object cvPersonsBIRTHNAME: TcxGridDBCardViewRow
        Caption = 'Birth Name'
        DataBinding.FieldName = 'BIRTHNAME'
        Options.Editing = False
      end
      object cvPersonsDATEOFBIRTH: TcxGridDBCardViewRow
        Caption = 'Date of Birth'
        DataBinding.FieldName = 'DATEOFBIRTH'
        Options.Editing = False
      end
      object cvPersonsLOCATIONOFBIRTH: TcxGridDBCardViewRow
        Caption = 'Location of Birth'
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
        Options.Editing = False
      end
      object cvPersonsBIOGRAPHY: TcxGridDBCardViewRow
        Caption = 'Biography'
        DataBinding.FieldName = 'BIOGRAPHY'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Properties.ReadOnly = True
      end
      object cvPersonsID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object cvPersonsFilmID: TcxGridDBCardViewRow
        DataBinding.FieldName = 'FilmID'
        Visible = False
      end
      object cvPersonsBIRTHCOUNTRY: TcxGridDBCardViewRow
        Caption = 'Birth Country'
        DataBinding.FieldName = 'BIRTHCOUNTRY'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DragDropDemoMainDM.dsCountries
        Visible = False
      end
      object cvPersonsGender: TcxGridDBCardViewRow
        DataBinding.FieldName = 'Gender'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Items = <
          item
            Description = 'Female'
            Value = False
          end
          item
            Description = 'Male'
            Value = True
          end>
        Options.Editing = False
      end
    end
    object tvCompanies: TcxGridDBTableView
      OnDragDrop = tvCompaniesDragDrop
      OnDragOver = tvCompaniesDragOver
      DataController.DataSource = DragDropDemoMainDM.dsFilmsCompanies
      DataController.DetailKeyFieldNames = 'FilmID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.DragFocusing = dfDragOver
      OptionsData.Inserting = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.Indicator = True
      Styles.StyleSheet = DragDropDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvCompaniesID: TcxGridDBColumn
        DataBinding.FieldName = 'ID'
        Visible = False
      end
      object tvCompaniesFilmID: TcxGridDBColumn
        DataBinding.FieldName = 'FilmID'
        Visible = False
      end
      object tvCompaniesFilmsCompaniesStaffCompanyID: TcxGridDBColumn
        DataBinding.FieldName = 'FilmsCompaniesStaff.CompanyID'
        Visible = False
      end
      object tvCompaniesCompanyID: TcxGridDBColumn
        DataBinding.FieldName = 'CompanyID'
        Visible = False
      end
      object tvCompaniesCompanyName: TcxGridDBColumn
        Caption = 'Company Name'
        DataBinding.FieldName = 'CompanyName'
        Options.Editing = False
      end
    end
    object cvPhotos: TcxGridDBCardView
      DataController.DataSource = DragDropDemoMainDM.dsFilmsScreens
      DataController.DetailKeyFieldNames = 'FILMID'
      DataController.KeyFieldNames = 'ID'
      DataController.MasterKeyFieldNames = 'ID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsView.CellAutoHeight = True
      Styles.StyleSheet = DragDropDemoMainDM.GridCardViewStyleSheetDevExpress
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
    object bvFilms: TcxGridDBBandedTableView
      OnDragDrop = bvFilmsDragDrop
      OnDragOver = bvFilmsDragOver
      DataController.DataSource = DragDropDemoMainDM.dsFilms
      DataController.KeyFieldNames = 'PrimeID'
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.DragFocusing = dfDragOver
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Header = False
      OptionsView.Indicator = True
      Preview.Column = bvFilmsCAPTION
      Preview.Place = ppTop
      Preview.Visible = True
      Styles.StyleSheet = DragDropDemoMainDM.GridBandedTableViewStyleSheetDevExpress
      Bands = <
        item
          Caption = 'Film'
          FixedKind = fkLeft
          Width = 57
        end
        item
          Caption = 'Info'
          Width = 447
        end>
      object bvFilmsCAPTION: TcxGridDBBandedColumn
        DataBinding.FieldName = 'CAPTION'
        Width = 404
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object bvFilmsPHOTO: TcxGridDBBandedColumn
        DataBinding.FieldName = 'PHOTO'
        PropertiesClassName = 'TcxImageProperties'
        Properties.GraphicClassName = 'TJPEGImage'
        Properties.Stretch = True
        Width = 50
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.LineCount = 5
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
        Properties.MaxLength = 200
        Properties.ScrollBars = ssVertical
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.LineCount = 3
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
    Left = 472
    Top = 16
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
      object miShowDictionaries: TMenuItem
        Caption = 'Show Dictionaries'
        Hint = 'Shows the form on which the source grid is located'
        OnClick = miShowDictionariesClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object miGenreTabPosition: TMenuItem
        Caption = 'Genre Tab &Position'
        object miTabPositionLeft: TMenuItem
          Tag = 1
          Caption = '&Left'
          Checked = True
          GroupIndex = 2
          Hint = 'Moves the tab panel to the left of the grid'
          RadioItem = True
          OnClick = miTabPositionClick
        end
        object miTabPositionTop: TMenuItem
          Tag = 2
          Caption = '&Top'
          GroupIndex = 2
          Hint = 'Moves the tab panel to the top of the grid'
          RadioItem = True
          OnClick = miTabPositionClick
        end
        object miTabPositionNone: TMenuItem
          Caption = '&None'
          GroupIndex = 2
          Hint = 'Hides the tab panel'
          RadioItem = True
          OnClick = miTabPositionClick
        end
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
    Left = 408
    Top = 16
  end
end
