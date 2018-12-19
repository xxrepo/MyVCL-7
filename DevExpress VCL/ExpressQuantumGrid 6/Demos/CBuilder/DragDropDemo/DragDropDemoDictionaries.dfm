object DragDropDemoDictionariesForm: TDragDropDemoDictionariesForm
  Left = 330
  Top = 212
  Width = 625
  Height = 429
  Caption = 'Dictionaries'
  Color = clBtnFace
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbDesc: TLabel
    Left = 0
    Top = 0
    Width = 617
    Height = 32
    Align = alTop
    Caption = 
      'Drag a row from the grid below and drop it into the current cate' +
      'gory displayed by the main form (see its Help/About for more inf' +
      'ormation).'
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
  object SourceGrid: TcxGrid
    Left = 0
    Top = 32
    Width = 617
    Height = 363
    Align = alClient
    TabOrder = 0
    RootLevelOptions.DetailTabsPosition = dtpTop
    RootLevelStyles.Tab = DragDropDemoMainDM.cxStyle1
    RootLevelStyles.TabsBackground = DragDropDemoMainDM.cxStyle39
    object tvCompaniesList: TcxGridDBTableView
      DragMode = dmAutomatic
      DataController.DataSource = DragDropDemoMainDM.dsCompanies
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DragDropDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvCompaniesListID: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID'
      end
      object tvCompaniesListCOMPANYTYPEID: TcxGridDBColumn
        Caption = 'Company Type'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = DragDropDemoMainDM.dsCompaniesType
        Properties.MaxLength = 50
        Width = 144
        DataBinding.FieldName = 'COMPANYTYPEID'
      end
      object tvCompaniesListCOUNTRYID: TcxGridDBColumn
        Caption = 'Country'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListSource = DragDropDemoMainDM.dsCountries
        Properties.MaxLength = 60
        Width = 110
        DataBinding.FieldName = 'COUNTRYID'
      end
      object tvCompaniesListCOMPANYNAME: TcxGridDBColumn
        Caption = 'Name'
        Width = 264
        DataBinding.FieldName = 'COMPANYNAME'
      end
      object tvCompaniesListCOMPANYWEBSITE: TcxGridDBColumn
        Caption = 'Company Web Site'
        Visible = False
        DataBinding.FieldName = 'COMPANYWEBSITE'
      end
    end
    object tvFilmsList: TcxGridDBTableView
      DragMode = dmAutomatic
      DataController.DataSource = DragDropDemoMainDM.dsFilmsDict
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      Styles.StyleSheet = DragDropDemoMainDM.GridTableViewStyleSheetDevExpress
      object tvFilmsListID: TcxGridDBColumn
        Visible = False
        DataBinding.FieldName = 'ID'
      end
      object tvFilmsListCAPTION: TcxGridDBColumn
        Caption = 'Caption'
        Width = 165
        DataBinding.FieldName = 'CAPTION'
      end
      object tvFilmsListYEAR: TcxGridDBColumn
        Caption = 'Year'
        Width = 39
        DataBinding.FieldName = 'YEAR'
      end
      object tvFilmsListTAGLINE: TcxGridDBColumn
        Caption = 'Tagline'
        Width = 194
        DataBinding.FieldName = 'TAGLINE'
      end
      object tvFilmsListPLOTOUTLINE: TcxGridDBColumn
        Caption = 'Plot Outline'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        Width = 41
        DataBinding.FieldName = 'PLOTOUTLINE'
      end
      object tvFilmsListRUNTIME: TcxGridDBColumn
        Caption = 'Runtime'
        Width = 31
        DataBinding.FieldName = 'RUNTIME'
      end
      object tvFilmsListCOLOR: TcxGridDBColumn
        Caption = 'Color'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayUnchecked = 'False'
        Width = 48
        DataBinding.FieldName = 'COLOR'
      end
      object tvFilmsListPHOTO: TcxGridDBColumn
        Caption = 'Photo'
        Visible = False
        DataBinding.FieldName = 'PHOTO'
      end
      object tvFilmsListICON: TcxGridDBColumn
        Caption = 'Icon'
        Visible = False
        DataBinding.FieldName = 'ICON'
      end
      object tvFilmsListWEBSITE: TcxGridDBColumn
        Caption = 'Website'
        Visible = False
        Width = 87
        DataBinding.FieldName = 'WEBSITE'
      end
    end
    object cvPersonsList: TcxGridDBCardView
      DragMode = dmAutomatic
      DataController.DataSource = DragDropDemoMainDM.dsPersons
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      Styles.StyleSheet = DragDropDemoMainDM.GridCardViewStyleSheetDevExpress
      object cvPersonsListID: TcxGridDBCardViewRow
        Visible = False
        DataBinding.FieldName = 'ID'
      end
      object cvPersonsListFIRSTNAME: TcxGridDBCardViewRow
        Caption = 'First Name'
        DataBinding.FieldName = 'FIRSTNAME'
      end
      object cvPersonsListSECONDNAME: TcxGridDBCardViewRow
        Caption = 'Second Name'
        DataBinding.FieldName = 'SECONDNAME'
      end
      object cvPersonsListGENDER: TcxGridDBCardViewRow
        Caption = 'Gender'
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
        DataBinding.FieldName = 'GENDER'
      end
      object cvPersonsListBIRTHNAME: TcxGridDBCardViewRow
        Caption = 'Birthname'
        DataBinding.FieldName = 'BIRTHNAME'
      end
      object cvPersonsListDATEOFBIRTH: TcxGridDBCardViewRow
        Caption = 'Date of Birth'
        DataBinding.FieldName = 'DATEOFBIRTH'
      end
      object cvPersonsListBIRTHCOUNTRY: TcxGridDBCardViewRow
        Caption = 'Birth Country'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.KeyFieldNames = 'ID'
        Properties.ListColumns = <
          item
            FieldName = 'NAME'
          end>
        Properties.ListSource = DragDropDemoMainDM.dsCountries
        DataBinding.FieldName = 'BIRTHCOUNTRY'
      end
      object cvPersonsListLOCATIONOFBIRTH: TcxGridDBCardViewRow
        Caption = 'Location of Birth'
        DataBinding.FieldName = 'LOCATIONOFBIRTH'
      end
      object cvPersonsListBIOGRAPHY: TcxGridDBCardViewRow
        Caption = 'Biography'
        PropertiesClassName = 'TcxBlobEditProperties'
        Properties.BlobEditKind = bekMemo
        DataBinding.FieldName = 'BIOGRAPHY'
      end
      object cvPersonsListNICKNAME: TcxGridDBCardViewRow
        Caption = 'Nick Name'
        DataBinding.FieldName = 'NICKNAME'
      end
      object cvPersonsListHOMEPAGE: TcxGridDBCardViewRow
        Visible = False
        DataBinding.FieldName = 'HOMEPAGE'
      end
    end
    object glFilmsList: TcxGridLevel
      Caption = 'Films'
      GridView = tvFilmsList
    end
    object glPersonsList: TcxGridLevel
      Caption = 'Persons'
      GridView = cvPersonsList
    end
    object glCompaniesList: TcxGridLevel
      Caption = 'Companies'
      GridView = tvCompaniesList
    end
  end
end
