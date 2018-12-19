object MasterDetailCardDemoDataDM: TMasterDetailCardDemoDataDM
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
    Left = 40
    Top = 200
  end
  object dsPersonsLine: TDataSource
    DataSet = tblPersonsLine
    Left = 288
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
  object tblPersonsLine: TTable
    Active = True
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'Name'
    TableName = 'PersonsLine.DB'
    Left = 288
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
    DataSource = dsFilms
    RequestLive = True
    SQL.Strings = (
      
        'select  FilmsPersonsStaff.ID, FilmID, FilmsPersonsStaff.PERSONID' +
        ' as PersonID, PersonLineID, BIOGRAPHY, BIRTHCOUNTRY, BIRTHNAME, ' +
        'DATEOFBIRTH, FIRSTNAME, LOCATIONOFBIRTH, NICKNAME, SECONDNAME, H' +
        'OMEPAGE, Gender  from FilmsPersonsStaff, Persons '
      'where'
      'FilmsPersonsStaff.PersonID = Persons.ID '
      'and FilmID = :ID ')
    UpdateObject = UpdateSQL
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftAutoInc
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qryFilmsPersonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryFilmsPersonsFilmID: TIntegerField
      FieldName = 'FilmID'
    end
    object qryFilmsPersonsPersonID: TAutoIncField
      FieldName = 'PersonID'
      ReadOnly = True
    end
    object qryFilmsPersonsPersonLineID: TIntegerField
      FieldName = 'PersonLineID'
    end
    object qryFilmsPersonsBIOGRAPHY: TMemoField
      FieldName = 'BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object qryFilmsPersonsBIRTHCOUNTRY: TIntegerField
      FieldName = 'BIRTHCOUNTRY'
    end
    object qryFilmsPersonsBIRTHNAME: TStringField
      FieldName = 'BIRTHNAME'
      Size = 50
    end
    object qryFilmsPersonsDATEOFBIRTH: TDateTimeField
      FieldName = 'DATEOFBIRTH'
    end
    object qryFilmsPersonsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object qryFilmsPersonsLOCATIONOFBIRTH: TStringField
      FieldName = 'LOCATIONOFBIRTH'
      Size = 50
    end
    object qryFilmsPersonsNICKNAME: TStringField
      FieldName = 'NICKNAME'
      Size = 50
    end
    object qryFilmsPersonsSECONDNAME: TStringField
      FieldName = 'SECONDNAME'
      Size = 50
    end
    object qryFilmsPersonsHOMEPAGE: TStringField
      FieldName = 'HOMEPAGE'
      Size = 100
    end
    object qryFilmsPersonsName: TStringField
      FieldKind = fkCalculated
      FieldName = 'Name'
      Size = 50
      Calculated = True
    end
    object qryFilmsPersonsGender: TBooleanField
      FieldName = 'Gender'
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 168
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
    end
  end
  object tblPersonsHelper: TTable
    DatabaseName = 'DemosDB'
    IndexFieldNames = 'ID'
    TableName = 'PERSONS.DB'
    Left = 192
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
    Left = 192
    Top = 208
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
    Left = 112
    Top = 160
  end
end
