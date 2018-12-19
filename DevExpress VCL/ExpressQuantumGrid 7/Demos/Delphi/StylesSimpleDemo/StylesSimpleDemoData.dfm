object StylesSimpleDemoMainDM: TStylesSimpleDemoMainDM
  OldCreateOrder = False
  Left = 289
  Top = 148
  Height = 222
  Width = 379
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
    Top = 16
  end
  object tblPersons: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'PERSONS.DB'
    Left = 40
    Top = 64
    object tblPersonsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblPersonsFIRSTNAME: TStringField
      DisplayLabel = 'FirstName'
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object tblPersonsSECONDNAME: TStringField
      DisplayLabel = 'SecondName'
      FieldName = 'SECONDNAME'
      Size = 50
    end
    object tblPersonsBIRTHNAME: TStringField
      DisplayLabel = 'BirthName'
      FieldName = 'BIRTHNAME'
      Size = 50
    end
    object tblPersonsDATEOFBIRTH: TDateTimeField
      DisplayLabel = 'DateOfBirth'
      FieldName = 'DATEOFBIRTH'
    end
    object tblPersonsBIRTHCOUNTRY: TIntegerField
      DisplayLabel = 'BirthCountry'
      FieldName = 'BIRTHCOUNTRY'
    end
    object tblPersonsLOCATIONOFBIRTH: TStringField
      DisplayLabel = 'LocationOfBirth'
      FieldName = 'LOCATIONOFBIRTH'
      Size = 50
    end
    object tblPersonsBIOGRAPHY: TMemoField
      DisplayLabel = 'Biography'
      FieldName = 'BIOGRAPHY'
      BlobType = ftMemo
      Size = 10
    end
    object tblPersonsNICKNAME: TStringField
      DisplayLabel = 'NickName'
      FieldName = 'NICKNAME'
      Size = 50
    end
  end
  object dsPersons: TDataSource
    DataSet = tblPersons
    Left = 40
    Top = 112
  end
  object tblCountries: TTable
    Active = True
    DatabaseName = 'DemosDB'
    TableName = 'Countries.DB'
    Left = 104
    Top = 64
    object tblCountriesID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblCountriesName: TStringField
      FieldName = 'Name'
      Size = 60
    end
  end
  object dsCountries: TDataSource
    DataSet = tblCountries
    Left = 104
    Top = 112
  end
  object StyleRepository: TcxStyleRepository
    Left = 192
    Top = 16
    object Sunny: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clNavy
    end
    object Dark: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15451300
      TextColor = clWhite
    end
    object Golden: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object Summer: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object Autumn: TcxStyle
      AssignedValues = [svColor]
      Color = clBtnFace
    end
    object Bright: TcxStyle
      AssignedValues = [svColor]
      Color = 16749885
    end
    object Cold: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object Spring: TcxStyle
      AssignedValues = [svColor]
      Color = 16247513
    end
    object Light: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object Winter: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
    end
    object Depth: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object UserStyleSheet: TcxGridTableViewStyleSheet
      Caption = 'User Defined Style Sheet'
      Styles.Background = Dark
      Styles.Content = Spring
      Styles.ContentEven = Autumn
      Styles.ContentOdd = Spring
      Styles.Inactive = Summer
      Styles.IncSearch = Golden
      Styles.Selection = Bright
      Styles.FilterBox = Sunny
      Styles.Footer = Light
      Styles.Group = Cold
      Styles.GroupByBox = Golden
      Styles.Header = Depth
      Styles.Indicator = Autumn
      Styles.Preview = Winter
      BuiltIn = True
    end
  end
end
