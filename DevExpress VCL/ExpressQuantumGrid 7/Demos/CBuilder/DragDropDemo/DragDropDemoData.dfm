object DragDropDemoMainDM: TDragDropDemoMainDM
  OldCreateOrder = False
  Left = 193
  Top = 123
  Height = 530
  Width = 674
  object dsFilms: TDataSource
    DataSet = qryFilms
    Left = 80
    Top = 96
  end
  object dsFilmsPersons: TDataSource
    DataSet = qryFilmsPersons
    Left = 168
    Top = 96
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 408
    Top = 312
  end
  object dsFilmsCompanies: TDataSource
    DataSet = qryFilmsCompanies
    Left = 256
    Top = 96
  end
  object dsFilmsScreens: TDataSource
    DataSet = tblFilmsScreens
    Left = 338
    Top = 314
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 16
    Top = 104
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
    object GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle15
      Styles.Content = cxStyle18
      Styles.ContentEven = cxStyle19
      Styles.ContentOdd = cxStyle20
      Styles.FilterBox = cxStyle21
      Styles.Inactive = cxStyle26
      Styles.IncSearch = cxStyle27
      Styles.Selection = cxStyle30
      Styles.Footer = cxStyle22
      Styles.Group = cxStyle23
      Styles.GroupByBox = cxStyle24
      Styles.Header = cxStyle25
      Styles.Indicator = cxStyle28
      Styles.Preview = cxStyle29
      Styles.BandBackground = cxStyle16
      Styles.BandHeader = cxStyle17
      BuiltIn = True
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
      BuiltIn = True
    end
  end
  object dsCountries: TDataSource
    DataSet = tlbCountries
    Left = 472
    Top = 312
  end
  object dsCompaniesType: TDataSource
    DataSet = tblCompaniesType
    Left = 248
    Top = 312
  end
  object qryFilms: TQuery
    Active = True
    CachedUpdates = True
    BeforeDelete = qryFilmsBeforeDelete
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'SELECT '
      
        '  FilmsGenres.ID as PRIMED, FilmsGenres.FILMID, FilmsGenres.GENR' +
        'EID, Films.*'
      'FROM FilmsGenres'
      'LEFT JOIN '
      '  FILMS ON '
      '    FilmsGenres.FILMID = Films.ID'
      'WHERE'
      '    FilmsGenres.GenreID = :Param'
      'ORDER BY  '
      '  FilmsGenres.ID')
    UpdateObject = usqFilms
    Left = 80
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Param'
        ParamType = ptUnknown
      end>
    object qryFilmsPRIMED: TIntegerField
      FieldName = 'PRIMED'
      Origin = 'DEMOSDB."FILMS.DB".ID'
    end
    object qryFilmsFILMID: TIntegerField
      FieldName = 'FILMID'
      Origin = 'DEMOSDB."FILMS.DB".CAPTION'
    end
    object qryFilmsGENREID: TIntegerField
      FieldName = 'GENREID'
      Origin = 'DEMOSDB."FILMS.DB".ID'
    end
    object qryFilmsID: TIntegerField
      FieldName = 'ID'
      Origin = 'DEMOSDB."FILMS.DB".YEAR'
    end
    object qryFilmsCAPTION: TStringField
      FieldName = 'CAPTION'
      Origin = 'DEMOSDB."FILMS.DB".TAGLINE'
      Size = 50
    end
    object qryFilmsYEAR: TIntegerField
      FieldName = 'YEAR'
      Origin = 'DEMOSDB."FILMS.DB".PLOTOUTLINE'
    end
    object qryFilmsTAGLINE: TStringField
      FieldName = 'TAGLINE'
      Origin = 'DEMOSDB."FILMS.DB".RUNTIME'
      Size = 250
    end
    object qryFilmsPLOTOUTLINE: TStringField
      FieldName = 'PLOTOUTLINE'
      Origin = 'DEMOSDB."FILMS.DB".COLOR'
      Size = 200
    end
    object qryFilmsRUNTIME: TIntegerField
      FieldName = 'RUNTIME'
      Origin = 'DEMOSDB."FILMS.DB".PHOTO'
    end
    object qryFilmsCOLOR: TStringField
      FieldName = 'COLOR'
      Origin = 'DEMOSDB."FILMS.DB".ICON'
      Size = 50
    end
    object qryFilmsPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = 'DEMOSDB."FILMS.DB".WEBSITE'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qryFilmsICON: TBlobField
      FieldName = 'ICON'
      Origin = 'DEMOSDB."FILMSGENRES.DB".ID'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qryFilmsWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Origin = 'DEMOSDB."FILMSGENRES.DB".FILMID'
      Size = 50
    end
  end
  object tblGenres: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'GENRES.DB'
    Left = 480
    Top = 160
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
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 16
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
      '  Companies.CompanyName'
      'FROM '
      '  FilmsCompaniesStaff'
      'LEFT JOIN '
      '  Companies on Companies.ID = FilmsCompaniesStaff.CompanyID'
      'ORDER BY '
      '  FilmsCompaniesStaff.FilmID')
    UpdateObject = usqFilmsCompanies
    Left = 256
    Top = 56
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
    object qryFilmsCompaniesCompanyName: TStringField
      FieldName = 'CompanyName'
      Origin = 'DEMOSDB."COMPANIES.DB".COMPANYNAME'
      Size = 50
    end
  end
  object tblCompaniesType: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'COMPANIESTYPE.DB'
    Left = 248
    Top = 272
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
      
        '  FilmsPersonsStaff.ID, FilmsPersonsStaff.FilmID, FilmsPersonsSt' +
        'aff.PersonLineID,'
      
        '  Persons.ID as PersonID, Persons.BIOGRAPHY, Persons.BIRTHCOUNTR' +
        'Y, '
      '  Persons.BIRTHNAME, Persons.DATEOFBIRTH, Persons.FIRSTNAME, '
      
        '  Persons.LOCATIONOFBIRTH, Persons.NICKNAME, Persons.SECONDNAME,' +
        ' '
      '  Persons.HOMEPAGE, Persons.Gender'
      'FROM '
      '  FilmsPersonsStaff'
      'LEFT JOIN '
      '  Persons on FilmsPersonsStaff.PersonID = Persons.ID'
      'ORDER BY '
      '  FilmsPersonsStaff.FilmID')
    UpdateObject = usqFilmsPersons
    Left = 168
    Top = 56
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
    Left = 408
    Top = 272
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
    Left = 480
    Top = 16
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
    Left = 480
    Top = 64
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
    Left = 480
    Top = 112
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
    Left = 472
    Top = 272
  end
  object usqFilmsCompanies: TUpdateSQL
    ModifySQL.Strings = (
      '')
    Left = 256
    Top = 16
  end
  object usqFilmsPersons: TUpdateSQL
    Left = 168
    Top = 16
  end
  object usqFilms: TUpdateSQL
    Left = 80
    Top = 16
  end
  object tblFilmsScreens: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSSCREENS.DB'
    Left = 336
    Top = 272
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 24
    Top = 312
  end
  object dsCompanies: TDataSource
    DataSet = tblCompanies
    Left = 96
    Top = 312
  end
  object tblPersons: TTable
    Active = True
    BeforePost = tblPersonsBeforeUpdate
    AfterPost = tblPersonsAfterUpdate
    BeforeDelete = tblPersonsBeforeUpdate
    AfterDelete = tblPersonsAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 24
    Top = 272
  end
  object tblCompanies: TTable
    Active = True
    BeforePost = tblCompaniesBeforeUpdate
    AfterPost = tblCompaniesAfterUpdate
    BeforeDelete = tblCompaniesBeforeUpdate
    AfterDelete = tblCompaniesAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'COMPANIES.DB'
    Left = 96
    Top = 272
  end
  object dsFilmsDict: TDataSource
    DataSet = tblFilmsDict
    Left = 168
    Top = 312
  end
  object tblFilmsDict: TTable
    Active = True
    BeforePost = tblFilmsDictBeforeUpdate
    AfterPost = tblFilmsDictAfterUpdate
    BeforeDelete = tblFilmsDictBeforeUpdate
    AfterDelete = tblFilmsDictAfterUpdate
    DatabaseName = 'DemosDB'
    TableName = 'FILMS.DB'
    Left = 168
    Top = 272
  end
end
