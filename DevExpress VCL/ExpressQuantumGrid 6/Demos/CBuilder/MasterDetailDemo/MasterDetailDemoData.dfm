object MasterDetailDemoDataDM: TMasterDetailDemoDataDM
  OldCreateOrder = False
  Left = 271
  Top = 206
  Height = 385
  Width = 656
  object dsFilms: TDataSource
    DataSet = tblFilms
    Left = 48
    Top = 96
  end
  object dsFilmsPersons: TDataSource
    DataSet = qryFilmsPersons
    Left = 216
    Top = 200
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 376
    Top = 200
  end
  object tblFilms: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'Films.DB'
    Left = 48
    Top = 56
    object tblFilmsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblFilmsCAPTION: TStringField
      FieldName = 'CAPTION'
      Size = 50
    end
    object tblFilmsYEAR: TIntegerField
      FieldName = 'YEAR'
    end
    object tblFilmsTAGLINE: TStringField
      FieldName = 'TAGLINE'
      Visible = False
      Size = 250
    end
    object tblFilmsPLOTOUTLINE: TStringField
      FieldName = 'PLOTOUTLINE'
      Visible = False
      Size = 200
    end
    object tblFilmsRUNTIME: TIntegerField
      FieldName = 'RUNTIME'
    end
    object tblFilmsCOLOR: TStringField
      FieldName = 'COLOR'
      Visible = False
      Size = 50
    end
    object tblFilmsPHOTO: TBlobField
      FieldName = 'PHOTO'
      BlobType = ftBlob
      Size = 10
    end
    object tblFilmsICON: TBlobField
      FieldName = 'ICON'
      Visible = False
      BlobType = ftBlob
      Size = 10
    end
    object tblFilmsWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Visible = False
      Size = 50
    end
  end
  object tblPersonsLine: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'Name'
    TableName = 'PersonsLine.DB'
    Left = 376
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
    CachedUpdates = True
    AfterInsert = qryFilmsPersonsAfterInsert
    AfterPost = qryFilmsPersonsAfterPost
    AfterDelete = qryFilmsPersonsAfterDelete
    OnCalcFields = qryFilmsPersonsCalcFields
    DatabaseName = 'DemosDB'
    RequestLive = True
    SQL.Strings = (
      
        'select  FilmsPersonsStaff.ID, FilmID, Persons.ID as PersonID, Pe' +
        'rsonLineID, BIOGRAPHY, BIRTHCOUNTRY, BIRTHNAME, DATEOFBIRTH, FIR' +
        'STNAME, LOCATIONOFBIRTH, NICKNAME, SECONDNAME, HOMEPAGE, Gender ' +
        ' from FilmsPersonsStaff, Persons '#13#10'where'#13#10'FilmsPersonsStaff.Pers' +
        'onID = Persons.ID')
    UpdateObject = UpdateSQL
    Left = 216
    Top = 160
    object qryFilmsPersonsID: TIntegerField
      FieldName = 'ID'
      Origin = 'DEMOSDB."FilmsPersonsStaff.DB".ID'
    end
    object qryFilmsPersonsFilmID: TIntegerField
      FieldName = 'FilmID'
      Origin = 'DEMOSDB."FilmsPersonsStaff.DB".FILMID'
    end
    object qryFilmsPersonsPersonID: TIntegerField
      FieldName = 'PersonID'
      Origin = 'DEMOSDB."Persons.DB".ID'
    end
    object qryFilmsPersonsPersonLineID: TIntegerField
      FieldName = 'PersonLineID'
      Origin = 'DEMOSDB."FilmsPersonsStaff.DB".PERSONLINEID'
    end
    object qryFilmsPersonsBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      Origin = 'DEMOSDB."Persons.DB".BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object qryFilmsPersonsBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
      Origin = 'DEMOSDB."Persons.DB".BIRTHCOUNTRY'
    end
    object qryFilmsPersonsBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Origin = 'DEMOSDB."Persons.DB".BIRTHNAME'
      Size = 50
    end
    object qryFilmsPersonsDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
      Origin = 'DEMOSDB."Persons.DB".DATEOFBIRTH'
    end
    object qryFilmsPersonsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'DEMOSDB."Persons.DB".FIRSTNAME'
      Size = 50
    end
    object qryFilmsPersonsLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Origin = 'DEMOSDB."Persons.DB".LOCATIONOFBIRTH'
      Size = 50
    end
    object qryFilmsPersonsNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Origin = 'DEMOSDB."Persons.DB".NICKNAME'
      Size = 50
    end
    object qryFilmsPersonsSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Origin = 'DEMOSDB."Persons.DB".SECONDNAME'
      Size = 50
    end
    object qryFilmsPersonsHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Origin = 'DEMOSDB."Persons.DB".HOMEPAGE'
      Size = 100
    end
    object qryFilmsPersonsGender: TBooleanField
      FieldName = 'Gender'
      Origin = 'DEMOSDB."Persons.DB".GENDER'
    end
    object qryFilmsPersonsName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 50
      Calculated = True
    end
  end
  object tblPersonsHelper: TTable
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PERSONS.DB'
    Left = 464
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
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'FILMID'
    MasterFields = 'ID'
    MasterSource = dsFilms
    TableName = 'FILMSPERSONSSTAFF.DB'
    Left = 464
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
    OnCalcFields = qryFilmsPersonsCalcFields
    DatabaseName = 'DemosDB'
    RequestLive = True
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
    Left = 120
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
      BlobType = ftBlob
      Size = 10
    end
    object tblFilmsScreensICON: TBlobField
      FieldName = 'ICON'
      Visible = False
      BlobType = ftBlob
      Size = 10
    end
  end
  object dsFilmsScreens: TDataSource
    DataSet = tblFilmsScreens
    Left = 120
    Top = 200
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update Persons'
      'set'
      '  FIRSTNAME = :FIRSTNAME,'
      '  SECONDNAME = :SECONDNAME,'
      '  GENDER = :GENDER,'
      '  BIRTHNAME = :BIRTHNAME,'
      '  DATEOFBIRTH = :DATEOFBIRTH,'
      '  BIRTHCOUNTRY = :BIRTHCOUNTRY,'
      '  LOCATIONOFBIRTH = :LOCATIONOFBIRTH,'
      '  BIOGRAPHY = :BIOGRAPHY,'
      '  NICKNAME = :NICKNAME,'
      '  HOMEPAGE = :HOMEPAGE'
      'where'
      '  ID = :PersonID'
      '')
    InsertSQL.Strings = (
      'insert into Persons'
      
        '  (FIRSTNAME, SECONDNAME, GENDER, BIRTHNAME, DATEOFBIRTH, BIRTHC' +
        'OUNTRY, '
      '   LOCATIONOFBIRTH, BIOGRAPHY, NICKNAME, HOMEPAGE)'
      'values'
      
        '  (:FIRSTNAME, :SECONDNAME, :GENDER, :BIRTHNAME, :DATEOFBIRTH, :' +
        'BIRTHCOUNTRY, '
      '   :LOCATIONOFBIRTH, :BIOGRAPHY, :NICKNAME, :HOMEPAGE)')
    DeleteSQL.Strings = (
      'delete from FilmsPersonsStaff'
      'where'
      '  ID = :OLD_ID')
    Left = 296
    Top = 160
  end
end
