object ViewTableSimpleDemoMainDM: TViewTableSimpleDemoMainDM
  OldCreateOrder = False
  Left = 283
  Top = 161
  Height = 479
  Width = 741
  object tlbGENRES: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'GENRES.DB'
    Left = 104
    Top = 64
    object tlbGENRESID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tlbGENRESNAME: TStringField
      FieldName = 'NAME'
      Size = 50
    end
  end
  object dsGENRES: TDataSource
    DataSet = tlbGENRES
    Left = 32
    Top = 64
  end
  object qreFilms: TQuery
    Active = True
    CachedUpdates = True
    AfterInsert = qreFilmsAfterInsert
    AfterPost = qreFilmsAfterPost
    BeforeDelete = qreFilmsBeforeDelete
    AfterDelete = qreFilmsAfterDelete
    DatabaseName = 'DemosDB'
    SessionName = 'Default'
    DataSource = dsGENRES
    RequestLive = True
    SQL.Strings = (
      
        'select * from FILMS where ID in (select FILMID from FILMSGENRES ' +
        'where '
      'GENREID=:ID)'
      ' ')
    UpdateObject = UpdateSQL
    Left = 104
    Top = 112
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qreFilmsID: TIntegerField
      FieldName = 'ID'
    end
    object qreFilmsCAPTION: TStringField
      DisplayWidth = 16
      FieldName = 'CAPTION'
      Size = 50
    end
    object qreFilmsYEAR: TIntegerField
      FieldName = 'YEAR'
    end
    object qreFilmsTAGLINE: TStringField
      DisplayWidth = 24
      FieldName = 'TAGLINE'
      Size = 250
    end
    object qreFilmsPLOTOUTLINE: TStringField
      DisplayWidth = 16
      FieldName = 'PLOTOUTLINE'
      Size = 200
    end
    object qreFilmsRUNTIME: TIntegerField
      DisplayWidth = 11
      FieldName = 'RUNTIME'
    end
    object qreFilmsCOLOR: TStringField
      DisplayWidth = 6
      FieldName = 'COLOR'
      Size = 50
    end
    object qreFilmsPHOTO: TBlobField
      DisplayWidth = 8
      FieldName = 'PHOTO'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qreFilmsICON: TBlobField
      DisplayWidth = 16
      FieldName = 'ICON'
      BlobType = ftParadoxOle
      Size = 10
    end
    object qreFilmsWEBSITE: TStringField
      DisplayWidth = 16
      FieldName = 'WEBSITE'
      Size = 50
    end
  end
  object dsFilms: TDataSource
    DataSet = qreFilms
    Left = 32
    Top = 112
  end
  object tblFilms: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMS.DB'
    Left = 32
    Top = 160
    object tblFilmsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblFilmsCAPTION: TStringField
      DisplayWidth = 100
      FieldName = 'CAPTION'
      Size = 50
    end
    object tblFilmsYEAR: TIntegerField
      DisplayWidth = 60
      FieldName = 'YEAR'
    end
    object tblFilmsTAGLINE: TStringField
      DisplayWidth = 150
      FieldName = 'TAGLINE'
      Size = 250
    end
    object tblFilmsPLOTOUTLINE: TStringField
      DisplayWidth = 100
      FieldName = 'PLOTOUTLINE'
      Size = 200
    end
    object tblFilmsRUNTIME: TIntegerField
      DisplayWidth = 65
      FieldName = 'RUNTIME'
    end
    object tblFilmsCOLOR: TStringField
      DisplayWidth = 45
      FieldName = 'COLOR'
      Size = 50
    end
    object tblFilmsPHOTO: TBlobField
      DisplayWidth = 50
      FieldName = 'PHOTO'
      Size = 10
    end
    object tblFilmsICON: TBlobField
      DisplayWidth = 100
      FieldName = 'ICON'
      Size = 10
    end
    object tblFilmsWEBSITE: TStringField
      DisplayWidth = 100
      FieldName = 'WEBSITE'
      Size = 50
    end
  end
  object tblFilmsGenres: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMSGENRES.DB'
    Left = 32
    Top = 208
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
    TransIsolation = tiDirtyRead
    Left = 32
    Top = 16
  end
  object UpdateSQL: TUpdateSQL
    ModifySQL.Strings = (
      'update FILMS'
      'set'
      '  CAPTION = :CAPTION,'
      '  FILMS."YEAR" = :YEAR,'
      '  TAGLINE = :TAGLINE,'
      '  PLOTOUTLINE = :PLOTOUTLINE,'
      '  RUNTIME = :RUNTIME,'
      '  COLOR = :COLOR,'
      '  PHOTO = :PHOTO,'
      '  ICON = :ICON,'
      '  WEBSITE = :WEBSITE'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into FILMS'
      '  (CAPTION, FILMS."YEAR", TAGLINE, PLOTOUTLINE, RUNTIME, COLOR, '
      'PHOTO, ICON, WEBSITE)'
      'values'
      
        '  (:CAPTION, :YEAR, :TAGLINE, :PLOTOUTLINE, :RUNTIME, :COLOR, :P' +
        'HOTO, '
      ':ICON, '
      '   :WEBSITE)')
    DeleteSQL.Strings = (
      'delete from FILMS'
      'where'
      '  ID = :OLD_ID')
    Left = 104
    Top = 160
  end
  object qreMaxFilmsID: TQuery
    Active = True
    DatabaseName = 'DemosDB'
    SQL.Strings = (
      'select MAX(ID) from FILMS')
    Left = 32
    Top = 256
    object qreMaxFilmsIDMAXOFID: TIntegerField
      FieldName = 'MAX OF ID'
      Origin = 'DEMOSDB."FILMS.DB".ID'
    end
  end
end
