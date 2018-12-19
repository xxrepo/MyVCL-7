object MasterDetailMultiDemoMainDM: TMasterDetailMultiDemoMainDM
  OldCreateOrder = False
  Left = 256
  Top = 149
  Height = 475
  Width = 702
  object dsFilms: TDataSource
    DataSet = qryFilms
    Left = 128
    Top = 96
  end
  object dsFilmsPersons: TDataSource
    DataSet = qryFilmsPersons
    Left = 232
    Top = 200
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 312
    Top = 200
  end
  object tblPersonsLine: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'NAME'
    TableName = 'PersonsLine.DB'
    Left = 312
    Top = 160
    object tblPersonsLineID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsLineNAME: TStringField
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
    Left = 48
    Top = 8
  end
  object qryFilmsPersons: TQuery
    Active = True
    AfterInsert = qryFilmsPersonsAfterInsert
    BeforePost = qryFilmsPersonsBeforePost
    OnCalcFields = qryFilmsPersonsCalcFields
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      
        'select  FilmsPersonsStaff.ID, FilmID, Persons.ID as PersonID, Pe' +
        'rsonLineID, BIOGRAPHY, BIRTHCOUNTRY, BIRTHNAME, DATEOFBIRTH, FIR' +
        'STNAME, LOCATIONOFBIRTH, NICKNAME, SECONDNAME, HOMEPAGE, Gender ' +
        ' from FilmsPersonsStaff, Persons '#13#10'where'#13#10'FilmsPersonsStaff.Pers' +
        'onID = Persons.ID'#13#10)
    Left = 232
    Top = 160
    object qryFilmsPersonsName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 50
      Calculated = True
    end
    object qryFilmsPersonsPersonLineID: TIntegerField
      FieldName = 'PersonLineID'
    end
    object qryFilmsPersonsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object qryFilmsPersonsSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 50
    end
    object qryFilmsPersonsNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Size = 50
    end
    object qryFilmsPersonsBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Size = 50
    end
    object qryFilmsPersonsDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
    end
    object qryFilmsPersonsLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Size = 50
    end
    object qryFilmsPersonsBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object qryFilmsPersonsHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 100
    end
    object qryFilmsPersonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qryFilmsPersonsFilmID: TIntegerField
      FieldName = 'FilmID'
      Visible = False
    end
    object qryFilmsPersonsBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
      Visible = False
    end
    object qryFilmsPersonsGender: TBooleanField
      FieldName = 'Gender'
      Visible = False
    end
  end
  object tblPersonsHelper: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PERSONS.DB'
    Left = 400
    Top = 160
    object tblPersonsHelperID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsHelperFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object tblPersonsHelperSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 50
    end
    object tblPersonsHelperGENDER: TBooleanField
      FieldName = 'GENDER'
    end
    object tblPersonsHelperBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Size = 50
    end
    object tblPersonsHelperDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
    end
    object tblPersonsHelperBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
    end
    object tblPersonsHelperLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Size = 50
    end
    object tblPersonsHelperBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object tblPersonsHelperNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Size = 50
    end
    object tblPersonsHelperHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 100
    end
  end
  object tblPersonsStaffHelper: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'FILMID'
    MasterFields = 'ID'
    MasterSource = dsFilms
    TableName = 'FILMSPERSONSSTAFF.DB'
    Left = 400
    Top = 200
    object tblPersonsStaffHelperID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsStaffHelperFILMID: TIntegerField
      FieldName = 'FILMID'
    end
    object tblPersonsStaffHelperPERSONLINEID: TIntegerField
      FieldName = 'PERSONLINEID'
    end
    object tblPersonsStaffHelperPERSONID: TIntegerField
      FieldName = 'PERSONID'
    end
    object tblPersonsStaffHelperDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 150
    end
  end
  object dsFilmsCompanies: TDataSource
    DataSet = qryFilmsCompanies
    Left = 32
    Top = 200
  end
  object qryFilmsCompanies: TQuery
    Active = True
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      
        'SELECT FILMSCOMPANIESSTAFF.ID, FILMSCOMPANIESSTAFF.FILMID, COMPA' +
        'NIES.COMPANYNAME AS Name, COMPANIES.COMPANYWEBSITE AS WebSite, C' +
        'OMPANIESTYPE.NAME AS Type, COUNTRIES.NAME AS Country'#13#10'FROM ((FIL' +
        'MSCOMPANIESSTAFF INNER JOIN COMPANIES ON FILMSCOMPANIESSTAFF.COM' +
        'PANYID = COMPANIES.ID) LEFT JOIN COMPANIESTYPE ON COMPANIES.COMP' +
        'ANYTYPEID = COMPANIESTYPE.ID) LEFT JOIN COUNTRIES ON COMPANIES.C' +
        'OUNTRYID = COUNTRIES.ID'#13#10'ORDER BY FILMSCOMPANIESSTAFF.FILMID, CO' +
        'MPANIES.COMPANYNAME')
    Left = 32
    Top = 160
    object qryFilmsCompaniesName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object qryFilmsCompaniesType: TStringField
      FieldName = 'Type'
      Size = 50
    end
    object qryFilmsCompaniesCountry: TStringField
      FieldName = 'Country'
      Size = 60
    end
    object qryFilmsCompaniesWebSite: TStringField
      FieldName = 'WebSite'
      Visible = False
      Size = 50
    end
    object qryFilmsCompaniesID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object qryFilmsCompaniesFILMID: TIntegerField
      FieldName = 'FILMID'
      Visible = False
    end
  end
  object tblFilmsScreens: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'FilmID'
    TableName = 'FILMSSCREENS.DB'
    Left = 136
    Top = 160
    object tblFilmsScreensID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblFilmsScreensFILMID: TIntegerField
      FieldName = 'FILMID'
      Visible = False
    end
    object tblFilmsScreensSCREEN: TBlobField
      FieldName = 'SCREEN'
      Size = 10
    end
    object tblFilmsScreensICON: TBlobField
      FieldName = 'ICON'
      Visible = False
      Size = 10
    end
  end
  object dsFilmsScreens: TDataSource
    DataSet = tblFilmsScreens
    Left = 136
    Top = 200
  end
  object qryFilms: TQuery
    Active = True
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      
        'SELECT FILMS.*'#13#10'FROM FILMS INNER JOIN FILMSGENRES ON FILMS.ID = ' +
        'FILMSGENRES.FILMID'#13#10'WHERE FilmsGenres.GenreID =:Param')
    Left = 128
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Param'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryFilmsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryFilmsCAPTION: TStringField
      FieldName = 'CAPTION'
      Size = 50
    end
    object qryFilmsYEAR: TIntegerField
      FieldName = 'YEAR'
      DisplayFormat = '# year'
      EditFormat = '#'
    end
    object qryFilmsTAGLINE: TStringField
      FieldName = 'TAGLINE'
      Size = 250
    end
    object qryFilmsPLOTOUTLINE: TStringField
      DisplayWidth = 50
      FieldName = 'PLOTOUTLINE'
      Size = 200
    end
    object qryFilmsRUNTIME: TIntegerField
      FieldName = 'RUNTIME'
      DisplayFormat = '# min'
      EditFormat = '#'
    end
    object qryFilmsCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 50
    end
    object qryFilmsPHOTO: TBlobField
      DisplayWidth = 20
      FieldName = 'PHOTO'
      Size = 10
    end
    object qryFilmsICON: TBlobField
      FieldName = 'ICON'
      Size = 10
    end
    object qryFilmsWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Size = 50
    end
  end
  object tblGenres: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'GENRES.DB'
    Left = 24
    Top = 56
    object tblGenresID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblGenresNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 232
    Top = 16
    object styleBold: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
  end
end
