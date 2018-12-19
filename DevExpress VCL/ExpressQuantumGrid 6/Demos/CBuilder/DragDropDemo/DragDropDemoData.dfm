object DragDropDemoMainDM: TDragDropDemoMainDM
  OldCreateOrder = False
  Left = 188
  Top = 111
  Height = 520
  Width = 679
  object dsFilms: TDataSource
    DataSet = qryFilms
    Left = 120
    Top = 152
  end
  object dsFilmsPersons: TDataSource
    DataSet = qryFilmsPersons
    Left = 184
    Top = 152
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 368
    Top = 256
  end
  object dsFilmsCompanies: TDataSource
    DataSet = qryFilmsCompanies
    Left = 40
    Top = 152
  end
  object dsFilmsScreens: TDataSource
    DataSet = tblFilmsScreens
    Left = 450
    Top = 258
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 112
    Top = 16
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
      AssignedValues = [svColor]
      Color = 15451300
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
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16749885
      TextColor = clWhite
    end
    object cxStyle40: TcxStyle
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
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.FilterBox = cxStyle5
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Header = cxStyle9
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
    end
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.FilterBox = cxStyle21
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
    end
    object GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle31
      Styles.Content = cxStyle34
      Styles.ContentEven = cxStyle35
      Styles.ContentOdd = cxStyle36
      Styles.Inactive = cxStyle37
      Styles.IncSearch = cxStyle38
      Styles.Selection = cxStyle40
      Styles.CaptionRow = cxStyle32
      Styles.CardBorder = cxStyle33
      Styles.RowCaption = cxStyle39
    end
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 32
    Top = 256
  end
  object dsCompanies: TDataSource
    DataSet = tblCompanies
    Left = 104
    Top = 256
  end
  object dsFilmsDict: TDataSource
    DataSet = tblFilmsDict
    Left = 192
    Top = 256
  end
  object dsCountries: TDataSource
    DataSet = tlbCountries
    Left = 520
    Top = 256
  end
  object dsCompaniesType: TDataSource
    DataSet = tblCompaniesType
    Left = 280
    Top = 256
  end
  object qryFilms: TQuery
    Active = True
    CachedUpdates = True
    BeforeDelete = qryFilmsBeforeDelete
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'SELECT FILMSGENRES.ID as PrimeID, FILMS.* '
      'FROM FILMSGENRES, FILMS  '
      'WHERE '
      'FILMSGENRES.FILMID = FILMS.ID and'
      'FilmsGenres.GenreID =:Param'
      'ORDER BY  FILMSGENRES.ID'
      ''
      '')
    UpdateObject = usqFilms
    Left = 120
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Param'
        ParamType = ptUnknown
        Value = 0
      end>
    object qryFilmsPrimeID: TIntegerField
      FieldName = 'PrimeID'
      Origin = 'DEMOSDB."FILMS.DB".ID'
    end
    object qryFilmsID: TIntegerField
      FieldName = 'ID'
      Origin = 'DEMOSDB."FILMS.DB".CAPTION'
    end
    object qryFilmsCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'DEMOSDB."FILMS.DB".YEAR'
      Size = 50
    end
    object qryFilmsYEAR: TIntegerField
      FieldName = 'YEAR'
      Origin = 'DEMOSDB."FILMS.DB".TAGLINE'
    end
    object qryFilmsTAGLINE: TStringField
      FieldName = 'TAGLINE'
      Origin = 'DEMOSDB."FILMS.DB".PLOTOUTLINE'
      Size = 250
    end
    object qryFilmsPLOTOUTLINE: TStringField
      FieldName = 'PLOTOUTLINE'
      Origin = 'DEMOSDB."FILMS.DB".RUNTIME'
      Size = 200
    end
    object qryFilmsRUNTIME: TIntegerField
      FieldName = 'RUNTIME'
      Origin = 'DEMOSDB."FILMS.DB".COLOR'
    end
    object qryFilmsCOLOR: TStringField
      FieldName = 'COLOR'
      Origin = 'DEMOSDB."FILMS.DB".PHOTO'
      Size = 50
    end
    object qryFilmsPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = 'DEMOSDB."FILMS.DB".ICON'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qryFilmsICON: TBlobField
      FieldName = 'ICON'
      Origin = 'DEMOSDB."FILMS.DB".WEBSITE'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qryFilmsWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Origin = 'DEMOSDB."FILMSGENRES.DB".ID'
      Size = 50
    end
  end
  object tblGenres: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'GENRES.DB'
    Left = 32
    Top = 320
    object tblGenresID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblGenresNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object qryFilmsCompanies: TQuery
    Active = True
    CachedUpdates = True
    BeforeDelete = qryFilmsCompaniesBeforeDelete
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'SELECT  '
      '  FilmsCompaniesStaff.ID, '
      '  FilmsCompaniesStaff.FilmID, '
      '  FilmsCompaniesStaff.CompanyID,'
      '  Companies.ID as CompanyID,'
      '  Companies.CompanyName as CompanyName'
      'FROM '
      '  FilmsCompaniesStaff, Companies'
      'WHERE'
      '  Companies.ID = FilmsCompaniesStaff.CompanyID'
      'ORDER BY '
      '  FilmsCompaniesStaff.ID')
    UpdateObject = usqFilmsCompanies
    Left = 40
    Top = 112
    object qryFilmsCompaniesID: TIntegerField
      FieldName = 'ID'
      Origin = 'DEMOSDB."FilmsCompaniesStaff.DB".ID'
    end
    object qryFilmsCompaniesFilmID: TIntegerField
      FieldName = 'FilmID'
      Origin = 'DEMOSDB."FilmsCompaniesStaff.DB".FILMID'
    end
    object qryFilmsCompaniesCompanyID: TIntegerField
      FieldName = 'CompanyID'
      Origin = 'DEMOSDB."FilmsCompaniesStaff.DB".COMPANYID'
    end
    object qryFilmsCompaniesCompanyID_1: TIntegerField
      FieldName = 'CompanyID_1'
      Origin = 'DEMOSDB."COMPANIES.DB".ID'
    end
    object qryFilmsCompaniesCompanyName: TStringField
      FieldName = 'CompanyName'
      Origin = 'DEMOSDB."COMPANIES.DB".COMPANYNAME'
      Size = 50
    end
  end
  object tblPersons: TTable
    Active = True
    BeforePost = tblPersonsBeforeUpdate
    AfterPost = tblPersonsAfterUpdate
    BeforeDelete = tblPersonsBeforeUpdate
    AfterDelete = tblPersonsAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 32
    Top = 216
  end
  object tblCompanies: TTable
    Active = True
    BeforePost = tblCompaniesBeforeUpdate
    AfterPost = tblCompaniesAfterUpdate
    BeforeDelete = tblCompaniesBeforeUpdate
    AfterDelete = tblCompaniesAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'COMPANIES.DB'
    Left = 104
    Top = 216
  end
  object tblFilmsDict: TTable
    Active = True
    BeforePost = tblFilmsDictBeforeUpdate
    AfterPost = tblFilmsDictAfterUpdate
    BeforeDelete = tblFilmsDictBeforeUpdate
    AfterDelete = tblFilmsDictAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'FILMS.DB'
    Left = 192
    Top = 216
  end
  object tblCompaniesType: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'COMPANIESTYPE.DB'
    Left = 280
    Top = 216
  end
  object qryFilmsPersons: TQuery
    Active = True
    CachedUpdates = True
    AfterPost = qryFilmsPersonsAfterPost
    BeforeDelete = qryFilmsPersonsBeforeDelete
    OnCalcFields = qryFilmsPersonsCalcFields
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'SELECT  '
      '  FilmsPersonsStaff.ID, FilmID, Persons.ID as PersonID, '
      '  PersonLineID, BIOGRAPHY, BIRTHCOUNTRY, '
      '  BIRTHNAME, DATEOFBIRTH, FIRSTNAME, '
      '  LOCATIONOFBIRTH, NICKNAME, SECONDNAME, '
      '  HOMEPAGE, Gender  '
      'FROM '
      'FilmsPersonsStaff, Persons '
      'WHERE'
      'FilmsPersonsStaff.PersonID = Persons.ID'
      'ORDER BY FilmsPersonsStaff.ID')
    UpdateObject = usqFilmsPersons
    Left = 184
    Top = 112
    object qryFilmsPersonsName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Calculated = True
    end
    object qryFilmsPersonsID: TIntegerField
      FieldName = 'ID'
      Origin = 'DEMOSDB."FILMSPERSONSSTAFF.DB".ID'
    end
    object qryFilmsPersonsFilmID: TIntegerField
      FieldName = 'FilmID'
      Origin = 'DEMOSDB."FILMSPERSONSSTAFF.DB".FILMID'
    end
    object qryFilmsPersonsPersonID: TIntegerField
      FieldName = 'PersonID'
      Origin = 'DEMOSDB."PERSONS.DB".ID'
    end
    object qryFilmsPersonsPersonLineID: TIntegerField
      FieldName = 'PersonLineID'
      Origin = 'DEMOSDB."FILMSPERSONSSTAFF.DB".PERSONLINEID'
    end
    object qryFilmsPersonsBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      Origin = 'DEMOSDB."PERSONS.DB".BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object qryFilmsPersonsBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
      Origin = 'DEMOSDB."PERSONS.DB".BIRTHCOUNTRY'
    end
    object qryFilmsPersonsBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Origin = 'DEMOSDB."PERSONS.DB".BIRTHNAME'
      Size = 50
    end
    object qryFilmsPersonsDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
      Origin = 'DEMOSDB."PERSONS.DB".DATEOFBIRTH'
    end
    object qryFilmsPersonsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'DEMOSDB."PERSONS.DB".FIRSTNAME'
      Size = 50
    end
    object qryFilmsPersonsLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Origin = 'DEMOSDB."PERSONS.DB".LOCATIONOFBIRTH'
      Size = 50
    end
    object qryFilmsPersonsNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Origin = 'DEMOSDB."PERSONS.DB".NICKNAME'
      Size = 50
    end
    object qryFilmsPersonsSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Origin = 'DEMOSDB."PERSONS.DB".SECONDNAME'
      Size = 50
    end
    object qryFilmsPersonsHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Origin = 'DEMOSDB."PERSONS.DB".HOMEPAGE'
      Size = 100
    end
    object qryFilmsPersonsGender: TBooleanField
      FieldName = 'Gender'
      Origin = 'DEMOSDB."PERSONS.DB".GENDER'
    end
  end
  object tblPersonsLine: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PERSONSLINE.DB'
    Left = 368
    Top = 216
    object tblPersonsLineID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsLineNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object tblFilmsCompaniesStaff: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSCOMPANIESSTAFF.DB'
    Left = 120
    Top = 320
    object tblFilmsCompaniesStaffID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblFilmsCompaniesStaffFILMID: TIntegerField
      FieldName = 'FILMID'
    end
    object tblFilmsCompaniesStaffCOMPANYID: TIntegerField
      FieldName = 'COMPANYID'
    end
    object tblFilmsCompaniesStaffDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
  end
  object tblFilmsGenres: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSGENRES.DB'
    Left = 216
    Top = 320
    object tblFilmsGenresID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblFilmsGenresFILMID: TIntegerField
      FieldName = 'FILMID'
    end
    object tblFilmsGenresGENREID: TIntegerField
      FieldName = 'GENREID'
    end
  end
  object tblFilmsPersonsStaff: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSPERSONSSTAFF.DB'
    Left = 304
    Top = 320
    object tblFilmsPersonsStaffID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblFilmsPersonsStaffFILMID: TIntegerField
      FieldName = 'FILMID'
    end
    object tblFilmsPersonsStaffPERSONLINEID: TIntegerField
      FieldName = 'PERSONLINEID'
    end
    object tblFilmsPersonsStaffPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object tblFilmsPersonsStaffDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 150
    end
  end
  object tlbCountries: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'COUNTRIES'
    Left = 520
    Top = 216
  end
  object usqFilmsCompanies: TUpdateSQL
    ModifySQL.Strings = (
      '')
    Left = 40
    Top = 72
  end
  object usqFilmsPersons: TUpdateSQL
    Left = 184
    Top = 72
  end
  object usqFilms: TUpdateSQL
    Left = 120
    Top = 72
  end
  object tblFilmsScreens: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSSCREENS.DB'
    Left = 448
    Top = 216
  end
end
