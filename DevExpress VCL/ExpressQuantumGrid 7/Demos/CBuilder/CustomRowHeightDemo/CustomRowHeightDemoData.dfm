object CustomRowHeightDemoDataDM: TCustomRowHeightDemoDataDM
  OldCreateOrder = False
  Left = 350
  Top = 198
  Height = 234
  Width = 374
  object Database: TDatabase
    Connected = True
    DatabaseName = 'DemosDB'
    DriverName = 'STANDARD'
    Params.Strings = (
      'PATH=..\..\Data'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 40
    Top = 8
  end
  object tblFilms: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'FILMS.DB'
    Left = 40
    Top = 56
    object tblFilmsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
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
      Size = 250
    end
    object tblFilmsPLOTOUTLINE: TStringField
      FieldName = 'PLOTOUTLINE'
      Size = 200
    end
    object tblFilmsRUNTIME: TIntegerField
      FieldName = 'RUNTIME'
    end
    object tblFilmsCOLOR: TStringField
      FieldName = 'COLOR'
      Size = 50
    end
    object tblFilmsPHOTO: TBlobField
      FieldName = 'PHOTO'
      BlobType = ftParadoxOle
      Size = 10
    end
    object tblFilmsICON: TBlobField
      FieldName = 'ICON'
      BlobType = ftParadoxOle
      Size = 10
    end
    object tblFilmsWEBSITE: TStringField
      FieldName = 'WEBSITE'
      Size = 50
    end
  end
  object dsFilms: TDataSource
    DataSet = tblFilms
    Left = 40
    Top = 104
  end
end
